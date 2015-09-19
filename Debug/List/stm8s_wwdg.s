///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V2.10.4.157 for STM8                19/Sep/2015  09:43:00
// Copyright 2010-2015 IAR Systems AB.
//
//    Source file  =  
//        D:\Data form
//        C\SRT\PWM调光项目\STM8继电器工程\Libraries\STM8S_StdPeriph_Driver\src\stm8s_wwdg.c
//    Command line =  
//        "D:\Data form
//        C\SRT\PWM调光项目\STM8继电器工程\Libraries\STM8S_StdPeriph_Driver\src\stm8s_wwdg.c"
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
//        D:\Data form C\SRT\PWM调光项目\STM8继电器工程\Debug\List\stm8s_wwdg.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_w4
        EXTERN ?push_w4
        EXTERN ?w0
        EXTERN ?w1
        EXTERN assert_failed

        PUBLIC WWDG_GetCounter
        PUBLIC WWDG_Init
        PUBLIC WWDG_SWReset
        PUBLIC WWDG_SetCounter
        PUBLIC WWDG_SetWindowValue

// D:\Data form C\SRT\PWM调光项目\STM8继电器工程\Libraries\STM8S_StdPeriph_Driver\src\stm8s_wwdg.c
//    1 /**
//    2   ********************************************************************************
//    3   * @file    stm8s_wwdg.c
//    4   * @author  MCD Application Team
//    5   * @version V2.1.0
//    6   * @date    18-November-2011
//    7   * @brief   This file contains all the functions for the WWDG peripheral.
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
//   23 #include "stm8s_wwdg.h"
//   24 
//   25 /** @addtogroup STM8S_StdPeriph_Driver
//   26   * @{
//   27   */
//   28 /* Private define ------------------------------------------------------------*/
//   29 #define BIT_MASK          ((uint8_t)0x7F)
//   30 /* Private macro -------------------------------------------------------------*/
//   31 /* Private variables ---------------------------------------------------------*/
//   32 /* Private function prototypes -----------------------------------------------*/
//   33 /* Private functions ---------------------------------------------------------*/
//   34 
//   35 /** @addtogroup WWDG_Public_Functions
//   36   * @{
//   37   */
//   38 
//   39 /**
//   40   * @brief  Initializes the WWDG peripheral.
//   41   *         This function set Window Register = WindowValue, Counter Register
//   42   *         according to Counter and \b ENABLE \b WWDG
//   43   * @param  Counter : WWDG counter value
//   44   * @param  WindowValue : specifies the WWDG Window Register, range is 0x00 to 0x7F.
//   45   * @retval None
//   46   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   47 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
//   48 {
WWDG_Init:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
//   49     /* Check the parameters */
//   50     assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
        LD        A, S:?b9
        CP        A, #0x80
        JRC       L:??WWDG_Init_0
        LDW       X, #0x32
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//   51     
//   52     WWDG->WR = WWDG_WR_RESET_VALUE;
??WWDG_Init_0:
        MOV       L:0x50d2, #0x7f
//   53     WWDG->CR = (uint8_t)((uint8_t)(WWDG_CR_WDGA | WWDG_CR_T6) | (uint8_t)Counter);
        LD        A, S:?b8
        OR        A, #0xc0
        LD        L:0x50d1, A
//   54     WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
        LD        A, S:?b9
        OR        A, #0x40
        AND       A, #0x7f
        LD        L:0x50d2, A
//   55 }
        JP        L:?epilogue_w4
//   56 
//   57 /**
//   58   * @brief  Refreshes the WWDG peripheral.
//   59   * @param  Counter :  WWDG Counter Value
//   60   *         This parameter must be a number between 0x40 and 0x7F.
//   61   * @retval None
//   62   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   63 void WWDG_SetCounter(uint8_t Counter)
//   64 {
WWDG_SetCounter:
        PUSH      S:?b8
        LD        S:?b8, A
//   65 
//   66     /* Check the parameters */
//   67     assert_param(IS_WWDG_COUNTERVALUE_OK(Counter));
        LD        A, S:?b8
        CP        A, #0x80
        JRC       L:??WWDG_SetCounter_0
        LDW       X, #0x43
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//   68 
//   69    /* Write to T[6:0] bits to configure the counter value, no need to do
//   70      a read-modify-write; writing a 0 to WDGA bit does nothing */
//   71   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
??WWDG_SetCounter_0:
        LD        A, S:?b8
        AND       A, #0x7f
        LD        L:0x50d1, A
//   72 
//   73 }
        POP       S:?b8
        RET
//   74 
//   75 /**
//   76   * @brief Gets the WWDG Counter Value.
//   77   *        This value could be used to check if WWDG is in the window, where
//   78   *        refresh is allowed.
//   79   * @param  None
//   80   * @retval WWDG Counter Value
//   81   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   82 uint8_t WWDG_GetCounter(void)
//   83 {
//   84     return(WWDG->CR);
WWDG_GetCounter:
        LD        A, L:0x50d1
        RET
//   85 }
//   86 
//   87 /**
//   88   * @brief  Generates immediate WWDG RESET.
//   89   * @param  None
//   90   * @retval None
//   91   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   92 void WWDG_SWReset(void)
//   93 {
//   94     WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
WWDG_SWReset:
        MOV       L:0x50d1, #0x80
//   95 }
        RET
//   96 
//   97 /**
//   98   * @brief  Sets the WWDG window value.
//   99   * @param  WindowValue: specifies the window value to be compared to the
//  100   *         downcounter.
//  101   *         This parameter value must be lower than 0x80.
//  102   * @retval None
//  103   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  104 void WWDG_SetWindowValue(uint8_t WindowValue)
//  105 {
WWDG_SetWindowValue:
        PUSH      S:?b8
        LD        S:?b8, A
//  106     /* Check the parameters */
//  107     assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
        LD        A, S:?b8
        CP        A, #0x80
        JRC       L:??WWDG_SetWindowValue_0
        LDW       X, #0x6b
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  108     
//  109     WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
??WWDG_SetWindowValue_0:
        LD        A, S:?b8
        OR        A, #0x40
        AND       A, #0x7f
        LD        L:0x50d2, A
//  110 }
        POP       S:?b8
        RET

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
        DC8 5FH, 77H, 77H, 64H, 67H, 2EH, 63H, 0

        END
//  111 /**
//  112   * @}
//  113   */
//  114   
//  115 /**
//  116   * @}
//  117   */
//  118   
//  119 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
//  96 bytes in section .near.rodata
// 134 bytes in section .near_func.text
// 
// 134 bytes of CODE  memory
//  96 bytes of CONST memory
//
//Errors: none
//Warnings: none
