///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V2.10.4.157 for STM8                19/Sep/2015  09:42:59
// Copyright 2010-2015 IAR Systems AB.
//
//    Source file  =  
//        D:\Data form
//        C\SRT\PWM调光项目\STM8继电器工程\Libraries\STM8S_StdPeriph_Driver\src\stm8s_iwdg.c
//    Command line =  
//        "D:\Data form
//        C\SRT\PWM调光项目\STM8继电器工程\Libraries\STM8S_StdPeriph_Driver\src\stm8s_iwdg.c"
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
//        D:\Data form C\SRT\PWM调光项目\STM8继电器工程\Debug\List\stm8s_iwdg.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b8
        EXTERN ?w0
        EXTERN ?w1
        EXTERN assert_failed

        PUBLIC IWDG_Enable
        PUBLIC IWDG_ReloadCounter
        PUBLIC IWDG_SetPrescaler
        PUBLIC IWDG_SetReload
        PUBLIC IWDG_WriteAccessCmd

// D:\Data form C\SRT\PWM调光项目\STM8继电器工程\Libraries\STM8S_StdPeriph_Driver\src\stm8s_iwdg.c
//    1 /**
//    2   ********************************************************************************
//    3   * @file    stm8s_iwdg.c
//    4   * @author  MCD Application Team
//    5   * @version V2.1.0
//    6   * @date    18-November-2011
//    7   * @brief   This file contains all the functions for the IWDG peripheral.
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
//   23 #include "stm8s_iwdg.h"
//   24 
//   25 /* Private define ------------------------------------------------------------*/
//   26 /* Private macro -------------------------------------------------------------*/
//   27 /* Private variables ---------------------------------------------------------*/
//   28 /* Private function prototypes -----------------------------------------------*/
//   29 /* Private functions ---------------------------------------------------------*/
//   30 /* Public functions ----------------------------------------------------------*/
//   31 
//   32 /** @addtogroup IWDG_Public_Functions
//   33   * @{
//   34   */
//   35 
//   36 /**
//   37   * @brief  Enables or disables write access to Prescaler and Reload registers.
//   38   * @param  IWDG_WriteAccess : New state of write access to Prescaler and Reload
//   39   *         registers.  This parameter can be a value of @ref IWDG_WriteAccess_TypeDef.
//   40   * @retval None
//   41   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   42 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
//   43 {
IWDG_WriteAccessCmd:
        PUSH      S:?b8
        LD        S:?b8, A
//   44     /* Check the parameters */
//   45     assert_param(IS_IWDG_WRITEACCESS_MODE_OK(IWDG_WriteAccess));
        LD        A, S:?b8
        CP        A, #0x55
        JREQ      L:??IWDG_WriteAccessCmd_0
        TNZ       S:?b8
        JREQ      L:??IWDG_WriteAccessCmd_0
        LDW       X, #0x2d
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//   46 
//   47     IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
??IWDG_WriteAccessCmd_0:
        LD        A, S:?b8
        LD        L:0x50e0, A
//   48 }
        POP       S:?b8
        RET
//   49 
//   50 /**
//   51   * @brief  Sets IWDG Prescaler value.
//   52   * @note   Write access should be enabled
//   53   * @param  IWDG_Prescaler : Specifies the IWDG Prescaler value.
//   54   *         This parameter can be a value of @ref IWDG_Prescaler_TypeDef.
//   55   * @retval None
//   56   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   57 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
//   58 {
IWDG_SetPrescaler:
        PUSH      S:?b8
        LD        S:?b8, A
//   59     /* Check the parameters */
//   60     assert_param(IS_IWDG_PRESCALER_OK(IWDG_Prescaler));
        TNZ       S:?b8
        JREQ      L:??IWDG_SetPrescaler_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??IWDG_SetPrescaler_0
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??IWDG_SetPrescaler_0
        LD        A, S:?b8
        CP        A, #0x3
        JREQ      L:??IWDG_SetPrescaler_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??IWDG_SetPrescaler_0
        LD        A, S:?b8
        CP        A, #0x5
        JREQ      L:??IWDG_SetPrescaler_0
        LD        A, S:?b8
        CP        A, #0x6
        JREQ      L:??IWDG_SetPrescaler_0
        LDW       X, #0x3c
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//   61 
//   62     IWDG->PR = (uint8_t)IWDG_Prescaler;
??IWDG_SetPrescaler_0:
        LD        A, S:?b8
        LD        L:0x50e1, A
//   63 }
        POP       S:?b8
        RET
//   64 
//   65 /**
//   66   * @brief  Sets IWDG Reload value.
//   67   * @note   Write access should be enabled
//   68   * @param  IWDG_Reload : Reload register value.
//   69   *         This parameter must be a number between 0 and 0xFF.
//   70   * @retval None
//   71   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   72 void IWDG_SetReload(uint8_t IWDG_Reload)
//   73 {
//   74     IWDG->RLR = IWDG_Reload;
IWDG_SetReload:
        LD        L:0x50e2, A
//   75 }
        RET
//   76 
//   77 /**
//   78   * @brief  Reloads IWDG counter
//   79   * @note   Write access should be enabled
//   80   * @param  None
//   81   * @retval None
//   82   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   83 void IWDG_ReloadCounter(void)
//   84 {
//   85     IWDG->KR = IWDG_KEY_REFRESH;
IWDG_ReloadCounter:
        MOV       L:0x50e0, #0xaa
//   86 }
        RET
//   87 
//   88 /**
//   89   * @brief  Enables IWDG.
//   90   * @param  None
//   91   * @retval None
//   92   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   93 void IWDG_Enable(void)
//   94 {
//   95     IWDG->KR = IWDG_KEY_ENABLE;
IWDG_Enable:
        MOV       L:0x50e0, #0xcc
//   96 }
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
        DC8 5FH, 69H, 77H, 64H, 67H, 2EH, 63H, 0

        END
//   97 
//   98 /**
//   99   * @}
//  100   */
//  101   
//  102 /**
//  103   * @}
//  104   */
//  105   
//  106 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
//  96 bytes in section .near.rodata
// 120 bytes in section .near_func.text
// 
// 120 bytes of CODE  memory
//  96 bytes of CONST memory
//
//Errors: none
//Warnings: none
