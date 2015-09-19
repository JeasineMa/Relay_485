///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V2.10.4.157 for STM8                19/Sep/2015  09:42:59
// Copyright 2010-2015 IAR Systems AB.
//
//    Source file  =  
//        D:\Data form C\SRT\PWM调光项目\STM8继电器工程\src\stm8s_it.c
//    Command line =  
//        "D:\Data form C\SRT\PWM调光项目\STM8继电器工程\src\stm8s_it.c" -e
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
//        D:\Data form C\SRT\PWM调光项目\STM8继电器工程\Debug\List\stm8s_it.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b8
        EXTERN ?pop_l0
        EXTERN ?pop_l1
        EXTERN ?push_l0
        EXTERN ?push_l1
        EXTERN GPIO_WriteHigh
        EXTERN GPIO_WriteLow
        EXTERN TIM1_ClearITPendingBit
        EXTERN UART1_ClearFlag
        EXTERN UART1_ClearITPendingBit
        EXTERN UART1_GetITStatus
        EXTERN UART1_ReceiveData8
        EXTERN get_light_flag
        EXTERN sensor_id
        EXTERN time_counter
        EXTERN usart1info

        PUBLIC AWU_IRQHandler
        PUBLIC CLK_IRQHandler
        PUBLIC EXTI_PORTA_IRQHandler
        PUBLIC EXTI_PORTB_IRQHandler
        PUBLIC EXTI_PORTC_IRQHandler
        PUBLIC EXTI_PORTD_IRQHandler
        PUBLIC EXTI_PORTE_IRQHandler
        PUBLIC I2C_IRQHandler
        PUBLIC TIM1_CAP_COM_IRQHandler
        PUBLIC TIM1_UPD_OVF_TRG_BRK_IRQHandler
        PUBLIC TLI_IRQHandler
        PUBLIC TRAP_IRQHandler
        PUBLIC UART1_RX_IRQHandler
        PUBLIC UART1_TX_IRQHandler
        PUBLIC _interrupt_1
        PUBLIC _interrupt_13
        PUBLIC _interrupt_14
        PUBLIC _interrupt_19
        PUBLIC _interrupt_2
        PUBLIC _interrupt_20
        PUBLIC _interrupt_21
        PUBLIC _interrupt_3
        PUBLIC _interrupt_4
        PUBLIC _interrupt_5
        PUBLIC _interrupt_6
        PUBLIC _interrupt_7
        PUBLIC _interrupt_8
        PUBLIC _interrupt_9

// D:\Data form C\SRT\PWM调光项目\STM8继电器工程\src\stm8s_it.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file     stm8s_it.c
//    4   * @author   MCD Application Team
//    5   * @version  V2.1.0
//    6   * @date     18-November-2011
//    7   * @brief    Main Interrupt Service Routines.
//    8   *           This file provides template for all peripherals interrupt service 
//    9   *           routine.
//   10   ******************************************************************************
//   11   * @attention
//   12   *
//   13   * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
//   14   * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
//   15   * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
//   16   * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
//   17   * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
//   18   * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
//   19   *
//   20   * <h2><center>&copy; COPYRIGHT 2011 STMicroelectronics</center></h2>
//   21   ******************************************************************************
//   22   */ 
//   23 
//   24 /* Includes ------------------------------------------------------------------*/
//   25 #include "stm8s_it.h"
//   26 
//   27 /** @addtogroup Template_Project
//   28   * @{
//   29   */
//   30 
//   31 /* Private typedef -----------------------------------------------------------*/
//   32 /* Private define ------------------------------------------------------------*/
//   33 /* Private macro -------------------------------------------------------------*/
//   34 /* Private variables ---------------------------------------------------------*/
//   35 extern   u16	time_counter;
//   36 extern 	u8 get_light_flag;
//   37 extern u16	uart_time_counter;
//   38 extern usart_def  usart1info;
//   39 extern u8	sensor_id;
//   40 
//   41 /* Private function prototypes -----------------------------------------------*/
//   42 /* Private functions ---------------------------------------------------------*/
//   43 /* Public functions ----------------------------------------------------------*/
//   44 
//   45 #ifdef _COSMIC_
//   46 /**
//   47   * @brief Dummy Interrupt routine
//   48   * @par Parameters:
//   49   * None
//   50   * @retval
//   51   * None
//   52 */
//   53 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
//   54 {
//   55   /* In order to detect unexpected events during development,
//   56      it is recommended to set a breakpoint on the following instruction.
//   57   */
//   58 }
//   59 #endif /*_COSMIC_*/
//   60 
//   61 /**
//   62   * @brief TRAP Interrupt routine
//   63   * @param  None
//   64   * @retval None
//   65   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   66 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
//   67 {
//   68   /* In order to detect unexpected events during development,
//   69      it is recommended to set a breakpoint on the following instruction.
//   70   */
//   71 }
TRAP_IRQHandler:
_interrupt_1:
        IRET
//   72 
//   73 /**
//   74   * @brief Top Level Interrupt routine.
//   75   * @param  None
//   76   * @retval None
//   77   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   78 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
//   79 
//   80 {
//   81   /* In order to detect unexpected events during development,
//   82      it is recommended to set a breakpoint on the following instruction.
//   83   */
//   84 }
TLI_IRQHandler:
_interrupt_2:
        IRET
//   85 
//   86 /**
//   87   * @brief Auto Wake Up Interrupt routine.
//   88   * @param  None
//   89   * @retval None
//   90   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   91 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
//   92 {
//   93   /* In order to detect unexpected events during development,
//   94      it is recommended to set a breakpoint on the following instruction.
//   95   */
//   96 }
AWU_IRQHandler:
_interrupt_3:
        IRET
//   97 
//   98 /**
//   99   * @brief Clock Controller Interrupt routine.
//  100   * @param  None
//  101   * @retval None
//  102   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  103 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
//  104 {
//  105   /* In order to detect unexpected events during development,
//  106      it is recommended to set a breakpoint on the following instruction.
//  107   */
//  108 }
CLK_IRQHandler:
_interrupt_4:
        IRET
//  109 
//  110 /**
//  111   * @brief External Interrupt PORTA Interrupt routine.
//  112   * @param  None
//  113   * @retval None
//  114   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  115 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
//  116 {
//  117   /* In order to detect unexpected events during development,
//  118      it is recommended to set a breakpoint on the following instruction.
//  119   */
//  120 }
EXTI_PORTA_IRQHandler:
_interrupt_5:
        IRET
//  121 
//  122 /**
//  123   * @brief External Interrupt PORTB Interrupt routine.
//  124   * @param  None
//  125   * @retval None
//  126   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  127 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
//  128 {
//  129   /* In order to detect unexpected events during development,
//  130      it is recommended to set a breakpoint on the following instruction.
//  131   */
//  132 }
EXTI_PORTB_IRQHandler:
_interrupt_6:
        IRET
//  133 
//  134 /**
//  135   * @brief External Interrupt PORTC Interrupt routine.
//  136   * @param  None
//  137   * @retval None
//  138   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  139 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
//  140 {
//  141   /* In order to detect unexpected events during development,
//  142      it is recommended to set a breakpoint on the following instruction.
//  143   */
//  144 }
EXTI_PORTC_IRQHandler:
_interrupt_7:
        IRET
//  145 
//  146 /**
//  147   * @brief External Interrupt PORTD Interrupt routine.
//  148   * @param  None
//  149   * @retval None
//  150   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  151 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
//  152 {
//  153   /* In order to detect unexpected events during development,
//  154      it is recommended to set a breakpoint on the following instruction.
//  155   */
//  156 }
EXTI_PORTD_IRQHandler:
_interrupt_8:
        IRET
//  157 
//  158 /**
//  159   * @brief External Interrupt PORTE Interrupt routine.
//  160   * @param  None
//  161   * @retval None
//  162   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  163 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
//  164 {
//  165   /* In order to detect unexpected events during development,
//  166      it is recommended to set a breakpoint on the following instruction.
//  167   */
//  168 }
EXTI_PORTE_IRQHandler:
_interrupt_9:
        IRET
//  169 
//  170 /**
//  171   * @brief Timer1 Update/Overflow/Trigger/Break Interrupt routine.
//  172   * @param  None
//  173   * @retval None
//  174   */
//  175 // //1ms 进入一次
//  176 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  177 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
//  178 {
TIM1_UPD_OVF_TRG_BRK_IRQHandler:
_interrupt_13:
        PUSH      CC
        POP       A
        AND       A, #0xbf
        PUSH      A
        POP       CC
        CALL      L:?push_l0
        CALL      L:?push_l1
//  179   /* In order to detect unexpected events during development,
//  180      it is recommended to set a breakpoint on the following instruction.
//  181   */
//  182 	time_counter++;
        LDW       X, L:time_counter
        INCW      X
        LDW       L:time_counter, X
//  183   
//  184   	if(time_counter == 400)
        LDW       X, L:time_counter
        CPW       X, #0x190
        JRNE      L:??TIM1_UPD_OVF_TRG_BRK_IRQHandler_0
//  185 		GPIO_WriteLow(GPIOC,GPIO_PIN_4);
        LD        A, #0x10
        LDW       X, #0x500a
        CALL      L:GPIO_WriteLow
        JRA       L:??TIM1_UPD_OVF_TRG_BRK_IRQHandler_1
//  186 	else if(time_counter == 1)
??TIM1_UPD_OVF_TRG_BRK_IRQHandler_0:
        LDW       X, L:time_counter
        CPW       X, #0x1
        JRNE      L:??TIM1_UPD_OVF_TRG_BRK_IRQHandler_1
//  187 		GPIO_WriteHigh(GPIOC,GPIO_PIN_4);
        LD        A, #0x10
        LDW       X, #0x500a
        CALL      L:GPIO_WriteHigh
//  188 	
//  189 	if(time_counter>800)
??TIM1_UPD_OVF_TRG_BRK_IRQHandler_1:
        LDW       X, L:time_counter
        CPW       X, #0x321
        JRC       L:??TIM1_UPD_OVF_TRG_BRK_IRQHandler_2
//  190 	{
//  191 		time_counter = 0;
        CLRW      X
        LDW       L:time_counter, X
//  192 		get_light_flag = 1;
        MOV       L:get_light_flag, #0x1
//  193 		
//  194 	}
//  195 	if(usart1info.write >4) 				//modbus 延时处理
??TIM1_UPD_OVF_TRG_BRK_IRQHandler_2:
        LDW       X, L:usart1info + 23
        CPW       X, #0x5
        JRC       L:??TIM1_UPD_OVF_TRG_BRK_IRQHandler_3
//  196 			usart1info.Rx_delay_CNT++;
        LDW       X, L:usart1info + 46
        INCW      X
        LDW       L:usart1info + 46, X
        JRA       L:??TIM1_UPD_OVF_TRG_BRK_IRQHandler_4
//  197 		else                
//  198 			usart1info.Rx_delay_CNT = 0;
??TIM1_UPD_OVF_TRG_BRK_IRQHandler_3:
        CLRW      X
        LDW       L:usart1info + 46, X
//  199                 
//  200 	TIM1_ClearITPendingBit(TIM1_IT_UPDATE);  
??TIM1_UPD_OVF_TRG_BRK_IRQHandler_4:
        LD        A, #0x1
        CALL      L:TIM1_ClearITPendingBit
//  201 }
        CALL      L:?pop_l1
        CALL      L:?pop_l0
        IRET
//  202 
//  203 /**
//  204   * @brief Timer1 Capture/Compare Interrupt routine.
//  205   * @param  None
//  206   * @retval None
//  207   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  208 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
//  209 {
//  210   /* In order to detect unexpected events during development,
//  211      it is recommended to set a breakpoint on the following instruction.
//  212   */
//  213 }
TIM1_CAP_COM_IRQHandler:
_interrupt_14:
        IRET
//  214 
//  215 
//  216 #if defined (STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8S103) || \ 
//  217     defined(STM8S003) ||  defined (STM8AF62Ax) || defined (STM8AF52Ax) || defined (STM8S903)
//  218 /**
//  219   * @brief UART1 TX Interrupt routine.
//  220   * @param  None
//  221   * @retval None
//  222   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  223  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
//  224  {
//  225     /* In order to detect unexpected events during development,
//  226        it is recommended to set a breakpoint on the following instruction.
//  227     */
//  228  }
UART1_TX_IRQHandler:
_interrupt_19:
        IRET
//  229 
//  230 /**
//  231   * @brief UART1 RX Interrupt routine.
//  232   * @param  None
//  233   * @retval None
//  234   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  235  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
//  236 {
UART1_RX_IRQHandler:
_interrupt_20:
        PUSH      CC
        POP       A
        AND       A, #0xbf
        PUSH      A
        POP       CC
        CALL      L:?push_l0
        CALL      L:?push_l1
        PUSH      S:?b8
//  237 	/* In order to detect unexpected events during development,
//  238 	it is recommended to set a breakpoint on the following instruction.
//  239 	*/
//  240 	u8 Res;
//  241 	if(UART1_GetITStatus(UART1_IT_RXNE )!= RESET)  
        LDW       X, #0x255
        CALL      L:UART1_GetITStatus
        CP        A, #0x0
        JREQ      L:??UART1_RX_IRQHandler_0
//  242 	{/*接收中断(接收到的数据必须是0x0d 0x0a结尾)*/
//  243 		Res =UART1_ReceiveData8();
        CALL      L:UART1_ReceiveData8
        LD        S:?b8, A
//  244 		/*(USART1->DR);读取接收到的数据,当读完数据后自动取消RXNE的中断标志位*/
//  245 		//disableInterrupts();
//  246 
//  247 		if(usart1info.write == 0)
        LDW       X, L:usart1info + 23
        TNZW      X
        JRNE      L:??UART1_RX_IRQHandler_1
//  248 		{
//  249 			if(Res == sensor_id)
        LD        A, L:sensor_id
        CP        A, S:?b8
        JRNE      L:??UART1_RX_IRQHandler_2
//  250 			{
//  251 				usart1info.data[usart1info.write] = Res;
        LDW       X, L:usart1info + 23
        LD        A, S:?b8
        LD        (L:usart1info,X), A
//  252 				usart1info.write++;
        LDW       X, L:usart1info + 23
        INCW      X
        LDW       L:usart1info + 23, X
        JRA       L:??UART1_RX_IRQHandler_2
//  253 			}
//  254 		}
//  255 		else
//  256 		{
//  257 			usart1info.data[usart1info.write] = Res;
??UART1_RX_IRQHandler_1:
        LDW       X, L:usart1info + 23
        LD        A, S:?b8
        LD        (L:usart1info,X), A
//  258 			usart1info.write++;
        LDW       X, L:usart1info + 23
        INCW      X
        LDW       L:usart1info + 23, X
//  259 			if(usart1info.write==USART_DATA_SIZE)  
        LDW       X, L:usart1info + 23
        CPW       X, #0x14
        JRNE      L:??UART1_RX_IRQHandler_2
//  260 				usart1info.write = USART_DATA_SIZE - 1; //防止缓冲区溢出出错
        LDW       X, #0x13
        LDW       L:usart1info + 23, X
//  261 		}
//  262 		usart1info.Rx_delay_CNT = 0; 	
??UART1_RX_IRQHandler_2:
        CLRW      X
        LDW       L:usart1info + 46, X
//  263                 UART1_ClearFlag(UART1_FLAG_RXNE);
        LDW       X, #0x20
        CALL      L:UART1_ClearFlag
//  264                 UART1_ClearITPendingBit(UART1_IT_RXNE);
        LDW       X, #0x255
        CALL      L:UART1_ClearITPendingBit
//  265 		//enableInterrupts();
//  266 
//  267 	}
//  268 
//  269 }
??UART1_RX_IRQHandler_0:
        POP       S:?b8
        CALL      L:?pop_l1
        CALL      L:?pop_l0
        IRET
//  270 #endif /*STM8S208 or STM8S207 or STM8S103 or STM8S903 or STM8AF62Ax or STM8AF52Ax */
//  271 
//  272 /**
//  273   * @brief I2C Interrupt routine.
//  274   * @param  None
//  275   * @retval None
//  276   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  277 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
//  278 {
//  279   /* In order to detect unexpected events during development,
//  280      it is recommended to set a breakpoint on the following instruction.
//  281   */
//  282 }
I2C_IRQHandler:
_interrupt_21:
        IRET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  283 
//  284 /**
//  285   * @}
//  286   */
//  287 
//  288 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
// 229 bytes in section .near_func.text
// 
// 229 bytes of CODE memory
//
//Errors: none
//Warnings: none
