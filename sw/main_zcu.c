
#include <stdio.h>
#include "platform.h"
#include "xuartps.h"
#include "xparameters.h"
#include "xaxidma.h"
#include "xscugic.h"
#include "xgpio.h"
#include "sleep.h"
#include "imageData.h"
#include <xtime_l.h>

#define IMAGE_SIZE 128 * 128
#define HEADER_SIZE 1078
#define FILE_SIZE IMAGE_SIZE + HEADER_SIZE


s32 uart_init(void);
s32 dma_init(void);
s32 intr_init(void);
s32 gpio_init(void);
u32 checkIdle(u32 baseAdddr, u32 offset);
void set_start_i(u32 data);
u32 checkHalted(u32 baseAddr, u32 offset);

typedef enum {ACTIVE_HIGHT = 1, RISING_EDGE_TRIGGER = 3} intr_trigger_e;

XUartPs_Config *myUartConfig;
XUartPs myUart;

XAxiDma_Config *myDmaConfig;
XAxiDma myDma;

XScuGic_Config *myIntrConfig;
XScuGic myIntr;

XGpio myGpio;
u32 done;

s32 intr_enable(u8 priority, intr_trigger_e trigger_type);
void myISR(void *CallBackRef){
    print("Interrupt triggered!\n");
   XScuGic_Disable(&myIntr, XPAR_FABRIC_TOP_MODULE_0_O_INTR_INTR);
	done = 1;
   XScuGic_Enable(&myIntr, XPAR_FABRIC_TOP_MODULE_0_O_INTR_INTR);

}
void sendHistogramData();
int main()
{

//	done = 0;
	XTime start, end;
	u32 histogram[600] __attribute__((aligned(64)));
	s32 status;
	status = uart_init();
	if(status != XST_SUCCESS ){
		print("UART initialization failed...\n");
		return -1;
	}
	status = dma_init();
	if(status != XST_SUCCESS) {
		print("DMA initialization failed...\n");
		return -1;
	}

	XAxiDma_Reset(&myDma);
	while (!XAxiDma_ResetIsDone(&myDma)) {
        xil_printf("Waiting for DMA reset...\n");
    }

	status = gpio_init();
	if(status != XST_SUCCESS) {
		print("GPIO initialization failed...\n");
		return -1;
	}
	XGpio_SetDataDirection(&myGpio, 1, 0);

//    intr_enable(0xA0, RISING_EDGE_TRIGGER);

	set_start_i(1);
	usleep(1);
	set_start_i(0);
	XTime_GetTime(&start);
	Xil_DCacheFlush();
	status = XAxiDma_SimpleTransfer(&myDma,(u8)imageData[HEADER_SIZE],IMAGE_SIZE * sizeof(u8),XAXIDMA_DMA_TO_DEVICE);
	if(status != XST_SUCCESS){
		print("PS -> PL transfer failed\n");
		return -1;
	}
	status = XAxiDma_SimpleTransfer(&myDma,(u32)histogram, 600 *sizeof(u32),XAXIDMA_DEVICE_TO_DMA);
	if(status != XST_SUCCESS){
		print("PL -> PS transfer failed\n");
		return -1;
	}

//	while(!done){}
	while(XAxiDma_Busy(&myDma, XAXIDMA_DEVICE_TO_DMA)){};
	 XTime_GetTime(&end);

	 printf("PROCESSING time %f us \n", (end-start) * 1000000.0/COUNTS_PER_SECOND);
	sendHistogramData(histogram);





    return 0;
}
void sendHistogramData(u32 histogram[]) {
    for (int i = 0; i < 600; i++) {
        uint32_t value = histogram[i];
//       xil_printf("%d ", histogram[i]);
        uint8_t bytes[4];

        bytes[0] = (value >> 0) & 0xFF;
        bytes[1] = (value >> 8) & 0xFF;
        bytes[2] = (value >> 16) & 0xFF;
        bytes[3] = (value >> 24) & 0xFF;

                // Send all 4 bytes
        XUartPs_Send(&myUart, bytes, 4);
        usleep(2000);
    }

}

s32 uart_init(){
	myUartConfig = XUartPs_LookupConfig(XPAR_PSU_UART_0_DEVICE_ID);
	return XUartPs_CfgInitialize(&myUart, myUartConfig, myUartConfig -> BaseAddress);
}

s32 dma_init(){
	myDmaConfig = XAxiDma_LookupConfigBaseAddr(XPAR_AXI_DMA_0_BASEADDR);
	return XAxiDma_CfgInitialize(&myDma, myDmaConfig);
}

s32 intr_enable(u8 priority, intr_trigger_e trigger_type){
    s32 status;
	myIntrConfig = XScuGic_LookupConfig(XPAR_SCUGIC_0_DEVICE_ID);
	if (myIntrConfig ==NULL) {
	        xil_printf("Interrupt controller lookup failed\n");
	        return XST_FAILURE;
	    }
	status = XScuGic_CfgInitialize(&myIntr, myIntrConfig, myIntrConfig -> CpuBaseAddress);

    if(status != XST_SUCCESS) {
			print("Interrupt initialization failed...\n");
			return -1;
	}
	XScuGic_SetPriorityTriggerType(&myIntr, XPAR_FABRIC_TOP_MODULE_0_O_INTR_INTR, priority,trigger_type);
	status = XScuGic_Connect(&myIntr,XPAR_FABRIC_TOP_MODULE_0_O_INTR_INTR,(Xil_InterruptHandler)myISR,(void *)NULL);
		 if (status != XST_SUCCESS) {
		        xil_printf("Interrupt connection failed\n");
		        return -1;
	}
	XScuGic_Enable(&myIntr,XPAR_FABRIC_TOP_MODULE_0_O_INTR_INTR);
	Xil_ExceptionInit();
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,(Xil_ExceptionHandler)XScuGic_InterruptHandler, &myIntr);
	Xil_ExceptionEnable();
	return 0;


}
s32 gpio_init(){
	return  XGpio_Initialize(&myGpio, XPAR_GPIO_0_DEVICE_ID);
}
u32 checkHalted(u32 baseAddr, u32 offset){
	u32 status;
		status = (XAxiDma_ReadReg(baseAddr,offset))&XAXIDMA_HALTED_MASK;
		return status;
}
u32 checkIdle(u32 baseAddr, u32 offset){
	u32 status;
	status = (XAxiDma_ReadReg(baseAddr,offset))&XAXIDMA_IDLE_MASK;
	return status;
}


void set_start_i(u32 data){
	XGpio_DiscreteWrite(&myGpio, 1, data);

}
