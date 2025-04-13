
#include <stdio.h>
#include "platform.h"
#include "xuartps.h"
#include "xparameters.h"
#include "xaxidma.h"
#include "xscugic.h"
#include "xgpio.h"
#include "sleep.h"
#include <xtime_l.h>

#define HEIGHT 128
#define WIDTH 128
#define IMAGE_SIZE HEIGHT * WIDTH
#define HEADER_SIZE 1078
#define FILE_SIZE IMAGE_SIZE + HEADER_SIZE


//#define DEBUG_ 1
//#define INTR_EN 1
#define IMAGE_FROM_UART 1



#ifndef IMAGE_FROM_UART
#include "imageData.h"
#endif



s32 dma_init(void);
s32 gpio_init(void);
u32 checkIdle(u32 baseAdddr, u32 offset);
void set_start_i(u32 data);
u32 checkHalted(u32 baseAddr, u32 offset);

typedef enum {ACTIVE_HIGHT = 1, RISING_EDGE_TRIGGER = 3} intr_trigger_e;

XAxiDma_Config *myDmaConfig;
XAxiDma myDma;

XScuGic_Config *myIntrConfig;
XScuGic myIntr;

XGpio myGpio;
#ifdef INTR_EN
u32 done;
#endif

s32 intr_enable(u8 priority, intr_trigger_e trigger_type);
#ifdef INTR_EN

void myISR(void *CallBackRef){
    // print("Interrupt triggered!\n");
   XScuGic_Disable(&myIntr, XPAR_FABRIC_TOP_MODULE_0_O_INTR_INTR);
	done = 1;
   XScuGic_Enable(&myIntr, XPAR_FABRIC_TOP_MODULE_0_O_INTR_INTR);

}
#endif

void sendHistogramData();
int main()
{

	#ifdef INTR_EN
	done = 0;
	#endif
	XTime start, end;
	u32 histogram[600] __attribute__((aligned(32)));
	s32 status;
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
#ifdef INTR_EN
    intr_enable(0xA0, RISING_EDGE_TRIGGER);
#endif

#ifdef IMAGE_FROM_UART
    XUartPs Uart_Ps;
    XUartPs_Config *Config = XUartPs_LookupConfig(XPAR_XUARTPS_1_DEVICE_ID);
       XUartPs_CfgInitialize(&Uart_Ps, Config, Config->BaseAddress);

       XUartPs_SetBaudRate(&Uart_Ps, 115200);
//       XUartPs_Send(&Uart_Ps, "UART1 ready\r\n", 13);


	u8 *imageData;
	imageData = (u8*)malloc(FILE_SIZE * sizeof(u8));
	if(imageData == NULL) {
		print("Memory allocation failed...\n");
		return -1;

		}
	u32 totalReceivedBytes = 0;

	while(totalReceivedBytes < FILE_SIZE) {
	    u8 buffer[100];
	    int bytesReceived = XUartPs_Recv(&Uart_Ps, buffer, sizeof(buffer));

	    if(bytesReceived > 0) {
	        for(int i = 0; i < bytesReceived && totalReceivedBytes < FILE_SIZE; i++) {
	            imageData[totalReceivedBytes++] = buffer[i];
	        }

	    }
	}

	int row_size = (WIDTH + 3) & ~3;
	int pixel_index = 0;
	static u8 img_out[IMAGE_SIZE] __attribute__((aligned(32)));
	*img_out = (u8*)malloc(IMAGE_SIZE * sizeof(u8));
	 for (int i = 0; i < HEIGHT; i ++){
    	u32 start = HEADER_SIZE + (HEIGHT - 1 - i) * row_size;

        for (int j = 0; j < WIDTH; j++){
          img_out[pixel_index] = imageData[start+j];
          pixel_index          = pixel_index + 1;

	 }

	}
//	 for(int i = HEADER_SIZE; i< HEADER_SIZE + 10; i++){
//	        	printf("%d %d\n", imageData[i - 1], img_out[i - HEADER_SIZE]);
//	        }
//	 for(int i = 0; i < 10; i++){
//		 printf("%d ", img_out[i]);
//	 }
//	 printf("\n");

#endif
	set_start_i(1);
	usleep(1);
	set_start_i(0);
	XTime_GetTime(&start);
	Xil_DCacheFlush();
	#ifdef IMAGE_FROM_UART
	status = XAxiDma_SimpleTransfer(&myDma,(u8*)&img_out,IMAGE_SIZE * sizeof(u8),XAXIDMA_DMA_TO_DEVICE);
	if(status != XST_SUCCESS){
		print("PS -> PL transfer failed\n");
		return -1;
	}
	#endif
	#ifndef IMAGE_FROM_UART
status = XAxiDma_SimpleTransfer(&myDma,(u8*)&imageData[HEADER_SIZE],IMAGE_SIZE * sizeof(u8),XAXIDMA_DMA_TO_DEVICE);
	if(status != XST_SUCCESS){
		print("PS -> PL transfer failed\n");
		return -1;
	}
	#endif
	status = XAxiDma_SimpleTransfer(&myDma,(u32)histogram, 600 *sizeof(u32),XAXIDMA_DEVICE_TO_DMA);
	if(status != XST_SUCCESS){
		print("PL -> PS transfer failed\n");
		return -1;
	}
#ifndef INTR_EN
//	print("ttesst1\n");
	 status = checkHalted(XPAR_AXI_DMA_0_BASEADDR,0x4);
	    while(status != 1){
	    	status = checkHalted(XPAR_AXI_DMA_0_BASEADDR,0x4);
	    }
	    status = checkHalted(XPAR_AXI_DMA_0_BASEADDR,0x34);
	    while(status != 1){
	    	status = checkHalted(XPAR_AXI_DMA_0_BASEADDR,0x34);
	    }
#endif
#ifdef INTR_EN
	    while(!done){}
#endif
	 XTime_GetTime(&end);
	Xil_DCacheFlushRange((UINTPTR)histogram,  600 * sizeof(u32));
	Xil_DCacheInvalidateRange((UINTPTR)histogram,  600 * sizeof(u32));
#ifdef DEBUG_
printf("PROCESSING time %f us \n", (end-start) * 1000000.0/COUNTS_PER_SECOND);
	 for(int i = 500; i< 600; i++){
		 xil_printf("%d\n", histogram[i]);
	 }

#endif
#ifndef DEBUG_
	sendHistogramData(histogram);
#endif





    return 0;
}
void sendHistogramData(u32 histogram[]) {
	 for (int i = 0; i < 600; i++) {
	        xil_printf("%c%c%c%c",
	            (histogram[i] >> 0) & 0xFF,
	            (histogram[i] >> 8) & 0xFF,
	            (histogram[i] >> 16) & 0xFF,
	            (histogram[i] >> 24) & 0xFF
	        );
	        usleep(2000);
	    }

}


s32 dma_init(){
	myDmaConfig = XAxiDma_LookupConfigBaseAddr(XPAR_AXI_DMA_0_BASEADDR);
	return XAxiDma_CfgInitialize(&myDma, myDmaConfig);
}

#ifdef INTR_EN
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
#endif
s32 gpio_init(){
	return  XGpio_Initialize(&myGpio, XPAR_GPIO_0_DEVICE_ID);
}
u32 checkHalted(u32 baseAddr, u32 offset){
	u32 status;
		status = (XAxiDma_ReadReg(baseAddr,offset))&XAXIDMA_HALTED_MASK;
		return status;
}

void set_start_i(u32 data){
	XGpio_DiscreteWrite(&myGpio, 1, data);

}
