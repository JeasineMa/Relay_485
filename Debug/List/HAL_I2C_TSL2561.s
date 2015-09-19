///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V2.10.4.157 for STM8                19/Sep/2015  09:42:58
// Copyright 2010-2015 IAR Systems AB.
//
//    Source file  =  
//        D:\Data form C\SRT\PWM调光项目\STM8继电器工程\HAL\HAL_I2C_TSL2561.c
//    Command line =  
//        "D:\Data form C\SRT\PWM调光项目\STM8继电器工程\HAL\HAL_I2C_TSL2561.c"
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
//        D:\Data form
//        C\SRT\PWM调光项目\STM8继电器工程\Debug\List\HAL_I2C_TSL2561.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?add32_l0_l0_dl
        EXTERN ?b0
        EXTERN ?b10
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?dec32_l0_l0
        EXTERN ?dec32_l2_l2
        EXTERN ?epilogue_l2
        EXTERN ?epilogue_l2_l3
        EXTERN ?epilogue_l2_w6
        EXTERN ?epilogue_w4
        EXTERN ?inc32_l0_l0
        EXTERN ?load32_dbsp_l0
        EXTERN ?load32_l0_dbsp
        EXTERN ?load32_l1_dbsp
        EXTERN ?mov_l0_l3
        EXTERN ?mov_l1_l3
        EXTERN ?mov_l2_l0
        EXTERN ?mov_l3_l0
        EXTERN ?mul16_x_x_w0
        EXTERN ?mul32_l0_l0_l1
        EXTERN ?pop_l1
        EXTERN ?push_l0
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?push_w4
        EXTERN ?push_w6
        EXTERN ?sll32_l0_l0_db
        EXTERN ?srl32_l0_l0_db
        EXTERN ?sub32_l0_l0_l1
        EXTERN ?udiv32_l0_l0_l1
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3
        EXTERN ?w4
        EXTERN ?w5
        EXTERN ?w6
        EXTERN GPIO_Init
        EXTERN GPIO_ReadInputPin
        EXTERN GPIO_WriteHigh
        EXTERN GPIO_WriteLow

        PUBLIC InitTSL2561
        PUBLIC PinDirConfig
        PUBLIC Read_Light
        PUBLIC TLS2561_I2C_Delay
        PUBLIC TLS2561_ack_recieve
        PUBLIC TLS2561_read_byte
        PUBLIC TLS2561_start_bit
        PUBLIC TLS2561_stop_bit
        PUBLIC TLS2561_write_byte
        PUBLIC TLS2561_write_scl_bit
        PUBLIC TLS2561_write_sda_bit
        PUBLIC TSL2561_Read
        PUBLIC TSL2561_Write
        PUBLIC ack
        PUBLIC calculateLux
        PUBLIC get_lightlux
        PUBLIC light_amp
        PUBLIC light_cal_time
        PUBLIC set_cal_time_amp

// D:\Data form C\SRT\PWM调光项目\STM8继电器工程\HAL\HAL_I2C_TSL2561.c
//    1 /*
//    2 ******************************************************************************
//    3 HALI2C.C
//    4 ******************************************************************************
//    5 Hardware Abstraction Layer.
//    6 ******************************************************************************
//    7 (C) Copyright STMicroelectronics - 2004-
//    8 ******************************************************************************
//    9 
//   10 Revision History (Latest modification on top)
//   11 
//   12 */
//   13 
//   14 /*
//   15 ******************************************************************************
//   16 Includes
//   17 ******************************************************************************
//   18 */
//   19 #include "HAL_I2C_TSL2561.h"
//   20 #include <string.h>
//   21 						   	
//   22 

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
//   23 unsigned char ack = 1;
ack:
        DC8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   24 u8	light_amp = 0;
light_amp:
        DS8 1

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
//   25 u8	light_cal_time = 2;
light_cal_time:
        DC8 2
//   26 
//   27 //????;????????  
//   28 //????:  
//   29 //????:  
//   30 /*******************************************************************************/   

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   31 void TLS2561_write_sda_bit(unsigned char sda_data)   
//   32 {   
TLS2561_write_sda_bit:
        PUSH      S:?b8
        LD        S:?b8, A
//   33 	if(sda_data==0)   
        TNZ       S:?b8
        JRNE      L:??TLS2561_write_sda_bit_0
//   34 	{ 
//   35 		GPIO_WriteLow(TLS2561_SDA_PORT, TLS2561_SDA_PORT_NUM);
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_WriteLow
        JRA       L:??TLS2561_write_sda_bit_1
//   36 	}   
//   37 	else   
//   38 	{   
//   39 		GPIO_WriteHigh(TLS2561_SDA_PORT, TLS2561_SDA_PORT_NUM);
??TLS2561_write_sda_bit_0:
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_WriteHigh
//   40 	}   
//   41 }   
??TLS2561_write_sda_bit_1:
        POP       S:?b8
        RET
//   42 /*******************************************************************************  
//   43 ????;????????  
//   44 ????:  
//   45 ????:  
//   46 *******************************************************************************/   

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   47 void TLS2561_write_scl_bit(unsigned char scl_data)   
//   48 {   
TLS2561_write_scl_bit:
        PUSH      S:?b8
        LD        S:?b8, A
//   49 	if(scl_data==0)   
        TNZ       S:?b8
        JRNE      L:??TLS2561_write_scl_bit_0
//   50 	{ 
//   51 		GPIO_WriteLow(TLS2561_SDA_PORT, TLS2561_SCL_PORT_NUM);
        LD        A, #0x10
        LDW       X, #0x5005
        CALL      L:GPIO_WriteLow
        JRA       L:??TLS2561_write_scl_bit_1
//   52 	}   
//   53 	else   
//   54 	{   
//   55 		GPIO_WriteHigh(TLS2561_SDA_PORT, TLS2561_SCL_PORT_NUM);
??TLS2561_write_scl_bit_0:
        LD        A, #0x10
        LDW       X, #0x5005
        CALL      L:GPIO_WriteHigh
//   56 	}   
//   57 }   
??TLS2561_write_scl_bit_1:
        POP       S:?b8
        RET
//   58 
//   59 /*******************************************************************************  
//   60 ????;??????  
//   61 ????:  
//   62 ????:  
//   63 *******************************************************************************/   

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   64 void TLS2561_start_bit(void)   
//   65 {   
//   66 	TLS2561_write_sda_bit(1);//?????    
TLS2561_start_bit:
        LD        A, #0x1
        CALL      L:TLS2561_write_sda_bit
//   67 //	TLS2561_I2C_Delay(6);  
//   68 	TLS2561_write_scl_bit(1);//?????    
        LD        A, #0x1
        CALL      L:TLS2561_write_scl_bit
//   69 	TLS2561_I2C_Delay(6);   
        LDW       X, #0x6
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:TLS2561_I2C_Delay
//   70 	TLS2561_write_sda_bit(0);//?????    
        CLR       A
        CALL      L:TLS2561_write_sda_bit
//   71 	TLS2561_I2C_Delay(12);   
        LDW       X, #0xc
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:TLS2561_I2C_Delay
//   72 	TLS2561_write_scl_bit(0);//?????    
        CLR       A
        CALL      L:TLS2561_write_scl_bit
//   73 	TLS2561_I2C_Delay(6);   
        LDW       X, #0x6
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:TLS2561_I2C_Delay
//   74 }   
        RET
//   75 /*******************************************************************************  
//   76 ????;??????  
//   77 ????:  
//   78 ????:  
//   79 *******************************************************************************/   

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   80 void TLS2561_stop_bit(void)   
//   81 {   
//   82 	TLS2561_write_sda_bit(0);//?????    
TLS2561_stop_bit:
        CLR       A
        CALL      L:TLS2561_write_sda_bit
//   83 //	TLS2561_I2C_Delay(6);  
//   84 	TLS2561_write_scl_bit(1);//?????    
        LD        A, #0x1
        CALL      L:TLS2561_write_scl_bit
//   85 	TLS2561_I2C_Delay(6);   
        LDW       X, #0x6
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:TLS2561_I2C_Delay
//   86 	TLS2561_write_sda_bit(1);//?????    
        LD        A, #0x1
        CALL      L:TLS2561_write_sda_bit
//   87 	TLS2561_I2C_Delay(6);   
        LDW       X, #0x6
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:TLS2561_I2C_Delay
//   88 	TLS2561_write_scl_bit(0);
        CLR       A
        CALL      L:TLS2561_write_scl_bit
//   89 	TLS2561_I2C_Delay(6); 
        LDW       X, #0x6
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:TLS2561_I2C_Delay
//   90 }   
        RET
//   91 
//   92 
//   93 /*******************************************************************************  
//   94 ????;??????  
//   95 ????:  
//   96 	????:  
//   97 *******************************************************************************/   

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   98 u8 TLS2561_ack_recieve(void)   
//   99 {   
TLS2561_ack_recieve:
        CALL      L:?push_l2
//  100 	u32 temp=0xffff;   
        CLRW      X
        LDW       S:?w4, X
        DECW      X
        LDW       S:?w5, X
//  101 	TLS2561_write_sda_bit(1);//?????    
        LD        A, #0x1
        CALL      L:TLS2561_write_sda_bit
//  102 	TLS2561_write_scl_bit(1);   
        LD        A, #0x1
        CALL      L:TLS2561_write_scl_bit
//  103 	TLS2561_I2C_Delay(3);   
        LDW       X, #0x3
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:TLS2561_I2C_Delay
//  104 	PinDirConfig(DATAIN);
        CLR       A
        CALL      L:PinDirConfig
//  105 
//  106 	while(temp&&(GPIO_ReadInputPin(TLS2561_SDA_PORT, TLS2561_SDA_PORT_NUM)))   
??TLS2561_ack_recieve_0:
        LDW       X, S:?w4
        CPW       X, #0x0
        JRNE      L:??TLS2561_ack_recieve_1
        LDW       X, S:?w5
        CPW       X, #0x0
??TLS2561_ack_recieve_1:
        JREQ      L:??TLS2561_ack_recieve_2
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_ReadInputPin
        CP        A, #0x0
        JREQ      L:??TLS2561_ack_recieve_2
//  107 	{   
//  108 		temp--;   
        CALL      L:?dec32_l2_l2
        JRA       L:??TLS2561_ack_recieve_0
//  109 	} 
//  110 	PinDirConfig(DATAOUT);
??TLS2561_ack_recieve_2:
        LD        A, #0x1
        CALL      L:PinDirConfig
//  111 
//  112 	TLS2561_write_scl_bit(0);   
        CLR       A
        CALL      L:TLS2561_write_scl_bit
//  113 	TLS2561_I2C_Delay(3);   
        LDW       X, #0x3
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:TLS2561_I2C_Delay
//  114 }   
        JP        L:?epilogue_l2
//  115 
//  116 /*******************************************************************************  
//  117 ????;?????  
//  118 	????:  
//  119 ????:  
//  120 	*******************************************************************************/   

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  121 void TLS2561_write_byte(u8 data)   
//  122 {   
TLS2561_write_byte:
        CALL      L:?push_w4
        LD        S:?b8, A
//  123 	unsigned char temp;   
//  124 
//  125 	for(temp=8;temp>0;temp--)   
        LD        A, #0x8
        LD        S:?b9, A
??TLS2561_write_byte_0:
        TNZ       S:?b9
        JREQ      L:??TLS2561_write_byte_1
//  126 	{   
//  127 		
//  128 		if((data&0x80)==0x80)   
        LD        A, S:?b8
        AND       A, #0x80
        CP        A, #0x0
        JREQ      L:??TLS2561_write_byte_2
//  129 		{   
//  130 			TLS2561_write_sda_bit(1);   
        LD        A, #0x1
        CALL      L:TLS2561_write_sda_bit
        JRA       L:??TLS2561_write_byte_3
//  131 		}   
//  132 		else   
//  133 		{   
//  134 			TLS2561_write_sda_bit(0);   
??TLS2561_write_byte_2:
        CLR       A
        CALL      L:TLS2561_write_sda_bit
//  135 		}  
//  136 		
//  137 		TLS2561_I2C_Delay(6);   
??TLS2561_write_byte_3:
        LDW       X, #0x6
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:TLS2561_I2C_Delay
//  138 		TLS2561_write_scl_bit(1);   
        LD        A, #0x1
        CALL      L:TLS2561_write_scl_bit
//  139 		TLS2561_I2C_Delay(6);  
        LDW       X, #0x6
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:TLS2561_I2C_Delay
//  140 		TLS2561_write_scl_bit(0);   
        CLR       A
        CALL      L:TLS2561_write_scl_bit
//  141 		data=data<<1;   
        LD        A, S:?b8
        SLL       A
        LD        S:?b8, A
//  142 	}  
        LD        A, S:?b9
        ADD       A, #0xff
        LD        S:?b9, A
        JRA       L:??TLS2561_write_byte_0
//  143 	TLS2561_I2C_Delay(6);  
??TLS2561_write_byte_1:
        LDW       X, #0x6
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:TLS2561_I2C_Delay
//  144 	TLS2561_write_sda_bit(1);   
        LD        A, #0x1
        CALL      L:TLS2561_write_sda_bit
//  145 	TLS2561_I2C_Delay(6);  
        LDW       X, #0x6
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:TLS2561_I2C_Delay
//  146 	TLS2561_write_scl_bit(1);  
        LD        A, #0x1
        CALL      L:TLS2561_write_scl_bit
//  147 	PinDirConfig(DATAIN);
        CLR       A
        CALL      L:PinDirConfig
//  148 	TLS2561_I2C_Delay(6);  
        LDW       X, #0x6
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:TLS2561_I2C_Delay
//  149 	ack = (GPIO_ReadInputPin(TLS2561_SDA_PORT, TLS2561_SDA_PORT_NUM)) ;  	
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_ReadInputPin
        LD        L:ack, A
//  150 	TLS2561_I2C_Delay(6);  
        LDW       X, #0x6
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:TLS2561_I2C_Delay
//  151 	PinDirConfig(DATAOUT);	
        LD        A, #0x1
        CALL      L:PinDirConfig
//  152 	TLS2561_write_scl_bit(0);   
        CLR       A
        CALL      L:TLS2561_write_scl_bit
//  153 	TLS2561_I2C_Delay(6);  	
        LDW       X, #0x6
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:TLS2561_I2C_Delay
//  154 }   
        JP        L:?epilogue_w4
//  155 /*******************************************************************************  
//  156 ????;?????  
//  157 	????:  
//  158 ????:  
//  159 	*******************************************************************************/   

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  160 u8 TLS2561_read_byte(void)   
//  161 {   
TLS2561_read_byte:
        CALL      L:?push_w4
//  162 	unsigned char temp = 0;   
        CLR       S:?b9
//  163 	unsigned char ret_value = 0;   
        CLR       S:?b8
//  164 
//  165 	TLS2561_write_sda_bit(1);   
        LD        A, #0x1
        CALL      L:TLS2561_write_sda_bit
//  166 	TLS2561_I2C_Delay(6); 
        LDW       X, #0x6
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:TLS2561_I2C_Delay
//  167 	PinDirConfig(DATAIN);
        CLR       A
        CALL      L:PinDirConfig
//  168 	
//  169 	for(temp=0;temp<8;temp++)   
        CLR       A
        LD        S:?b9, A
??TLS2561_read_byte_0:
        LD        A, S:?b9
        CP        A, #0x8
        JRNC      L:??TLS2561_read_byte_1
//  170 	{   
//  171 		TLS2561_write_scl_bit(0);   
        CLR       A
        CALL      L:TLS2561_write_scl_bit
//  172 		TLS2561_I2C_Delay(6);   
        LDW       X, #0x6
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:TLS2561_I2C_Delay
//  173 		TLS2561_write_scl_bit(1);   
        LD        A, #0x1
        CALL      L:TLS2561_write_scl_bit
//  174 		TLS2561_I2C_Delay(6);   
        LDW       X, #0x6
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:TLS2561_I2C_Delay
//  175 		if(GPIO_ReadInputPin(TLS2561_SDA_PORT, TLS2561_SDA_PORT_NUM))   
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_ReadInputPin
        CP        A, #0x0
        JREQ      L:??TLS2561_read_byte_2
//  176 		{   
//  177 			ret_value+=1;   
        LD        A, S:?b8
        ADD       A, #0x1
        LD        S:?b8, A
        JRA       L:??TLS2561_read_byte_3
//  178 		}   
//  179 		else   
//  180 		{   
//  181 			ret_value+=0;   
//  182 		}   
//  183 	//	TLS2561_I2C_Delay(20);  
//  184 		if(temp!=7)   
??TLS2561_read_byte_2:
??TLS2561_read_byte_3:
        LD        A, S:?b9
        CP        A, #0x7
        JREQ      L:??TLS2561_read_byte_4
//  185 		ret_value=ret_value<<1;   
        LD        A, S:?b8
        SLL       A
        LD        S:?b8, A
//  186 		TLS2561_write_scl_bit(0);   
??TLS2561_read_byte_4:
        CLR       A
        CALL      L:TLS2561_write_scl_bit
//  187 	}   
        LD        A, S:?b9
        ADD       A, #0x1
        LD        S:?b9, A
        JRA       L:??TLS2561_read_byte_0
//  188 	
//  189 	PinDirConfig(DATAOUT);
??TLS2561_read_byte_1:
        LD        A, #0x1
        CALL      L:PinDirConfig
//  190 	TLS2561_I2C_Delay(6); 
        LDW       X, #0x6
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:TLS2561_I2C_Delay
//  191 	TLS2561_write_sda_bit(1);   
        LD        A, #0x1
        CALL      L:TLS2561_write_sda_bit
//  192 	TLS2561_I2C_Delay(6); 
        LDW       X, #0x6
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:TLS2561_I2C_Delay
//  193 	TLS2561_write_scl_bit(1);   
        LD        A, #0x1
        CALL      L:TLS2561_write_scl_bit
//  194 	TLS2561_I2C_Delay(6);   
        LDW       X, #0x6
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:TLS2561_I2C_Delay
//  195 	TLS2561_write_scl_bit(0);   
        CLR       A
        CALL      L:TLS2561_write_scl_bit
//  196 	TLS2561_I2C_Delay(6);  
        LDW       X, #0x6
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:TLS2561_I2C_Delay
//  197 
//  198 	return ret_value;
        LD        A, S:?b8
        JP        L:?epilogue_w4
//  199 }
//  200 
//  201 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  202 u8  TSL2561_Write(u8 command,u8 date) 
//  203 {  
TSL2561_Write:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
//  204 	TLS2561_start_bit();   
        CALL      L:TLS2561_start_bit
//  205 	TLS2561_write_byte(SLAVE_ADDR_WR);  
        LD        A, #0x52
        CALL      L:TLS2561_write_byte
//  206 	if(ack) return 1;  
        LD        A, L:ack
        CP        A, #0x0
        JREQ      L:??TSL2561_Write_0
        LD        A, #0x1
        JRA       L:??TSL2561_Write_1
//  207 	TLS2561_write_byte(command);  
??TSL2561_Write_0:
        LD        A, S:?b8
        CALL      L:TLS2561_write_byte
//  208 	if(ack) return 1;  
        LD        A, L:ack
        CP        A, #0x0
        JREQ      L:??TSL2561_Write_2
        LD        A, #0x1
        JRA       L:??TSL2561_Write_1
//  209 	TLS2561_write_byte(date);  
??TSL2561_Write_2:
        LD        A, S:?b9
        CALL      L:TLS2561_write_byte
//  210 	if(ack) return 1;
        LD        A, L:ack
        CP        A, #0x0
        JREQ      L:??TSL2561_Write_3
        LD        A, #0x1
        JRA       L:??TSL2561_Write_1
//  211 	TLS2561_stop_bit(); 
??TSL2561_Write_3:
        CALL      L:TLS2561_stop_bit
//  212 	return 0;
        CLR       A
??TSL2561_Write_1:
        JP        L:?epilogue_w4
//  213 } 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  214 u8 TSL2561_Read(u8 command, u8 *pDat)
//  215 {   
TSL2561_Read:
        CALL      L:?push_w4
        PUSH      S:?b10
        LD        S:?b10, A
        LDW       S:?w4, X
//  216 	u8 date;  
//  217 	TLS2561_start_bit();   
        CALL      L:TLS2561_start_bit
//  218 	TLS2561_write_byte(SLAVE_ADDR_WR);  
        LD        A, #0x52
        CALL      L:TLS2561_write_byte
//  219 	if(ack) return 1;  
        LD        A, L:ack
        CP        A, #0x0
        JREQ      L:??TSL2561_Read_0
        LD        A, #0x1
        JRA       L:??TSL2561_Read_1
//  220 	TLS2561_write_byte(command);  
??TSL2561_Read_0:
        LD        A, S:?b10
        CALL      L:TLS2561_write_byte
//  221 	if(ack) return 1;  
        LD        A, L:ack
        CP        A, #0x0
        JREQ      L:??TSL2561_Read_2
        LD        A, #0x1
        JRA       L:??TSL2561_Read_1
//  222 	TLS2561_start_bit();  
??TSL2561_Read_2:
        CALL      L:TLS2561_start_bit
//  223 	TLS2561_write_byte(SLAVE_ADDR_RD); 
        LD        A, #0x53
        CALL      L:TLS2561_write_byte
//  224 	if(ack) return 1;  
        LD        A, L:ack
        CP        A, #0x0
        JREQ      L:??TSL2561_Read_3
        LD        A, #0x1
        JRA       L:??TSL2561_Read_1
//  225 	*pDat=TLS2561_read_byte(); 
??TSL2561_Read_3:
        CALL      L:TLS2561_read_byte
        LD        [S:?w4.w], A
//  226 	TLS2561_stop_bit();  
        CALL      L:TLS2561_stop_bit
//  227 	return 0; 
        CLR       A
??TSL2561_Read_1:
        POP       S:?b10
        JP        L:?epilogue_w4
//  228 } 
//  229 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  230 void set_cal_time_amp(u8 amp, u8 cal_time)
//  231 {
set_cal_time_amp:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
//  232 	if(amp==0)	//amp = 1
        TNZ       S:?b8
        JRNE      L:??set_cal_time_amp_0
//  233 	{
//  234 		if(cal_time==0)  //13.7ms
        TNZ       S:?b9
        JRNE      L:??set_cal_time_amp_1
//  235 			TSL2561_Write(0x81, 0x0);	//  1  倍增益
        CLR       S:?b0
        LD        A, #0x81
        CALL      L:TSL2561_Write
        JRA       L:??set_cal_time_amp_2
//  236 		else if(cal_time==1)  //101ms
??set_cal_time_amp_1:
        LD        A, S:?b9
        CP        A, #0x1
        JRNE      L:??set_cal_time_amp_3
//  237 			TSL2561_Write(0x81, 0x1);	//  1  倍增益
        MOV       S:?b0, #0x1
        LD        A, #0x81
        CALL      L:TSL2561_Write
        JRA       L:??set_cal_time_amp_2
//  238 		else if(cal_time==2)  //402ms
??set_cal_time_amp_3:
        LD        A, S:?b9
        CP        A, #0x2
        JRNE      L:??set_cal_time_amp_2
//  239 			TSL2561_Write(0x81, 0x2);	//  1  倍增益
        MOV       S:?b0, #0x2
        LD        A, #0x81
        CALL      L:TSL2561_Write
        JRA       L:??set_cal_time_amp_2
//  240 	}
//  241 	else if(amp==1)
??set_cal_time_amp_0:
        LD        A, S:?b8
        CP        A, #0x1
        JRNE      L:??set_cal_time_amp_2
//  242 	{
//  243 		if(cal_time==0)  //13.7ms
        TNZ       S:?b9
        JRNE      L:??set_cal_time_amp_4
//  244 			TSL2561_Write(0x81, 0x10);	//  1  倍增益
        MOV       S:?b0, #0x10
        LD        A, #0x81
        CALL      L:TSL2561_Write
        JRA       L:??set_cal_time_amp_2
//  245 		else if(cal_time==1)  //101ms
??set_cal_time_amp_4:
        LD        A, S:?b9
        CP        A, #0x1
        JRNE      L:??set_cal_time_amp_5
//  246 			TSL2561_Write(0x81, 0x11);	//  1  倍增益
        MOV       S:?b0, #0x11
        LD        A, #0x81
        CALL      L:TSL2561_Write
        JRA       L:??set_cal_time_amp_2
//  247 		else if(cal_time==2)  //402ms
??set_cal_time_amp_5:
        LD        A, S:?b9
        CP        A, #0x2
        JRNE      L:??set_cal_time_amp_2
//  248 			TSL2561_Write(0x81, 0x12);	//  1  倍增益
        MOV       S:?b0, #0x12
        LD        A, #0x81
        CALL      L:TSL2561_Write
//  249 	}
//  250 }
??set_cal_time_amp_2:
        JP        L:?epilogue_w4
//  251 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  252 void InitTSL2561(void)
//  253 {
//  254 	light_amp = 0;			// 1倍
InitTSL2561:
        MOV       L:light_amp, #0x0
//  255 	light_cal_time = 2;		//402ms
        MOV       L:light_cal_time, #0x2
//  256 	TSL2561_Write( 0x80, 0x03);	//power on
        MOV       S:?b0, #0x3
        LD        A, #0x80
        CALL      L:TSL2561_Write
//  257 	set_cal_time_amp(light_amp,light_cal_time);	// 1增益
        LD        A, L:light_cal_time
        LD        S:?b0, A
        LD        A, L:light_amp
        CALL      L:set_cal_time_amp
//  258 }
        RET
//  259 //读取光照强度

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  260 void Read_Light(void) 
//  261 {   
Read_Light:
        CALL      L:?push_l2
        SUB       SP, #0x4
//  262 	u8  DataLow0,DataHigh0,DataLow1,DataHigh1,commad,temp; 
//  263 	u16 Channel0,Channel1;
//  264 	TSL2561_Read(DATA0LOW,&DataLow0);  
        LDW       X, SP
        ADDW      X, #0x4
        LD        A, #0x8c
        CALL      L:TSL2561_Read
//  265 	TSL2561_Read(DATA0HIGH,&DataHigh0);  
        LDW       X, SP
        ADDW      X, #0x3
        LD        A, #0x8d
        CALL      L:TSL2561_Read
//  266 	Channel0 = 256*DataHigh0 + DataLow0;    
        LD        A, (0x3,SP)
        CLRW      X
        LD        XL, A
        LDW       Y, X
        LDW       X, #0x100
        LDW       S:?w0, X
        LDW       X, Y
        CALL      L:?mul16_x_x_w0
        LDW       Y, X
        LD        A, (0x4,SP)
        CLRW      X
        LD        XL, A
        LDW       S:?w0, X
        LDW       X, Y
        ADDW      X, S:?w0
        LDW       S:?w5, X
//  267 	TSL2561_Read(DATA1LOW,&DataLow1);  
        LDW       X, SP
        ADDW      X, #0x2
        LD        A, #0x8e
        CALL      L:TSL2561_Read
//  268 	TSL2561_Read(DATA1HIGH,&DataHigh1);  
        LDW       X, SP
        ADDW      X, #0x1
        LD        A, #0x8f
        CALL      L:TSL2561_Read
//  269 	Channel1 = 256*DataHigh1 + DataLow1; 
        LD        A, (0x1,SP)
        CLRW      X
        LD        XL, A
        LDW       Y, X
        LDW       X, #0x100
        LDW       S:?w0, X
        LDW       X, Y
        CALL      L:?mul16_x_x_w0
        LDW       Y, X
        LD        A, (0x2,SP)
        CLRW      X
        LD        XL, A
        LDW       S:?w0, X
        LDW       X, Y
        ADDW      X, S:?w0
        LDW       S:?w4, X
//  270 	
//  271 } 
        ADD       SP, #0x4
        JP        L:?epilogue_l2
//  272 
//  273 //得到光照强度

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  274 void get_lightlux(u16 *value)
//  275 {
get_lightlux:
        CALL      L:?push_l2
        CALL      L:?push_w6
        SUB       SP, #0x4
        LDW       S:?w6, X
//  276 	u8  DataLow0,DataHigh0,DataLow1,DataHigh1,commad,temp; 
//  277 	u16 Channel0,Channel1;
//  278 	
//  279 	TSL2561_Read(DATA0LOW,&DataLow0);  
        LDW       X, SP
        ADDW      X, #0x4
        LD        A, #0x8c
        CALL      L:TSL2561_Read
//  280 	TSL2561_Read(DATA0HIGH,&DataHigh0);  
        LDW       X, SP
        ADDW      X, #0x3
        LD        A, #0x8d
        CALL      L:TSL2561_Read
//  281 	Channel0 = 256*DataHigh0 + DataLow0;    
        LD        A, (0x3,SP)
        CLRW      X
        LD        XL, A
        LDW       Y, X
        LDW       X, #0x100
        LDW       S:?w0, X
        LDW       X, Y
        CALL      L:?mul16_x_x_w0
        LDW       Y, X
        LD        A, (0x4,SP)
        CLRW      X
        LD        XL, A
        LDW       S:?w0, X
        LDW       X, Y
        ADDW      X, S:?w0
        LDW       S:?w5, X
//  282 	TSL2561_Read(DATA1LOW,&DataLow1);  
        LDW       X, SP
        ADDW      X, #0x2
        LD        A, #0x8e
        CALL      L:TSL2561_Read
//  283 	TSL2561_Read(DATA1HIGH,&DataHigh1);  
        LDW       X, SP
        ADDW      X, #0x1
        LD        A, #0x8f
        CALL      L:TSL2561_Read
//  284 	Channel1 = 256*DataHigh1 + DataLow1; 
        LD        A, (0x1,SP)
        CLRW      X
        LD        XL, A
        LDW       Y, X
        LDW       X, #0x100
        LDW       S:?w0, X
        LDW       X, Y
        CALL      L:?mul16_x_x_w0
        LDW       Y, X
        LD        A, (0x2,SP)
        CLRW      X
        LD        XL, A
        LDW       S:?w0, X
        LDW       X, Y
        ADDW      X, S:?w0
        LDW       S:?w4, X
//  285 
//  286 		// Determine if either sensor saturated (0xFFFF)
//  287 	// If so, abandon ship (calculation will not be accurate)
//  288 	if ((Channel0 == 0xFFFF) || (Channel1 == 0xFFFF))
        LDW       X, S:?w5
        CPW       X, #0xffff
        JREQ      L:??get_lightlux_0
        LDW       X, S:?w4
        CPW       X, #0xffff
        JRNE      L:??get_lightlux_1
//  289 	{
//  290 		if(light_cal_time==2)
??get_lightlux_0:
        LD        A, L:light_cal_time
        CP        A, #0x2
        JRNE      L:??get_lightlux_2
//  291 			light_cal_time =1;
        MOV       L:light_cal_time, #0x1
        JRA       L:??get_lightlux_3
//  292 		else if(light_cal_time == 1)
??get_lightlux_2:
        LD        A, L:light_cal_time
        CP        A, #0x1
        JRNE      L:??get_lightlux_3
//  293 			light_cal_time = 0;
        MOV       L:light_cal_time, #0x0
//  294 		set_cal_time_amp(light_amp,light_cal_time);	//16高增益
??get_lightlux_3:
        LD        A, L:light_cal_time
        LD        S:?b0, A
        LD        A, L:light_amp
        CALL      L:set_cal_time_amp
//  295 		return;
        JRA       L:??get_lightlux_4
//  296 	}
//  297 
//  298 	*value = calculateLux(Channel0,Channel1);
??get_lightlux_1:
        LDW       Y, S:?w4
        LDW       X, S:?w5
        CALL      L:calculateLux
        LDW       X, S:?w1
        LDW       [S:?w6.w], X
//  299 }
??get_lightlux_4:
        ADD       SP, #0x4
        JP        L:?epilogue_l2_w6
//  300 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  301 uint32_t calculateLux(uint16_t ch0, uint16_t ch1)
//  302 {
calculateLux:
        CALL      L:?push_l2
        CALL      L:?push_l3
        PUSHW     X
        PUSHW     Y
        SUB       SP, #0x18
//  303 	unsigned long chScale;
//  304 	unsigned long channel1;
//  305 	unsigned long channel0;
//  306 
//  307 	// find the ratio of the channel values (Channel1/Channel0)
//  308 	unsigned long ratio1 ;
//  309 	// round the ratio value
//  310 	unsigned long ratio ;
//  311 	unsigned int b, m;
//  312 	unsigned long temp;
//  313 	u32 lux ;
//  314 	
//  315 	switch (light_cal_time)
        LD        A, L:light_cal_time
        TNZ       A
        JREQ      L:??calculateLux_0
        DEC       A
        JREQ      L:??calculateLux_1
        JRA       L:??calculateLux_2
//  316 	{
//  317 		case 0:
//  318 			chScale = TSL2561_LUX_CHSCALE_TINT0;
??calculateLux_0:
        LDW       X, #0x7517
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?mov_l3_l0
//  319 		break;
        JRA       L:??calculateLux_3
//  320 		case 1:
//  321 			chScale = TSL2561_LUX_CHSCALE_TINT1;
??calculateLux_1:
        LDW       X, #0xfe7
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?mov_l3_l0
//  322 		break;
        JRA       L:??calculateLux_3
//  323 		default: // No scaling ... integration time = 402ms
//  324 			chScale = (1 << TSL2561_LUX_CHSCALE);
??calculateLux_2:
        LDW       X, #0x400
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?mov_l3_l0
//  325 		break;
//  326 	}
//  327 	  // Scale for gain (1x or 16x)
//  328   	if (!light_amp) 
??calculateLux_3:
        LD        A, L:light_amp
        CP        A, #0x0
        JRNE      L:??calculateLux_4
//  329 		chScale = chScale << 4;
        CALL      L:?mov_l0_l3
        CALL      L:?sll32_l0_l0_db
        DATA
        DC8       0x4
        CODE
        CALL      L:?mov_l3_l0
//  330 
//  331 	  // scale the channel values
//  332 	channel0 = (ch0 * chScale) >> TSL2561_LUX_CHSCALE;
??calculateLux_4:
        LDW       X, (0x1b,SP)
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?mov_l1_l3
        CALL      L:?mul32_l0_l0_l1
        CALL      L:?srl32_l0_l0_db
        DATA
        DC8       0xa
        CODE
        CALL      L:?load32_dbsp_l0
        DATA
        DC8       0x9
        CODE
//  333 	channel1 = (ch1 * chScale) >> TSL2561_LUX_CHSCALE;
        LDW       X, (0x19,SP)
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?mov_l1_l3
        CALL      L:?mul32_l0_l0_l1
        CALL      L:?srl32_l0_l0_db
        DATA
        DC8       0xa
        CODE
        CALL      L:?load32_dbsp_l0
        DATA
        DC8       0xd
        CODE
//  334 
//  335 	if (channel0 != 0) 
        CALL      L:?load32_l0_dbsp
        DATA
        DC8       0x9
        CODE
        LDW       X, S:?w0
        CPW       X, #0x0
        JRNE      L:??calculateLux_5
        LDW       X, S:?w1
        CPW       X, #0x0
??calculateLux_5:
        JREQ      L:??calculateLux_6
//  336 		ratio1 = (channel1 << (TSL2561_LUX_RATIOSCALE+1)) / channel0;
        CALL      L:?load32_l0_dbsp
        DATA
        DC8       0xd
        CODE
        CALL      L:?sll32_l0_l0_db
        DATA
        DC8       0xa
        CODE
        CALL      L:?load32_l1_dbsp
        DATA
        DC8       0x9
        CODE
        CALL      L:?udiv32_l0_l0_l1
        CALL      L:?load32_dbsp_l0
        DATA
        DC8       0x15
        CODE
//  337 
//  338 	ratio = (ratio1 + 1) >> 1;
??calculateLux_6:
        CALL      L:?load32_l0_dbsp
        DATA
        DC8       0x15
        CODE
        CALL      L:?inc32_l0_l0
        CALL      L:?srl32_l0_l0_db
        DATA
        DC8       0x1
        CODE
        CALL      L:?mov_l2_l0
//  339 
//  340 
//  341 	if ((ratio >= 0) && (ratio <= TSL2561_LUX_K1T))
        LDW       X, S:?w4
        CPW       X, #0x0
        JRNE      L:??calculateLux_7
        LDW       X, S:?w5
        CPW       X, #0x41
??calculateLux_7:
        JRNC      L:??calculateLux_8
//  342 	{
//  343 		b=TSL2561_LUX_B1T; 
        LDW       X, #0x1f2
        LDW       (0x3,SP), X
//  344 		m=TSL2561_LUX_M1T;
        LDW       X, #0x1be
        LDW       (0x1,SP), X
        JP        L:??calculateLux_9
//  345 	}
//  346 	else if (ratio <= TSL2561_LUX_K2T)
??calculateLux_8:
        LDW       X, S:?w4
        CPW       X, #0x0
        JRNE      L:??calculateLux_10
        LDW       X, S:?w5
        CPW       X, #0x81
??calculateLux_10:
        JRNC      L:??calculateLux_11
//  347 	{
//  348 		b=TSL2561_LUX_B2T; 
        LDW       X, #0x214
        LDW       (0x3,SP), X
//  349 		m=TSL2561_LUX_M2T;
        LDW       X, #0x2d1
        LDW       (0x1,SP), X
        JP        L:??calculateLux_9
//  350 	}
//  351 	else if (ratio <= TSL2561_LUX_K3T)
??calculateLux_11:
        LDW       X, S:?w4
        CPW       X, #0x0
        JRNE      L:??calculateLux_12
        LDW       X, S:?w5
        CPW       X, #0xc1
??calculateLux_12:
        JRNC      L:??calculateLux_13
//  352 	{
//  353 		b=TSL2561_LUX_B3T; 
        LDW       X, #0x23f
        LDW       (0x3,SP), X
//  354 		m=TSL2561_LUX_M3T;
        LDW       X, #0x37b
        LDW       (0x1,SP), X
        JRA       L:??calculateLux_9
//  355 	}
//  356 	else if (ratio <= TSL2561_LUX_K4T)
??calculateLux_13:
        LDW       X, S:?w4
        CPW       X, #0x0
        JRNE      L:??calculateLux_14
        LDW       X, S:?w5
        CPW       X, #0x101
??calculateLux_14:
        JRNC      L:??calculateLux_15
//  357 	{
//  358 		b=TSL2561_LUX_B4T; 
        LDW       X, #0x270
        LDW       (0x3,SP), X
//  359 		m=TSL2561_LUX_M4T;
        LDW       X, #0x3fe
        LDW       (0x1,SP), X
        JRA       L:??calculateLux_9
//  360 	}
//  361 	else if (ratio <= TSL2561_LUX_K5T)
??calculateLux_15:
        LDW       X, S:?w4
        CPW       X, #0x0
        JRNE      L:??calculateLux_16
        LDW       X, S:?w5
        CPW       X, #0x139
??calculateLux_16:
        JRNC      L:??calculateLux_17
//  362 	{
//  363 		b=TSL2561_LUX_B5T; 
        LDW       X, #0x16f
        LDW       (0x3,SP), X
//  364 		m=TSL2561_LUX_M5T;
        LDW       X, #0x1fc
        LDW       (0x1,SP), X
        JRA       L:??calculateLux_9
//  365 	}
//  366 	else if (ratio <= TSL2561_LUX_K6T)
??calculateLux_17:
        LDW       X, S:?w4
        CPW       X, #0x0
        JRNE      L:??calculateLux_18
        LDW       X, S:?w5
        CPW       X, #0x19b
??calculateLux_18:
        JRNC      L:??calculateLux_19
//  367 	{
//  368 		b=TSL2561_LUX_B6T; 
        LDW       X, #0xd2
        LDW       (0x3,SP), X
//  369 		m=TSL2561_LUX_M6T;
        LDW       X, #0xfb
        LDW       (0x1,SP), X
        JRA       L:??calculateLux_9
//  370 	}
//  371 	else if (ratio <= TSL2561_LUX_K7T)
??calculateLux_19:
        LDW       X, S:?w4
        CPW       X, #0x0
        JRNE      L:??calculateLux_20
        LDW       X, S:?w5
        CPW       X, #0x29b
??calculateLux_20:
        JRNC      L:??calculateLux_21
//  372 	{
//  373 		b=TSL2561_LUX_B7T; 
        LDW       X, #0x18
        LDW       (0x3,SP), X
//  374 		m=TSL2561_LUX_M7T;
        LDW       X, #0x12
        LDW       (0x1,SP), X
        JRA       L:??calculateLux_9
//  375 	}
//  376 	else if (ratio > TSL2561_LUX_K8T)
??calculateLux_21:
        LDW       X, S:?w4
        CPW       X, #0x0
        JRNE      L:??calculateLux_22
        LDW       X, S:?w5
        CPW       X, #0x29b
??calculateLux_22:
        JRC       L:??calculateLux_9
//  377 	{
//  378 		b=TSL2561_LUX_B8T; 
        CLRW      X
        LDW       (0x3,SP), X
//  379 		m=TSL2561_LUX_M8T;
        CLRW      X
        LDW       (0x1,SP), X
//  380 	}
//  381 
//  382 	temp = ((channel0 * b) - (channel1 * m));
??calculateLux_9:
        LDW       X, (0x1,SP)
        LDW       S:?w3, X
        CLRW      X
        LDW       S:?w2, X
        CALL      L:?load32_l0_dbsp
        DATA
        DC8       0xd
        CODE
        CALL      L:?mul32_l0_l0_l1
        CALL      L:?push_l0
        LDW       X, (0x7,SP)
        LDW       S:?w3, X
        CLRW      X
        LDW       S:?w2, X
        CALL      L:?load32_l0_dbsp
        DATA
        DC8       0xd
        CODE
        CALL      L:?mul32_l0_l0_l1
        CALL      L:?pop_l1
        CALL      L:?sub32_l0_l0_l1
        CALL      L:?load32_dbsp_l0
        DATA
        DC8       0x5
        CODE
//  383 
//  384 	// do not allow negative lux value
//  385 	if (temp < 0) 
//  386 		temp = 0;
//  387 
//  388 	// round lsb (2^(LUX_SCALE-1))
//  389 	temp += (1 << (TSL2561_LUX_LUXSCALE-1));
        CALL      L:?load32_l0_dbsp
        DATA
        DC8       0x5
        CODE
        CALL      L:?add32_l0_l0_dl
        DATA
        DC32      0x2000
        CODE
        CALL      L:?load32_dbsp_l0
        DATA
        DC8       0x5
        CODE
//  390 
//  391 	// strip off fractional portion
//  392 	lux = (temp >> TSL2561_LUX_LUXSCALE);
        CALL      L:?load32_l0_dbsp
        DATA
        DC8       0x5
        CODE
        CALL      L:?srl32_l0_l0_db
        DATA
        DC8       0xe
        CODE
        CALL      L:?load32_dbsp_l0
        DATA
        DC8       0x11
        CODE
//  393 
//  394 	// Signal I2C had no errors
//  395 	return lux;  
        CALL      L:?load32_l0_dbsp
        DATA
        DC8       0x11
        CODE
        ADD       SP, #0x1c
        JP        L:?epilogue_l2_l3
//  396 }
//  397 
//  398 /****************************************************************************
//  399 * 函  数：void DS18B20PinDirConfig(uint8_t dir);
//  400 * 功  能：DS18B20数据引脚方向配置
//  401 * 参  数：uint8_t dir(DATAIN , DATAOUT)
//  402 * 返回值：无
//  403 * 更  新：无
//  404 * 备  注：无
//  405 ****************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  406 void PinDirConfig(uint8_t dir)
//  407 {
PinDirConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  408 	switch(dir)
        LD        A, S:?b8
        TNZ       A
        JREQ      L:??PinDirConfig_0
        DEC       A
        JREQ      L:??PinDirConfig_1
        JRA       L:??PinDirConfig_2
//  409 	{
//  410 		case DATAIN :
//  411 			GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)(GPIO_PIN_5), GPIO_MODE_IN_FL_NO_IT);
??PinDirConfig_0:
        CLR       S:?b0
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_Init
//  412 		break;
        JRA       L:??PinDirConfig_3
//  413 		case DATAOUT :
//  414 			GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)(GPIO_PIN_5), GPIO_MODE_OUT_PP_HIGH_FAST);
??PinDirConfig_1:
        MOV       S:?b0, #0xf0
        LD        A, #0x20
        LDW       X, #0x5005
        CALL      L:GPIO_Init
//  415 		break;
        JRA       L:??PinDirConfig_3
//  416 		
//  417 		default:
//  418 		break;
//  419 	}
//  420 }
??PinDirConfig_2:
??PinDirConfig_3:
        POP       S:?b8
        RET
//  421 
//  422 
//  423 //延时1 uS

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  424 void TLS2561_I2C_Delay(u32 nCount)   
//  425 {   
//  426 	u16 temp_counter = 0;
TLS2561_I2C_Delay:
        CLRW      Y
//  427 	for(; nCount != 0; nCount--)
??TLS2561_I2C_Delay_0:
        LDW       X, S:?w0
        CPW       X, #0x0
        JRNE      L:??TLS2561_I2C_Delay_1
        LDW       X, S:?w1
        CPW       X, #0x0
??TLS2561_I2C_Delay_1:
        JREQ      L:??TLS2561_I2C_Delay_2
//  428 	{
//  429 		for(temp_counter=0;temp_counter<2;temp_counter++)
        CLRW      X
        LDW       Y, X
??TLS2561_I2C_Delay_3:
        CPW       Y, #0x2
        JRNC      L:??TLS2561_I2C_Delay_4
        INCW      Y
        JRA       L:??TLS2561_I2C_Delay_3
//  430 		{
//  431 			;
//  432 		}
//  433 	}   
??TLS2561_I2C_Delay_4:
        CALL      L:?dec32_l0_l0
        JRA       L:??TLS2561_I2C_Delay_0
//  434 }   
??TLS2561_I2C_Delay_2:
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  435 
//  436 
//  437 
//  438 
//  439 
//  440 
// 
//     1 byte  in section .near.bss
//     2 bytes in section .near.data
// 1 701 bytes in section .near_func.text
// 
// 1 701 bytes of CODE memory
//     3 bytes of DATA memory
//
//Errors: none
//Warnings: 10
