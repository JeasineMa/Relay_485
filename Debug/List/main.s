///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V2.10.4.157 for STM8                19/Sep/2015  09:47:04
// Copyright 2010-2015 IAR Systems AB.
//
//    Source file  =  D:\Data form C\SRT\PWM调光项目\STM8继电器工程\src\main.c
//    Command line =  
//        "D:\Data form C\SRT\PWM调光项目\STM8继电器工程\src\main.c" -e
//        --char_is_signed -On --no_cse --no_unroll --no_inline
//        --no_code_motion --no_tbaa --no_cross_call --debug --code_model small
//        --data_model medium -o "D:\Data form
//        C\SRT\PWM调光项目\STM8继电器工程\Debug\Obj\" --dlib_config
//        "D:\Program Files\IAR Systems\Embedded Workbench
//        7.0\stm8\LIB\dlstm8smn.h" -D STM8S103F3P -D USE_STM8_128_EVAL -lcN
//        "D:\Data form C\SRT\PWM调光项目\STM8继电器工程\Debug\List\" -lB
//        "D:\Data form C\SRT\PWM调光项目\STM8继电器工程\Debug\List\" -I
//        "D:\Data form
//        C\SRT\PWM调光项目\STM8继电器工程\Libraries\STM8S_StdPeriph_Driver\inc\"
//        -I "D:\Data form C\SRT\PWM调光项目\STM8继电器工程\HAL\" -I "D:\Data
//        form C\SRT\PWM调光项目\STM8继电器工程\src\" --vregs 16
//    List file    =  
//        D:\Data form C\SRT\PWM调光项目\STM8继电器工程\Debug\List\main.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
        EXTERN ?b7
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?dec32_l0_l0
        EXTERN ?epilogue_w4
        EXTERN ?push_w4
        EXTERN ?w0
        EXTERN ?w1
        EXTERN CLK_SYSCLKConfig
        EXTERN GPIO_Init
        EXTERN GPIO_WriteHigh
        EXTERN GPIO_WriteLow
        EXTERN TIM1_ITConfig
        EXTERN TIM1_SetCounter
        EXTERN TIM1_TimeBaseInit
        EXTERN TIM2_Cmd
        EXTERN TIM2_OC3Init
        EXTERN TIM2_TimeBaseInit
        EXTERN UART1_ClearFlag
        EXTERN UART1_ITConfig
        EXTERN UART1_Init

        PUBLIC Delay
        PUBLIC GPIO_INIT
        PUBLIC RCC_INIT
        PUBLIC RS485_RSV
        PUBLIC TIME1_INIT
        PUBLIC TIME2_INIT
        PUBLIC USART1_INIT
        PUBLIC assert_failed
        PUBLIC get_light_flag
        PUBLIC light_lux
        PUBLIC main
        PUBLIC run_led
        PUBLIC sensor_id
        PUBLIC time_counter
        PUBLIC uart_buf
        PUBLIC uart_counter
        PUBLIC uart_revflag
        PUBLIC uart_time_counter

// D:\Data form C\SRT\PWM调光项目\STM8继电器工程\src\main.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    Project/main.c 
//    4   * @author  MCD Application Team
//    5   * @version V2.1.0
//    6   * @date    18-November-2011
//    7   * @brief   Main program body
//    8   ******************************************************************************
//    9   * @attention
//   10   *
//   11   * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
//   12   * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
//   13   * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
//   14   * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
//   15   * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
//   16   * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
//   17   *
//   18   * <h2><center>&copy; COPYRIGHT 2011 STMicroelectronics</center></h2>
//   19   ******************************************************************************
//   20   */ 
//   21 
//   22 
//   23 /* Includes ------------------------------------------------------------------*/
//   24 #include "stm8s.h"
//   25 #include "stm8s_uart1.h"
//   26 #include "stm8s_clk.h"
//   27 #include "stm8s_flash.h"
//   28 
//   29 #include "HAL_I2C_TSL2561.h"
//   30 #include "Modbus.h"
//   31 
//   32 /* Private defines -----------------------------------------------------------*/
//   33 /* Private function prototypes -----------------------------------------------*/
//   34 /* Private functions ---------------------------------------------------------*/
//   35 
//   36 
//   37 void      	RCC_INIT(void);
//   38 void 		GPIO_INIT(void);
//   39 void 		TIME1_INIT(void);
//   40 void 		USART1_INIT(void);
//   41 void 		TIME2_INIT(void);
//   42 void            Delay(uint32_t nCount);
//   43 
//   44 void 		run_led(u8 sta);
//   45 
//   46 void           RS485_RSV(u8 port, u8 flag);
//   47 
//   48 

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   49 u16	time_counter;
time_counter:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   50 u16     light_lux;
light_lux:
        DS8 2
//   51 

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   52 u8      get_light_flag;
get_light_flag:
        DS8 1
//   53 

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   54 u8      uart_counter;
uart_counter:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   55 u8      uart_buf[10] = {0};
uart_buf:
        DS8 10

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   56 u8      uart_revflag;
uart_revflag:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   57 u16	uart_time_counter;
uart_time_counter:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   58 u8	sensor_id;
sensor_id:
        DS8 1
//   59 extern u8 HoldingReg_data[HOLDINGREG_DATA_SIZE];
//   60 
//   61 //   235   5V    10   0V
//   62 
//   63 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   64 void main(void)
//   65 {
//   66   /* Infinite loop */
//   67 	RCC_INIT();
main:
        CALL      L:RCC_INIT
//   68 	GPIO_INIT();
        CALL      L:GPIO_INIT
//   69 	//TIME1_INIT();
//   70 	//USART1_INIT();
//   71 	//TIME2_INIT();
//   72 	//InitTSL2561();
//   73         sensor_id = 0x02;
        MOV       L:sensor_id, #0x2
//   74 	
//   75 	get_light_flag = 0;
        MOV       L:get_light_flag, #0x0
//   76 	time_counter =0;
        CLRW      X
        LDW       L:time_counter, X
//   77         
//   78         while(1)
//   79         {
//   80           GPIO_WriteHigh(GPIOD,GPIO_PIN_2);
??main_0:
        LD        A, #0x4
        LDW       X, #0x500f
        CALL      L:GPIO_WriteHigh
//   81           GPIO_WriteHigh(GPIOD,GPIO_PIN_3);
        LD        A, #0x8
        LDW       X, #0x500f
        CALL      L:GPIO_WriteHigh
//   82           GPIO_WriteHigh(GPIOA,GPIO_PIN_3);
        LD        A, #0x8
        LDW       X, #0x5000
        CALL      L:GPIO_WriteHigh
//   83           Delay(1000000);
        LDW       X, #0x4240
        LDW       S:?w1, X
        LDW       X, #0xf
        LDW       S:?w0, X
        CALL      L:Delay
//   84     
//   85           GPIO_WriteLow(GPIOD,GPIO_PIN_3);
        LD        A, #0x8
        LDW       X, #0x500f
        CALL      L:GPIO_WriteLow
//   86           GPIO_WriteLow(GPIOD,GPIO_PIN_2);
        LD        A, #0x4
        LDW       X, #0x500f
        CALL      L:GPIO_WriteLow
//   87           GPIO_WriteLow(GPIOA,GPIO_PIN_3);
        LD        A, #0x8
        LDW       X, #0x5000
        CALL      L:GPIO_WriteLow
//   88           Delay(1000000);
        LDW       X, #0x4240
        LDW       S:?w1, X
        LDW       X, #0xf
        LDW       S:?w0, X
        CALL      L:Delay
        JRA       L:??main_0
//   89 
//   90         }
//   91 
//   92 
//   93 //	enableInterrupts();
//   94 //
//   95 //	while (1)
//   96 //	{
//   97 //           GPIO_WriteLow(GPIOD,GPIO_PIN_4);
//   98 //              if(get_light_flag==1)
//   99 //              {
//  100 //                      disableInterrupts();
//  101 //                      get_lightlux(&light_lux);
//  102 //                      //enableInterrupts();
//  103 //                      get_light_flag = 0;
//  104 //                      HoldingReg_data[0] = light_lux>>8;
//  105 //                      HoldingReg_data[1] = light_lux&0XFF;   
//  106 //                      time_counter = 0;
//  107 //              }		
//  108 //              bsp_ModbusRTUSlave_decode();
//  109 //              enableInterrupts();
//  110 		
//  111 //	}
//  112 }
//  113 
//  114 //RS485 使能叫配置

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  115 void RS485_RSV(u8 port, u8 flag)
//  116 {
RS485_RSV:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
//  117 	if(port == 1)
        LD        A, S:?b8
        CP        A, #0x1
        JRNE      L:??RS485_RSV_0
//  118 	{
//  119 		if(flag ==0)
        TNZ       S:?b9
        JRNE      L:??RS485_RSV_1
//  120 			GPIO_WriteLow(GPIOD,GPIO_PIN_4);	
        LD        A, #0x10
        LDW       X, #0x500f
        CALL      L:GPIO_WriteLow
        JRA       L:??RS485_RSV_0
//  121 		else
//  122 			GPIO_WriteHigh(GPIOD,GPIO_PIN_4);				
??RS485_RSV_1:
        LD        A, #0x10
        LDW       X, #0x500f
        CALL      L:GPIO_WriteHigh
//  123 			
//  124 	}
//  125 }
??RS485_RSV_0:
        JP        L:?epilogue_w4
//  126 
//  127 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  128 void 	run_led(u8 sta)
//  129 {
run_led:
        PUSH      S:?b8
        LD        S:?b8, A
//  130 	if(sta==1)
        LD        A, S:?b8
        CP        A, #0x1
        JRNE      L:??run_led_0
//  131 		GPIO_WriteLow(GPIOA,GPIO_PIN_3);
        LD        A, #0x8
        LDW       X, #0x5000
        CALL      L:GPIO_WriteLow
        JRA       L:??run_led_1
//  132 	else
//  133 		GPIO_WriteHigh(GPIOA,GPIO_PIN_3);
??run_led_0:
        LD        A, #0x8
        LDW       X, #0x5000
        CALL      L:GPIO_WriteHigh
//  134 }
??run_led_1:
        POP       S:?b8
        RET
//  135 
//  136 
//  137 
//  138 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  139 void Delay(uint32_t nCount)
//  140 {
//  141 	/* Decrement nCount value */
//  142         //1000000时间适当
//  143 	while (nCount != 0)
Delay:
??Delay_0:
        LDW       X, S:?w0
        CPW       X, #0x0
        JRNE      L:??Delay_1
        LDW       X, S:?w1
        CPW       X, #0x0
??Delay_1:
        JREQ      L:??Delay_2
//  144 	{       
//  145 		nCount--;
        CALL      L:?dec32_l0_l0
        JRA       L:??Delay_0
//  146 	}
//  147 }
??Delay_2:
        RET
//  148 
//  149 //void Delay(uint32_t count)
//  150 //{
//  151 //        while(count--);
//  152 //}
//  153 
//  154 
//  155 
//  156 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  157 void      RCC_INIT(void)
//  158 {
//  159 	 CLK->ICKR |= CLK_ICKR_HSIEN;
RCC_INIT:
        BSET      L:0x50c0, #0x0
//  160 //	CLK_HSICmd(ENABLE);
//  161 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
        LD        A, #0x80
        CALL      L:CLK_SYSCLKConfig
//  162 	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
        CLR       A
        CALL      L:CLK_SYSCLKConfig
//  163 //	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1,ENABLE);  //串口1时钟开
//  164 //	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1,ENABLE);  //定时器时钟1开	
//  165 //	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2,  ENABLE);  
//  166 	CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_PERIPHERAL_UART1 & (uint8_t)0x0F));
        BSET      L:0x50c7, #0x3
//  167 	CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_PERIPHERAL_TIMER1 & (uint8_t)0x0F));
        BSET      L:0x50c7, #0x7
//  168 	CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_PERIPHERAL_TIMER2 & (uint8_t)0x0F));
        BSET      L:0x50c7, #0x5
//  169 
//  170 }
        RET
//  171 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  172 void USART1_INIT(void)
//  173 {
//  174 //	UART1_DeInit();
//  175 	UART1_Init(9600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1,UART1_PARITY_NO,UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE );  
USART1_INIT:
        MOV       S:?b7, #0xc
        MOV       S:?b6, #0x80
        CLR       S:?b5
        CLR       S:?b4
        CLR       A
        LDW       X, #0x2580
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:UART1_Init
//  176 	UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);//UART1_IT_RXNE_OR    
        LD        A, #0x1
        LDW       X, #0x205
        CALL      L:UART1_ITConfig
//  177 	UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
        BRES      L:0x5234, #0x5
//  178 //	UART1_Cmd(ENABLE);  
//  179 	UART1_ClearFlag(UART1_FLAG_RXNE);
        LDW       X, #0x20
        CALL      L:UART1_ClearFlag
//  180 }
        RET
//  181 
//  182 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  183 void 	GPIO_INIT(void)
//  184 {
//  185 	GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)(GPIO_PIN_4), GPIO_MODE_OUT_PP_LOW_FAST);
GPIO_INIT:
        MOV       S:?b0, #0xe0
        LD        A, #0x10
        LDW       X, #0x500f
        CALL      L:GPIO_Init
//  186 	GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)(GPIO_PIN_5), GPIO_MODE_OUT_PP_HIGH_FAST);
        MOV       S:?b0, #0xf0
        LD        A, #0x20
        LDW       X, #0x500f
        CALL      L:GPIO_Init
//  187         
//  188         GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)(GPIO_PIN_2), GPIO_MODE_OUT_PP_HIGH_FAST);
        MOV       S:?b0, #0xf0
        LD        A, #0x4
        LDW       X, #0x500f
        CALL      L:GPIO_Init
//  189         GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)(GPIO_PIN_3), GPIO_MODE_OUT_PP_HIGH_FAST);
        MOV       S:?b0, #0xf0
        LD        A, #0x8
        LDW       X, #0x500f
        CALL      L:GPIO_Init
//  190         
//  191         
//  192 	GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)(GPIO_PIN_6), GPIO_MODE_IN_FL_NO_IT);
        CLR       S:?b0
        LD        A, #0x40
        LDW       X, #0x500f
        CALL      L:GPIO_Init
//  193 	
//  194 	GPIO_Init(GPIOA, (GPIO_Pin_TypeDef)(GPIO_PIN_3), GPIO_MODE_OUT_PP_LOW_FAST);		//暂时不用中断方式
        MOV       S:?b0, #0xe0
        LD        A, #0x8
        LDW       X, #0x5000
        CALL      L:GPIO_Init
//  195 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)(GPIO_PIN_3), GPIO_MODE_OUT_PP_LOW_FAST);		//暂时不用中断方式
        MOV       S:?b0, #0xe0
        LD        A, #0x8
        LDW       X, #0x500a
        CALL      L:GPIO_Init
//  196 
//  197 	GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)(GPIO_PIN_4), GPIO_MODE_OUT_PP_HIGH_FAST);
        MOV       S:?b0, #0xf0
        LD        A, #0x10
        LDW       X, #0x500a
        CALL      L:GPIO_Init
//  198 	
//  199 	GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)(GPIO_PIN_4), GPIO_MODE_OUT_PP_HIGH_FAST);
        MOV       S:?b0, #0xf0
        LD        A, #0x10
        LDW       X, #0x5005
        CALL      L:GPIO_Init
//  200 	GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)(GPIO_PIN_5), GPIO_MODE_OUT_PP_HIGH_FAST);
        MOV       S:?b0, #0xf0
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_Init
//  201 }
        RET
//  202 
//  203 
//  204 /*******************************************************************************
//  205 *                           ==定时器2初始化函数==
//  206 * TIM2_DeInit();                                 --> 初始化定时器2寄存器
//  207 * TIM2_TimeBaseInit(TIM2_PRESCALER_1, 224);      --> 定时器2基本初始化 设置 分频系数 , 初值
//  208                                                   --> ( 无分频 , 7372800 / 32768 = 225 校准为224 )
//  209 * TIM2_OC1Init(TIM2_OCMODE_PWM1 , TIM2_OUTPUTSTATE_ENABLE , 112 , TIM2_OCPOLARITY_HIGH);
//  210                                                   --> 定时器2输出方式 为PWM1 , 定时器2输出状态使能 , 输出占空比 50% , 输出起始电平 为高
//  211 * TIM2_Cmd(ENABLE);                              --> 启动定时器
//  212 *******************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  213 void TIME2_INIT(void)
//  214 {
//  215 	//	TIM2_DeInit();
//  216 	TIM2_TimeBaseInit(TIM2_PRESCALER_2, 1000);
TIME2_INIT:
        LDW       X, #0x3e8
        LD        A, #0x1
        CALL      L:TIM2_TimeBaseInit
//  217 	TIM2_OC3Init(TIM2_OCMODE_PWM1 , 
//  218 	TIM2_OUTPUTSTATE_ENABLE , 
//  219 	0 , 
//  220 	TIM2_OCPOLARITY_HIGH);
        CLR       S:?b1
        CLRW      X
        MOV       S:?b0, #0x11
        LD        A, #0x60
        CALL      L:TIM2_OC3Init
//  221 	//	TIM2_OC3PreloadConfig(ENABLE);
//  222 	//	TIM1_CtrlPWMOutputs(ENABLE);
//  223 	TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
        BSET      L:0x5309, #0x3
//  224 	TIM1->BKR |= TIM1_BKR_MOE;
        BSET      L:0x526d, #0x7
//  225 	TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
        BSET      L:0x5300, #0x0
//  226 	TIM2_Cmd(ENABLE);
        LD        A, #0x1
        CALL      L:TIM2_Cmd
//  227 }	
        RET
//  228 
//  229 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  230 void TIME1_INIT()
//  231 {
//  232 //	TIM1_DeInit();
//  233 
//  234 	TIM1_TimeBaseInit(0,                    //预分频  		16 000 000   / (159 + 1)
//  235 	TIM1_COUNTERMODE_UP,     //计数模式  
//  236 	15999,                        //重装值  	1ms进入一次	
//  237 	0x00);                     //重复计数N，计数N次后产生更新标志 
TIME1_INIT:
        CLR       S:?b0
        LDW       Y, #0x3e7f
        CLR       A
        CLRW      X
        CALL      L:TIM1_TimeBaseInit
//  238 	
//  239 	TIM1_SetCounter(0);	//计数器初值设为0
        CLRW      X
        CALL      L:TIM1_SetCounter
//  240 //	TIM1_ARRPreloadConfig(ENABLE);
//  241 	TIM1->CR1 |= TIM1_CR1_ARPE;
        BSET      L:0x5250, #0x7
//  242 	TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);  
        MOV       S:?b0, #0x1
        LD        A, #0x1
        CALL      L:TIM1_ITConfig
//  243 //	TIM1_Cmd(ENABLE);
//  244 	TIM1->CR1 |= TIM1_CR1_CEN;
        BSET      L:0x5250, #0x0
//  245 }
        RET
//  246 
//  247 
//  248 
//  249 
//  250 
//  251 
//  252 /**
//  253   * @brief Delay
//  254   * @param nCount
//  255   * @retval None
//  256   */
//  257 
//  258 
//  259 
//  260 #ifdef USE_FULL_ASSERT
//  261 
//  262 /**
//  263   * @brief  Reports the name of the source file and the source line number
//  264   *   where the assert_param error has occurred.
//  265   * @param file: pointer to the source file name
//  266   * @param line: assert_param error line source number
//  267   * @retval : None
//  268   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  269 void assert_failed(u8* file, u32 line)
//  270 { 
//  271   /* User can add his own implementation to report the file name and line number,
//  272      ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
//  273 
//  274   /* Infinite loop */
//  275   while (1)
assert_failed:
??assert_failed_0:
        JRA       L:??assert_failed_0
//  276   {
//  277   }
//  278 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  279 #endif
//  280 
//  281 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
//  20 bytes in section .near.bss
// 447 bytes in section .near_func.text
// 
// 447 bytes of CODE memory
//  20 bytes of DATA memory
//
//Errors: none
//Warnings: none
