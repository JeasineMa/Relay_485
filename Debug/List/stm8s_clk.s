///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V2.10.4.157 for STM8                19/Sep/2015  09:42:59
// Copyright 2010-2015 IAR Systems AB.
//
//    Source file  =  
//        D:\Data form
//        C\SRT\PWM调光项目\STM8继电器工程\Libraries\STM8S_StdPeriph_Driver\src\stm8s_clk.c
//    Command line =  
//        "D:\Data form
//        C\SRT\PWM调光项目\STM8继电器工程\Libraries\STM8S_StdPeriph_Driver\src\stm8s_clk.c"
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
//        D:\Data form C\SRT\PWM调光项目\STM8继电器工程\Debug\List\stm8s_clk.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b12
        EXTERN ?b13
        EXTERN ?b14
        EXTERN ?b15
        EXTERN ?b2
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_l2_l3
        EXTERN ?epilogue_l2_w6
        EXTERN ?epilogue_w4
        EXTERN ?mov_l0_l3
        EXTERN ?mov_l3_l0
        EXTERN ?pop_l3
        EXTERN ?pop_w4
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?push_w4
        EXTERN ?push_w6
        EXTERN ?sll16_x_x_a
        EXTERN ?udiv32_l0_dl_l1
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3
        EXTERN ?w4
        EXTERN ?w5
        EXTERN ?w6
        EXTERN ?w7
        EXTERN assert_failed

        PUBLIC CLKPrescTable
        PUBLIC CLK_AdjustHSICalibrationValue
        PUBLIC CLK_CCOCmd
        PUBLIC CLK_CCOConfig
        PUBLIC CLK_ClearITPendingBit
        PUBLIC CLK_ClockSecuritySystemEnable
        PUBLIC CLK_ClockSwitchCmd
        PUBLIC CLK_ClockSwitchConfig
        PUBLIC CLK_DeInit
        PUBLIC CLK_GetClockFreq
        PUBLIC CLK_GetFlagStatus
        PUBLIC CLK_GetITStatus
        PUBLIC CLK_GetSYSCLKSource
        PUBLIC CLK_HSECmd
        PUBLIC CLK_HSICmd
        PUBLIC CLK_HSIPrescalerConfig
        PUBLIC CLK_ITConfig
        PUBLIC CLK_LSICmd
        PUBLIC CLK_PeripheralClockConfig
        PUBLIC CLK_SWIMConfig
        PUBLIC CLK_SYSCLKConfig
        PUBLIC CLK_SYSCLKEmergencyClear
        PUBLIC CLK_SlowActiveHaltWakeUpCmd
        PUBLIC HSIDivFactor

// D:\Data form C\SRT\PWM调光项目\STM8继电器工程\Libraries\STM8S_StdPeriph_Driver\src\stm8s_clk.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_clk.c
//    4   * @author  MCD Application Team
//    5   * @version V2.1.0
//    6   * @date    18-November-2011
//    7   * @brief   This file contains all the functions for the CLK peripheral.
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
//   24 #include "stm8s_clk.h"
//   25 
//   26 /** @addtogroup STM8S_StdPeriph_Driver
//   27   * @{
//   28   */
//   29 /* Private typedef -----------------------------------------------------------*/
//   30 /* Private define ------------------------------------------------------------*/
//   31 /* Private macro -------------------------------------------------------------*/
//   32 /* Private variables ---------------------------------------------------------*/
//   33 /* Private function prototypes -----------------------------------------------*/
//   34 
//   35 /* Private Constants ---------------------------------------------------------*/
//   36 
//   37 /**
//   38   * @addtogroup CLK_Private_Constants
//   39   * @{
//   40   */
//   41 

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
//   42 CONST uint8_t HSIDivFactor[4] = {1, 2, 4, 8}; /*!< Holds the different HSI Divider factors */
HSIDivFactor:
        DC8 1, 2, 4, 8

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
//   43 CONST uint8_t CLKPrescTable[8] = {1, 2, 4, 8, 10, 16, 20, 40}; /*!< Holds the different CLK prescaler values */
CLKPrescTable:
        DC8 1, 2, 4, 8, 10, 16, 20, 40
//   44 
//   45 /**
//   46   * @}
//   47   */
//   48 
//   49 /* Public functions ----------------------------------------------------------*/
//   50 /**
//   51   * @addtogroup CLK_Public_Functions
//   52   * @{
//   53   */
//   54 
//   55 /**
//   56   * @brief  Deinitializes the CLK peripheral registers to their default reset
//   57   * values.
//   58   * @param  None
//   59   * @retval None
//   60   * @par Warning:
//   61   * Resetting the CCOR register: \n
//   62   * When the CCOEN bit is set, the reset of the CCOR register require
//   63   * two consecutive write instructions in order to reset first the CCOEN bit
//   64   * and the second one is to reset the CCOSEL bits.
//   65   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   66 void CLK_DeInit(void)
//   67 {
//   68 
//   69     CLK->ICKR = CLK_ICKR_RESET_VALUE;
CLK_DeInit:
        MOV       L:0x50c0, #0x1
//   70     CLK->ECKR = CLK_ECKR_RESET_VALUE;
        MOV       L:0x50c1, #0x0
//   71     CLK->SWR  = CLK_SWR_RESET_VALUE;
        MOV       L:0x50c4, #0xe1
//   72     CLK->SWCR = CLK_SWCR_RESET_VALUE;
        MOV       L:0x50c5, #0x0
//   73     CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
        MOV       L:0x50c6, #0x18
//   74     CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
        MOV       L:0x50c7, #0xff
//   75     CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
        MOV       L:0x50ca, #0xff
//   76     CLK->CSSR = CLK_CSSR_RESET_VALUE;
        MOV       L:0x50c8, #0x0
//   77     CLK->CCOR = CLK_CCOR_RESET_VALUE;
        MOV       L:0x50c9, #0x0
//   78     while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
??CLK_DeInit_0:
        BTJT      L:0x50c9, #0x0, L:??CLK_DeInit_0
//   79     {}
//   80     CLK->CCOR = CLK_CCOR_RESET_VALUE;
        MOV       L:0x50c9, #0x0
//   81     CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
        MOV       L:0x50cc, #0x0
//   82     CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
        MOV       L:0x50cd, #0x0
//   83 
//   84 }
        RET
//   85 
//   86 /**
//   87   * @brief  Enable or Disable the External High Speed oscillator (HSE).
//   88   * @param   NewState new state of HSEEN, value accepted ENABLE, DISABLE.
//   89   * @retval None
//   90   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   91 void CLK_HSECmd(FunctionalState NewState)
//   92 {
CLK_HSECmd:
        PUSH      S:?b8
        LD        S:?b8, A
//   93 
//   94     /* Check the parameters */
//   95     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??CLK_HSECmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??CLK_HSECmd_0
        LDW       X, #0x5f
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//   96 
//   97     if (NewState != DISABLE)
??CLK_HSECmd_0:
        TNZ       S:?b8
        JREQ      L:??CLK_HSECmd_1
//   98     {
//   99         /* Set HSEEN bit */
//  100         CLK->ECKR |= CLK_ECKR_HSEEN;
        BSET      L:0x50c1, #0x0
        JRA       L:??CLK_HSECmd_2
//  101     }
//  102     else
//  103     {
//  104         /* Reset HSEEN bit */
//  105         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
??CLK_HSECmd_1:
        BRES      L:0x50c1, #0x0
//  106     }
//  107 
//  108 }
??CLK_HSECmd_2:
        POP       S:?b8
        RET
//  109 
//  110 /**
//  111   * @brief  Enables or disables the Internal High Speed oscillator (HSI).
//  112   * @param   NewState new state of HSIEN, value accepted ENABLE, DISABLE.
//  113   * @retval None
//  114   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  115 void CLK_HSICmd(FunctionalState NewState)
//  116 {
CLK_HSICmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  117 
//  118     /* Check the parameters */
//  119     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??CLK_HSICmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??CLK_HSICmd_0
        LDW       X, #0x77
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  120 
//  121     if (NewState != DISABLE)
??CLK_HSICmd_0:
        TNZ       S:?b8
        JREQ      L:??CLK_HSICmd_1
//  122     {
//  123         /* Set HSIEN bit */
//  124         CLK->ICKR |= CLK_ICKR_HSIEN;
        BSET      L:0x50c0, #0x0
        JRA       L:??CLK_HSICmd_2
//  125     }
//  126     else
//  127     {
//  128         /* Reset HSIEN bit */
//  129         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
??CLK_HSICmd_1:
        BRES      L:0x50c0, #0x0
//  130     }
//  131 
//  132 }
??CLK_HSICmd_2:
        POP       S:?b8
        RET
//  133 
//  134 /**
//  135   * @brief  Enables or disables the Internal Low Speed oscillator (LSI).
//  136   * @param    NewState new state of LSIEN, value accepted ENABLE, DISABLE.
//  137   * @retval None
//  138   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  139 void CLK_LSICmd(FunctionalState NewState)
//  140 {
CLK_LSICmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  141 
//  142     /* Check the parameters */
//  143     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??CLK_LSICmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??CLK_LSICmd_0
        LDW       X, #0x8f
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  144 
//  145     if (NewState != DISABLE)
??CLK_LSICmd_0:
        TNZ       S:?b8
        JREQ      L:??CLK_LSICmd_1
//  146     {
//  147         /* Set LSIEN bit */
//  148         CLK->ICKR |= CLK_ICKR_LSIEN;
        BSET      L:0x50c0, #0x3
        JRA       L:??CLK_LSICmd_2
//  149     }
//  150     else
//  151     {
//  152         /* Reset LSIEN bit */
//  153         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
??CLK_LSICmd_1:
        BRES      L:0x50c0, #0x3
//  154     }
//  155 
//  156 }
??CLK_LSICmd_2:
        POP       S:?b8
        RET
//  157 
//  158 /**
//  159   * @brief  Enables or disablle the Configurable Clock Output (CCO).
//  160   * @param   NewState : New state of CCEN bit (CCO register).
//  161   * This parameter can be any of the @ref FunctionalState enumeration.
//  162   * @retval None
//  163   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  164 void CLK_CCOCmd(FunctionalState NewState)
//  165 {
CLK_CCOCmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  166 
//  167     /* Check the parameters */
//  168     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??CLK_CCOCmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??CLK_CCOCmd_0
        LDW       X, #0xa8
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  169 
//  170     if (NewState != DISABLE)
??CLK_CCOCmd_0:
        TNZ       S:?b8
        JREQ      L:??CLK_CCOCmd_1
//  171     {
//  172         /* Set CCOEN bit */
//  173         CLK->CCOR |= CLK_CCOR_CCOEN;
        BSET      L:0x50c9, #0x0
        JRA       L:??CLK_CCOCmd_2
//  174     }
//  175     else
//  176     {
//  177         /* Reset CCOEN bit */
//  178         CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
??CLK_CCOCmd_1:
        BRES      L:0x50c9, #0x0
//  179     }
//  180 
//  181 }
??CLK_CCOCmd_2:
        POP       S:?b8
        RET
//  182 
//  183 /**
//  184   * @brief  Starts or Stops manually the clock switch execution.
//  185   * @par Full description:
//  186   * NewState parameter set the SWEN.
//  187   * @param   NewState new state of SWEN, value accepted ENABLE, DISABLE.
//  188   * @retval None
//  189   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  190 void CLK_ClockSwitchCmd(FunctionalState NewState)
//  191 {
CLK_ClockSwitchCmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  192 
//  193     /* Check the parameters */
//  194     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??CLK_ClockSwitchCmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??CLK_ClockSwitchCmd_0
        LDW       X, #0xc2
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  195 
//  196     if (NewState != DISABLE )
??CLK_ClockSwitchCmd_0:
        TNZ       S:?b8
        JREQ      L:??CLK_ClockSwitchCmd_1
//  197     {
//  198         /* Enable the Clock Switch */
//  199         CLK->SWCR |= CLK_SWCR_SWEN;
        BSET      L:0x50c5, #0x1
        JRA       L:??CLK_ClockSwitchCmd_2
//  200     }
//  201     else
//  202     {
//  203         /* Disable the Clock Switch */
//  204         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
??CLK_ClockSwitchCmd_1:
        BRES      L:0x50c5, #0x1
//  205     }
//  206 
//  207 }
??CLK_ClockSwitchCmd_2:
        POP       S:?b8
        RET
//  208 
//  209 /**
//  210   * @brief  Configures the slow active halt wake up
//  211   * @param   NewState: specifies the Slow Active Halt wake up state.
//  212   * can be set of the following values:
//  213   * - DISABLE: Slow Active Halt mode disabled;
//  214   * - ENABLE:  Slow Active Halt mode enabled.
//  215   * @retval None
//  216   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  217 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
//  218 {
CLK_SlowActiveHaltWakeUpCmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  219 
//  220     /* check the parameters */
//  221     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??CLK_SlowActiveHaltWakeUpCmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??CLK_SlowActiveHaltWakeUpCmd_0
        LDW       X, #0xdd
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  222 
//  223     if (NewState != DISABLE)
??CLK_SlowActiveHaltWakeUpCmd_0:
        TNZ       S:?b8
        JREQ      L:??CLK_SlowActiveHaltWakeUpCmd_1
//  224     {
//  225         /* Set S_ACTHALT bit */
//  226         CLK->ICKR |= CLK_ICKR_SWUAH;
        BSET      L:0x50c0, #0x5
        JRA       L:??CLK_SlowActiveHaltWakeUpCmd_2
//  227     }
//  228     else
//  229     {
//  230         /* Reset S_ACTHALT bit */
//  231         CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
??CLK_SlowActiveHaltWakeUpCmd_1:
        BRES      L:0x50c0, #0x5
//  232     }
//  233 
//  234 }
??CLK_SlowActiveHaltWakeUpCmd_2:
        POP       S:?b8
        RET
//  235 
//  236 /**
//  237   * @brief   Enables or disables the specified peripheral CLK.
//  238   * @param   CLK_Peripheral : This parameter specifies the peripheral clock to gate.
//  239   * This parameter can be any of the  @ref CLK_Peripheral_TypeDef enumeration.
//  240   * @param   NewState : New state of specified peripheral clock.
//  241   * This parameter can be any of the @ref FunctionalState enumeration.
//  242   * @retval None
//  243   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  244 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
//  245 {
CLK_PeripheralClockConfig:
        LD        S:?b1, A
//  246 
//  247     /* Check the parameters */
//  248 //    assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  249 //   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
//  250 
//  251     if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
        LD        A, S:?b1
        AND       A, #0x10
        CP        A, #0x0
        JRNE      L:??CLK_PeripheralClockConfig_0
//  252     {
//  253         if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??CLK_PeripheralClockConfig_1
//  254         {
//  255             /* Enable the peripheral Clock */
//  256             CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
        LD        A, S:?b1
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        OR        A, L:0x50c7
        LD        L:0x50c7, A
        JRA       L:??CLK_PeripheralClockConfig_1
//  257         }
//  258      //   else
//  259      //   {
//  260             /* Disable the peripheral Clock */
//  261        //     CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
//  262     //    }
//  263     }
//  264     else
//  265     {
//  266         if (NewState != DISABLE)
??CLK_PeripheralClockConfig_0:
        TNZ       S:?b0
        JREQ      L:??CLK_PeripheralClockConfig_1
//  267         {
//  268             /* Enable the peripheral Clock */
//  269             CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
        LD        A, S:?b1
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        OR        A, L:0x50ca
        LD        L:0x50ca, A
//  270         }
//  271     //    else
//  272     //    {
//  273             /* Disable the peripheral Clock */
//  274     //        CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
//  275     //    }
//  276     }
//  277 
//  278 }
??CLK_PeripheralClockConfig_1:
        RET
//  279 
//  280 /**
//  281   * @brief  configures the Switch from one clock to another
//  282   * @param   CLK_SwitchMode select the clock switch mode.
//  283   * It can be set of the values of @ref CLK_SwitchMode_TypeDef
//  284   * @param   CLK_NewClock choice of the future clock.
//  285   * It can be set of the values of @ref CLK_Source_TypeDef
//  286   * @param   NewState Enable or Disable the Clock Switch interrupt.
//  287   * @param   CLK_CurrentClockState current clock to switch OFF or to keep ON.
//  288   * It can be set of the values of @ref CLK_CurrentClockState_TypeDef
//  289   * @retval ErrorStatus this shows the clock switch status (ERROR/SUCCESS).
//  290   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  291 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
//  292 {
CLK_ClockSwitchConfig:
        CALL      L:?push_l2
        CALL      L:?push_l3
        LD        S:?b12, A
        MOV       S:?b11, S:?b0
        MOV       S:?b14, S:?b1
        MOV       S:?b13, S:?b2
//  293 
//  294     CLK_Source_TypeDef clock_master;
//  295     uint16_t DownCounter = CLK_TIMEOUT;
        LDW       X, #0x491
        LDW       S:?w4, X
//  296     ErrorStatus Swif = ERROR;
        CLR       S:?b10
//  297 
//  298     /* Check the parameters */
//  299     assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
        LD        A, S:?b11
        CP        A, #0xe1
        JREQ      L:??CLK_ClockSwitchConfig_0
        LD        A, S:?b11
        CP        A, #0xd2
        JREQ      L:??CLK_ClockSwitchConfig_0
        LD        A, S:?b11
        CP        A, #0xb4
        JREQ      L:??CLK_ClockSwitchConfig_0
        LDW       X, #0x12b
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  300     assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
??CLK_ClockSwitchConfig_0:
        TNZ       S:?b12
        JREQ      L:??CLK_ClockSwitchConfig_1
        LD        A, S:?b12
        CP        A, #0x1
        JREQ      L:??CLK_ClockSwitchConfig_1
        LDW       X, #0x12c
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  301     assert_param(IS_FUNCTIONALSTATE_OK(ITState));
??CLK_ClockSwitchConfig_1:
        TNZ       S:?b14
        JREQ      L:??CLK_ClockSwitchConfig_2
        LD        A, S:?b14
        CP        A, #0x1
        JREQ      L:??CLK_ClockSwitchConfig_2
        LDW       X, #0x12d
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  302     assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
??CLK_ClockSwitchConfig_2:
        TNZ       S:?b13
        JREQ      L:??CLK_ClockSwitchConfig_3
        LD        A, S:?b13
        CP        A, #0x1
        JREQ      L:??CLK_ClockSwitchConfig_3
        LDW       X, #0x12e
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  303 
//  304     /* Current clock master saving */
//  305     clock_master = (CLK_Source_TypeDef)CLK->CMSR;
??CLK_ClockSwitchConfig_3:
        LD        A, L:0x50c3
        LD        S:?b15, A
//  306 
//  307     /* Automatic switch mode management */
//  308     if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
        LD        A, S:?b12
        CP        A, #0x1
        JRNE      L:??CLK_ClockSwitchConfig_4
//  309     {
//  310 
//  311         /* Enables Clock switch */
//  312         CLK->SWCR |= CLK_SWCR_SWEN;
        BSET      L:0x50c5, #0x1
//  313 
//  314         /* Enables or Disables Switch interrupt */
//  315         if (ITState != DISABLE)
        TNZ       S:?b14
        JREQ      L:??CLK_ClockSwitchConfig_5
//  316         {
//  317             CLK->SWCR |= CLK_SWCR_SWIEN;
        BSET      L:0x50c5, #0x2
        JRA       L:??CLK_ClockSwitchConfig_6
//  318         }
//  319         else
//  320         {
//  321             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
??CLK_ClockSwitchConfig_5:
        BRES      L:0x50c5, #0x2
//  322         }
//  323 
//  324         /* Selection of the target clock source */
//  325         CLK->SWR = (uint8_t)CLK_NewClock;
??CLK_ClockSwitchConfig_6:
        LD        A, S:?b11
        LD        L:0x50c4, A
//  326 
//  327         while ((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
??CLK_ClockSwitchConfig_7:
        BTJF      L:0x50c5, #0x0, L:??CLK_ClockSwitchConfig_8
        LDW       X, S:?w4
        TNZW      X
        JREQ      L:??CLK_ClockSwitchConfig_8
//  328         {
//  329             DownCounter--;
        LDW       X, S:?w4
        DECW      X
        LDW       S:?w4, X
        JRA       L:??CLK_ClockSwitchConfig_7
//  330         }
//  331 
//  332         if (DownCounter != 0)
??CLK_ClockSwitchConfig_8:
        LDW       X, S:?w4
        TNZW      X
        JREQ      L:??CLK_ClockSwitchConfig_9
//  333         {
//  334             Swif = SUCCESS;
        LD        A, #0x1
        LD        S:?b10, A
        JRA       L:??CLK_ClockSwitchConfig_10
//  335         }
//  336         else
//  337         {
//  338             Swif = ERROR;
??CLK_ClockSwitchConfig_9:
        CLR       A
        LD        S:?b10, A
        JRA       L:??CLK_ClockSwitchConfig_10
//  339         }
//  340 
//  341     }
//  342     else /* CLK_SwitchMode == CLK_SWITCHMODE_MANUAL */
//  343     {
//  344 
//  345         /* Enables or Disables Switch interrupt  if required  */
//  346         if (ITState != DISABLE)
??CLK_ClockSwitchConfig_4:
        TNZ       S:?b14
        JREQ      L:??CLK_ClockSwitchConfig_11
//  347         {
//  348             CLK->SWCR |= CLK_SWCR_SWIEN;
        BSET      L:0x50c5, #0x2
        JRA       L:??CLK_ClockSwitchConfig_12
//  349         }
//  350         else
//  351         {
//  352             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
??CLK_ClockSwitchConfig_11:
        BRES      L:0x50c5, #0x2
//  353         }
//  354 
//  355         /* Selection of the target clock source */
//  356         CLK->SWR = (uint8_t)CLK_NewClock;
??CLK_ClockSwitchConfig_12:
        LD        A, S:?b11
        LD        L:0x50c4, A
//  357 
//  358         /* In manual mode, there is no risk to be stuck in a loop, value returned
//  359           is then always SUCCESS */
//  360         Swif = SUCCESS;
        LD        A, #0x1
        LD        S:?b10, A
//  361 
//  362     }
//  363 
//  364     /* Switch OFF current clock if required */
//  365     if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
??CLK_ClockSwitchConfig_10:
        TNZ       S:?b13
        JRNE      L:??CLK_ClockSwitchConfig_13
        LD        A, S:?b15
        CP        A, #0xe1
        JRNE      L:??CLK_ClockSwitchConfig_13
//  366     {
//  367         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
        BRES      L:0x50c0, #0x0
        JRA       L:??CLK_ClockSwitchConfig_14
//  368     }
//  369     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
??CLK_ClockSwitchConfig_13:
        TNZ       S:?b13
        JRNE      L:??CLK_ClockSwitchConfig_15
        LD        A, S:?b15
        CP        A, #0xd2
        JRNE      L:??CLK_ClockSwitchConfig_15
//  370     {
//  371         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
        BRES      L:0x50c0, #0x3
        JRA       L:??CLK_ClockSwitchConfig_14
//  372     }
//  373     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
??CLK_ClockSwitchConfig_15:
        TNZ       S:?b13
        JRNE      L:??CLK_ClockSwitchConfig_14
        LD        A, S:?b15
        CP        A, #0xb4
        JRNE      L:??CLK_ClockSwitchConfig_14
//  374     {
//  375         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
        BRES      L:0x50c1, #0x0
//  376     }
//  377 
//  378     return(Swif);
??CLK_ClockSwitchConfig_14:
        LD        A, S:?b10
        JP        L:?epilogue_l2_l3
//  379 
//  380 }
//  381 
//  382 /**
//  383   * @brief  Configures the HSI clock dividers.
//  384   * @param   HSIPrescaler : Specifies the HSI clock divider to apply.
//  385   * This parameter can be any of the @ref CLK_Prescaler_TypeDef enumeration.
//  386   * @retval None
//  387   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  388 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
//  389 {
CLK_HSIPrescalerConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  390 
//  391     /* check the parameters */
//  392     assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
        TNZ       S:?b8
        JREQ      L:??CLK_HSIPrescalerConfig_0
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??CLK_HSIPrescalerConfig_0
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??CLK_HSIPrescalerConfig_0
        LD        A, S:?b8
        CP        A, #0x18
        JREQ      L:??CLK_HSIPrescalerConfig_0
        LDW       X, #0x188
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  393 
//  394     /* Clear High speed internal clock prescaler */
//  395     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
??CLK_HSIPrescalerConfig_0:
        LD        A, L:0x50c6
        AND       A, #0xe7
        LD        L:0x50c6, A
//  396 
//  397     /* Set High speed internal clock prescaler */
//  398     CLK->CKDIVR |= (uint8_t)HSIPrescaler;
        LD        A, S:?b8
        OR        A, L:0x50c6
        LD        L:0x50c6, A
//  399 
//  400 }
        POP       S:?b8
        RET
//  401 
//  402 /**
//  403   * @brief  Output the selected clock on a dedicated I/O pin.
//  404   * @param   CLK_CCO : Specifies the clock source.
//  405   * This parameter can be any of the  @ref CLK_Output_TypeDef enumeration.
//  406   * @retval None
//  407   * @par Required preconditions:
//  408   * The dedicated I/O pin must be set at 1 in the corresponding Px_CR1 register \n
//  409   * to be set as input with pull-up or push-pull output.
//  410   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  411 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
//  412 {
CLK_CCOConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  413 
//  414     /* check the parameters */
//  415     assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
        TNZ       S:?b8
        JREQ      L:??CLK_CCOConfig_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??CLK_CCOConfig_0
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??CLK_CCOConfig_0
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??CLK_CCOConfig_0
        LD        A, S:?b8
        CP        A, #0xa
        JREQ      L:??CLK_CCOConfig_0
        LD        A, S:?b8
        CP        A, #0xc
        JREQ      L:??CLK_CCOConfig_0
        LD        A, S:?b8
        CP        A, #0xe
        JREQ      L:??CLK_CCOConfig_0
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??CLK_CCOConfig_0
        LD        A, S:?b8
        CP        A, #0x12
        JREQ      L:??CLK_CCOConfig_0
        LD        A, S:?b8
        CP        A, #0x14
        JREQ      L:??CLK_CCOConfig_0
        LD        A, S:?b8
        CP        A, #0x16
        JREQ      L:??CLK_CCOConfig_0
        LD        A, S:?b8
        CP        A, #0x18
        JREQ      L:??CLK_CCOConfig_0
        LD        A, S:?b8
        CP        A, #0x1a
        JREQ      L:??CLK_CCOConfig_0
        LDW       X, #0x19f
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  416 
//  417     /* Clears of the CCO type bits part */
//  418     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
??CLK_CCOConfig_0:
        LD        A, L:0x50c9
        AND       A, #0xe1
        LD        L:0x50c9, A
//  419 
//  420     /* Selects the source provided on cco_ck output */
//  421     CLK->CCOR |= (uint8_t)CLK_CCO;
        LD        A, S:?b8
        OR        A, L:0x50c9
        LD        L:0x50c9, A
//  422 
//  423     /* Enable the clock output */
//  424     CLK->CCOR |= CLK_CCOR_CCOEN;
        BSET      L:0x50c9, #0x0
//  425 
//  426 }
        POP       S:?b8
        RET
//  427 
//  428 /**
//  429   * @brief   Enables or disables the specified CLK interrupts.
//  430   * @param   CLK_IT This parameter specifies the interrupt sources.
//  431   * It can be one of the values of @ref CLK_IT_TypeDef.
//  432   * @param   NewState New state of the Interrupt.
//  433   * Value accepted ENABLE, DISABLE.
//  434   * @retval None
//  435   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  436 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
//  437 {
CLK_ITConfig:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
//  438 
//  439     /* check the parameters */
//  440     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b9
        JREQ      L:??CLK_ITConfig_0
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??CLK_ITConfig_0
        LDW       X, #0x1b8
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  441     assert_param(IS_CLK_IT_OK(CLK_IT));
??CLK_ITConfig_0:
        LD        A, S:?b8
        CP        A, #0xc
        JREQ      L:??CLK_ITConfig_1
        LD        A, S:?b8
        CP        A, #0x1c
        JREQ      L:??CLK_ITConfig_1
        LDW       X, #0x1b9
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  442 
//  443     if (NewState != DISABLE)
??CLK_ITConfig_1:
        TNZ       S:?b9
        JREQ      L:??CLK_ITConfig_2
//  444     {
//  445         switch (CLK_IT)
        LD        A, S:?b8
        CP        A, #0xc
        JREQ      L:??CLK_ITConfig_3
        CP        A, #0x1c
        JREQ      L:??CLK_ITConfig_4
        JRA       L:??CLK_ITConfig_5
//  446         {
//  447         case CLK_IT_SWIF: /* Enable the clock switch interrupt */
//  448             CLK->SWCR |= CLK_SWCR_SWIEN;
??CLK_ITConfig_4:
        BSET      L:0x50c5, #0x2
//  449             break;
        JRA       L:??CLK_ITConfig_6
//  450         case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
//  451             CLK->CSSR |= CLK_CSSR_CSSDIE;
??CLK_ITConfig_3:
        BSET      L:0x50c8, #0x2
//  452             break;
        JRA       L:??CLK_ITConfig_6
//  453         default:
//  454             break;
??CLK_ITConfig_5:
        JRA       L:??CLK_ITConfig_6
//  455         }
//  456     }
//  457     else  /*(NewState == DISABLE)*/
//  458     {
//  459         switch (CLK_IT)
??CLK_ITConfig_2:
        LD        A, S:?b8
        CP        A, #0xc
        JREQ      L:??CLK_ITConfig_7
        CP        A, #0x1c
        JREQ      L:??CLK_ITConfig_8
        JRA       L:??CLK_ITConfig_9
//  460         {
//  461         case CLK_IT_SWIF: /* Disable the clock switch interrupt */
//  462             CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
??CLK_ITConfig_8:
        BRES      L:0x50c5, #0x2
//  463             break;
        JRA       L:??CLK_ITConfig_6
//  464         case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
//  465             CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
??CLK_ITConfig_7:
        BRES      L:0x50c8, #0x2
//  466             break;
        JRA       L:??CLK_ITConfig_6
//  467         default:
//  468             break;
//  469         }
//  470     }
//  471 
//  472 }
??CLK_ITConfig_9:
??CLK_ITConfig_6:
        JP        L:?epilogue_w4
//  473 
//  474 /**
//  475   * @brief  Configures the HSI and CPU clock dividers.
//  476   * @param   ClockPrescaler Specifies the HSI or CPU clock divider to apply.
//  477   * @retval None
//  478   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  479 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
//  480 {
CLK_SYSCLKConfig:
        LD        S:?b0, A
//  481 
//  482     /* check the parameters */
//  483  //   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
//  484 
//  485     if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
        LD        A, S:?b0
        AND       A, #0x80
        CP        A, #0x0
        JRNE      L:??CLK_SYSCLKConfig_0
//  486     {
//  487         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
        LD        A, L:0x50c6
        AND       A, #0xe7
        LD        L:0x50c6, A
//  488         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
        LD        A, S:?b0
        AND       A, #0x18
        OR        A, L:0x50c6
        LD        L:0x50c6, A
        JRA       L:??CLK_SYSCLKConfig_1
//  489     }
//  490     else /* Bit7 = 1 means CPU divider */
//  491     {
//  492         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
??CLK_SYSCLKConfig_0:
        LD        A, L:0x50c6
        AND       A, #0xf8
        LD        L:0x50c6, A
//  493         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
        LD        A, S:?b0
        AND       A, #0x7
        OR        A, L:0x50c6
        LD        L:0x50c6, A
//  494     }
//  495 
//  496 }
??CLK_SYSCLKConfig_1:
        RET
//  497 /**
//  498   * @brief  Configures the SWIM clock frequency on the fly.
//  499   * @param   CLK_SWIMDivider Specifies the SWIM clock divider to apply.
//  500   * can be one of the value of @ref CLK_SWIMDivider_TypeDef
//  501   * @retval None
//  502   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  503 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
//  504 {
CLK_SWIMConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  505 
//  506     /* check the parameters */
//  507     assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
        TNZ       S:?b8
        JREQ      L:??CLK_SWIMConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??CLK_SWIMConfig_0
        LDW       X, #0x1fb
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  508 
//  509     if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
??CLK_SWIMConfig_0:
        TNZ       S:?b8
        JREQ      L:??CLK_SWIMConfig_1
//  510     {
//  511         /* SWIM clock is not divided by 2 */
//  512         CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
        BSET      L:0x50cd, #0x0
        JRA       L:??CLK_SWIMConfig_2
//  513     }
//  514     else /* CLK_SWIMDivider == CLK_SWIMDIVIDER_2 */
//  515     {
//  516         /* SWIM clock is divided by 2 */
//  517         CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
??CLK_SWIMConfig_1:
        BRES      L:0x50cd, #0x0
//  518     }
//  519 
//  520 }
??CLK_SWIMConfig_2:
        POP       S:?b8
        RET
//  521 
//  522 /**
//  523   * @brief  Enables the Clock Security System.
//  524   * @par Full description:
//  525   * once CSS is enabled it cannot be disabled until the next reset.
//  526   * @param  None
//  527   * @retval None
//  528   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  529 void CLK_ClockSecuritySystemEnable(void)
//  530 {
//  531     /* Set CSSEN bit */
//  532     CLK->CSSR |= CLK_CSSR_CSSEN;
CLK_ClockSecuritySystemEnable:
        BSET      L:0x50c8, #0x0
//  533 }
        RET
//  534 
//  535 /**
//  536   * @brief  Returns the clock source used as system clock.
//  537   * @param  None
//  538   * @retval  Clock source used.
//  539   * can be one of the values of @ref CLK_Source_TypeDef
//  540   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  541 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
//  542 {
//  543     return((CLK_Source_TypeDef)CLK->CMSR);
CLK_GetSYSCLKSource:
        LD        A, L:0x50c3
        RET
//  544 }
//  545 
//  546 /**
//  547   * @brief  This function returns the frequencies of different on chip clocks.
//  548   * @param  None
//  549   * @retval the master clock frequency
//  550   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  551 uint32_t CLK_GetClockFreq(void)
//  552 {
CLK_GetClockFreq:
        CALL      L:?push_l3
        CALL      L:?push_w4
        PUSH      S:?b10
//  553 
//  554     uint32_t clockfrequency = 0;
        CLRW      X
        LDW       S:?w7, X
        LDW       S:?w6, X
//  555     CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
        MOV       S:?b10, #0xe1
//  556     uint8_t tmp = 0, presc = 0;
        CLR       S:?b9
        CLR       S:?b8
//  557 
//  558     /* Get CLK source. */
//  559     clocksource = (CLK_Source_TypeDef)CLK->CMSR;
        LD        A, L:0x50c3
        LD        S:?b10, A
//  560 
//  561     if (clocksource == CLK_SOURCE_HSI)
        LD        A, S:?b10
        CP        A, #0xe1
        JRNE      L:??CLK_GetClockFreq_0
//  562     {
//  563         tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
        LD        A, L:0x50c6
        AND       A, #0x18
        LD        S:?b9, A
//  564         tmp = (uint8_t)(tmp >> 3);
        LD        A, S:?b9
        SRL       A
        SRL       A
        SRL       A
        LD        S:?b9, A
//  565         presc = HSIDivFactor[tmp];
        CLRW      X
        EXG       A, XL
        LD        A, S:?b9
        EXG       A, XL
        LD        A, (L:HSIDivFactor,X)
        LD        S:?b8, A
//  566         clockfrequency = HSI_VALUE / presc;
        CLRW      X
        EXG       A, XL
        LD        A, S:?b8
        EXG       A, XL
        LDW       S:?w3, X
        CLRW      X
        LDW       S:?w2, X
        CALL      L:?udiv32_l0_dl_l1
        DATA
        DC32      0xf42400
        CODE
        CALL      L:?mov_l3_l0
        JRA       L:??CLK_GetClockFreq_1
//  567     }
//  568     else if ( clocksource == CLK_SOURCE_LSI)
??CLK_GetClockFreq_0:
        LD        A, S:?b10
        CP        A, #0xd2
        JRNE      L:??CLK_GetClockFreq_2
//  569     {
//  570         clockfrequency = LSI_VALUE;
        LDW       X, #0xf400
        LDW       S:?w1, X
        CLRW      X
        INCW      X
        LDW       S:?w0, X
        CALL      L:?mov_l3_l0
        JRA       L:??CLK_GetClockFreq_1
//  571     }
//  572     else
//  573     {
//  574         clockfrequency = HSE_VALUE;
??CLK_GetClockFreq_2:
        LDW       X, #0x2400
        LDW       S:?w1, X
        LDW       X, #0xf4
        LDW       S:?w0, X
        CALL      L:?mov_l3_l0
//  575     }
//  576 
//  577     return((uint32_t)clockfrequency);
??CLK_GetClockFreq_1:
        CALL      L:?mov_l0_l3
        POP       S:?b10
        CALL      L:?pop_w4
        CALL      L:?pop_l3
        RET
//  578 
//  579 }
//  580 
//  581 /**
//  582   * @brief  Adjusts the Internal High Speed oscillator (HSI) calibration value.
//  583   * @par Full description:
//  584   * @param   CLK_HSICalibrationValue calibration trimming value.
//  585   * can be one of the values of @ref CLK_HSITrimValue_TypeDef
//  586   * @retval None
//  587   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  588 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
//  589 {
CLK_AdjustHSICalibrationValue:
        PUSH      S:?b8
        LD        S:?b8, A
//  590 
//  591     /* check the parameters */
//  592     assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
        TNZ       S:?b8
        JREQ      L:??CLK_AdjustHSICalibrationValue_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??CLK_AdjustHSICalibrationValue_0
        LD        A, S:?b8
        CP        A, #0x2
        JREQ      L:??CLK_AdjustHSICalibrationValue_0
        LD        A, S:?b8
        CP        A, #0x3
        JREQ      L:??CLK_AdjustHSICalibrationValue_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??CLK_AdjustHSICalibrationValue_0
        LD        A, S:?b8
        CP        A, #0x5
        JREQ      L:??CLK_AdjustHSICalibrationValue_0
        LD        A, S:?b8
        CP        A, #0x6
        JREQ      L:??CLK_AdjustHSICalibrationValue_0
        LD        A, S:?b8
        CP        A, #0x7
        JREQ      L:??CLK_AdjustHSICalibrationValue_0
        LDW       X, #0x250
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  593 
//  594     /* Store the new value */
//  595     CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
??CLK_AdjustHSICalibrationValue_0:
        LD        A, L:0x50cc
        AND       A, #0xf8
        OR        A, S:?b8
        LD        L:0x50cc, A
//  596 
//  597 }
        POP       S:?b8
        RET
//  598 
//  599 /**
//  600   * @brief  Reset the SWBSY flag (SWICR Reister)
//  601   * @par Full description:
//  602   * This function reset SWBSY flag in order to reset clock switch operations (target
//  603   * oscillator is broken, stabilization is longing too much, etc.).  If at the same time \n
//  604   * software attempts to set SWEN and clear SWBSY, SWBSY action takes precedence.
//  605   * @param  None
//  606   * @retval None
//  607   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  608 void CLK_SYSCLKEmergencyClear(void)
//  609 {
//  610     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
CLK_SYSCLKEmergencyClear:
        BRES      L:0x50c5, #0x0
//  611 }
        RET
//  612 
//  613 /**
//  614   * @brief  Checks whether the specified CLK flag is set or not.
//  615   * @par Full description:
//  616   * @param   CLK_FLAG Flag to check.
//  617   * can be one of the values of @ref CLK_Flag_TypeDef
//  618   * @retval FlagStatus, status of the checked flag
//  619   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  620 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
//  621 {
CLK_GetFlagStatus:
        CALL      L:?push_l2
        CALL      L:?push_w6
        LDW       S:?w4, X
//  622 
//  623     uint16_t statusreg = 0;
        CLR       S:?b11
        CLR       S:?b10
//  624     uint8_t tmpreg = 0;
        CLR       S:?b12
//  625     FlagStatus bitstatus = RESET;
        CLR       S:?b13
//  626 
//  627     /* check the parameters */
//  628     assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
        LDW       X, S:?w4
        CPW       X, #0x110
        JREQ      L:??CLK_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x102
        JREQ      L:??CLK_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x202
        JREQ      L:??CLK_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x308
        JREQ      L:??CLK_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x301
        JREQ      L:??CLK_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x408
        JREQ      L:??CLK_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x402
        JREQ      L:??CLK_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x504
        JREQ      L:??CLK_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x502
        JREQ      L:??CLK_GetFlagStatus_0
        LDW       X, #0x274
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  629 
//  630     /* Get the CLK register index */
//  631     statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
??CLK_GetFlagStatus_0:
        LDW       X, S:?w4
        RLWA      X, A
        AND       A, #0xff
        RLWA      X, A
        AND       A, #0x0
        RLWA      X, A
        LDW       S:?w5, X
//  632 
//  633 
//  634     if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
        LDW       X, S:?w5
        CPW       X, #0x100
        JRNE      L:??CLK_GetFlagStatus_1
//  635     {
//  636         tmpreg = CLK->ICKR;
        LD        A, L:0x50c0
        LD        S:?b12, A
        JRA       L:??CLK_GetFlagStatus_2
//  637     }
//  638     else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
??CLK_GetFlagStatus_1:
        LDW       X, S:?w5
        CPW       X, #0x200
        JRNE      L:??CLK_GetFlagStatus_3
//  639     {
//  640         tmpreg = CLK->ECKR;
        LD        A, L:0x50c1
        LD        S:?b12, A
        JRA       L:??CLK_GetFlagStatus_2
//  641     }
//  642     else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
??CLK_GetFlagStatus_3:
        LDW       X, S:?w5
        CPW       X, #0x300
        JRNE      L:??CLK_GetFlagStatus_4
//  643     {
//  644         tmpreg = CLK->SWCR;
        LD        A, L:0x50c5
        LD        S:?b12, A
        JRA       L:??CLK_GetFlagStatus_2
//  645     }
//  646     else if (statusreg == 0x0400) /* The flag to check is in CSS register */
??CLK_GetFlagStatus_4:
        LDW       X, S:?w5
        CPW       X, #0x400
        JRNE      L:??CLK_GetFlagStatus_5
//  647     {
//  648         tmpreg = CLK->CSSR;
        LD        A, L:0x50c8
        LD        S:?b12, A
        JRA       L:??CLK_GetFlagStatus_2
//  649     }
//  650     else /* The flag to check is in CCO register */
//  651     {
//  652         tmpreg = CLK->CCOR;
??CLK_GetFlagStatus_5:
        LD        A, L:0x50c9
        LD        S:?b12, A
//  653     }
//  654 
//  655     if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
??CLK_GetFlagStatus_2:
        LD        A, S:?b9
        AND       A, S:?b12
        CP        A, #0x0
        JREQ      L:??CLK_GetFlagStatus_6
//  656     {
//  657         bitstatus = SET;
        LD        A, #0x1
        LD        S:?b13, A
        JRA       L:??CLK_GetFlagStatus_7
//  658     }
//  659     else
//  660     {
//  661         bitstatus = RESET;
??CLK_GetFlagStatus_6:
        CLR       A
        LD        S:?b13, A
//  662     }
//  663 
//  664     /* Return the flag status */
//  665     return((FlagStatus)bitstatus);
??CLK_GetFlagStatus_7:
        LD        A, S:?b13
        JP        L:?epilogue_l2_w6
//  666 
//  667 }
//  668 
//  669 /**
//  670   * @brief  Checks whether the specified CLK interrupt has is enabled or not.
//  671   * @param   CLK_IT specifies the CLK interrupt.
//  672   * can be one of the values of @ref CLK_IT_TypeDef
//  673   * @retval ITStatus, new state of CLK_IT (SET or RESET).
//  674   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  675 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
//  676 {
CLK_GetITStatus:
        CALL      L:?push_w4
        LD        S:?b9, A
//  677 
//  678     ITStatus bitstatus = RESET;
        CLR       S:?b8
//  679 
//  680     /* check the parameters */
//  681     assert_param(IS_CLK_IT_OK(CLK_IT));
        LD        A, S:?b9
        CP        A, #0xc
        JREQ      L:??CLK_GetITStatus_0
        LD        A, S:?b9
        CP        A, #0x1c
        JREQ      L:??CLK_GetITStatus_0
        LDW       X, #0x2a9
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  682 
//  683     if (CLK_IT == CLK_IT_SWIF)
??CLK_GetITStatus_0:
        LD        A, S:?b9
        CP        A, #0x1c
        JRNE      L:??CLK_GetITStatus_1
//  684     {
//  685         /* Check the status of the clock switch interrupt */
//  686         if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
        LD        A, S:?b9
        AND       A, L:0x50c5
        CP        A, #0xc
        JRNE      L:??CLK_GetITStatus_2
//  687         {
//  688             bitstatus = SET;
        LD        A, #0x1
        LD        S:?b8, A
        JRA       L:??CLK_GetITStatus_3
//  689         }
//  690         else
//  691         {
//  692             bitstatus = RESET;
??CLK_GetITStatus_2:
        CLR       A
        LD        S:?b8, A
        JRA       L:??CLK_GetITStatus_3
//  693         }
//  694     }
//  695     else /* CLK_IT == CLK_IT_CSSDIE */
//  696     {
//  697         /* Check the status of the security system detection interrupt */
//  698         if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
??CLK_GetITStatus_1:
        LD        A, S:?b9
        AND       A, L:0x50c8
        CP        A, #0xc
        JRNE      L:??CLK_GetITStatus_4
//  699         {
//  700             bitstatus = SET;
        LD        A, #0x1
        LD        S:?b8, A
        JRA       L:??CLK_GetITStatus_3
//  701         }
//  702         else
//  703         {
//  704             bitstatus = RESET;
??CLK_GetITStatus_4:
        CLR       A
        LD        S:?b8, A
//  705         }
//  706     }
//  707 
//  708     /* Return the CLK_IT status */
//  709     return bitstatus;
??CLK_GetITStatus_3:
        LD        A, S:?b8
        JP        L:?epilogue_w4
//  710 
//  711 }
//  712 
//  713 /**
//  714   * @brief  Clears the CLK抯 interrupt pending bits.
//  715   * @param   CLK_IT specifies the interrupt pending bits.
//  716   * can be one of the values of @ref CLK_IT_TypeDef
//  717   * @retval None
//  718   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  719 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
//  720 {
CLK_ClearITPendingBit:
        PUSH      S:?b8
        LD        S:?b8, A
//  721 
//  722     /* check the parameters */
//  723     assert_param(IS_CLK_IT_OK(CLK_IT));
        LD        A, S:?b8
        CP        A, #0xc
        JREQ      L:??CLK_ClearITPendingBit_0
        LD        A, S:?b8
        CP        A, #0x1c
        JREQ      L:??CLK_ClearITPendingBit_0
        LDW       X, #0x2d3
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  724 
//  725     if (CLK_IT == (uint8_t)CLK_IT_CSSD)
??CLK_ClearITPendingBit_0:
        LD        A, S:?b8
        CP        A, #0xc
        JRNE      L:??CLK_ClearITPendingBit_1
//  726     {
//  727         /* Clear the status of the security system detection interrupt */
//  728         CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
        BRES      L:0x50c8, #0x3
        JRA       L:??CLK_ClearITPendingBit_2
//  729     }
//  730     else /* CLK_PendingBit == (uint8_t)CLK_IT_SWIF */
//  731     {
//  732         /* Clear the status of the clock switch interrupt */
//  733         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
??CLK_ClearITPendingBit_1:
        BRES      L:0x50c5, #0x3
//  734     }
//  735 
//  736 }
??CLK_ClearITPendingBit_2:
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
        DC8 5FH, 63H, 6CH, 6BH, 2EH, 63H, 0

        END
//  737 /**
//  738   * @}
//  739   */
//  740   
//  741 /**
//  742   * @}
//  743   */
//  744   
//  745 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
//   107 bytes in section .near.rodata
// 1 587 bytes in section .near_func.text
// 
// 1 587 bytes of CODE  memory
//   107 bytes of CONST memory
//
//Errors: none
//Warnings: none
