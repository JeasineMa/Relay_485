/*
******************************************************************************
HALI2C.C
******************************************************************************
Hardware Abstraction Layer.
******************************************************************************
(C) Copyright STMicroelectronics - 2004-
******************************************************************************

Revision History (Latest modification on top)

*/

/*
******************************************************************************
Includes
******************************************************************************
*/
#include "HAL_I2C_TSL2561.h"
#include <string.h>
						   	

unsigned char ack = 1;
u8	light_amp = 0;
u8	light_cal_time = 2;

//????;????????  
//????:  
//????:  
/*******************************************************************************/   
void TLS2561_write_sda_bit(unsigned char sda_data)   
{   
	if(sda_data==0)   
	{ 
		GPIO_WriteLow(TLS2561_SDA_PORT, TLS2561_SDA_PORT_NUM);
	}   
	else   
	{   
		GPIO_WriteHigh(TLS2561_SDA_PORT, TLS2561_SDA_PORT_NUM);
	}   
}   
/*******************************************************************************  
????;????????  
????:  
????:  
*******************************************************************************/   
void TLS2561_write_scl_bit(unsigned char scl_data)   
{   
	if(scl_data==0)   
	{ 
		GPIO_WriteLow(TLS2561_SDA_PORT, TLS2561_SCL_PORT_NUM);
	}   
	else   
	{   
		GPIO_WriteHigh(TLS2561_SDA_PORT, TLS2561_SCL_PORT_NUM);
	}   
}   

/*******************************************************************************  
????;??????  
????:  
????:  
*******************************************************************************/   
void TLS2561_start_bit(void)   
{   
	TLS2561_write_sda_bit(1);//?????    
//	TLS2561_I2C_Delay(6);  
	TLS2561_write_scl_bit(1);//?????    
	TLS2561_I2C_Delay(6);   
	TLS2561_write_sda_bit(0);//?????    
	TLS2561_I2C_Delay(12);   
	TLS2561_write_scl_bit(0);//?????    
	TLS2561_I2C_Delay(6);   
}   
/*******************************************************************************  
????;??????  
????:  
????:  
*******************************************************************************/   
void TLS2561_stop_bit(void)   
{   
	TLS2561_write_sda_bit(0);//?????    
//	TLS2561_I2C_Delay(6);  
	TLS2561_write_scl_bit(1);//?????    
	TLS2561_I2C_Delay(6);   
	TLS2561_write_sda_bit(1);//?????    
	TLS2561_I2C_Delay(6);   
	TLS2561_write_scl_bit(0);
	TLS2561_I2C_Delay(6); 
}   


/*******************************************************************************  
????;??????  
????:  
	????:  
*******************************************************************************/   
u8 TLS2561_ack_recieve(void)   
{   
	u32 temp=0xffff;   
	TLS2561_write_sda_bit(1);//?????    
	TLS2561_write_scl_bit(1);   
	TLS2561_I2C_Delay(3);   
	PinDirConfig(DATAIN);

	while(temp&&(GPIO_ReadInputPin(TLS2561_SDA_PORT, TLS2561_SDA_PORT_NUM)))   
	{   
		temp--;   
	} 
	PinDirConfig(DATAOUT);

	TLS2561_write_scl_bit(0);   
	TLS2561_I2C_Delay(3);   
}   

/*******************************************************************************  
????;?????  
	????:  
????:  
	*******************************************************************************/   
void TLS2561_write_byte(u8 data)   
{   
	unsigned char temp;   

	for(temp=8;temp>0;temp--)   
	{   
		
		if((data&0x80)==0x80)   
		{   
			TLS2561_write_sda_bit(1);   
		}   
		else   
		{   
			TLS2561_write_sda_bit(0);   
		}  
		
		TLS2561_I2C_Delay(6);   
		TLS2561_write_scl_bit(1);   
		TLS2561_I2C_Delay(6);  
		TLS2561_write_scl_bit(0);   
		data=data<<1;   
	}  
	TLS2561_I2C_Delay(6);  
	TLS2561_write_sda_bit(1);   
	TLS2561_I2C_Delay(6);  
	TLS2561_write_scl_bit(1);  
	PinDirConfig(DATAIN);
	TLS2561_I2C_Delay(6);  
	ack = (GPIO_ReadInputPin(TLS2561_SDA_PORT, TLS2561_SDA_PORT_NUM)) ;  	
	TLS2561_I2C_Delay(6);  
	PinDirConfig(DATAOUT);	
	TLS2561_write_scl_bit(0);   
	TLS2561_I2C_Delay(6);  	
}   
/*******************************************************************************  
????;?????  
	????:  
????:  
	*******************************************************************************/   
u8 TLS2561_read_byte(void)   
{   
	unsigned char temp = 0;   
	unsigned char ret_value = 0;   

	TLS2561_write_sda_bit(1);   
	TLS2561_I2C_Delay(6); 
	PinDirConfig(DATAIN);
	
	for(temp=0;temp<8;temp++)   
	{   
		TLS2561_write_scl_bit(0);   
		TLS2561_I2C_Delay(6);   
		TLS2561_write_scl_bit(1);   
		TLS2561_I2C_Delay(6);   
		if(GPIO_ReadInputPin(TLS2561_SDA_PORT, TLS2561_SDA_PORT_NUM))   
		{   
			ret_value+=1;   
		}   
		else   
		{   
			ret_value+=0;   
		}   
	//	TLS2561_I2C_Delay(20);  
		if(temp!=7)   
		ret_value=ret_value<<1;   
		TLS2561_write_scl_bit(0);   
	}   
	
	PinDirConfig(DATAOUT);
	TLS2561_I2C_Delay(6); 
	TLS2561_write_sda_bit(1);   
	TLS2561_I2C_Delay(6); 
	TLS2561_write_scl_bit(1);   
	TLS2561_I2C_Delay(6);   
	TLS2561_write_scl_bit(0);   
	TLS2561_I2C_Delay(6);  

	return ret_value;
}


u8  TSL2561_Write(u8 command,u8 date) 
{  
	TLS2561_start_bit();   
	TLS2561_write_byte(SLAVE_ADDR_WR);  
	if(ack) return 1;  
	TLS2561_write_byte(command);  
	if(ack) return 1;  
	TLS2561_write_byte(date);  
	if(ack) return 1;
	TLS2561_stop_bit(); 
	return 0;
} 
u8 TSL2561_Read(u8 command, u8 *pDat)
{   
	u8 date;  
	TLS2561_start_bit();   
	TLS2561_write_byte(SLAVE_ADDR_WR);  
	if(ack) return 1;  
	TLS2561_write_byte(command);  
	if(ack) return 1;  
	TLS2561_start_bit();  
	TLS2561_write_byte(SLAVE_ADDR_RD); 
	if(ack) return 1;  
	*pDat=TLS2561_read_byte(); 
	TLS2561_stop_bit();  
	return 0; 
} 

void set_cal_time_amp(u8 amp, u8 cal_time)
{
	if(amp==0)	//amp = 1
	{
		if(cal_time==0)  //13.7ms
			TSL2561_Write(0x81, 0x0);	//  1  倍增益
		else if(cal_time==1)  //101ms
			TSL2561_Write(0x81, 0x1);	//  1  倍增益
		else if(cal_time==2)  //402ms
			TSL2561_Write(0x81, 0x2);	//  1  倍增益
	}
	else if(amp==1)
	{
		if(cal_time==0)  //13.7ms
			TSL2561_Write(0x81, 0x10);	//  1  倍增益
		else if(cal_time==1)  //101ms
			TSL2561_Write(0x81, 0x11);	//  1  倍增益
		else if(cal_time==2)  //402ms
			TSL2561_Write(0x81, 0x12);	//  1  倍增益
	}
}

void InitTSL2561(void)
{
	light_amp = 0;			// 1倍
	light_cal_time = 2;		//402ms
	TSL2561_Write( 0x80, 0x03);	//power on
	set_cal_time_amp(light_amp,light_cal_time);	// 1增益
}
//读取光照强度
void Read_Light(void) 
{   
	u8  DataLow0,DataHigh0,DataLow1,DataHigh1,commad,temp; 
	u16 Channel0,Channel1;
	TSL2561_Read(DATA0LOW,&DataLow0);  
	TSL2561_Read(DATA0HIGH,&DataHigh0);  
	Channel0 = 256*DataHigh0 + DataLow0;    
	TSL2561_Read(DATA1LOW,&DataLow1);  
	TSL2561_Read(DATA1HIGH,&DataHigh1);  
	Channel1 = 256*DataHigh1 + DataLow1; 
	
} 

//得到光照强度
void get_lightlux(u16 *value)
{
	u8  DataLow0,DataHigh0,DataLow1,DataHigh1,commad,temp; 
	u16 Channel0,Channel1;
	
	TSL2561_Read(DATA0LOW,&DataLow0);  
	TSL2561_Read(DATA0HIGH,&DataHigh0);  
	Channel0 = 256*DataHigh0 + DataLow0;    
	TSL2561_Read(DATA1LOW,&DataLow1);  
	TSL2561_Read(DATA1HIGH,&DataHigh1);  
	Channel1 = 256*DataHigh1 + DataLow1; 

		// Determine if either sensor saturated (0xFFFF)
	// If so, abandon ship (calculation will not be accurate)
	if ((Channel0 == 0xFFFF) || (Channel1 == 0xFFFF))
	{
		if(light_cal_time==2)
			light_cal_time =1;
		else if(light_cal_time == 1)
			light_cal_time = 0;
		set_cal_time_amp(light_amp,light_cal_time);	//16高增益
		return;
	}

	*value = calculateLux(Channel0,Channel1);
}

uint32_t calculateLux(uint16_t ch0, uint16_t ch1)
{
	unsigned long chScale;
	unsigned long channel1;
	unsigned long channel0;

	// find the ratio of the channel values (Channel1/Channel0)
	unsigned long ratio1 ;
	// round the ratio value
	unsigned long ratio ;
	unsigned int b, m;
	unsigned long temp;
	u32 lux ;
	
	switch (light_cal_time)
	{
		case 0:
			chScale = TSL2561_LUX_CHSCALE_TINT0;
		break;
		case 1:
			chScale = TSL2561_LUX_CHSCALE_TINT1;
		break;
		default: // No scaling ... integration time = 402ms
			chScale = (1 << TSL2561_LUX_CHSCALE);
		break;
	}
	  // Scale for gain (1x or 16x)
  	if (!light_amp) 
		chScale = chScale << 4;

	  // scale the channel values
	channel0 = (ch0 * chScale) >> TSL2561_LUX_CHSCALE;
	channel1 = (ch1 * chScale) >> TSL2561_LUX_CHSCALE;

	if (channel0 != 0) 
		ratio1 = (channel1 << (TSL2561_LUX_RATIOSCALE+1)) / channel0;

	ratio = (ratio1 + 1) >> 1;


	if ((ratio >= 0) && (ratio <= TSL2561_LUX_K1T))
	{
		b=TSL2561_LUX_B1T; 
		m=TSL2561_LUX_M1T;
	}
	else if (ratio <= TSL2561_LUX_K2T)
	{
		b=TSL2561_LUX_B2T; 
		m=TSL2561_LUX_M2T;
	}
	else if (ratio <= TSL2561_LUX_K3T)
	{
		b=TSL2561_LUX_B3T; 
		m=TSL2561_LUX_M3T;
	}
	else if (ratio <= TSL2561_LUX_K4T)
	{
		b=TSL2561_LUX_B4T; 
		m=TSL2561_LUX_M4T;
	}
	else if (ratio <= TSL2561_LUX_K5T)
	{
		b=TSL2561_LUX_B5T; 
		m=TSL2561_LUX_M5T;
	}
	else if (ratio <= TSL2561_LUX_K6T)
	{
		b=TSL2561_LUX_B6T; 
		m=TSL2561_LUX_M6T;
	}
	else if (ratio <= TSL2561_LUX_K7T)
	{
		b=TSL2561_LUX_B7T; 
		m=TSL2561_LUX_M7T;
	}
	else if (ratio > TSL2561_LUX_K8T)
	{
		b=TSL2561_LUX_B8T; 
		m=TSL2561_LUX_M8T;
	}

	temp = ((channel0 * b) - (channel1 * m));

	// do not allow negative lux value
	if (temp < 0) 
		temp = 0;

	// round lsb (2^(LUX_SCALE-1))
	temp += (1 << (TSL2561_LUX_LUXSCALE-1));

	// strip off fractional portion
	lux = (temp >> TSL2561_LUX_LUXSCALE);

	// Signal I2C had no errors
	return lux;  
}

/****************************************************************************
* 函  数：void DS18B20PinDirConfig(uint8_t dir);
* 功  能：DS18B20数据引脚方向配置
* 参  数：uint8_t dir(DATAIN , DATAOUT)
* 返回值：无
* 更  新：无
* 备  注：无
****************************************************************************/
void PinDirConfig(uint8_t dir)
{
	switch(dir)
	{
		case DATAIN :
			GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)(GPIO_PIN_5), GPIO_MODE_IN_FL_NO_IT);
		break;
		case DATAOUT :
			GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)(GPIO_PIN_5), GPIO_MODE_OUT_PP_HIGH_FAST);
		break;
		
		default:
		break;
	}
}


//延时1 uS
void TLS2561_I2C_Delay(u32 nCount)   
{   
	u16 temp_counter = 0;
	for(; nCount != 0; nCount--)
	{
		for(temp_counter=0;temp_counter<2;temp_counter++)
		{
			;
		}
	}   
}   






