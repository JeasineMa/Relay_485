///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V2.10.4.157 for STM8                19/Sep/2015  09:42:59
// Copyright 2010-2015 IAR Systems AB.
//
//    Source file  =  
//        D:\Data form
//        C\SRT\PWM调光项目\STM8继电器工程\Libraries\STM8S_StdPeriph_Driver\src\stm8s_rst.c
//    Command line =  
//        "D:\Data form
//        C\SRT\PWM调光项目\STM8继电器工程\Libraries\STM8S_StdPeriph_Driver\src\stm8s_rst.c"
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
//        D:\Data form C\SRT\PWM调光项目\STM8继电器工程\Debug\List\stm8s_rst.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b8
        EXTERN ?w0
        EXTERN ?w1
        EXTERN assert_failed

        PUBLIC RST_ClearFlag
        PUBLIC RST_GetFlagStatus

// D:\Data form C\SRT\PWM调光项目\STM8继电器工程\Libraries\STM8S_StdPeriph_Driver\src\stm8s_rst.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_rst.c
//    4   * @author  MCD Application Team
//    5   * @version V2.1.0
//    6   * @date    18-November-2011
//    7   * @brief   This file contains all the functions for the RST peripheral.
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
//   23 
//   24 #include "stm8s_rst.h"
//   25 
//   26 /** @addtogroup STM8S_StdPeriph_Driver
//   27   * @{
//   28   */
//   29 /* Private typedef -----------------------------------------------------------*/
//   30 /* Private define ------------------------------------------------------------*/
//   31 /* Private macro -------------------------------------------------------------*/
//   32 /* Private variables ---------------------------------------------------------*/
//   33 /* Private function prototypes -----------------------------------------------*/
//   34 /* Private Constants ---------------------------------------------------------*/
//   35 /* Public functions ----------------------------------------------------------*/
//   36 /**
//   37   * @addtogroup RST_Public_Functions
//   38   * @{
//   39   */
//   40 
//   41 
//   42 /**
//   43   * @brief   Checks whether the specified RST flag is set or not.
//   44   * @param   RST_Flag : specify the reset flag to check.
//   45   *          This parameter can be a value of @ref RST_FLAG_TypeDef.
//   46   * @retval  FlagStatus: status of the given RST flag.
//   47   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   48 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
//   49 {
RST_GetFlagStatus:
        PUSH      S:?b8
        LD        S:?b8, A
//   50     /* Check the parameters */
//   51     assert_param(IS_RST_FLAG_OK(RST_Flag));
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??RST_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??RST_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??RST_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??RST_GetFlagStatus_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??RST_GetFlagStatus_0
        LDW       X, #0x33
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//   52 
//   53     /* Get flag status */
//   54 
//   55     return ((FlagStatus)((uint8_t)RST->SR & (uint8_t)RST_Flag));
??RST_GetFlagStatus_0:
        LD        A, S:?b8
        AND       A, L:0x50b3
        POP       S:?b8
        RET
//   56 }
//   57 
//   58 /**
//   59   * @brief  Clears the specified RST flag.
//   60   * @param  RST_Flag : specify the reset flag to clear.
//   61   *         This parameter can be a value of @ref RST_FLAG_TypeDef.
//   62   * @retval None
//   63   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   64 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
//   65 {
RST_ClearFlag:
        PUSH      S:?b8
        LD        S:?b8, A
//   66     /* Check the parameters */
//   67     assert_param(IS_RST_FLAG_OK(RST_Flag));
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??RST_ClearFlag_0
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??RST_ClearFlag_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??RST_ClearFlag_0
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??RST_ClearFlag_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??RST_ClearFlag_0
        LDW       X, #0x43
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//   68 
//   69     RST->SR = (uint8_t)RST_Flag;
??RST_ClearFlag_0:
        LD        A, S:?b8
        LD        L:0x50b3, A
//   70 }
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
        DC8 5FH, 72H, 73H, 74H, 2EH, 63H, 0

        END
//   71 
//   72 /**
//   73   * @}
//   74   */
//   75   
//   76 /**
//   77   * @}
//   78   */
//   79   
//   80 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
//  95 bytes in section .near.rodata
// 116 bytes in section .near_func.text
// 
// 116 bytes of CODE  memory
//  95 bytes of CONST memory
//
//Errors: none
//Warnings: none
