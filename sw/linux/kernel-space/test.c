#include <linux/dmaengine.h>
#include <linux/module.h>
#include <linux/version.h>
#include <linux/kernel.h>
#include <linux/dma-mapping.h>
#include <linux/slab.h>

#include <linux/platform_device.h>
static struct dma_chan *tx_chan;
static struct dma_chan *rx_chan;
static struct completion tx_cmp;
static struct completion rx_cmp;
static dma_cookie_t tx_cookie;
static dma_cookie_t rx_cookie;
static dma_addr_t tx_dma_handle;
static dma_addr_t rx_dma_handle;

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

    //  err = dmatest_add_slave_channels(tx_chan, rx_chan);
    //  if (err) {
    //      pr_err("xilinx_dmatest: Unable to add channels\n");
    //      goto free_rx;
    //  }
    
    
    // axidma_test_transfer();
    return 0;

}static int xilinx_axidmatest_remove(struct platform_device *pdev)
{
    struct dmatest_chan *dtc, *_dtc;
    struct dma_chan *chan;

    /* Step 12, release the DMA channels back to the DMA engine
     */
    
    dma_release_channel(tx_chan);
    dma_release_channel(rx_chan);
    
//  list_for_each_entry_safe(dtc, _dtc, &dmatest_channels, node) {
//      list_del(&dtc->node);
//      chan = dtc->chan;
//      dmatest_cleanup_channel(dtc);
//      pr_info("xilinx_dmatest: dropped channel %s\n",
//          dma_chan_name(chan));
//      dma_release_channel(chan);
//  }
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
    
//  if (!rx_chan || !tx_chan) {
//      printk(KERN_INFO "DMA channel request error\n");
//      return -1;
//  }



}

static void __exit axidma_exit(void)
{
    printk(KERN_INFO "AXI DMA module exited\n");
    platform_driver_unregister(&rfx_axidmatest_driver);
}

module_init(axidma_init);
module_exit(axidma_exit);
MODULE_LICENSE("GPL");

