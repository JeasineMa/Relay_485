///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V2.10.4.157 for STM8                19/Sep/2015  09:42:59
// Copyright 2010-2015 IAR Systems AB.
//
//    Source file  =  
//        D:\Data form
//        C\SRT\PWM调光项目\STM8继电器工程\Libraries\STM8S_StdPeriph_Driver\src\stm8s_itc.c
//    Command line =  
//        "D:\Data form
//        C\SRT\PWM调光项目\STM8继电器工程\Libraries\STM8S_StdPeriph_Driver\src\stm8s_itc.c"
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
//        D:\Data form C\SRT\PWM调光项目\STM8继电器工程\Debug\List\stm8s_itc.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_l2
        EXTERN ?epilogue_w4
        EXTERN ?push_l2
        EXTERN ?push_w4
        EXTERN ?sll16_x_x_a
        EXTERN ?srl8_a_a_b0
        EXTERN ?w0
        EXTERN ?w1
        EXTERN assert_failed

        PUBLIC ITC_DeInit
        PUBLIC ITC_GetCPUCC
        PUBLIC ITC_GetSoftIntStatus
        PUBLIC ITC_GetSoftwarePriority
        PUBLIC ITC_SetSoftwarePriority

// D:\Data form C\SRT\PWM调光项目\STM8继电器工程\Libraries\STM8S_StdPeriph_Driver\src\stm8s_itc.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_itc.c
//    4   * @author  MCD Application Team
//    5   * @version V2.1.0
//    6   * @date    18-November-2011
//    7   * @brief   This file contains all the functions for the ITC peripheral.
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
//   23 #include "stm8s_itc.h"
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
//   35 /** @addtogroup ITC_Private_Functions
//   36   * @{
//   37   */
//   38 
//   39 /**
//   40   * @brief  Utility function used to read CC register.
//   41   * @param  None
//   42   * @retval CPU CC register value
//   43   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   44 uint8_t ITC_GetCPUCC(void)
//   45 {
//   46 #ifdef _COSMIC_
//   47   _asm("push cc");
//   48   _asm("pop a");
//   49   return; /* Ignore compiler warning, the returned value is in A register */
//   50 #elif defined _RAISONANCE_ /* _RAISONANCE_ */
//   51   return _getCC_();
//   52 #else /* _IAR_ */
//   53   asm("push cc");
ITC_GetCPUCC:
        push cc
//   54   asm("pop a"); /* Ignore compiler warning, the returned value is in A register */
        pop a
//   55 #endif /* _COSMIC_*/
//   56 }
        RET
//   57 
//   58 
//   59 /**
//   60   * @}
//   61   */
//   62 
//   63 /* Public functions ----------------------------------------------------------*/
//   64 
//   65 /** @addtogroup ITC_Public_Functions
//   66   * @{
//   67   */
//   68 
//   69 /**
//   70   * @brief  Deinitializes the ITC registers to their default reset value.
//   71   * @param  None
//   72   * @retval None
//   73   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   74 void ITC_DeInit(void)
//   75 {
//   76     ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
ITC_DeInit:
        MOV       L:0x7f70, #0xff
//   77     ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
        MOV       L:0x7f71, #0xff
//   78     ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
        MOV       L:0x7f72, #0xff
//   79     ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
        MOV       L:0x7f73, #0xff
//   80     ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
        MOV       L:0x7f74, #0xff
//   81     ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
        MOV       L:0x7f75, #0xff
//   82     ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
        MOV       L:0x7f76, #0xff
//   83     ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
        MOV       L:0x7f77, #0xff
//   84 }
        RET
//   85 
//   86 /**
//   87   * @brief  Gets the interrupt software priority bits (I1, I0) value from CPU CC register.
//   88   * @param  None
//   89   * @retval The interrupt software priority bits value.
//   90   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   91 uint8_t ITC_GetSoftIntStatus(void)
//   92 {
//   93     return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
ITC_GetSoftIntStatus:
        CALL      L:ITC_GetCPUCC
        AND       A, #0x28
        RET
//   94 }
//   95 
//   96 /**
//   97   * @brief  Gets the software priority of the specified interrupt source.
//   98   * @param  IrqNum : Specifies the peripheral interrupt source.
//   99   * @retval ITC_PriorityLevel_TypeDef : Specifies the software priority of the interrupt source.
//  100   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  101 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
//  102 {
ITC_GetSoftwarePriority:
        CALL      L:?push_w4
        PUSH      S:?b10
        LD        S:?b8, A
//  103 
//  104     uint8_t Value = 0;
        CLR       S:?b9
//  105     uint8_t Mask = 0;
        CLR       S:?b10
//  106 
//  107     /* Check function parameters */
//  108     assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
        LD        A, S:?b8
        CP        A, #0x19
        JRC       L:??ITC_GetSoftwarePriority_0
        LDW       X, #0x6c
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  109 
//  110     /* Define the mask corresponding to the bits position in the SPR register */
//  111     Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
??ITC_GetSoftwarePriority_0:
        LD        A, #0x4
        CLRW      X
        RRWA      X, A
        LD        A, S:?b8
        RLWA      X, A
        DIV       X, A
        MOV       S:?b0, #0x2
        LD        XL, A
        LD        A, S:?b0
        MUL       X, A
        LD        A, XL
        LDW       X, #0x3
        CALL      L:?sll16_x_x_a
        LD        A, XL
        LD        S:?b10, A
//  112 
//  113     switch (IrqNum)
        LD        A, S:?b8
        TNZ       A
        JREQ      L:??ITC_GetSoftwarePriority_1
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_1
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_1
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_1
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_2
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_2
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_2
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_2
        SUB       A, #0x3
        JREQ      L:??ITC_GetSoftwarePriority_3
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_3
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_4
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_4
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_4
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_4
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_5
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_5
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_5
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_5
        SUB       A, #0x4
        JREQ      L:??ITC_GetSoftwarePriority_6
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_7
        JRA       L:??ITC_GetSoftwarePriority_8
//  114     {
//  115     case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
//  116     case ITC_IRQ_AWU:
//  117     case ITC_IRQ_CLK:
//  118     case ITC_IRQ_PORTA:
//  119         Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_1:
        LD        A, S:?b10
        AND       A, L:0x7f70
        LD        S:?b9, A
//  120         break;
        JRA       L:??ITC_GetSoftwarePriority_9
//  121     case ITC_IRQ_PORTB:
//  122     case ITC_IRQ_PORTC:
//  123     case ITC_IRQ_PORTD:
//  124     case ITC_IRQ_PORTE:
//  125         Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_2:
        LD        A, S:?b10
        AND       A, L:0x7f71
        LD        S:?b9, A
//  126         break;
        JRA       L:??ITC_GetSoftwarePriority_9
//  127 #if defined(STM8S208) || defined(STM8AF52Ax)
//  128     case ITC_IRQ_CAN_RX:
//  129     case ITC_IRQ_CAN_TX:
//  130 #endif /*STM8S208 or STM8AF52Ax */
//  131 
//  132 #ifdef STM8S903
//  133     case ITC_IRQ_PORTF:
//  134 #endif /*STM8S903*/
//  135 
//  136     case ITC_IRQ_SPI:
//  137     case ITC_IRQ_TIM1_OVF:
//  138         Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_3:
        LD        A, S:?b10
        AND       A, L:0x7f72
        LD        S:?b9, A
//  139         break;
        JRA       L:??ITC_GetSoftwarePriority_9
//  140     case ITC_IRQ_TIM1_CAPCOM:
//  141 #ifdef STM8S903
//  142     case ITC_IRQ_TIM5_OVFTRI:
//  143     case ITC_IRQ_TIM5_CAPCOM:
//  144 #else
//  145     case ITC_IRQ_TIM2_OVF:
//  146     case ITC_IRQ_TIM2_CAPCOM:
//  147 #endif /*STM8S903*/
//  148 
//  149     case ITC_IRQ_TIM3_OVF:
//  150         Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_4:
        LD        A, S:?b10
        AND       A, L:0x7f73
        LD        S:?b9, A
//  151         break;
        JRA       L:??ITC_GetSoftwarePriority_9
//  152     case ITC_IRQ_TIM3_CAPCOM:
//  153     case ITC_IRQ_UART1_TX:
//  154     case ITC_IRQ_UART1_RX:
//  155     case ITC_IRQ_I2C:
//  156         Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_5:
        LD        A, S:?b10
        AND       A, L:0x7f74
        LD        S:?b9, A
//  157         break;
        JRA       L:??ITC_GetSoftwarePriority_9
//  158 #if defined(STM8S105) || defined(STM8S005) || defined(STM8AF626x)
//  159     case ITC_IRQ_UART2_TX:
//  160     case ITC_IRQ_UART2_RX:
//  161 #endif /*STM8S105 or STM8AF626x*/
//  162 
//  163 #if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8AF52Ax) || \ 
//  164     defined(STM8AF62Ax)
//  165     case ITC_IRQ_UART3_TX:
//  166     case ITC_IRQ_UART3_RX:
//  167     case ITC_IRQ_ADC2:
//  168 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
//  169 
//  170 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \ 
//  171     defined(STM8S903) || defined(STM8AF626x)
//  172 //    case ITC_IRQ_ADC1:
//  173 #endif /*STM8S105, STM8S103 or STM8S905 or STM8AF626x */
//  174 
//  175 #ifdef STM8S903
//  176     case ITC_IRQ_TIM6_OVFTRI:
//  177 #else
//  178     case ITC_IRQ_TIM4_OVF:
//  179 #endif /*STM8S903*/
//  180         Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_6:
        LD        A, S:?b10
        AND       A, L:0x7f75
        LD        S:?b9, A
//  181         break;
        JRA       L:??ITC_GetSoftwarePriority_9
//  182     case ITC_IRQ_EEPROM_EEC:
//  183         Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
??ITC_GetSoftwarePriority_7:
        LD        A, S:?b10
        AND       A, L:0x7f76
        LD        S:?b9, A
//  184         break;
        JRA       L:??ITC_GetSoftwarePriority_9
//  185     default:
//  186         break;
//  187     }
//  188 
//  189     Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
??ITC_GetSoftwarePriority_8:
??ITC_GetSoftwarePriority_9:
        LD        A, #0x4
        CLRW      X
        RRWA      X, A
        LD        A, S:?b8
        RLWA      X, A
        DIV       X, A
        MOV       S:?b0, #0x2
        LD        XL, A
        LD        A, S:?b0
        MUL       X, A
        EXG       A, XL
        LD        S:?b0, A
        EXG       A, XL
        LD        A, S:?b9
        CALL      L:?srl8_a_a_b0
        LD        S:?b9, A
//  190 
//  191     return((ITC_PriorityLevel_TypeDef)Value);
        LD        A, S:?b9
        POP       S:?b10
        JP        L:?epilogue_w4
//  192 
//  193 }
//  194 
//  195 /**
//  196   * @brief  Sets the software priority of the specified interrupt source.
//  197   * @note   - The modification of the software priority is only possible when
//  198   *         the interrupts are disabled.
//  199   *         - The normal behavior is to disable the interrupt before calling
//  200   *         this function, and re-enable it after.
//  201   *         - The priority level 0 cannot be set (see product specification
//  202   *         for more details).
//  203   * @param  IrqNum : Specifies the peripheral interrupt source.
//  204   * @param  PriorityValue : Specifies the software priority value to set,
//  205   *         can be a value of @ref  ITC_PriorityLevel_TypeDef .
//  206   * @retval None
//  207 */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  208 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
//  209 {
ITC_SetSoftwarePriority:
        CALL      L:?push_l2
        LD        S:?b8, A
        MOV       S:?b11, S:?b0
//  210 
//  211     uint8_t Mask = 0;
        CLR       S:?b9
//  212     uint8_t NewPriority = 0;
        CLR       S:?b10
//  213 
//  214     /* Check function parameters */
//  215     assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
        LD        A, S:?b8
        CP        A, #0x19
        JRC       L:??ITC_SetSoftwarePriority_0
        LDW       X, #0xd7
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  216     assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
??ITC_SetSoftwarePriority_0:
        LD        A, S:?b11
        CP        A, #0x2
        JREQ      L:??ITC_SetSoftwarePriority_1
        LD        A, S:?b11
        CP        A, #0x1
        JREQ      L:??ITC_SetSoftwarePriority_1
        TNZ       S:?b11
        JREQ      L:??ITC_SetSoftwarePriority_1
        LD        A, S:?b11
        CP        A, #0x3
        JREQ      L:??ITC_SetSoftwarePriority_1
        LDW       X, #0xd8
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  217 
//  218     /* Check if interrupts are disabled */
//  219     assert_param(IS_ITC_INTERRUPTS_DISABLED);
??ITC_SetSoftwarePriority_1:
        CALL      L:ITC_GetSoftIntStatus
        CP        A, #0x28
        JREQ      L:??ITC_SetSoftwarePriority_2
        LDW       X, #0xdb
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  220 
//  221     /* Define the mask corresponding to the bits position in the SPR register */
//  222     /* The mask is reversed in order to clear the 2 bits after more easily */
//  223     Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
??ITC_SetSoftwarePriority_2:
        LD        A, #0x4
        CLRW      X
        RRWA      X, A
        LD        A, S:?b8
        RLWA      X, A
        DIV       X, A
        MOV       S:?b0, #0x2
        LD        XL, A
        LD        A, S:?b0
        MUL       X, A
        LD        A, XL
        LDW       X, #0x3
        CALL      L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        LD        S:?b9, A
//  224 
//  225     /* Define the new priority to write */
//  226     NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
        LD        A, #0x4
        CLRW      X
        RRWA      X, A
        LD        A, S:?b8
        RLWA      X, A
        DIV       X, A
        MOV       S:?b0, #0x2
        LD        XL, A
        LD        A, S:?b0
        MUL       X, A
        LD        A, XL
        CLRW      X
        EXG       A, XL
        LD        A, S:?b11
        EXG       A, XL
        CALL      L:?sll16_x_x_a
        LD        A, XL
        LD        S:?b10, A
//  227 
//  228     switch (IrqNum)
        LD        A, S:?b8
        TNZ       A
        JREQ      L:??ITC_SetSoftwarePriority_3
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_3
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_3
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_3
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_4
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_4
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_4
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_4
        SUB       A, #0x3
        JREQ      L:??ITC_SetSoftwarePriority_5
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_5
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_6
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_6
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_6
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_6
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_7
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_7
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_7
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_7
        SUB       A, #0x4
        JREQ      L:??ITC_SetSoftwarePriority_8
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_9
        JRA       L:??ITC_SetSoftwarePriority_10
//  229     {
//  230 
//  231     case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
//  232     case ITC_IRQ_AWU:
//  233     case ITC_IRQ_CLK:
//  234     case ITC_IRQ_PORTA:
//  235         ITC->ISPR1 &= Mask;
??ITC_SetSoftwarePriority_3:
        LD        A, S:?b9
        AND       A, L:0x7f70
        LD        L:0x7f70, A
//  236         ITC->ISPR1 |= NewPriority;
        LD        A, S:?b10
        OR        A, L:0x7f70
        LD        L:0x7f70, A
//  237         break;
        JRA       L:??ITC_SetSoftwarePriority_11
//  238 
//  239     case ITC_IRQ_PORTB:
//  240     case ITC_IRQ_PORTC:
//  241     case ITC_IRQ_PORTD:
//  242     case ITC_IRQ_PORTE:
//  243         ITC->ISPR2 &= Mask;
??ITC_SetSoftwarePriority_4:
        LD        A, S:?b9
        AND       A, L:0x7f71
        LD        L:0x7f71, A
//  244         ITC->ISPR2 |= NewPriority;
        LD        A, S:?b10
        OR        A, L:0x7f71
        LD        L:0x7f71, A
//  245         break;
        JRA       L:??ITC_SetSoftwarePriority_11
//  246 
//  247 #if defined(STM8S208) || defined(STM8AF52Ax)
//  248     case ITC_IRQ_CAN_RX:
//  249     case ITC_IRQ_CAN_TX:
//  250 #endif /*STM8S208 or STM8AF52Ax */
//  251 
//  252 #ifdef STM8S903
//  253     case ITC_IRQ_PORTF:
//  254 #endif /*STM8S903*/
//  255     case ITC_IRQ_SPI:
//  256     case ITC_IRQ_TIM1_OVF:
//  257         ITC->ISPR3 &= Mask;
??ITC_SetSoftwarePriority_5:
        LD        A, S:?b9
        AND       A, L:0x7f72
        LD        L:0x7f72, A
//  258         ITC->ISPR3 |= NewPriority;
        LD        A, S:?b10
        OR        A, L:0x7f72
        LD        L:0x7f72, A
//  259         break;
        JRA       L:??ITC_SetSoftwarePriority_11
//  260 
//  261     case ITC_IRQ_TIM1_CAPCOM:
//  262 #ifdef STM8S903
//  263     case ITC_IRQ_TIM5_OVFTRI:
//  264     case ITC_IRQ_TIM5_CAPCOM:
//  265 #else
//  266     case ITC_IRQ_TIM2_OVF:
//  267     case ITC_IRQ_TIM2_CAPCOM:
//  268 #endif /*STM8S903*/
//  269 
//  270     case ITC_IRQ_TIM3_OVF:
//  271         ITC->ISPR4 &= Mask;
??ITC_SetSoftwarePriority_6:
        LD        A, S:?b9
        AND       A, L:0x7f73
        LD        L:0x7f73, A
//  272         ITC->ISPR4 |= NewPriority;
        LD        A, S:?b10
        OR        A, L:0x7f73
        LD        L:0x7f73, A
//  273         break;
        JRA       L:??ITC_SetSoftwarePriority_11
//  274 
//  275     case ITC_IRQ_TIM3_CAPCOM:
//  276     case ITC_IRQ_UART1_TX:
//  277     case ITC_IRQ_UART1_RX:
//  278     case ITC_IRQ_I2C:
//  279         ITC->ISPR5 &= Mask;
??ITC_SetSoftwarePriority_7:
        LD        A, S:?b9
        AND       A, L:0x7f74
        LD        L:0x7f74, A
//  280         ITC->ISPR5 |= NewPriority;
        LD        A, S:?b10
        OR        A, L:0x7f74
        LD        L:0x7f74, A
//  281         break;
        JRA       L:??ITC_SetSoftwarePriority_11
//  282 
//  283 #if defined(STM8S105) || defined(STM8S005) || defined(STM8AF626x)
//  284     case ITC_IRQ_UART2_TX:
//  285     case ITC_IRQ_UART2_RX:
//  286 #endif /*STM8S105 or STM8AF626x */
//  287 
//  288 #if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8AF52Ax) || \ 
//  289     defined(STM8AF62Ax)
//  290     case ITC_IRQ_UART3_TX:
//  291     case ITC_IRQ_UART3_RX:
//  292     case ITC_IRQ_ADC2:
//  293 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
//  294 
//  295 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \ 
//  296     defined(STM8S903) || defined(STM8AF626x)
//  297  //   case ITC_IRQ_ADC1:
//  298 #endif /*STM8S105, STM8S103 or STM8S905 or STM8AF626x */
//  299 
//  300 #ifdef STM8S903
//  301     case ITC_IRQ_TIM6_OVFTRI:
//  302 #else
//  303     case ITC_IRQ_TIM4_OVF:
//  304 #endif /*STM8S903*/
//  305         ITC->ISPR6 &= Mask;
??ITC_SetSoftwarePriority_8:
        LD        A, S:?b9
        AND       A, L:0x7f75
        LD        L:0x7f75, A
//  306         ITC->ISPR6 |= NewPriority;
        LD        A, S:?b10
        OR        A, L:0x7f75
        LD        L:0x7f75, A
//  307         break;
        JRA       L:??ITC_SetSoftwarePriority_11
//  308 
//  309     case ITC_IRQ_EEPROM_EEC:
//  310         ITC->ISPR7 &= Mask;
??ITC_SetSoftwarePriority_9:
        LD        A, S:?b9
        AND       A, L:0x7f76
        LD        L:0x7f76, A
//  311         ITC->ISPR7 |= NewPriority;
        LD        A, S:?b10
        OR        A, L:0x7f76
        LD        L:0x7f76, A
//  312         break;
        JRA       L:??ITC_SetSoftwarePriority_11
//  313 
//  314     default:
//  315         break;
//  316 
//  317     }
//  318 
//  319 }
??ITC_SetSoftwarePriority_10:
??ITC_SetSoftwarePriority_11:
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
        DC8 5FH, 69H, 74H, 63H, 2EH, 63H, 0

        END
//  320 
//  321 /**
//  322   * @}
//  323   */
//  324   
//  325 /**
//  326   * @}
//  327   */
//  328   
//  329 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
//  95 bytes in section .near.rodata
// 603 bytes in section .near_func.text
// 
// 603 bytes of CODE  memory
//  95 bytes of CONST memory
//
//Errors: none
//Warnings: 1
