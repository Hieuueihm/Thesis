#include <linux/dmaengine.h>
#include <linux/module.h>
#include <linux/version.h>
#include <linux/kernel.h>
#include <linux/dma-mapping.h>
#include <linux/slab.h>
#include <linux/amba/xilinx_dma.h>
#include <linux/io.h>
#include <linux/of_address.h>
#include <linux/kernel.h>
#include <linux/delay.h>

#include <linux/platform_device.h>
static struct dma_chan *tx_chan;
static struct dma_chan *rx_chan;
static struct completion tx_cmp;
static struct completion rx_cmp;
static dma_cookie_t tx_cookie;
static dma_cookie_t rx_cookie;
static dma_addr_t tx_dma_handle;
static dma_addr_t rx_dma_handle;
#define IMAGE_SIZE 128*128
#define HISTOGRAM_SIZE 600
#define HEADER_SIZE 1078
static void __iomem *gpio_regs;
#define GPIO_BASE_ADDR     0xA0001000
#define GPIO_REG_SIZE      0x1000
#define GPIO_DATA_OFFSET   (0x0)    /* Data register  */
#define GPIO_TRI_OFFSET    (0x4)    /* I/O direction register  */

static void gpio_set_direction_output(void) {
    iowrite32(0x0, gpio_regs + GPIO_TRI_OFFSET);  // SET AS OUPUT
}
static void gpio_write(u32 val){
      iowrite32(val, gpio_regs + GPIO_DATA_OFFSET); // WRITE DATA TO IT
}
static dma_cookie_t axidma_prep_buffer(struct dma_chan *chan, dma_addr_t buf, size_t len, 
					enum dma_transfer_direction dir, struct completion *cmp) 
{
	enum dma_ctrl_flags flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
	struct dma_async_tx_descriptor *chan_desc;
	dma_cookie_t cookie;

	/* Step 5, create a buffer (channel)  descriptor for the buffer since only a  
	 * single buffer is being used for this transfer
	 */

	chan_desc = dmaengine_prep_slave_single(chan, buf, len, dir, flags);

	/* Make sure the operation was completed successfully
	 */
	if (!chan_desc) {
		printk(KERN_ERR "dmaengine_prep_slave_single error\n");
		cookie = -EBUSY;
	} else {
		chan_desc->callback = axidma_sync_callback;
		chan_desc->callback_param = cmp;

		/* Step 6, submit the transaction to the DMA engine so that it's queued
		 * up to be processed later and get a cookie to track it's status
		 */

		cookie = dmaengine_submit(chan_desc);
	
	}
	return cookie;
}
static void axidma_start_transfer(struct dma_chan *chan, struct completion *cmp, 
					dma_cookie_t cookie, int wait)
{
	unsigned long timeout = msecs_to_jiffies(3000);
	enum dma_status status;

	/* Step 7, initialize the completion before using it and then start the 
	 * DMA transaction which was previously queued up in the DMA engine
	 */

	init_completion(cmp);
	dma_async_issue_pending(chan);

	if (wait) {
		printk("Waiting for DMA to complete...\n");

		/* Step 8, wait for the transaction to complete, timeout, or get
		 * get an error
		 */

		timeout = wait_for_completion_timeout(cmp, timeout);
		status = dma_async_is_tx_complete(chan, cookie, NULL, NULL);

		/* Determine if the transaction completed without a timeout and
		 * withtout any errors
		 */
		if (timeout == 0)  {
			printk(KERN_ERR "DMA timed out\n");
		} else if (status != DMA_COMPLETE) {
			printk(KERN_ERR "DMA returned completion callback status of: %s\n",
			       status == DMA_ERROR ? "error" : "in progress");
		}
	}
}
static void dma_transfer_ps2pl(char * image){
	char *src_dma_buffer = kmalloc(IMAGE_SIZE, GFP_KERNEL);
    if(!src_dma_buffer){
        pr_err("Failed to allocate memory for source buffer\n");
        return;
    }
    // write data to buffer
    for(int i = 0; i < IMAGE_SIZE; i++){
        src_dma_buffer[i] = image[i + HEADER_SIZE];
    }
    // write gpio start
     gpio_write(1);
     ndelay(1);
     gpio_write(0);
    // transfer data to the device
    tx_dma_handle = dma_map_single(tx_chan->device->dev, src_dma_buffer, IMAGE_SIZE, DMA_TO_DEVICE);
    if (dma_mapping_error(tx_chan->device->dev, tx_dma_handle)) {
        pr_err("Failed to map DMA buffer\n");
        kfree(src_dma_buffer);
        return;
    }
    tx_cookie = axidma_prep_buffer(tx_chan, tx_dma_handle, IMAGE_SIZE, DMA_MEM_TO_DEV, &tx_cmp);
    if (IS_ERR(tx_cookie)) {
        pr_err("Failed to prepare DMA transfer\n");
        dma_unmap_single(tx_chan->device->dev, tx_dma_handle, IMAGE_SIZE, DMA_TO_DEVICE);
        kfree(src_dma_buffer);
        return;
    }
    // Step 7, start the transfer and wait for it to complete
    printk(KERN_INFO "Starting DMA transfers\n");

	/* Start both DMA transfers and wait for them to complete
	 */
	axidma_start_transfer(rx_chan, &rx_cmp, rx_cookie, NO_WAIT);
    dma_unmap_single(tx_chan->device->dev, tx_dma_handle, IMAGE_SIZE, DMA_TO_DEVICE);
}

static const struct of_device_id rfx_axidmatest_of_ids[] = {
	{ .compatible = "xlnx,axi-dma-1.00.a",},
	{}
};

static struct platform_driver rfx_axidmatest_driver = {
	.driver = {
		.name = "rfx-axidma",
		.owner = THIS_MODULE,
		.of_match_table = rfx_axidmatest_of_ids,
	},
	.probe = xilinx_axidmatest_probe,
	.remove = xilinx_axidmatest_remove,
};

static int xilinx_axidmatest_probe(struct platform_device *pdev)
{

    int err;
    dma_cap_mask_t mask;
    
    /* Step 1, zero out the capability mask then initialize
	 * it for a slave channel that is private
	 */
    dma_cap_zero(mask);
	dma_cap_set(DMA_SLAVE | DMA_PRIVATE, mask);
        gpio_regs = ioremap(GPIO_BASE_ADDR, GPIO_REG_SIZE);
    if (!gpio_regs) {
        printk(KERN_ERR "Failed to map IO memory\n");
        return -ENOMEM;
    }

    /* Step 2, request the transmit and receive channels for the AXI DMA
	 * from the DMA engine
	 */

    //    struct dma_chan *tx_chan, *rx_chan;

    
	tx_chan = dma_request_slave_channel(&pdev->dev, "dma0");
	if (IS_ERR(tx_chan)) {
		pr_err("xilinx_dmatest: No Tx channel\n");
		return PTR_ERR(tx_chan);
	}

	rx_chan = dma_request_slave_channel(&pdev->dev, "dma1");
	if (IS_ERR(rx_chan)) {
		err = PTR_ERR(rx_chan);
		pr_err("xilinx_dmatest: No Rx channel\n");
		goto free_tx;
	}

    //	err = dmatest_add_slave_channels(tx_chan, rx_chan);
    //	if (err) {
    //		pr_err("xilinx_dmatest: Unable to add channels\n");
    //		goto free_rx;
    //	}
    
    
    axidma_test_transfer();
	return 0;

free_rx:
	dma_release_channel(rx_chan);
free_tx:
	dma_release_channel(tx_chan);

	return 0;
}static int xilinx_axidmatest_remove(struct platform_device *pdev)
{
	struct dmatest_chan *dtc, *_dtc;
	struct dma_chan *chan;

    /* Step 12, release the DMA channels back to the DMA engine
	 */
    
    dma_release_channel(tx_chan);
    dma_release_channel(rx_chan);
    
//	list_for_each_entry_safe(dtc, _dtc, &dmatest_channels, node) {
//		list_del(&dtc->node);
//		chan = dtc->chan;
//		dmatest_cleanup_channel(dtc);
//		pr_info("xilinx_dmatest: dropped channel %s\n",
//			dma_chan_name(chan));
//		dma_release_channel(chan);
//	}
	return 0;
}
tatic int __init axidma_init(void)
{
	

	printk(KERN_INFO "AXI DMA module initialized\n");
    return platform_driver_register(&rfx_axidmatest_driver);
    
    // OLD code (not supported in 4.x? )
    
//    u32 device_id = 0 << XILINX_DMA_DEVICE_ID_SHIFT;
//    enum dma_transfer_direction tx_direction = DMA_MEM_TO_DEV;
//    u32 tx_match = (tx_direction & 0xFF) | XILINX_DMA_IP_DMA | device_id;
//    tx_chan = dma_request_channel(mask, filter, (void*)&tx_match );    
//    enum dma_transfer_direction rx_direction = DMA_DEV_TO_MEM;
//    u32 rx_match = (rx_direction & 0xFF) | XILINX_DMA_IP_DMA | device_id;    
//    rx_chan = dma_request_channel(mask, filter, (void*)&rx_match );
    
//	if (!rx_chan || !tx_chan) {
//		printk(KERN_INFO "DMA channel request error\n");
//		return -1;
//	}



}

static void __exit axidma_exit(void)
{
	printk(KERN_INFO "AXI DMA module exited\n");
    platform_driver_unregister(&rfx_axidmatest_driver);
}

module_init(axidma_init);
module_exit(axidma_exit);
MODULE_LICENSE("GPL");
