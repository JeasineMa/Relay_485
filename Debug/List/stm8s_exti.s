///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V2.10.4.157 for STM8                19/Sep/2015  09:42:59
// Copyright 2010-2015 IAR Systems AB.
//
//    Source file  =  
//        D:\Data form
//        C\SRT\PWM调光项目\STM8继电器工程\Libraries\STM8S_StdPeriph_Driver\src\stm8s_exti.c
//    Command line =  
//        "D:\Data form
//        C\SRT\PWM调光项目\STM8继电器工程\Libraries\STM8S_StdPeriph_Driver\src\stm8s_exti.c"
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
//        D:\Data form C\SRT\PWM调光项目\STM8继电器工程\Debug\List\stm8s_exti.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_w4
        EXTERN ?push_w4
        EXTERN ?sll8_a_a_6
        EXTERN ?srl8_a_a_6
        EXTERN ?w0
        EXTERN ?w1
        EXTERN assert_failed

        PUBLIC EXTI_DeInit
        PUBLIC EXTI_GetExtIntSensitivity
        PUBLIC EXTI_GetTLISensitivity
        PUBLIC EXTI_SetExtIntSensitivity
        PUBLIC EXTI_SetTLISensitivity

// D:\Data form C\SRT\PWM调光项目\STM8继电器工程\Libraries\STM8S_StdPeriph_Driver\src\stm8s_exti.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_exti.c
//    4   * @author  MCD Application Team
//    5   * @version V2.1.0
//    6   * @date    18-November-2011
//    7   * @brief   This file contains all the functions for the EXTI peripheral.
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
//   23 #include "stm8s_exti.h"
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
//   38   * @addtogroup EXTI_Public_Functions
//   39   * @{
//   40   */
//   41 
//   42 /**
//   43   * @brief  Deinitializes the external interrupt control registers to their default reset value.
//   44   * @param  None
//   45   * @retval None
//   46   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   47 void EXTI_DeInit(void)
//   48 {
//   49     EXTI->CR1 = EXTI_CR1_RESET_VALUE;
EXTI_DeInit:
        MOV       L:0x50a0, #0x0
//   50     EXTI->CR2 = EXTI_CR2_RESET_VALUE;
        MOV       L:0x50a1, #0x0
//   51 }
        RET
//   52 
//   53 /**
//   54   * @brief  Set the external interrupt sensitivity of the selected port.
//   55   * @warning
//   56   * - The modification of external interrupt sensitivity is only possible when the interrupts are disabled.
//   57   * - The normal behavior is to disable the interrupts before calling this function, and re-enable them after.
//   58   * @param   Port The port number to access.
//   59   * @param   SensitivityValue The external interrupt sensitivity value to set.
//   60   * @retval None
//   61   * @par Required preconditions:
//   62   * Global interrupts must be disabled before calling this function.
//   63   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   64 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
//   65 {
EXTI_SetExtIntSensitivity:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
//   66 
//   67     /* Check function parameters */
//   68     assert_param(IS_EXTI_PORT_OK(Port));
        TNZ       S:?b8
        JREQ      L:??EXTI_SetExtIntSensitivity_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??EXTI_SetExtIntSensitivity_0
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??EXTI_SetExtIntSensitivity_0
        LD        A, S:?b8
        CP        A, #0x3
        JREQ      L:??EXTI_SetExtIntSensitivity_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??EXTI_SetExtIntSensitivity_0
        LDW       X, #0x44
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//   69     assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
??EXTI_SetExtIntSensitivity_0:
        TNZ       S:?b9
        JREQ      L:??EXTI_SetExtIntSensitivity_1
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??EXTI_SetExtIntSensitivity_1
        LD        A, S:?b9
        CP        A, #0x2
        JREQ      L:??EXTI_SetExtIntSensitivity_1
        LD        A, S:?b9
        CP        A, #0x3
        JREQ      L:??EXTI_SetExtIntSensitivity_1
        LDW       X, #0x45
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//   70 
//   71     /* Set external interrupt sensitivity */
//   72     switch (Port)
??EXTI_SetExtIntSensitivity_1:
        LD        A, S:?b8
        TNZ       A
        JREQ      L:??EXTI_SetExtIntSensitivity_2
        DEC       A
        JREQ      L:??EXTI_SetExtIntSensitivity_3
        DEC       A
        JREQ      L:??EXTI_SetExtIntSensitivity_4
        DEC       A
        JREQ      L:??EXTI_SetExtIntSensitivity_5
        DEC       A
        JREQ      L:??EXTI_SetExtIntSensitivity_6
        JRA       L:??EXTI_SetExtIntSensitivity_7
//   73     {
//   74     case EXTI_PORT_GPIOA:
//   75         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
??EXTI_SetExtIntSensitivity_2:
        LD        A, L:0x50a0
        AND       A, #0xfc
        LD        L:0x50a0, A
//   76         EXTI->CR1 |= (uint8_t)(SensitivityValue);
        LD        A, S:?b9
        OR        A, L:0x50a0
        LD        L:0x50a0, A
//   77         break;
        JRA       L:??EXTI_SetExtIntSensitivity_8
//   78     case EXTI_PORT_GPIOB:
//   79         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
??EXTI_SetExtIntSensitivity_3:
        LD        A, L:0x50a0
        AND       A, #0xf3
        LD        L:0x50a0, A
//   80         EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
        LD        A, S:?b9
        SLL       A
        SLL       A
        OR        A, L:0x50a0
        LD        L:0x50a0, A
//   81         break;
        JRA       L:??EXTI_SetExtIntSensitivity_8
//   82     case EXTI_PORT_GPIOC:
//   83         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
??EXTI_SetExtIntSensitivity_4:
        LD        A, L:0x50a0
        AND       A, #0xcf
        LD        L:0x50a0, A
//   84         EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
        LD        A, S:?b9
        SWAP      A
        AND       A, #0xf0
        OR        A, L:0x50a0
        LD        L:0x50a0, A
//   85         break;
        JRA       L:??EXTI_SetExtIntSensitivity_8
//   86     case EXTI_PORT_GPIOD:
//   87         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
??EXTI_SetExtIntSensitivity_5:
        LD        A, L:0x50a0
        AND       A, #0x3f
        LD        L:0x50a0, A
//   88         EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
        LD        A, S:?b9
        CALL      L:?sll8_a_a_6
        OR        A, L:0x50a0
        LD        L:0x50a0, A
//   89         break;
        JRA       L:??EXTI_SetExtIntSensitivity_8
//   90     case EXTI_PORT_GPIOE:
//   91         EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
??EXTI_SetExtIntSensitivity_6:
        LD        A, L:0x50a1
        AND       A, #0xfc
        LD        L:0x50a1, A
//   92         EXTI->CR2 |= (uint8_t)(SensitivityValue);
        LD        A, S:?b9
        OR        A, L:0x50a1
        LD        L:0x50a1, A
//   93         break;
        JRA       L:??EXTI_SetExtIntSensitivity_8
//   94     default:
//   95         break;
//   96     }
//   97 }
??EXTI_SetExtIntSensitivity_7:
??EXTI_SetExtIntSensitivity_8:
        JP        L:?epilogue_w4
//   98 
//   99 /**
//  100   * @brief  Set the TLI interrupt sensitivity.
//  101   * @param   SensitivityValue The TLI interrupt sensitivity value.
//  102   * @retval None
//  103   * @par Required preconditions:
//  104   * Global interrupts must be disabled before calling this function.
//  105   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  106 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
//  107 {
EXTI_SetTLISensitivity:
        PUSH      S:?b8
        LD        S:?b8, A
//  108     /* Check function parameters */
//  109     assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
        TNZ       S:?b8
        JREQ      L:??EXTI_SetTLISensitivity_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??EXTI_SetTLISensitivity_0
        LDW       X, #0x6d
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  110 
//  111     /* Set TLI interrupt sensitivity */
//  112     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
??EXTI_SetTLISensitivity_0:
        BRES      L:0x50a1, #0x2
//  113     EXTI->CR2 |= (uint8_t)(SensitivityValue);
        LD        A, S:?b8
        OR        A, L:0x50a1
        LD        L:0x50a1, A
//  114 }
        POP       S:?b8
        RET
//  115 
//  116 /**
//  117   * @brief  Get the external interrupt sensitivity of the selected port.
//  118   * @param   Port The port number to access.
//  119   * @retval EXTI_Sensitivity_TypeDef The external interrupt sensitivity of the selected port.
//  120   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  121 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
//  122 {
EXTI_GetExtIntSensitivity:
        CALL      L:?push_w4
        LD        S:?b9, A
//  123     uint8_t value = 0;
        CLR       S:?b8
//  124 
//  125     /* Check function parameters */
//  126     assert_param(IS_EXTI_PORT_OK(Port));
        TNZ       S:?b9
        JREQ      L:??EXTI_GetExtIntSensitivity_0
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??EXTI_GetExtIntSensitivity_0
        LD        A, S:?b9
        CP        A, #0x2
        JREQ      L:??EXTI_GetExtIntSensitivity_0
        LD        A, S:?b9
        CP        A, #0x3
        JREQ      L:??EXTI_GetExtIntSensitivity_0
        LD        A, S:?b9
        CP        A, #0x4
        JREQ      L:??EXTI_GetExtIntSensitivity_0
        LDW       X, #0x7e
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  127 
//  128     switch (Port)
??EXTI_GetExtIntSensitivity_0:
        LD        A, S:?b9
        TNZ       A
        JREQ      L:??EXTI_GetExtIntSensitivity_1
        DEC       A
        JREQ      L:??EXTI_GetExtIntSensitivity_2
        DEC       A
        JREQ      L:??EXTI_GetExtIntSensitivity_3
        DEC       A
        JREQ      L:??EXTI_GetExtIntSensitivity_4
        DEC       A
        JREQ      L:??EXTI_GetExtIntSensitivity_5
        JRA       L:??EXTI_GetExtIntSensitivity_6
//  129     {
//  130     case EXTI_PORT_GPIOA:
//  131         value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
??EXTI_GetExtIntSensitivity_1:
        LD        A, L:0x50a0
        AND       A, #0x3
        LD        S:?b8, A
//  132         break;
        JRA       L:??EXTI_GetExtIntSensitivity_7
//  133     case EXTI_PORT_GPIOB:
//  134         value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
??EXTI_GetExtIntSensitivity_2:
        LD        A, L:0x50a0
        AND       A, #0xc
        SRL       A
        SRL       A
        LD        S:?b8, A
//  135         break;
        JRA       L:??EXTI_GetExtIntSensitivity_7
//  136     case EXTI_PORT_GPIOC:
//  137         value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
??EXTI_GetExtIntSensitivity_3:
        LD        A, L:0x50a0
        AND       A, #0x30
        SWAP      A
        AND       A, #0xf
        LD        S:?b8, A
//  138         break;
        JRA       L:??EXTI_GetExtIntSensitivity_7
//  139     case EXTI_PORT_GPIOD:
//  140         value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
??EXTI_GetExtIntSensitivity_4:
        LD        A, L:0x50a0
        CALL      L:?srl8_a_a_6
        LD        S:?b8, A
//  141         break;
        JRA       L:??EXTI_GetExtIntSensitivity_7
//  142     case EXTI_PORT_GPIOE:
//  143         value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
??EXTI_GetExtIntSensitivity_5:
        LD        A, L:0x50a1
        AND       A, #0x3
        LD        S:?b8, A
//  144         break;
        JRA       L:??EXTI_GetExtIntSensitivity_7
//  145     default:
//  146         break;
//  147     }
//  148 
//  149     return((EXTI_Sensitivity_TypeDef)value);
??EXTI_GetExtIntSensitivity_6:
??EXTI_GetExtIntSensitivity_7:
        LD        A, S:?b8
        JP        L:?epilogue_w4
//  150 }
//  151 
//  152 /**
//  153   * @brief  Get the TLI interrupt sensitivity.
//  154   * @param  None
//  155   * @retval EXTI_TLISensitivity_TypeDef The TLI interrupt sensitivity read.
//  156   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  157 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
//  158 {
//  159 
//  160     uint8_t value = 0;
EXTI_GetTLISensitivity:
        CLR       S:?b0
//  161 
//  162     /* Get TLI interrupt sensitivity */
//  163     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
        LD        A, L:0x50a1
        AND       A, #0x4
        LD        S:?b0, A
//  164 
//  165     return((EXTI_TLISensitivity_TypeDef)value);
        LD        A, S:?b0
        RET
//  166 }

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
        DC8 5FH, 65H, 78H, 74H, 69H, 2EH, 63H, 0

        END
//  167 
//  168 /**
//  169   * @}
//  170   */
//  171   
//  172 /**
//  173   * @}
//  174   */
//  175   
//  176 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
//  96 bytes in section .near.rodata
// 396 bytes in section .near_func.text
// 
// 396 bytes of CODE  memory
//  96 bytes of CONST memory
//
//Errors: none
//Warnings: none
