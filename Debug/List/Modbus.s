///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V2.10.4.157 for STM8                19/Sep/2015  09:42:59
// Copyright 2010-2015 IAR Systems AB.
//
//    Source file  =  
//        D:\Data form C\SRT\PWM调光项目\STM8继电器工程\HAL\Modbus.c
//    Command line =  
//        "D:\Data form C\SRT\PWM调光项目\STM8继电器工程\HAL\Modbus.c" -e
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
//        D:\Data form C\SRT\PWM调光项目\STM8继电器工程\Debug\List\Modbus.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b13
        EXTERN ?b6
        EXTERN ?b7
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_l2
        EXTERN ?epilogue_l2_l3
        EXTERN ?epilogue_l2_w6
        EXTERN ?epilogue_w4
        EXTERN ?mov_w2_w1
        EXTERN ?pop_l3
        EXTERN ?pop_w5
        EXTERN ?pop_w6
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?push_w4
        EXTERN ?push_w5
        EXTERN ?push_w6
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3
        EXTERN ?w4
        EXTERN ?w5
        EXTERN ?w6
        EXTERN ?w7
        EXTERN Delay
        EXTERN GPIO_WriteHigh
        EXTERN GPIO_WriteLow
        EXTERN UART1_GetFlagStatus
        EXTERN UART1_SendData8
        EXTERN sensor_id

        PUBLIC HoldingReg_data
        PUBLIC UART1_SendByte
        PUBLIC UART1_SendString
        PUBLIC bsp_ModbusRTUSlave_Tx
        PUBLIC bsp_ModbusRTUSlave_decode
        PUBLIC dst_crc
        PUBLIC duty_receive
        PUBLIC src_crc
        PUBLIC usart1info
        PUBLIC usart2info
        PUBLIC usart3info

// D:\Data form C\SRT\PWM调光项目\STM8继电器工程\HAL\Modbus.c
//    1 
//    2 #include "MODBUS.h"
//    3 
//    4 void bsp_ModbusRTUSlave_Tx(unsigned char *pt_send, u16 lenght);
//    5 u16 cal_crc16(u8 *ptr,u16 len);		//CRC校验(16位)
//    6 /*
//    7 void modbus_set_buff();
//    8 void modbus_put_buff();*/
//    9 static void UART_clear_buf(void);
//   10 void 		UART1_SendByte(u8 data);
//   11 void 		UART1_SendString(u8* Data,u16 len);
//   12 
//   13 
//   14 //u32 duty;
//   15 

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   16 u32 duty_receive;
duty_receive:
        DS8 4
//   17 extern u8	sensor_id;
//   18 
//   19 extern u16	 optimal_light_strength;

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   20 u8 HoldingReg_data[HOLDINGREG_DATA_SIZE]; //可读写寄存器 功能码：0x03  0x06  0x10 
HoldingReg_data:
        DS8 36

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   21 u16  src_crc, dst_crc;
src_crc:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
dst_crc:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   22 usart_def  usart1info,usart2info,usart3info;
usart1info:
        DS8 50

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
usart2info:
        DS8 50

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
usart3info:
        DS8 50
//   23 

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
//   24 static const unsigned char  aucCRCHi[] = {
aucCRCHi:
        DC8 0, 193, 129, 64, 1, 192, 128, 65, 1, 192, 128, 65, 0, 193, 129, 64
        DC8 1, 192, 128, 65, 0, 193, 129, 64, 0, 193, 129, 64, 1, 192, 128, 65
        DC8 1, 192, 128, 65, 0, 193, 129, 64, 0, 193, 129, 64, 1, 192, 128, 65
        DC8 0, 193, 129, 64, 1, 192, 128, 65, 1, 192, 128, 65, 0, 193, 129, 64
        DC8 1, 192, 128, 65, 0, 193, 129, 64, 0, 193, 129, 64, 1, 192, 128, 65
        DC8 0, 193, 129, 64, 1, 192, 128, 65, 1, 192, 128, 65, 0, 193, 129, 64
        DC8 0, 193, 129, 64, 1, 192, 128, 65, 1, 192, 128, 65, 0, 193, 129, 64
        DC8 1, 192, 128, 65, 0, 193, 129, 64, 0, 193, 129, 64, 1, 192, 128, 65
        DC8 1, 192, 128, 65, 0, 193, 129, 64, 0, 193, 129, 64, 1, 192, 128, 65
        DC8 0, 193, 129, 64, 1, 192, 128, 65, 1, 192, 128, 65, 0, 193, 129, 64
        DC8 0, 193, 129, 64, 1, 192, 128, 65, 1, 192, 128, 65, 0, 193, 129, 64
        DC8 1, 192, 128, 65, 0, 193, 129, 64, 0, 193, 129, 64, 1, 192, 128, 65
        DC8 0, 193, 129, 64, 1, 192, 128, 65, 1, 192, 128, 65, 0, 193, 129, 64
        DC8 1, 192, 128, 65, 0, 193, 129, 64, 0, 193, 129, 64, 1, 192, 128, 65
        DC8 1, 192, 128, 65, 0, 193, 129, 64, 0, 193, 129, 64, 1, 192, 128, 65
        DC8 0, 193, 129, 64, 1, 192, 128, 65, 1, 192, 128, 65, 0, 193, 129, 64
//   25 	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,
//   26 	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,
//   27 	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,
//   28 	0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,
//   29 	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,
//   30 	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,
//   31 	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,
//   32 	0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,
//   33 	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,
//   34 	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,
//   35 	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,
//   36 	0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 
//   37 	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,
//   38 	0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 
//   39 	0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,
//   40 	0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,
//   41 	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 
//   42 	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,
//   43 	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,
//   44 	0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,
//   45 	0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,
//   46 	0x00, 0xC1, 0x81, 0x40
//   47 };
//   48 

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
//   49 static const unsigned char aucCRCLo[] = {
aucCRCLo:
        DC8 0, 192, 193, 1, 195, 3, 2, 194, 198, 6, 7, 199, 5, 197, 196, 4, 204
        DC8 12, 13, 205, 15, 207, 206, 14, 10, 202, 203, 11, 201, 9, 8, 200
        DC8 216, 24, 25, 217, 27, 219, 218, 26, 30, 222, 223, 31, 221, 29, 28
        DC8 220, 20, 212, 213, 21, 215, 23, 22, 214, 210, 18, 19, 211, 17, 209
        DC8 208, 16, 240, 48, 49, 241, 51, 243, 242, 50, 54, 246, 247, 55, 245
        DC8 53, 52, 244, 60, 252, 253, 61, 255, 63, 62, 254, 250, 58, 59, 251
        DC8 57, 249, 248, 56, 40, 232, 233, 41, 235, 43, 42, 234, 238, 46, 47
        DC8 239, 45, 237, 236, 44, 228, 36, 37, 229, 39, 231, 230, 38, 34, 226
        DC8 227, 35, 225, 33, 32, 224, 160, 96, 97, 161, 99, 163, 162, 98, 102
        DC8 166, 167, 103, 165, 101, 100, 164, 108, 172, 173, 109, 175, 111
        DC8 110, 174, 170, 106, 107, 171, 105, 169, 168, 104, 120, 184, 185
        DC8 121, 187, 123, 122, 186, 190, 126, 127, 191, 125, 189, 188, 124
        DC8 180, 116, 117, 181, 119, 183, 182, 118, 114, 178, 179, 115, 177
        DC8 113, 112, 176, 80, 144, 145, 81, 147, 83, 82, 146, 150, 86, 87, 151
        DC8 85, 149, 148, 84, 156, 92, 93, 157, 95, 159, 158, 94, 90, 154, 155
        DC8 91, 153, 89, 88, 152, 136, 72, 73, 137, 75, 139, 138, 74, 78, 142
        DC8 143, 79, 141, 77, 76, 140, 68, 132, 133, 69, 135, 71, 70, 134, 130
        DC8 66, 67, 131, 65, 129, 128, 64
//   50 	0x00, 0xC0, 0xC1, 0x01, 0xC3, 0x03, 0x02, 0xC2, 0xC6, 0x06, 0x07, 0xC7,
//   51 	0x05, 0xC5, 0xC4, 0x04, 0xCC, 0x0C, 0x0D, 0xCD, 0x0F, 0xCF, 0xCE, 0x0E,
//   52 	0x0A, 0xCA, 0xCB, 0x0B, 0xC9, 0x09, 0x08, 0xC8, 0xD8, 0x18, 0x19, 0xD9,
//   53 	0x1B, 0xDB, 0xDA, 0x1A, 0x1E, 0xDE, 0xDF, 0x1F, 0xDD, 0x1D, 0x1C, 0xDC,
//   54 	0x14, 0xD4, 0xD5, 0x15, 0xD7, 0x17, 0x16, 0xD6, 0xD2, 0x12, 0x13, 0xD3,
//   55 	0x11, 0xD1, 0xD0, 0x10, 0xF0, 0x30, 0x31, 0xF1, 0x33, 0xF3, 0xF2, 0x32,
//   56 	0x36, 0xF6, 0xF7, 0x37, 0xF5, 0x35, 0x34, 0xF4, 0x3C, 0xFC, 0xFD, 0x3D,
//   57 	0xFF, 0x3F, 0x3E, 0xFE, 0xFA, 0x3A, 0x3B, 0xFB, 0x39, 0xF9, 0xF8, 0x38, 
//   58 	0x28, 0xE8, 0xE9, 0x29, 0xEB, 0x2B, 0x2A, 0xEA, 0xEE, 0x2E, 0x2F, 0xEF,
//   59 	0x2D, 0xED, 0xEC, 0x2C, 0xE4, 0x24, 0x25, 0xE5, 0x27, 0xE7, 0xE6, 0x26,
//   60 	0x22, 0xE2, 0xE3, 0x23, 0xE1, 0x21, 0x20, 0xE0, 0xA0, 0x60, 0x61, 0xA1,
//   61 	0x63, 0xA3, 0xA2, 0x62, 0x66, 0xA6, 0xA7, 0x67, 0xA5, 0x65, 0x64, 0xA4,
//   62 	0x6C, 0xAC, 0xAD, 0x6D, 0xAF, 0x6F, 0x6E, 0xAE, 0xAA, 0x6A, 0x6B, 0xAB, 
//   63 	0x69, 0xA9, 0xA8, 0x68, 0x78, 0xB8, 0xB9, 0x79, 0xBB, 0x7B, 0x7A, 0xBA,
//   64 	0xBE, 0x7E, 0x7F, 0xBF, 0x7D, 0xBD, 0xBC, 0x7C, 0xB4, 0x74, 0x75, 0xB5,
//   65 	0x77, 0xB7, 0xB6, 0x76, 0x72, 0xB2, 0xB3, 0x73, 0xB1, 0x71, 0x70, 0xB0,
//   66 	0x50, 0x90, 0x91, 0x51, 0x93, 0x53, 0x52, 0x92, 0x96, 0x56, 0x57, 0x97,
//   67 	0x55, 0x95, 0x94, 0x54, 0x9C, 0x5C, 0x5D, 0x9D, 0x5F, 0x9F, 0x9E, 0x5E,
//   68 	0x5A, 0x9A, 0x9B, 0x5B, 0x99, 0x59, 0x58, 0x98, 0x88, 0x48, 0x49, 0x89,
//   69 	0x4B, 0x8B, 0x8A, 0x4A, 0x4E, 0x8E, 0x8F, 0x4F, 0x8D, 0x4D, 0x4C, 0x8C,
//   70 	0x44, 0x84, 0x85, 0x45, 0x87, 0x47, 0x46, 0x86, 0x82, 0x42, 0x43, 0x83,
//   71 	0x41, 0x81, 0x80, 0x40
//   72 };
//   73 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   74 void UART1_SendByte(u8 data)
//   75 {
UART1_SendByte:
        PUSH      S:?b8
        LD        S:?b8, A
//   76 	UART1_SendData8((unsigned char)data);
        LD        A, S:?b8
        CALL      L:UART1_SendData8
//   77 	/* Loop until the end of transmission */
//   78 	while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
??UART1_SendByte_0:
        LDW       X, #0x80
        CALL      L:UART1_GetFlagStatus
        CP        A, #0x0
        JREQ      L:??UART1_SendByte_0
//   79 }
        POP       S:?b8
        RET
//   80 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   81 void UART1_SendString(u8* Data,u16 len)
//   82 {
UART1_SendString:
        CALL      L:?push_l2
        CALL      L:?push_w6
        LDW       S:?w6, X
        LDW       S:?w5, Y
//   83 	u16 i=0;
        CLR       S:?b9
        CLR       S:?b8
//   84 	for(i=0;i<len;i++)
        CLRW      X
        LDW       S:?w4, X
??UART1_SendString_0:
        LDW       X, S:?w4
        CPW       X, S:?w5
        JRNC      L:??UART1_SendString_1
//   85 		UART1_SendByte(Data[i]); 
        LDW       X, S:?w4
        ADDW      X, S:?w6
        LD        A, (X)
        CALL      L:UART1_SendByte
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
        JRA       L:??UART1_SendString_0
//   86 }
??UART1_SendString_1:
        JP        L:?epilogue_l2_w6
//   87 
//   88 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   89  void UART_clear_buf(void)
//   90 {
//   91 	u16 i;
//   92 	usart1info.write = 0;
UART_clear_buf:
        CLRW      X
        LDW       L:usart1info + 23, X
//   93 	usart1info.Rx_delay_CNT = 0;
        CLRW      X
        LDW       L:usart1info + 46, X
//   94 	for(i = 0; i < USART_DATA_SIZE ; i++)
        CLRW      X
        LDW       Y, X
??UART_clear_buf_0:
        CPW       Y, #0x14
        JRNC      L:??UART_clear_buf_1
//   95 		usart1info.data[i] =0xFF;
        LD        A, #0xff
        LDW       X, Y
        LD        (L:usart1info,X), A
        LDW       X, Y
        INCW      X
        LDW       Y, X
        JRA       L:??UART_clear_buf_0
//   96 }
??UART_clear_buf_1:
        RET
//   97 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   98 static u16 ModbusRTU_CRC(unsigned char *pucFrame, u16 usLen)
//   99 {
ModbusRTU_CRC:
        LDW       S:?w0, X
        LDW       S:?w1, Y
//  100 	unsigned char	ucCRCHi = 0xFF;
        MOV       S:?b7, #0xff
//  101 	unsigned char	       ucCRCLo = 0xFF;
        MOV       S:?b6, #0xff
//  102 	u16      iIndex = 0;
        CLRW      Y
//  103 
//  104 	while( usLen-- )
??ModbusRTU_CRC_0:
        CALL      L:?mov_w2_w1
        LDW       X, S:?w2
        DECW      X
        LDW       S:?w1, X
        LDW       X, S:?w2
        TNZW      X
        JREQ      L:??ModbusRTU_CRC_1
//  105 	{
//  106 		iIndex = ucCRCHi ^ *( pucFrame++ );
        LD        A, [S:?w0.w]
        XOR       A, S:?b7
        CLRW      X
        LD        XL, A
        LDW       Y, X
        LDW       X, S:?w0
        INCW      X
        LDW       S:?w0, X
//  107 		ucCRCHi	 = (unsigned char)( ucCRCLo ^ aucCRCHi[iIndex] );
        LD        A, S:?b6
        LDW       X, Y
        XOR       A, (L:aucCRCHi,X)
        LD        S:?b7, A
//  108 		ucCRCLo = aucCRCLo[iIndex];
        LDW       X, Y
        LD        A, (L:aucCRCLo,X)
        LD        S:?b6, A
        JRA       L:??ModbusRTU_CRC_0
//  109 	}
//  110 
//  111 	return (u16)( ucCRCHi << 8 | ucCRCLo );
??ModbusRTU_CRC_1:
        CLRW      X
        EXG       A, XL
        LD        A, S:?b7
        EXG       A, XL
        CLR       A
        RLWA      X, A
        LDW       S:?w2, X
        CLRW      X
        EXG       A, XL
        LD        A, S:?b6
        EXG       A, XL
        LDW       S:?w3, X
        LDW       X, S:?w2
        RRWA      X, A
        OR        A, S:?b7
        RRWA      X, A
        OR        A, S:?b6
        RRWA      X, A
        RET
//  112 }
//  113 //33 03 00 00 00 01 80 18 
//  114 //  ID 1   CMD 1  address 2  quantity 2  CRC 2 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  115 static void ReadHoldingRegisters_Handle(void)
//  116 {
ReadHoldingRegisters_Handle:
        CALL      L:?push_l2
        CALL      L:?push_l3
//  117 	unsigned char  i,byte_index;
//  118 	u16	dat_CRC,dat_Quantity,dat_Address;
//  119 	//u16 temp;
//  120 
//  121 	src_crc = ModbusRTU_CRC(usart1info.data,6); // 检验前六个字节    
        LDW       Y, #0x6
        LDW       X, #usart1info
        CALL      L:ModbusRTU_CRC
        LDW       L:src_crc, X
//  122 
//  123 	dst_crc = usart1info.data[6] ;	
        LD        A, L:usart1info + 6
        CLRW      X
        LD        XL, A
        LDW       L:dst_crc, X
//  124 	dst_crc =  (dst_crc<< 8 | usart1info.data[7]);
        LD        A, L:usart1info + 7
        CLRW      X
        LD        XL, A
        LDW       S:?w0, X
        LDW       X, L:dst_crc
        CLR       A
        RLWA      X, A
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        LDW       L:dst_crc, X
//  125 	
//  126 	//CRC添加到消息中时，低字节先加入，然后高字节。
//  127 	if(src_crc ==dst_crc) 
        LDW       X, L:src_crc
        CPW       X, L:dst_crc
        JRNE      L:??ReadHoldingRegisters_Handle_0
//  128 		usart1info.CRCerror = 0; //CRC校验正确
        MOV       L:usart1info + 22, #0x0
        JRA       L:??ReadHoldingRegisters_Handle_1
//  129 	else 
//  130 		usart1info.CRCerror = 1; //CRC校验出错
??ReadHoldingRegisters_Handle_0:
        MOV       L:usart1info + 22, #0x1
//  131 		
//  132 	if((usart1info.slaveID == sensor_id) && (usart1info.CRCerror == 0))//从机地址正确  CRC校验正确  接着往下处理
??ReadHoldingRegisters_Handle_1:
        LD        A, L:sensor_id
        CP        A, L:usart1info + 20
        JREQ      ??lb_10
        JP        L:??ReadHoldingRegisters_Handle_2
??lb_10:
        LD        A, L:usart1info + 22
        CP        A, #0x0
        JREQ      ??lb_11
        JP        L:??ReadHoldingRegisters_Handle_2
//  133 	{
//  134 		dat_Quantity = (u16)((usart1info.data[4] << 8 )| (usart1info.data[5])); 	//Quantity of Outputs 在消息中  高位在前  低位在后
??lb_11:
        LD        A, L:usart1info + 4
        CLRW      X
        LD        XL, A
        CLR       A
        RLWA      X, A
        LDW       Y, X
        LD        A, L:usart1info + 5
        CLRW      X
        LD        XL, A
        LDW       S:?w0, X
        LDW       X, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        LDW       S:?w5, X
//  135 		if(dat_Quantity >= 0x01 && dat_Quantity <= 0x10)  		//0x0001 <= Quantity of Outputs <= 0x0010
        LDW       X, S:?w5
        TNZW      X
        JRNE      ??lb_12
        JP        L:??ReadHoldingRegisters_Handle_3
??lb_12:
        LDW       X, S:?w5
        CPW       X, #0x11
        JRC       ??lb_13
        JP        L:??ReadHoldingRegisters_Handle_3
//  136 		{
//  137 			dat_Address = (u16)((usart1info.data[2] << 8) | (usart1info.data[3])); //Address在消息中  高位在前  低位在后
??lb_13:
        LD        A, L:usart1info + 2
        CLRW      X
        LD        XL, A
        CLR       A
        RLWA      X, A
        LDW       Y, X
        LD        A, L:usart1info + 3
        CLRW      X
        LD        XL, A
        LDW       S:?w0, X
        LDW       X, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        LDW       S:?w7, X
//  138 
//  139 			if((dat_Address + dat_Quantity) <= HOLDINGREG_DATA_SIZE)  //Address 要在范围之内
        LDW       X, S:?w5
        ADDW      X, S:?w7
        CPW       X, #0x25
        JRC       ??lb_14
        JP        L:??ReadHoldingRegisters_Handle_4
//  140 			{
//  141 				byte_index = (unsigned char )dat_Quantity * 2;
??lb_14:
        LD        A, S:?b11
        MOV       S:?b0, #0x2
        LD        XL, A
        LD        A, S:?b0
        MUL       X, A
        LD        A, XL
        LD        S:?b9, A
//  142 				
//  143 				usart1info.send[0] = sensor_id;
        LD        A, L:sensor_id
        LD        L:usart1info + 26, A
//  144 				usart1info.send[1] = usart1info.function;
        LD        A, L:usart1info + 25
        LD        L:usart1info + 27, A
//  145 				usart1info.send[2] = byte_index; 
        LD        A, S:?b9
        LD        L:usart1info + 28, A
//  146 
//  147 				for(i = 0; i < byte_index; i++) //读取相应的寄存器的值
        CLR       A
        LD        S:?b8, A
??ReadHoldingRegisters_Handle_5:
        LD        A, S:?b8
        CP        A, S:?b9
        JRNC      L:??ReadHoldingRegisters_Handle_6
//  148 				{
//  149 					usart1info.send[i  + 3] = (unsigned char )(HoldingReg_data[dat_Address + i] );
        CLRW      X
        EXG       A, XL
        LD        A, S:?b8
        EXG       A, XL
        ADDW      X, S:?w7
        LD        A, (L:HoldingReg_data,X)
        CLRW      X
        EXG       A, XL
        LD        A, S:?b8
        EXG       A, XL
        ADDW      X, #usart1info + 29
        LD        (X), A
//  150 				}
        LD        A, S:?b8
        ADD       A, #0x1
        LD        S:?b8, A
        JRA       L:??ReadHoldingRegisters_Handle_5
//  151 
//  152 				dat_CRC = ModbusRTU_CRC(usart1info.send,byte_index + 3); 
??ReadHoldingRegisters_Handle_6:
        CLRW      Y
        EXG       A, YL
        LD        A, S:?b9
        EXG       A, YL
        ADDW      Y, #0x3
        LDW       X, #usart1info + 26
        CALL      L:ModbusRTU_CRC
        LDW       S:?w6, X
//  153 				usart1info.send[byte_index + 4] = (unsigned char )(dat_CRC & 0x00FF);
        CLRW      X
        EXG       A, XL
        LD        A, S:?b9
        EXG       A, XL
        ADDW      X, #usart1info + 30
        LD        A, S:?b13
        LD        (X), A
//  154 				usart1info.send[byte_index + 3] = (unsigned char )(dat_CRC >> 8);
        CLRW      X
        EXG       A, XL
        LD        A, S:?b9
        EXG       A, XL
        ADDW      X, #usart1info + 29
        LDW       Y, X
        LDW       X, S:?w6
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        (Y), A
//  155 				GPIO_WriteHigh(GPIOD,GPIO_PIN_4);
        LD        A, #0x10
        LDW       X, #0x500f
        CALL      L:GPIO_WriteHigh
//  156 				Delay(5);
        LDW       X, #0x5
        CALL      L:Delay
//  157 				bsp_ModbusRTUSlave_Tx(usart1info.send, byte_index + 5); //发送相应的消息给主机
        CLRW      Y
        EXG       A, YL
        LD        A, S:?b9
        EXG       A, YL
        ADDW      Y, #0x5
        LDW       X, #usart1info + 26
        CALL      L:bsp_ModbusRTUSlave_Tx
//  158                       
//  159 				Delay(2500);
        LDW       X, #0x9c4
        CALL      L:Delay
        JRA       L:??ReadHoldingRegisters_Handle_2
//  160 			//	GPIO_WriteLow(GPIOD,GPIO_PIN_4);
//  161 			}
//  162 			
//  163 			else 
//  164 				usart1info.exceptionCode = 0x02; //错误类型：Address 不在范围之内
??ReadHoldingRegisters_Handle_4:
        MOV       L:usart1info + 21, #0x2
        JRA       L:??ReadHoldingRegisters_Handle_2
//  165 		}
//  166 		
//  167 		else  
//  168 			usart1info.exceptionCode = 0x03; //错误类型：Quantity of Outputs 不在范围之内
??ReadHoldingRegisters_Handle_3:
        MOV       L:usart1info + 21, #0x3
//  169 	} 
//  170 }
??ReadHoldingRegisters_Handle_2:
        JP        L:?epilogue_l2_l3
//  171 
//  172 
//  173 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  174 static void WriteSingleRegister_Handle(void)
//  175 {
WriteSingleRegister_Handle:
        CALL      L:?push_w4
        CALL      L:?push_w6
        PUSH      S:?b10
//  176 	unsigned char i;
//  177 	u16 dat_Value,dat_Address;
//  178 //        u16 dat_CRC;
//  179 	
//  180 	src_crc = ModbusRTU_CRC(usart1info.data,6); // 检验前六个字节    
        LDW       Y, #0x6
        LDW       X, #usart1info
        CALL      L:ModbusRTU_CRC
        LDW       L:src_crc, X
//  181 	dst_crc = usart1info.data[6] ;	
        LD        A, L:usart1info + 6
        CLRW      X
        LD        XL, A
        LDW       L:dst_crc, X
//  182 	dst_crc =  (dst_crc<< 8 | usart1info.data[7]);
        LD        A, L:usart1info + 7
        CLRW      X
        LD        XL, A
        LDW       S:?w0, X
        LDW       X, L:dst_crc
        CLR       A
        RLWA      X, A
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        LDW       L:dst_crc, X
//  183 	
//  184 	//CRC添加到消息中时，低字节先加入，然后高字节。
//  185 	if(src_crc ==dst_crc) 
        LDW       X, L:src_crc
        CPW       X, L:dst_crc
        JRNE      L:??WriteSingleRegister_Handle_0
//  186 		usart1info.CRCerror = 0; //CRC校验正确
        MOV       L:usart1info + 22, #0x0
        JRA       L:??WriteSingleRegister_Handle_1
//  187 	else
//  188 		usart1info.CRCerror = 1; //CRC校验出错
??WriteSingleRegister_Handle_0:
        MOV       L:usart1info + 22, #0x1
//  189 
//  190 	if((usart1info.slaveID == sensor_id) && (usart1info.CRCerror == 0))//从机地址正确  CRC校验正确  接着往下处理
??WriteSingleRegister_Handle_1:
        LD        A, L:sensor_id
        CP        A, L:usart1info + 20
        JREQ      ??lb_8
        JP        L:??WriteSingleRegister_Handle_2
??lb_8:
        LD        A, L:usart1info + 22
        CP        A, #0x0
        JREQ      ??lb_9
        JP        L:??WriteSingleRegister_Handle_2
//  191 	{
//  192 		dat_Value = (u16)(usart1info.data[4] << 8 | usart1info.data[5]); //Register Value 在消息中  高位在前  低位在后
??lb_9:
        LD        A, L:usart1info + 4
        CLRW      X
        LD        XL, A
        CLR       A
        RLWA      X, A
        LDW       Y, X
        LD        A, L:usart1info + 5
        CLRW      X
        LD        XL, A
        LDW       S:?w0, X
        LDW       X, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        LDW       S:?w6, X
//  193 		dat_Address = (u16)(usart1info.data[2] << 8 | usart1info.data[3]); //Address在消息中  高位在前  低位在后
        LD        A, L:usart1info + 2
        CLRW      X
        LD        XL, A
        CLR       A
        RLWA      X, A
        LDW       Y, X
        LD        A, L:usart1info + 3
        CLRW      X
        LD        XL, A
        LDW       S:?w0, X
        LDW       X, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        LDW       S:?w4, X
//  194 		
//  195 		if(dat_Address < HOLDINGREG_DATA_SIZE)  //Address 要在范围之内
        LDW       X, S:?w4
        CPW       X, #0x24
        JRNC      L:??WriteSingleRegister_Handle_3
//  196 		{
//  197 			HoldingReg_data[dat_Address] = dat_Value; //将相应的值写入寄存器
        LD        A, S:?b13
        LDW       X, S:?w4
        LD        (L:HoldingReg_data,X), A
//  198 
//  199 			for(i = 0; i < 8; i++) 
        CLR       A
        LD        S:?b10, A
??WriteSingleRegister_Handle_4:
        LD        A, S:?b10
        CP        A, #0x8
        JRNC      L:??WriteSingleRegister_Handle_5
//  200 				usart1info.send[i] = usart1info.data[i]; //将接收到的消息直接反馈给主机
        CLRW      X
        EXG       A, XL
        LD        A, S:?b10
        EXG       A, XL
        ADDW      X, #usart1info + 26
        LDW       Y, X
        CLRW      X
        EXG       A, XL
        LD        A, S:?b10
        EXG       A, XL
        LD        A, (L:usart1info,X)
        LD        (Y), A
        LD        A, S:?b10
        ADD       A, #0x1
        LD        S:?b10, A
        JRA       L:??WriteSingleRegister_Handle_4
//  201 			GPIO_WriteHigh(GPIOD,GPIO_PIN_4);
??WriteSingleRegister_Handle_5:
        LD        A, #0x10
        LDW       X, #0x500f
        CALL      L:GPIO_WriteHigh
//  202 			Delay(2);
        LDW       X, #0x2
        CALL      L:Delay
//  203 			bsp_ModbusRTUSlave_Tx(usart1info.send, 8); //发送相应的消息给主机
        LDW       Y, #0x8
        LDW       X, #usart1info + 26
        CALL      L:bsp_ModbusRTUSlave_Tx
//  204 			Delay(4);
        LDW       X, #0x4
        CALL      L:Delay
        JRA       L:??WriteSingleRegister_Handle_2
//  205 			//GPIO_WriteLow(GPIOD,GPIO_PIN_4);
//  206 			//modbus_set_buff();
//  207 		}
//  208 		else 
//  209 			usart1info.exceptionCode = 0x02; //错误类型：Address 不在范围之内
??WriteSingleRegister_Handle_3:
        MOV       L:usart1info + 21, #0x2
//  210 	} 
//  211 }
??WriteSingleRegister_Handle_2:
        POP       S:?b10
        CALL      L:?pop_w6
        JP        L:?epilogue_w4
//  212 
//  213 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  214 static void WriteMultipleregisters_Handle(void)
//  215 {
WriteMultipleregisters_Handle:
        CALL      L:?push_l3
        CALL      L:?push_w5
        PUSH      S:?b8
//  216 	unsigned char  i;
//  217 	u16 dat_CRC,dat_Address,dat_Quantity;
//  218 
//  219 	src_crc = ModbusRTU_CRC(usart1info.data, usart1info.data[6] + 7); // 检验前N个字节 
        LD        A, L:usart1info + 6
        CLRW      Y
        LD        YL, A
        ADDW      Y, #0x7
        LDW       X, #usart1info
        CALL      L:ModbusRTU_CRC
        LDW       L:src_crc, X
//  220 	dst_crc = usart1info.data[6] ;	
        LD        A, L:usart1info + 6
        CLRW      X
        LD        XL, A
        LDW       L:dst_crc, X
//  221 	dst_crc =  (dst_crc<< 8 | usart1info.data[7]);
        LD        A, L:usart1info + 7
        CLRW      X
        LD        XL, A
        LDW       S:?w0, X
        LDW       X, L:dst_crc
        CLR       A
        RLWA      X, A
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        LDW       L:dst_crc, X
//  222 	
//  223 	//CRC添加到消息中时，低字节先加入，然后高字节。
//  224 	if(src_crc ==dst_crc) 
        LDW       X, L:src_crc
        CPW       X, L:dst_crc
        JRNE      L:??WriteMultipleregisters_Handle_0
//  225 		usart1info.CRCerror = 0; //CRC校验正确
        MOV       L:usart1info + 22, #0x0
        JRA       L:??WriteMultipleregisters_Handle_1
//  226 	else                                                         
//  227 		usart1info.CRCerror = 1; //CRC校验出错
??WriteMultipleregisters_Handle_0:
        MOV       L:usart1info + 22, #0x1
//  228 
//  229 	if((usart1info.slaveID == sensor_id) && (usart1info.CRCerror == 0))//从机地址正确  CRC校验正确  接着往下处理
??WriteMultipleregisters_Handle_1:
        LD        A, L:sensor_id
        CP        A, L:usart1info + 20
        JREQ      ??lb_2
        JP        L:??WriteMultipleregisters_Handle_2
??lb_2:
        LD        A, L:usart1info + 22
        CP        A, #0x0
        JREQ      ??lb_3
        JP        L:??WriteMultipleregisters_Handle_2
//  230 	{
//  231 		dat_Quantity = (u16)(usart1info.data[4] << 8 | usart1info.data[5]); //Quantity of Outputs 在消息中  高位在前  低位在后
??lb_3:
        LD        A, L:usart1info + 4
        CLRW      X
        LD        XL, A
        CLR       A
        RLWA      X, A
        LDW       Y, X
        LD        A, L:usart1info + 5
        CLRW      X
        LD        XL, A
        LDW       S:?w0, X
        LDW       X, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        LDW       S:?w5, X
//  232 		
//  233 		if(dat_Quantity >= 0x0001 && dat_Quantity <= 0x007B && usart1info.data[6] == (dat_Quantity * 2))  //0x0001 <= Quantity of Outputs <= 0x007B
        LDW       X, S:?w5
        TNZW      X
        JRNE      ??lb_4
        JP        L:??WriteMultipleregisters_Handle_3
??lb_4:
        LDW       X, S:?w5
        CPW       X, #0x7c
        JRC       ??lb_5
        JP        L:??WriteMultipleregisters_Handle_3
??lb_5:
        LD        A, L:usart1info + 6
        CLRW      X
        LD        XL, A
        LDW       S:?w0, X
        LDW       X, S:?w5
        SLLW      X
        CPW       X, S:?w0
        JREQ      ??lb_6
        JP        L:??WriteMultipleregisters_Handle_3
//  234 		{
//  235 			dat_Address = (u16)(usart1info.data[2] << 8 | usart1info.data[3]); //Address在消息中  高位在前  低位在后
??lb_6:
        LD        A, L:usart1info + 2
        CLRW      X
        LD        XL, A
        CLR       A
        RLWA      X, A
        LDW       Y, X
        LD        A, L:usart1info + 3
        CLRW      X
        LD        XL, A
        LDW       S:?w0, X
        LDW       X, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        LDW       S:?w7, X
//  236 			
//  237 			if((dat_Address + dat_Quantity) <= HOLDINGREG_DATA_SIZE)  //Address 要在范围之内
        LDW       X, S:?w5
        ADDW      X, S:?w7
        CPW       X, #0x25
        JRC       ??lb_7
        JP        L:??WriteMultipleregisters_Handle_4
//  238 			{
//  239 				for(i = 0; i < dat_Quantity; i++) //写入相应的寄存器的值
??lb_7:
        CLR       A
        LD        S:?b8, A
??WriteMultipleregisters_Handle_5:
        CLRW      X
        EXG       A, XL
        LD        A, S:?b8
        EXG       A, XL
        CPW       X, S:?w5
        JRNC      L:??WriteMultipleregisters_Handle_6
//  240 				{
//  241 					HoldingReg_data[dat_Address + i] = (u16)(usart1info.data[i * 2 + 7] << 8 | usart1info.data[i * 2 + 8]);
        CLRW      X
        EXG       A, XL
        LD        A, S:?b8
        EXG       A, XL
        SLLW      X
        ADDW      X, #usart1info + 8
        LD        A, (X)
        CLRW      X
        EXG       A, XL
        LD        A, S:?b8
        EXG       A, XL
        ADDW      X, S:?w7
        LD        (L:HoldingReg_data,X), A
//  242 				}
        LD        A, S:?b8
        ADD       A, #0x1
        LD        S:?b8, A
        JRA       L:??WriteMultipleregisters_Handle_5
//  243 
//  244 				for(i = 0; i < 6; i++) 
??WriteMultipleregisters_Handle_6:
        CLR       A
        LD        S:?b8, A
??WriteMultipleregisters_Handle_7:
        LD        A, S:?b8
        CP        A, #0x6
        JRNC      L:??WriteMultipleregisters_Handle_8
//  245 					usart1info.send[i] = usart1info.data[i]; //将接收到的消息的前一部分+CRC反馈给主机
        CLRW      X
        EXG       A, XL
        LD        A, S:?b8
        EXG       A, XL
        ADDW      X, #usart1info + 26
        LDW       Y, X
        CLRW      X
        EXG       A, XL
        LD        A, S:?b8
        EXG       A, XL
        LD        A, (L:usart1info,X)
        LD        (Y), A
        LD        A, S:?b8
        ADD       A, #0x1
        LD        S:?b8, A
        JRA       L:??WriteMultipleregisters_Handle_7
//  246 					
//  247 				dat_CRC = ModbusRTU_CRC(usart1info.send,6); 
??WriteMultipleregisters_Handle_8:
        LDW       Y, #0x6
        LDW       X, #usart1info + 26
        CALL      L:ModbusRTU_CRC
        LDW       S:?w6, X
//  248 				
//  249 				usart1info.send[6] = (unsigned char)(dat_CRC & 0x00FF);
        LD        A, S:?b13
        LD        L:usart1info + 32, A
//  250 				usart1info.send[7] = (unsigned char)(dat_CRC >> 8);
        LDW       X, S:?w6
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:usart1info + 33, A
//  251 				GPIO_WriteHigh(GPIOD,GPIO_PIN_4);
        LD        A, #0x10
        LDW       X, #0x500f
        CALL      L:GPIO_WriteHigh
//  252 				Delay(2);
        LDW       X, #0x2
        CALL      L:Delay
//  253 				bsp_ModbusRTUSlave_Tx(usart1info.send, 8); //发送相应的消息给主机 
        LDW       Y, #0x8
        LDW       X, #usart1info + 26
        CALL      L:bsp_ModbusRTUSlave_Tx
//  254 				Delay(4);
        LDW       X, #0x4
        CALL      L:Delay
        JRA       L:??WriteMultipleregisters_Handle_2
//  255 			//	GPIO_WriteLow(GPIOD,GPIO_PIN_4);
//  256 				//modbus_set_buff();
//  257 			}
//  258 			else usart1info.exceptionCode = 0x02; //错误类型：Address 不在范围之内
??WriteMultipleregisters_Handle_4:
        MOV       L:usart1info + 21, #0x2
        JRA       L:??WriteMultipleregisters_Handle_2
//  259 		}
//  260 		else  usart1info.exceptionCode = 0x03; //错误类型：Quantity of Outputs 不在范围之内
??WriteMultipleregisters_Handle_3:
        MOV       L:usart1info + 21, #0x3
//  261 	}
//  262 }
??WriteMultipleregisters_Handle_2:
        POP       S:?b8
        CALL      L:?pop_w5
        CALL      L:?pop_l3
        RET
//  263 
//  264 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  265 void bsp_ModbusRTUSlave_Tx(unsigned char *pt_send, u16 lenght)
//  266 {
bsp_ModbusRTUSlave_Tx:
        CALL      L:?push_l2
        LDW       S:?w5, X
        LDW       S:?w4, Y
//  267     //u16 i; 
//  268     
//  269     UART1_SendString(pt_send,lenght);
        LDW       Y, S:?w4
        LDW       X, S:?w5
        CALL      L:UART1_SendString
//  270 }
        JP        L:?epilogue_l2
//  271 
//  272 
//  273 // 01 03 00 00 00 02 c4 0b 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  274 void bsp_ModbusRTUSlave_decode(void)
//  275 { 
bsp_ModbusRTUSlave_decode:
        CALL      L:?push_w4
//  276 	u16 dat_buff;
//  277 
//  278 	if(usart1info.write > 0 && usart1info.Rx_delay_CNT > 4)//缓冲区接收到数据  延时200ms再处理
        LDW       X, L:usart1info + 23
        TNZW      X
        JRNE      ??lb_0
        JP        L:??bsp_ModbusRTUSlave_decode_0
??lb_0:
        LDW       X, L:usart1info + 46
        CPW       X, #0x5
        JRNC      ??lb_1
        JP        L:??bsp_ModbusRTUSlave_decode_0
//  279 	{ 
//  280 		usart1info.slaveID = usart1info.data[0];
??lb_1:
        LD        A, L:usart1info
        LD        L:usart1info + 20, A
//  281 		usart1info.function = usart1info.data[1];
        LD        A, L:usart1info + 1
        LD        L:usart1info + 25, A
//  282 		usart1info.exceptionCode = 0x00; // 错误类型清零
        MOV       L:usart1info + 21, #0x0
//  283 		
//  284 		switch(usart1info.function)
        LD        A, L:usart1info + 25
        CP        A, #0x3
        JREQ      L:??bsp_ModbusRTUSlave_decode_1
        CP        A, #0x6
        JREQ      L:??bsp_ModbusRTUSlave_decode_2
        CP        A, #0x10
        JREQ      L:??bsp_ModbusRTUSlave_decode_3
        JRA       L:??bsp_ModbusRTUSlave_decode_4
//  285 		{
//  286                     
//  287 			//case 0x01:ReadCoils_Handle();break;  //Read Coils 这种"位"是可读写的，在PLC中为可读写的线圈，如数字量输出、中间继电器等
//  288 			//case 0x02:ReadDiscreteInputs_Handle();break;  //Read Discrete Inputs 这种"位"是只读的，不能进行写操作，在PLC中为只读的线圈，如数字量输入
//  289 			case 0x03:
//  290 				ReadHoldingRegisters_Handle();
??bsp_ModbusRTUSlave_decode_1:
        CALL      L:ReadHoldingRegisters_Handle
//  291 				break;  //Read Holding Registers  这种寄存器可读写  0x0001 <= Quantity of Registers <= 0x007D
        JRA       L:??bsp_ModbusRTUSlave_decode_5
//  292 			//case 0x04:ReadInputRegisters_Handle();break;  //Read Input Registers    这种寄存器只能读，不能写
//  293 			//case 0x05:WriteSingleCoil_Handle();break;  //Write Single Coil
//  294 			case 0x06:
//  295 				WriteSingleRegister_Handle();
??bsp_ModbusRTUSlave_decode_2:
        CALL      L:WriteSingleRegister_Handle
//  296 				break;  //Write Single Register
        JRA       L:??bsp_ModbusRTUSlave_decode_5
//  297 			//case 0x0F:WriteMultipleCoils_Handle();break;  //Write Multiple Coils 
//  298 			case 0x10:
//  299 				WriteMultipleregisters_Handle();
??bsp_ModbusRTUSlave_decode_3:
        CALL      L:WriteMultipleregisters_Handle
//  300 				break;  //Write Multiple registers   0x0001 <= Quantity of Registers <= 0x007B
        JRA       L:??bsp_ModbusRTUSlave_decode_5
//  301 			default : 
//  302 				break; //usart1info.exceptionCode = 0x01;注释掉了，用不着，而且还会有误判的情况，错误类型：功能号不支持
//  303 		}
//  304 		//发送故障信息给主机
//  305 		if(usart1info.exceptionCode != 0 && usart1info.slaveID == sensor_id)
??bsp_ModbusRTUSlave_decode_4:
??bsp_ModbusRTUSlave_decode_5:
        LD        A, L:usart1info + 21
        CP        A, #0x0
        JREQ      L:??bsp_ModbusRTUSlave_decode_6
        LD        A, L:sensor_id
        CP        A, L:usart1info + 20
        JRNE      L:??bsp_ModbusRTUSlave_decode_6
//  306 		{
//  307 			usart1info.send[0] = sensor_id;
        LD        A, L:sensor_id
        LD        L:usart1info + 26, A
//  308 			usart1info.send[1] = usart1info.function | 0x80;//function + 0x80
        LD        A, L:usart1info + 25
        OR        A, #0x80
        LD        L:usart1info + 27, A
//  309 			usart1info.send[2] = usart1info.exceptionCode;
        LD        A, L:usart1info + 21
        LD        L:usart1info + 28, A
//  310 
//  311 			dat_buff = ModbusRTU_CRC(usart1info.send,3);
        LDW       Y, #0x3
        LDW       X, #usart1info + 26
        CALL      L:ModbusRTU_CRC
        LDW       S:?w4, X
//  312 
//  313 			usart1info.send[3] = (unsigned char )(dat_buff & 0x00FF);
        LD        A, S:?b9
        LD        L:usart1info + 29, A
//  314 			usart1info.send[4] = (unsigned char )(dat_buff >> 8);
        LDW       X, S:?w4
        CLR       A
        RRWA      X, A
        LD        A, XL
        LD        L:usart1info + 30, A
//  315 			GPIO_WriteHigh(GPIOD,GPIO_PIN_4);
        LD        A, #0x10
        LDW       X, #0x500f
        CALL      L:GPIO_WriteHigh
//  316 			Delay(2);
        LDW       X, #0x2
        CALL      L:Delay
//  317 			bsp_ModbusRTUSlave_Tx(usart1info.send, 5); //发送相应的消息给主机
        LDW       Y, #0x5
        LDW       X, #usart1info + 26
        CALL      L:bsp_ModbusRTUSlave_Tx
//  318 			Delay(4);
        LDW       X, #0x4
        CALL      L:Delay
//  319 			GPIO_WriteLow(GPIOD,GPIO_PIN_4);
        LD        A, #0x10
        LDW       X, #0x500f
        CALL      L:GPIO_WriteLow
//  320 		}
//  321 
//  322 		UART_clear_buf();
??bsp_ModbusRTUSlave_decode_6:
        CALL      L:UART_clear_buf
//  323                 usart1info.write = 0;
        CLRW      X
        LDW       L:usart1info + 23, X
//  324                 usart1info.Rx_delay_CNT = 0;
        CLRW      X
        LDW       L:usart1info + 46, X
//  325 	}
//  326 }
??bsp_ModbusRTUSlave_decode_0:
        JP        L:?epilogue_w4

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  327 /*
//  328 void modbus_set_buff()
//  329 {
//  330 
//  331 }
//  332 
//  333 //将数据放入modbuf   里面
//  334 void modbus_put_buff()
//  335 {
//  336 	unsigned int num;
//  337 	memset(HoldingReg_data,0,HOLDINGREG_DATA_SIZE);
//  338 	HoldingReg_data[0] = optimal_light_strength>>8;
//  339 	HoldingReg_data[1] = optimal_light_strength&0xff;
//  340 }
//  341 */
//  342 
// 
//   194 bytes in section .near.bss
//   512 bytes in section .near.rodata
// 1 315 bytes in section .near_func.text
// 
// 1 315 bytes of CODE  memory
//   512 bytes of CONST memory
//   194 bytes of DATA  memory
//
//Errors: none
//Warnings: 4
