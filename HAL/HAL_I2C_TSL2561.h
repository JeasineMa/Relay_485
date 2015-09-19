/*
******************************************************************************
halrtc.H - (C) Copyright SGS-Thomson Microelectronics
******************************************************************************
*/
#ifndef __TLS2561_HALI2C_H__
#define __TLS2561_HALI2C_H__
/*
******************************************************************************
Includes
******************************************************************************
*/
#include <stdio.h>
#include "stm8s.h"

#define	TLS2561_SDA_PORT	GPIOB
#define	TLS2561_SDA_PORT_NUM	GPIO_PIN_5

#define	TLS2561_SCL_PORT	GPIOB
#define	TLS2561_SCL_PORT_NUM	GPIO_PIN_4


#define	DATAIN		0
#define	DATAOUT	1

//Éè±¸¶ÁÐ´µØÖ·  
#define SLAVE_ADDR_WR 0x52
#define SLAVE_ADDR_RD 0x53 

//ÃüÁî¿ØÖÆ¼Ä´æÆ÷  
#define CONTROL 	0x80 
#define TIMING  	0x81  
#define DATA0LOW  0x8C 
#define DATA0HIGH 0x8D 
#define DATA1LOW  0x8E 
#define DATA1HIGH 0x8F 


#define TSL2561_LUX_LUXSCALE      (14)      // Scale by 2^14
#define TSL2561_LUX_RATIOSCALE    (9)       // Scale ratio by 2^9
#define TSL2561_LUX_CHSCALE       (10)      // Scale channel values by 2^10
#define TSL2561_LUX_CHSCALE_TINT0 (0x7517)  // 322/11 * 2^TSL2561_LUX_CHSCALE
#define TSL2561_LUX_CHSCALE_TINT1 (0x0FE7)  // 322/81 * 2^TSL2561_LUX_CHSCALE



// T, FN and CL package values
#define TSL2561_LUX_K1T           (0x0040)  // 0.125 * 2^RATIO_SCALE
#define TSL2561_LUX_B1T           (0x01f2)  // 0.0304 * 2^LUX_SCALE
#define TSL2561_LUX_M1T           (0x01be)  // 0.0272 * 2^LUX_SCALE
#define TSL2561_LUX_K2T           (0x0080)  // 0.250 * 2^RATIO_SCALE
#define TSL2561_LUX_B2T           (0x0214)  // 0.0325 * 2^LUX_SCALE
#define TSL2561_LUX_M2T           (0x02d1)  // 0.0440 * 2^LUX_SCALE
#define TSL2561_LUX_K3T           (0x00c0)  // 0.375 * 2^RATIO_SCALE
#define TSL2561_LUX_B3T           (0x023f)  // 0.0351 * 2^LUX_SCALE
#define TSL2561_LUX_M3T           (0x037b)  // 0.0544 * 2^LUX_SCALE
#define TSL2561_LUX_K4T           (0x0100)  // 0.50 * 2^RATIO_SCALE
#define TSL2561_LUX_B4T           (0x0270)  // 0.0381 * 2^LUX_SCALE
#define TSL2561_LUX_M4T           (0x03fe)  // 0.0624 * 2^LUX_SCALE
#define TSL2561_LUX_K5T           (0x0138)  // 0.61 * 2^RATIO_SCALE
#define TSL2561_LUX_B5T           (0x016f)  // 0.0224 * 2^LUX_SCALE
#define TSL2561_LUX_M5T           (0x01fc)  // 0.0310 * 2^LUX_SCALE
#define TSL2561_LUX_K6T           (0x019a)  // 0.80 * 2^RATIO_SCALE
#define TSL2561_LUX_B6T           (0x00d2)  // 0.0128 * 2^LUX_SCALE
#define TSL2561_LUX_M6T           (0x00fb)  // 0.0153 * 2^LUX_SCALE
#define TSL2561_LUX_K7T           (0x029a)  // 1.3 * 2^RATIO_SCALE
#define TSL2561_LUX_B7T           (0x0018)  // 0.00146 * 2^LUX_SCALE
#define TSL2561_LUX_M7T           (0x0012)  // 0.00112 * 2^LUX_SCALE
#define TSL2561_LUX_K8T           (0x029a)  // 1.3 * 2^RATIO_SCALE
#define TSL2561_LUX_B8T           (0x0000)  // 0.000 * 2^LUX_SCALE
#define TSL2561_LUX_M8T           (0x0000)  // 0.000 * 2^LUX_SCALE


void TLS2561_write_sda_bit(unsigned char sda_data);   
void TLS2561_write_scl_bit(unsigned char scl_data);   
void TLS2561_start_bit(void);   
void TLS2561_stop_bit(void)  ;
u8   TLS2561_ack_recieve(void);  
void TLS2561_write_byte(u8 data)   ;
u8 TLS2561_read_byte(void)   ;
u8 TSL2561_Write(u8 command,u8 date) ;
u8 TSL2561_Read(u8 command, u8 *pDat);
void set_cal_time_amp(u8 amp, u8 cal_time);
void Read_Light(void) ;
void PinDirConfig(uint8_t dir);
void TLS2561_I2C_Delay(u32 nCount);   
void InitTSL2561(void);
uint32_t calculateLux(uint16_t ch0, uint16_t ch1);
void get_lightlux(u16 *value);

#ifdef __cplusplus
}
#endif



/* ------------------------------- End of file ---------------------------- */
#endif /* #ifndef __TLS2561_HALAUD_H */

