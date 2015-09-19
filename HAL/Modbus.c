
#include "MODBUS.h"

void bsp_ModbusRTUSlave_Tx(unsigned char *pt_send, u16 lenght);
u16 cal_crc16(u8 *ptr,u16 len);		//CRC校验(16位)
/*
void modbus_set_buff();
void modbus_put_buff();*/
static void UART_clear_buf(void);
void 		UART1_SendByte(u8 data);
void 		UART1_SendString(u8* Data,u16 len);


//u32 duty;

u32 duty_receive;
extern u8	sensor_id;

extern u16	 optimal_light_strength;
u8 HoldingReg_data[HOLDINGREG_DATA_SIZE]; //可读写寄存器 功能码：0x03  0x06  0x10 
u16  src_crc, dst_crc;
usart_def  usart1info,usart2info,usart3info;

static const unsigned char  aucCRCHi[] = {
	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,
	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,
	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,
	0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,
	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,
	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,
	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,
	0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,
	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,
	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,
	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,
	0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 
	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,
	0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 
	0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,
	0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,
	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 
	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,
	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,
	0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,
	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,
	0x00, 0xC1, 0x81, 0x40
};

static const unsigned char aucCRCLo[] = {
	0x00, 0xC0, 0xC1, 0x01, 0xC3, 0x03, 0x02, 0xC2, 0xC6, 0x06, 0x07, 0xC7,
	0x05, 0xC5, 0xC4, 0x04, 0xCC, 0x0C, 0x0D, 0xCD, 0x0F, 0xCF, 0xCE, 0x0E,
	0x0A, 0xCA, 0xCB, 0x0B, 0xC9, 0x09, 0x08, 0xC8, 0xD8, 0x18, 0x19, 0xD9,
	0x1B, 0xDB, 0xDA, 0x1A, 0x1E, 0xDE, 0xDF, 0x1F, 0xDD, 0x1D, 0x1C, 0xDC,
	0x14, 0xD4, 0xD5, 0x15, 0xD7, 0x17, 0x16, 0xD6, 0xD2, 0x12, 0x13, 0xD3,
	0x11, 0xD1, 0xD0, 0x10, 0xF0, 0x30, 0x31, 0xF1, 0x33, 0xF3, 0xF2, 0x32,
	0x36, 0xF6, 0xF7, 0x37, 0xF5, 0x35, 0x34, 0xF4, 0x3C, 0xFC, 0xFD, 0x3D,
	0xFF, 0x3F, 0x3E, 0xFE, 0xFA, 0x3A, 0x3B, 0xFB, 0x39, 0xF9, 0xF8, 0x38, 
	0x28, 0xE8, 0xE9, 0x29, 0xEB, 0x2B, 0x2A, 0xEA, 0xEE, 0x2E, 0x2F, 0xEF,
	0x2D, 0xED, 0xEC, 0x2C, 0xE4, 0x24, 0x25, 0xE5, 0x27, 0xE7, 0xE6, 0x26,
	0x22, 0xE2, 0xE3, 0x23, 0xE1, 0x21, 0x20, 0xE0, 0xA0, 0x60, 0x61, 0xA1,
	0x63, 0xA3, 0xA2, 0x62, 0x66, 0xA6, 0xA7, 0x67, 0xA5, 0x65, 0x64, 0xA4,
	0x6C, 0xAC, 0xAD, 0x6D, 0xAF, 0x6F, 0x6E, 0xAE, 0xAA, 0x6A, 0x6B, 0xAB, 
	0x69, 0xA9, 0xA8, 0x68, 0x78, 0xB8, 0xB9, 0x79, 0xBB, 0x7B, 0x7A, 0xBA,
	0xBE, 0x7E, 0x7F, 0xBF, 0x7D, 0xBD, 0xBC, 0x7C, 0xB4, 0x74, 0x75, 0xB5,
	0x77, 0xB7, 0xB6, 0x76, 0x72, 0xB2, 0xB3, 0x73, 0xB1, 0x71, 0x70, 0xB0,
	0x50, 0x90, 0x91, 0x51, 0x93, 0x53, 0x52, 0x92, 0x96, 0x56, 0x57, 0x97,
	0x55, 0x95, 0x94, 0x54, 0x9C, 0x5C, 0x5D, 0x9D, 0x5F, 0x9F, 0x9E, 0x5E,
	0x5A, 0x9A, 0x9B, 0x5B, 0x99, 0x59, 0x58, 0x98, 0x88, 0x48, 0x49, 0x89,
	0x4B, 0x8B, 0x8A, 0x4A, 0x4E, 0x8E, 0x8F, 0x4F, 0x8D, 0x4D, 0x4C, 0x8C,
	0x44, 0x84, 0x85, 0x45, 0x87, 0x47, 0x46, 0x86, 0x82, 0x42, 0x43, 0x83,
	0x41, 0x81, 0x80, 0x40
};

void UART1_SendByte(u8 data)
{
	UART1_SendData8((unsigned char)data);
	/* Loop until the end of transmission */
	while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
}

void UART1_SendString(u8* Data,u16 len)
{
	u16 i=0;
	for(i=0;i<len;i++)
		UART1_SendByte(Data[i]); 
}


 void UART_clear_buf(void)
{
	u16 i;
	usart1info.write = 0;
	usart1info.Rx_delay_CNT = 0;
	for(i = 0; i < USART_DATA_SIZE ; i++)
		usart1info.data[i] =0xFF;
}

static u16 ModbusRTU_CRC(unsigned char *pucFrame, u16 usLen)
{
	unsigned char	ucCRCHi = 0xFF;
	unsigned char	       ucCRCLo = 0xFF;
	u16      iIndex = 0;

	while( usLen-- )
	{
		iIndex = ucCRCHi ^ *( pucFrame++ );
		ucCRCHi	 = (unsigned char)( ucCRCLo ^ aucCRCHi[iIndex] );
		ucCRCLo = aucCRCLo[iIndex];
	}

	return (u16)( ucCRCHi << 8 | ucCRCLo );
}
//33 03 00 00 00 01 80 18 
//  ID 1   CMD 1  address 2  quantity 2  CRC 2 
static void ReadHoldingRegisters_Handle(void)
{
	unsigned char  i,byte_index;
	u16	dat_CRC,dat_Quantity,dat_Address;
	//u16 temp;

	src_crc = ModbusRTU_CRC(usart1info.data,6); // 检验前六个字节    

	dst_crc = usart1info.data[6] ;	
	dst_crc =  (dst_crc<< 8 | usart1info.data[7]);
	
	//CRC添加到消息中时，低字节先加入，然后高字节。
	if(src_crc ==dst_crc) 
		usart1info.CRCerror = 0; //CRC校验正确
	else 
		usart1info.CRCerror = 1; //CRC校验出错
		
	if((usart1info.slaveID == sensor_id) && (usart1info.CRCerror == 0))//从机地址正确  CRC校验正确  接着往下处理
	{
		dat_Quantity = (u16)((usart1info.data[4] << 8 )| (usart1info.data[5])); 	//Quantity of Outputs 在消息中  高位在前  低位在后
		if(dat_Quantity >= 0x01 && dat_Quantity <= 0x10)  		//0x0001 <= Quantity of Outputs <= 0x0010
		{
			dat_Address = (u16)((usart1info.data[2] << 8) | (usart1info.data[3])); //Address在消息中  高位在前  低位在后

			if((dat_Address + dat_Quantity) <= HOLDINGREG_DATA_SIZE)  //Address 要在范围之内
			{
				byte_index = (unsigned char )dat_Quantity * 2;
				
				usart1info.send[0] = sensor_id;
				usart1info.send[1] = usart1info.function;
				usart1info.send[2] = byte_index; 

				for(i = 0; i < byte_index; i++) //读取相应的寄存器的值
				{
					usart1info.send[i  + 3] = (unsigned char )(HoldingReg_data[dat_Address + i] );
				}

				dat_CRC = ModbusRTU_CRC(usart1info.send,byte_index + 3); 
				usart1info.send[byte_index + 4] = (unsigned char )(dat_CRC & 0x00FF);
				usart1info.send[byte_index + 3] = (unsigned char )(dat_CRC >> 8);
				GPIO_WriteHigh(GPIOD,GPIO_PIN_4);
				Delay(5);
				bsp_ModbusRTUSlave_Tx(usart1info.send, byte_index + 5); //发送相应的消息给主机
                      
				Delay(2500);
			//	GPIO_WriteLow(GPIOD,GPIO_PIN_4);
			}
			
			else 
				usart1info.exceptionCode = 0x02; //错误类型：Address 不在范围之内
		}
		
		else  
			usart1info.exceptionCode = 0x03; //错误类型：Quantity of Outputs 不在范围之内
	} 
}



static void WriteSingleRegister_Handle(void)
{
	unsigned char i;
	u16 dat_Value,dat_Address;
//        u16 dat_CRC;
	
	src_crc = ModbusRTU_CRC(usart1info.data,6); // 检验前六个字节    
	dst_crc = usart1info.data[6] ;	
	dst_crc =  (dst_crc<< 8 | usart1info.data[7]);
	
	//CRC添加到消息中时，低字节先加入，然后高字节。
	if(src_crc ==dst_crc) 
		usart1info.CRCerror = 0; //CRC校验正确
	else
		usart1info.CRCerror = 1; //CRC校验出错

	if((usart1info.slaveID == sensor_id) && (usart1info.CRCerror == 0))//从机地址正确  CRC校验正确  接着往下处理
	{
		dat_Value = (u16)(usart1info.data[4] << 8 | usart1info.data[5]); //Register Value 在消息中  高位在前  低位在后
		dat_Address = (u16)(usart1info.data[2] << 8 | usart1info.data[3]); //Address在消息中  高位在前  低位在后
		
		if(dat_Address < HOLDINGREG_DATA_SIZE)  //Address 要在范围之内
		{
			HoldingReg_data[dat_Address] = dat_Value; //将相应的值写入寄存器

			for(i = 0; i < 8; i++) 
				usart1info.send[i] = usart1info.data[i]; //将接收到的消息直接反馈给主机
			GPIO_WriteHigh(GPIOD,GPIO_PIN_4);
			Delay(2);
			bsp_ModbusRTUSlave_Tx(usart1info.send, 8); //发送相应的消息给主机
			Delay(4);
			//GPIO_WriteLow(GPIOD,GPIO_PIN_4);
			//modbus_set_buff();
		}
		else 
			usart1info.exceptionCode = 0x02; //错误类型：Address 不在范围之内
	} 
}


static void WriteMultipleregisters_Handle(void)
{
	unsigned char  i;
	u16 dat_CRC,dat_Address,dat_Quantity;

	src_crc = ModbusRTU_CRC(usart1info.data, usart1info.data[6] + 7); // 检验前N个字节 
	dst_crc = usart1info.data[6] ;	
	dst_crc =  (dst_crc<< 8 | usart1info.data[7]);
	
	//CRC添加到消息中时，低字节先加入，然后高字节。
	if(src_crc ==dst_crc) 
		usart1info.CRCerror = 0; //CRC校验正确
	else                                                         
		usart1info.CRCerror = 1; //CRC校验出错

	if((usart1info.slaveID == sensor_id) && (usart1info.CRCerror == 0))//从机地址正确  CRC校验正确  接着往下处理
	{
		dat_Quantity = (u16)(usart1info.data[4] << 8 | usart1info.data[5]); //Quantity of Outputs 在消息中  高位在前  低位在后
		
		if(dat_Quantity >= 0x0001 && dat_Quantity <= 0x007B && usart1info.data[6] == (dat_Quantity * 2))  //0x0001 <= Quantity of Outputs <= 0x007B
		{
			dat_Address = (u16)(usart1info.data[2] << 8 | usart1info.data[3]); //Address在消息中  高位在前  低位在后
			
			if((dat_Address + dat_Quantity) <= HOLDINGREG_DATA_SIZE)  //Address 要在范围之内
			{
				for(i = 0; i < dat_Quantity; i++) //写入相应的寄存器的值
				{
					HoldingReg_data[dat_Address + i] = (u16)(usart1info.data[i * 2 + 7] << 8 | usart1info.data[i * 2 + 8]);
				}

				for(i = 0; i < 6; i++) 
					usart1info.send[i] = usart1info.data[i]; //将接收到的消息的前一部分+CRC反馈给主机
					
				dat_CRC = ModbusRTU_CRC(usart1info.send,6); 
				
				usart1info.send[6] = (unsigned char)(dat_CRC & 0x00FF);
				usart1info.send[7] = (unsigned char)(dat_CRC >> 8);
				GPIO_WriteHigh(GPIOD,GPIO_PIN_4);
				Delay(2);
				bsp_ModbusRTUSlave_Tx(usart1info.send, 8); //发送相应的消息给主机 
				Delay(4);
			//	GPIO_WriteLow(GPIOD,GPIO_PIN_4);
				//modbus_set_buff();
			}
			else usart1info.exceptionCode = 0x02; //错误类型：Address 不在范围之内
		}
		else  usart1info.exceptionCode = 0x03; //错误类型：Quantity of Outputs 不在范围之内
	}
}


void bsp_ModbusRTUSlave_Tx(unsigned char *pt_send, u16 lenght)
{
    //u16 i; 
    
    UART1_SendString(pt_send,lenght);
}


// 01 03 00 00 00 02 c4 0b 
void bsp_ModbusRTUSlave_decode(void)
{ 
	u16 dat_buff;

	if(usart1info.write > 0 && usart1info.Rx_delay_CNT > 4)//缓冲区接收到数据  延时200ms再处理
	{ 
		usart1info.slaveID = usart1info.data[0];
		usart1info.function = usart1info.data[1];
		usart1info.exceptionCode = 0x00; // 错误类型清零
		
		switch(usart1info.function)
		{
                    
			//case 0x01:ReadCoils_Handle();break;  //Read Coils 这种"位"是可读写的，在PLC中为可读写的线圈，如数字量输出、中间继电器等
			//case 0x02:ReadDiscreteInputs_Handle();break;  //Read Discrete Inputs 这种"位"是只读的，不能进行写操作，在PLC中为只读的线圈，如数字量输入
			case 0x03:
				ReadHoldingRegisters_Handle();
				break;  //Read Holding Registers  这种寄存器可读写  0x0001 <= Quantity of Registers <= 0x007D
			//case 0x04:ReadInputRegisters_Handle();break;  //Read Input Registers    这种寄存器只能读，不能写
			//case 0x05:WriteSingleCoil_Handle();break;  //Write Single Coil
			case 0x06:
				WriteSingleRegister_Handle();
				break;  //Write Single Register
			//case 0x0F:WriteMultipleCoils_Handle();break;  //Write Multiple Coils 
			case 0x10:
				WriteMultipleregisters_Handle();
				break;  //Write Multiple registers   0x0001 <= Quantity of Registers <= 0x007B
			default : 
				break; //usart1info.exceptionCode = 0x01;注释掉了，用不着，而且还会有误判的情况，错误类型：功能号不支持
		}
		//发送故障信息给主机
		if(usart1info.exceptionCode != 0 && usart1info.slaveID == sensor_id)
		{
			usart1info.send[0] = sensor_id;
			usart1info.send[1] = usart1info.function | 0x80;//function + 0x80
			usart1info.send[2] = usart1info.exceptionCode;

			dat_buff = ModbusRTU_CRC(usart1info.send,3);

			usart1info.send[3] = (unsigned char )(dat_buff & 0x00FF);
			usart1info.send[4] = (unsigned char )(dat_buff >> 8);
			GPIO_WriteHigh(GPIOD,GPIO_PIN_4);
			Delay(2);
			bsp_ModbusRTUSlave_Tx(usart1info.send, 5); //发送相应的消息给主机
			Delay(4);
			GPIO_WriteLow(GPIOD,GPIO_PIN_4);
		}

		UART_clear_buf();
                usart1info.write = 0;
                usart1info.Rx_delay_CNT = 0;
	}
}
/*
void modbus_set_buff()
{

}

//将数据放入modbuf   里面
void modbus_put_buff()
{
	unsigned int num;
	memset(HoldingReg_data,0,HOLDINGREG_DATA_SIZE);
	HoldingReg_data[0] = optimal_light_strength>>8;
	HoldingReg_data[1] = optimal_light_strength&0xff;
}
*/

