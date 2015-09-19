/**
  ******************************************************************************
  * @file    Project/main.c 
  * @author  MCD Application Team
  * @version V2.1.0
  * @date    18-November-2011
  * @brief   Main program body
  ******************************************************************************
  * @attention
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2011 STMicroelectronics</center></h2>
  ******************************************************************************
  */ 


/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "stm8s_uart1.h"
#include "stm8s_clk.h"
#include "stm8s_flash.h"

#include "HAL_I2C_TSL2561.h"
#include "Modbus.h"

/* Private defines -----------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/* Global Macros*/
#define   sensor_id   0x01
#define   I1_ADDR     0
#define   I2_ADDR     0  
#define   O1_ADDR     0
#define   O2_ADDR     0

 
/****************/

void      	RCC_INIT(void);
void 		GPIO_INIT(void);
void 		TIME1_INIT(void);
void 		USART1_INIT(void);
void 		TIME2_INIT(void);
void            void EXTI_INIT(void);
void            Delay(uint32_t nCount);

void 		run_led(u8 sta);

void           RS485_RSV(u8 port, u8 flag);


u16	time_counter;
u16     light_lux;

u8      get_light_flag;

u8      uart_counter;
u8      uart_buf[10] = {0};
u8      uart_revflag;
u16	uart_time_counter;

extern u8 HoldingReg_data[HOLDINGREG_DATA_SIZE];

//   235   5V    10   0V


void main(void)
{
  /* Infinite loop */
	RCC_INIT();
	GPIO_INIT();
        EXTI_INIT();
	TIME1_INIT();
	USART1_INIT();
	TIME2_INIT();
	//InitTSL2561();
	
	//get_light_flag = 0;
	//time_counter =0;
        
        
 /*     485继电器小板测试用程序  
        while(1)
        {
          GPIO_WriteHigh(GPIOD,GPIO_PIN_2);
          GPIO_WriteHigh(GPIOD,GPIO_PIN_3);
          GPIO_WriteHigh(GPIOA,GPIO_PIN_3);
          Delay(1000000);
    
          GPIO_WriteLow(GPIOD,GPIO_PIN_3);
          GPIO_WriteLow(GPIOD,GPIO_PIN_2);
          GPIO_WriteLow(GPIOA,GPIO_PIN_3);
          Delay(1000000);

        }
*/


	enableInterrupts();

	while (1)
	{
           GPIO_WriteLow(GPIOD,GPIO_PIN_4);//使能485接收
           
           
           bsp_ModbusRTUSlave_decode();
		
	}
}

//RS485 使能配置，flag=0使能接收 flag=1使能发送 port默认为1
void RS485_RSV(u8 port, u8 flag)
{
	if(port == 1)
	{
		if(flag ==0)
			GPIO_WriteLow(GPIOD,GPIO_PIN_4);	
		else
			GPIO_WriteHigh(GPIOD,GPIO_PIN_4);				
			
	}
}


void 	run_led(u8 sta)
{
	if(sta==1)
		GPIO_WriteLow(GPIOA,GPIO_PIN_3);
	else
		GPIO_WriteHigh(GPIOA,GPIO_PIN_3);
}




void Delay(uint32_t nCount)
{
	/* Decrement nCount value */
        //1000000时间适当
	while (nCount != 0)
	{       
		nCount--;
	}
}

//void Delay(uint32_t count)
//{
//        while(count--);
//}




void      RCC_INIT(void)
{
	 CLK->ICKR |= CLK_ICKR_HSIEN;
//	CLK_HSICmd(ENABLE);
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
//	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1,ENABLE);  //串口1时钟开
//	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1,ENABLE);  //定时器时钟1开	
//	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2,  ENABLE);  
	CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_PERIPHERAL_UART1 & (uint8_t)0x0F));
	CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_PERIPHERAL_TIMER1 & (uint8_t)0x0F));
	CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_PERIPHERAL_TIMER2 & (uint8_t)0x0F));

}

void USART1_INIT(void)
{
//	UART1_DeInit();
	UART1_Init(9600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1,UART1_PARITY_NO,UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE );  
	UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);//UART1_IT_RXNE_OR    
	UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
//	UART1_Cmd(ENABLE);  
	UART1_ClearFlag(UART1_FLAG_RXNE);
}


void 	GPIO_INIT(void)
{
	GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)(GPIO_PIN_4), GPIO_MODE_OUT_PP_LOW_FAST);    //EN485
	GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)(GPIO_PIN_5), GPIO_MODE_OUT_PP_HIGH_FAST);   //UART_TX
        GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)(GPIO_PIN_6), GPIO_MODE_IN_FL_NO_IT);        //UART_RX
        
        GPIO_Init(GPIOA, (GPIO_Pin_TypeDef)(GPIO_PIN_3), GPIO_MODE_OUT_PP_LOW_FAST);	//LED2
        
        GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)(GPIO_PIN_3), GPIO_MODE_IN_PU_IT);           //IN_2
        GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)(GPIO_PIN_4), GPIO_MODE_IN_PU_IT);           //IN_1
        
        GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)(GPIO_PIN_2),  GPIO_MODE_OUT_PP_LOW_FAST);   //OUT_2
        GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)(GPIO_PIN_3),  GPIO_MODE_OUT_PP_LOW_FAST);   //OUT_1
	
}



void EXTI_INIT(void)
{
      EXTI_DeInit();

      EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_RISE_FALL);
      EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOB, EXTI_SENSITIVITY_RISE_FALL);

}

/*******************************************************************************
*                           ==定时器2初始化函数==
* TIM2_DeInit();                                 --> 初始化定时器2寄存器
* TIM2_TimeBaseInit(TIM2_PRESCALER_1, 224);      --> 定时器2基本初始化 设置 分频系数 , 初值
                                                  --> ( 无分频 , 7372800 / 32768 = 225 校准为224 )
* TIM2_OC1Init(TIM2_OCMODE_PWM1 , TIM2_OUTPUTSTATE_ENABLE , 112 , TIM2_OCPOLARITY_HIGH);
                                                  --> 定时器2输出方式 为PWM1 , 定时器2输出状态使能 , 输出占空比 50% , 输出起始电平 为高
* TIM2_Cmd(ENABLE);                              --> 启动定时器
*******************************************************************************/
void TIME2_INIT(void)
{
	//	TIM2_DeInit();
	TIM2_TimeBaseInit(TIM2_PRESCALER_2, 1000);
	TIM2_OC3Init(TIM2_OCMODE_PWM1 , 
	TIM2_OUTPUTSTATE_ENABLE , 
	0 , 
	TIM2_OCPOLARITY_HIGH);
	//	TIM2_OC3PreloadConfig(ENABLE);
	//	TIM1_CtrlPWMOutputs(ENABLE);
	TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
	TIM1->BKR |= TIM1_BKR_MOE;
	TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
	TIM2_Cmd(ENABLE);
}	


void TIME1_INIT()
{
//	TIM1_DeInit();

	TIM1_TimeBaseInit(0,                    //预分频  		16 000 000   / (159 + 1)
	TIM1_COUNTERMODE_UP,     //计数模式  
	15999,                        //重装值  	1ms进入一次	
	0x00);                     //重复计数N，计数N次后产生更新标志 
	
	TIM1_SetCounter(0);	//计数器初值设为0
//	TIM1_ARRPreloadConfig(ENABLE);
	TIM1->CR1 |= TIM1_CR1_ARPE;
	TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);  
//	TIM1_Cmd(ENABLE);
	TIM1->CR1 |= TIM1_CR1_CEN;
}






/**
  * @brief Delay
  * @param nCount
  * @retval None
  */



#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval : None
  */
void assert_failed(u8* file, u32 line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
