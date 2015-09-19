///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V2.10.4.157 for STM8                19/Sep/2015  09:42:59
// Copyright 2010-2015 IAR Systems AB.
//
//    Source file  =  
//        D:\Data form
//        C\SRT\PWM调光项目\STM8继电器工程\Libraries\STM8S_StdPeriph_Driver\src\stm8s_gpio.c
//    Command line =  
//        "D:\Data form
//        C\SRT\PWM调光项目\STM8继电器工程\Libraries\STM8S_StdPeriph_Driver\src\stm8s_gpio.c"
//        -e --char_is_signed -On --no_cse --no_unroll --no_inline
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
//        D:\Data form C\SRT\PWM调光项目\STM8继电器工程\Debug\List\stm8s_gpio.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?epilogue_l2
        EXTERN ?push_l2
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w4
        EXTERN assert_failed

        PUBLIC GPIO_DeInit
        PUBLIC GPIO_ExternalPullUpConfig
        PUBLIC GPIO_Init
        PUBLIC GPIO_ReadInputData
        PUBLIC GPIO_ReadInputPin
        PUBLIC GPIO_ReadOutputData
        PUBLIC GPIO_Write
        PUBLIC GPIO_WriteHigh
        PUBLIC GPIO_WriteLow
        PUBLIC GPIO_WriteReverse

// D:\Data form C\SRT\PWM调光项目\STM8继电器工程\Libraries\STM8S_StdPeriph_Driver\src\stm8s_gpio.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_gpio.c
//    4   * @author  MCD Application Team
//    5   * @version V2.1.0
//    6   * @date    18-November-2011
//    7   * @brief   This file contains all the functions for the GPIO peripheral.
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
//   22 /* Includes ------------------------------------------------------------------*/
//   23 #include "stm8s_gpio.h"
//   24 
//   25 /** @addtogroup STM8S_StdPeriph_Driver
//   26   * @{
//   27   */
//   28 /* Private typedef -----------------------------------------------------------*/
//   29 /* Private define ------------------------------------------------------------*/
//   30 /* Private macro -------------------------------------------------------------*/
//   31 /* Private variables ---------------------------------------------------------*/
//   32 /* Private function prototypes -----------------------------------------------*/
//   33 /* Private functions ---------------------------------------------------------*/
//   34 
//   35 /* Public functions ----------------------------------------------------------*/
//   36 
//   37 /**
//   38   * @addtogroup GPIO_Public_Functions
//   39   * @{
//   40   */
//   41 
//   42 /**
//   43   * @brief  Deinitializes the GPIOx peripheral registers to their default reset values.
//   44   * @param  GPIOx: Select the GPIO peripheral number (x = A to I).
//   45   * @retval None
//   46   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   47 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
//   48 {
//   49     GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
GPIO_DeInit:
        CLR       A
        LD        (X), A
//   50     GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
        LDW       Y, X
        ADDW      Y, #0x2
        CLR       A
        LD        (Y), A
//   51     GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
        LDW       Y, X
        ADDW      Y, #0x3
        CLR       A
        LD        (Y), A
//   52     GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
        LDW       Y, X
        ADDW      Y, #0x4
        CLR       A
        LD        (Y), A
//   53 }
        RET
//   54 
//   55 /**
//   56   * @brief  Initializes the GPIOx according to the specified parameters.
//   57   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//   58   * @param  GPIO_Pin : This parameter contains the pin number, it can be any value
//   59   *         of the @ref GPIO_Pin_TypeDef enumeration.
//   60   * @param  GPIO_Mode : This parameter can be a value of the
//   61   *         @Ref GPIO_Mode_TypeDef enumeration.
//   62   * @retval None
//   63   */
//   64 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   65 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
//   66 {
GPIO_Init:
        LD        S:?b1, A
//   67     /*----------------------*/
//   68     /* Check the parameters */
//   69     /*----------------------*/
//   70 
//   71  //   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
//   72 //    assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
//   73     
//   74   /* Reset corresponding bit to GPIO_Pin in CR2 register */
//   75   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
        LDW       Y, X
        ADDW      Y, #0x4
        LD        A, S:?b1
        CPL       A
        AND       A, (Y)
        LDW       Y, X
        ADDW      Y, #0x4
        LD        (Y), A
//   76 
//   77     /*-----------------------------*/
//   78     /* Input/Output mode selection */
//   79     /*-----------------------------*/
//   80 
//   81     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
        LD        A, S:?b0
        AND       A, #0x80
        CP        A, #0x0
        JREQ      L:??GPIO_Init_0
//   82     {
//   83         if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
        LD        A, S:?b0
        AND       A, #0x10
        CP        A, #0x0
        JREQ      L:??GPIO_Init_1
//   84         {
//   85             GPIOx->ODR |= (uint8_t)GPIO_Pin;
        LD        A, S:?b1
        OR        A, (X)
        LD        (X), A
        JRA       L:??GPIO_Init_2
//   86         } 
//   87         else /* Low level */
//   88         {
//   89             GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
??GPIO_Init_1:
        LD        A, S:?b1
        CPL       A
        AND       A, (X)
        LD        (X), A
//   90         }
//   91         /* Set Output mode */
//   92         GPIOx->DDR |= (uint8_t)GPIO_Pin;
??GPIO_Init_2:
        LDW       Y, X
        ADDW      Y, #0x2
        LD        A, S:?b1
        OR        A, (Y)
        LDW       Y, X
        ADDW      Y, #0x2
        LD        (Y), A
        JRA       L:??GPIO_Init_3
//   93     } 
//   94     else /* Input mode */
//   95     {
//   96         /* Set Input mode */
//   97         GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
??GPIO_Init_0:
        LDW       Y, X
        ADDW      Y, #0x2
        LD        A, S:?b1
        CPL       A
        AND       A, (Y)
        LDW       Y, X
        ADDW      Y, #0x2
        LD        (Y), A
//   98     }
//   99 
//  100     /*------------------------------------------------------------------------*/
//  101     /* Pull-Up/Float (Input) or Push-Pull/Open-Drain (Output) modes selection */
//  102     /*------------------------------------------------------------------------*/
//  103 
//  104     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
??GPIO_Init_3:
        LD        A, S:?b0
        AND       A, #0x40
        CP        A, #0x0
        JREQ      L:??GPIO_Init_4
//  105     {
//  106         GPIOx->CR1 |= (uint8_t)GPIO_Pin;
        LDW       Y, X
        ADDW      Y, #0x3
        LD        A, S:?b1
        OR        A, (Y)
        LDW       Y, X
        ADDW      Y, #0x3
        LD        (Y), A
        JRA       L:??GPIO_Init_5
//  107     } 
//  108     else /* Float or Open-Drain */
//  109     {
//  110         GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
??GPIO_Init_4:
        LDW       Y, X
        ADDW      Y, #0x3
        LD        A, S:?b1
        CPL       A
        AND       A, (Y)
        LDW       Y, X
        ADDW      Y, #0x3
        LD        (Y), A
//  111     }
//  112 
//  113     /*-----------------------------------------------------*/
//  114     /* Interrupt (Input) or Slope (Output) modes selection */
//  115     /*-----------------------------------------------------*/
//  116 
//  117     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
??GPIO_Init_5:
        LD        A, S:?b0
        AND       A, #0x20
        CP        A, #0x0
        JREQ      L:??GPIO_Init_6
//  118     {
//  119         GPIOx->CR2 |= (uint8_t)GPIO_Pin;
        LDW       Y, X
        ADDW      Y, #0x4
        LD        A, S:?b1
        OR        A, (Y)
        LDW       Y, X
        ADDW      Y, #0x4
        LD        (Y), A
        JRA       L:??GPIO_Init_7
//  120     } 
//  121     else /* No external interrupt or No slope control */
//  122     {
//  123         GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
??GPIO_Init_6:
        LDW       Y, X
        ADDW      Y, #0x4
        LD        A, S:?b1
        CPL       A
        AND       A, (Y)
        LDW       Y, X
        ADDW      Y, #0x4
        LD        (Y), A
//  124     }
//  125 }
??GPIO_Init_7:
        RET
//  126 
//  127 /**
//  128   * @brief  Writes data to the specified GPIO data port.
//  129   * @note   The port must be configured in output mode.
//  130   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  131   * @param  GPIO_PortVal : Specifies the value to be written to the port output
//  132   *         data register.
//  133   * @retval None
//  134   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  135 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
//  136 {
//  137     GPIOx->ODR = PortVal;
GPIO_Write:
        LD        (X), A
//  138 }
        RET
//  139 
//  140 /**
//  141   * @brief  Writes high level to the specified GPIO pins.
//  142   * @note   The port must be configured in output mode.  
//  143   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  144   * @param  PortPins : Specifies the pins to be turned high to the port output.
//  145   *         data register.
//  146   * @retval None
//  147   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  148 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
//  149 {
GPIO_WriteHigh:
        LD        S:?b0, A
//  150     GPIOx->ODR |= (uint8_t)PortPins;
        LD        A, S:?b0
        OR        A, (X)
        LD        (X), A
//  151 }
        RET
//  152 
//  153 /**
//  154   * @brief  Writes low level to the specified GPIO pins.
//  155   * @note   The port must be configured in output mode.  
//  156   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  157   * @param  PortPins : Specifies the pins to be turned low to the port output.
//  158   *         data register.
//  159   * @retval None
//  160   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  161 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
//  162 {
GPIO_WriteLow:
        LD        S:?b0, A
//  163     GPIOx->ODR &= (uint8_t)(~PortPins);
        LD        A, S:?b0
        CPL       A
        AND       A, (X)
        LD        (X), A
//  164 }
        RET
//  165 
//  166 /**
//  167   * @brief  Writes reverse level to the specified GPIO pins.
//  168   * @note   The port must be configured in output mode.
//  169   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  170   * @param  PortPins : Specifies the pins to be reversed to the port output.
//  171   *         data register.
//  172   * @retval None
//  173   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  174 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
//  175 {
GPIO_WriteReverse:
        LD        S:?b0, A
//  176     GPIOx->ODR ^= (uint8_t)PortPins;
        LD        A, S:?b0
        XOR       A, (X)
        LD        (X), A
//  177 }
        RET
//  178 
//  179 /**
//  180   * @brief  Reads the specified GPIO output data port.
//  181   * @note   The port must be configured in input mode.  
//  182   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  183   * @retval GPIO output data port value.
//  184   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  185 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
//  186 {
//  187     return ((uint8_t)GPIOx->ODR);
GPIO_ReadOutputData:
        LD        A, (X)
        RET
//  188 }
//  189 
//  190 /**
//  191   * @brief  Reads the specified GPIO input data port.
//  192   * @note   The port must be configured in input mode.   
//  193   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  194   * @retval GPIO input data port value.
//  195   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  196 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
//  197 {
//  198     return ((uint8_t)GPIOx->IDR);
GPIO_ReadInputData:
        INCW      X
        LD        A, (X)
        RET
//  199 }
//  200 
//  201 /**
//  202   * @brief  Reads the specified GPIO input data pin.
//  203   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  204   * @param  GPIO_Pin : Specifies the pin number.
//  205   * @retval BitStatus : GPIO input pin status.
//  206   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  207 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
//  208 {
//  209     return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
GPIO_ReadInputPin:
        INCW      X
        AND       A, (X)
        RET
//  210 }
//  211 
//  212 /**
//  213   * @brief  Configures the external pull-up on GPIOx pins.
//  214   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  215   * @param  GPIO_Pin : Specifies the pin number
//  216   * @param  NewState : The new state of the pull up pin.
//  217   * @retval None
//  218   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  219 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
//  220 {
GPIO_ExternalPullUpConfig:
        CALL      L:?push_l2
        LDW       S:?w4, X
        LD        S:?b10, A
        MOV       S:?b11, S:?b0
//  221     /* Check the parameters */
//  222     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
        TNZ       S:?b10
        JRNE      L:??GPIO_ExternalPullUpConfig_0
        LDW       X, #0xde
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  223     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
??GPIO_ExternalPullUpConfig_0:
        TNZ       S:?b11
        JREQ      L:??GPIO_ExternalPullUpConfig_1
        LD        A, S:?b11
        CP        A, #0x1
        JREQ      L:??GPIO_ExternalPullUpConfig_1
        LDW       X, #0xdf
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  224 
//  225     if (NewState != DISABLE) /* External Pull-Up Set*/
??GPIO_ExternalPullUpConfig_1:
        TNZ       S:?b11
        JREQ      L:??GPIO_ExternalPullUpConfig_2
//  226     {
//  227         GPIOx->CR1 |= (uint8_t)GPIO_Pin;
        LDW       X, S:?w4
        ADDW      X, #0x3
        LD        A, S:?b10
        OR        A, (X)
        LDW       X, S:?w4
        ADDW      X, #0x3
        LD        (X), A
        JRA       L:??GPIO_ExternalPullUpConfig_3
//  228     } else /* External Pull-Up Reset*/
//  229     {
//  230         GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
??GPIO_ExternalPullUpConfig_2:
        LDW       X, S:?w4
        ADDW      X, #0x3
        LD        A, S:?b10
        CPL       A
        AND       A, (X)
        LDW       X, S:?w4
        ADDW      X, #0x3
        LD        (X), A
//  231     }
//  232 }
??GPIO_ExternalPullUpConfig_3:
        JP        L:?epilogue_l2

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_0:
        DC8 44H, 3AH, 5CH, 44H, 61H, 74H, 61H, 20H
        DC8 66H, 6FH, 72H, 6DH, 20H, 43H, 5CH, 53H
        DC8 52H, 54H, 5CH, 50H, 57H, 4DH, 0B5H, 0F7H
        DC8 0B9H, 0E2H, 0CFH, 0EEH, 0C4H, 0BFH, 5CH, 53H
        DC8 54H, 4DH, 38H, 0BCH, 0CCH, 0B5H, 0E7H, 0C6H
        DC8 0F7H, 0B9H, 0A4H, 0B3H, 0CCH, 5CH, 4CH, 69H
        DC8 62H, 72H, 61H, 72H, 69H, 65H, 73H, 5CH
        DC8 53H, 54H, 4DH, 38H, 53H, 5FH, 53H, 74H
        DC8 64H, 50H, 65H, 72H, 69H, 70H, 68H, 5FH
        DC8 44H, 72H, 69H, 76H, 65H, 72H, 5CH, 73H
        DC8 72H, 63H, 5CH, 73H, 74H, 6DH, 38H, 73H
        DC8 5FH, 67H, 70H, 69H, 6FH, 2EH, 63H, 0

        END
//  233 
//  234 /**
//  235   * @}
//  236   */
//  237   
//  238 /**
//  239   * @}
//  240   */
//  241   
//  242 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
//  96 bytes in section .near.rodata
// 334 bytes in section .near_func.text
// 
// 334 bytes of CODE  memory
//  96 bytes of CONST memory
//
//Errors: none
//Warnings: none
