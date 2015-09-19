/*------------------------------------------------------------------*-

  MODBUS.h

-*------------------------------------------------------------------*/

#ifndef __MODBUS_H
#define __MODBUS_H

#ifdef __cplusplus
 extern "C" {
#endif 


#include "stm8s.h"
#include "stm8s_uart1.h"
#include "stm8s_clk.h"
   

#define SLAVE_ID 			0x01

#define USART_DATA_SIZE 	20
#define HOLDINGREG_DATA_SIZE 36


typedef struct usart_s
{
	unsigned char  data[USART_DATA_SIZE];
	unsigned char  slaveID;
	unsigned char  exceptionCode;
	unsigned char  CRCerror;	
        u16 write;
	unsigned char  function;
	unsigned char  send[USART_DATA_SIZE];
	u16 Rx_delay_CNT;
	u8 rev_flag;	//代表收到一包数据
	u8 commucation_flag;		//通信成功失败标值
}usart_def;

extern usart_def  usart1info;
	 
extern void slave_process(u8 adr);
extern void master_write(u8 adr, u8 num, u32 dat);
extern void master_read(u8 adr, u8 num);
extern u16 cal_crc16(u8 *ptr,u16 len);
extern u32 duty_receive;

extern void bsp_ModbusRTUSlave_decode(void);
//-----------------------------------

#ifdef __cplusplus
}
#endif

#endif /*__MODBUS_H*/

/*------------------------------------------------------------------*-
  ---- END OF FILE -------------------------------------------------
-*------------------------------------------------------------------*/
