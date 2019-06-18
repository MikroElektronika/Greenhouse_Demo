_Write_to_Data_Lines:
;MikromediaGreenhouseProject_driver.c,465 :: 		void Write_to_Data_Lines(unsigned char _hi, unsigned char _lo) {
; _lo start address is: 4 (R1)
; _hi start address is: 0 (R0)
; _lo end address is: 4 (R1)
; _hi end address is: 0 (R0)
; _hi start address is: 0 (R0)
; _lo start address is: 4 (R1)
;MikromediaGreenhouseProject_driver.c,467 :: 		temp = GPIOE_ODR;
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
; temp start address is: 8 (R2)
LDR	R2, [R2, #0]
;MikromediaGreenhouseProject_driver.c,468 :: 		temp &= 0x00FF;
AND	R3, R2, #255
UXTH	R3, R3
; temp end address is: 8 (R2)
;MikromediaGreenhouseProject_driver.c,469 :: 		GPIOE_ODR = temp | (_hi << 8);
LSLS	R2, R0, #8
UXTH	R2, R2
; _hi end address is: 0 (R0)
ORRS	R3, R2
UXTH	R3, R3
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,470 :: 		temp = GPIOG_ODR;
MOVW	R2, #lo_addr(GPIOG_ODR+0)
MOVT	R2, #hi_addr(GPIOG_ODR+0)
; temp start address is: 0 (R0)
LDR	R0, [R2, #0]
;MikromediaGreenhouseProject_driver.c,471 :: 		temp &= 0xFF00;
AND	R2, R0, #65280
UXTH	R2, R2
; temp end address is: 0 (R0)
;MikromediaGreenhouseProject_driver.c,472 :: 		GPIOG_ODR = temp | _lo;
ORR	R3, R2, R1, LSL #0
UXTH	R3, R3
; _lo end address is: 4 (R1)
MOVW	R2, #lo_addr(GPIOG_ODR+0)
MOVT	R2, #hi_addr(GPIOG_ODR+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,473 :: 		}
L_end_Write_to_Data_Lines:
BX	LR
; end of _Write_to_Data_Lines
_Set_Index:
;MikromediaGreenhouseProject_driver.c,475 :: 		void Set_Index(unsigned short index) {
; index start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; index end address is: 0 (R0)
; index start address is: 0 (R0)
;MikromediaGreenhouseProject_driver.c,476 :: 		TFT_RS = 0;
MOVW	R2, #lo_addr(GPIOF_ODR+0)
MOVT	R2, #hi_addr(GPIOF_ODR+0)
LDR	R1, [R2, #0]
BFC	R1, #15, #1
STR	R1, [R2, #0]
;MikromediaGreenhouseProject_driver.c,477 :: 		Write_to_Data_Lines(0, index);
UXTB	R1, R0
; index end address is: 0 (R0)
MOVS	R0, #0
BL	_Write_to_Data_Lines+0
;MikromediaGreenhouseProject_driver.c,478 :: 		TFT_WR = 0;
MOVW	R2, #lo_addr(GPIOF_ODR+0)
MOVT	R2, #hi_addr(GPIOF_ODR+0)
LDR	R1, [R2, #0]
BFC	R1, #11, #1
STR	R1, [R2, #0]
;MikromediaGreenhouseProject_driver.c,479 :: 		asm nop;
NOP
;MikromediaGreenhouseProject_driver.c,480 :: 		TFT_WR = 1;
MOVW	R2, #lo_addr(GPIOF_ODR+0)
MOVT	R2, #hi_addr(GPIOF_ODR+0)
LDR	R1, [R2, #0]
ORR	R1, R1, #2048
STR	R1, [R2, #0]
;MikromediaGreenhouseProject_driver.c,481 :: 		}
L_end_Set_Index:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_Index
_Write_Command:
;MikromediaGreenhouseProject_driver.c,483 :: 		void Write_Command(unsigned short cmd) {
; cmd start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; cmd end address is: 0 (R0)
; cmd start address is: 0 (R0)
;MikromediaGreenhouseProject_driver.c,484 :: 		TFT_RS = 1;
MOVW	R2, #lo_addr(GPIOF_ODR+0)
MOVT	R2, #hi_addr(GPIOF_ODR+0)
LDR	R1, [R2, #0]
ORR	R1, R1, #32768
STR	R1, [R2, #0]
;MikromediaGreenhouseProject_driver.c,485 :: 		Write_to_Data_Lines(0, cmd);
UXTB	R1, R0
; cmd end address is: 0 (R0)
MOVS	R0, #0
BL	_Write_to_Data_Lines+0
;MikromediaGreenhouseProject_driver.c,486 :: 		TFT_WR = 0;
MOVW	R2, #lo_addr(GPIOF_ODR+0)
MOVT	R2, #hi_addr(GPIOF_ODR+0)
LDR	R1, [R2, #0]
BFC	R1, #11, #1
STR	R1, [R2, #0]
;MikromediaGreenhouseProject_driver.c,487 :: 		asm nop;
NOP
;MikromediaGreenhouseProject_driver.c,488 :: 		TFT_WR = 1;
MOVW	R2, #lo_addr(GPIOF_ODR+0)
MOVT	R2, #hi_addr(GPIOF_ODR+0)
LDR	R1, [R2, #0]
ORR	R1, R1, #2048
STR	R1, [R2, #0]
;MikromediaGreenhouseProject_driver.c,489 :: 		}
L_end_Write_Command:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Write_Command
_Write_Data:
;MikromediaGreenhouseProject_driver.c,491 :: 		void Write_Data(unsigned int _data) {
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRH	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,492 :: 		TFT_RS = 1;
MOVW	R2, #lo_addr(GPIOF_ODR+0)
MOVT	R2, #hi_addr(GPIOF_ODR+0)
LDR	R1, [R2, #0]
ORR	R1, R1, #32768
STR	R1, [R2, #0]
;MikromediaGreenhouseProject_driver.c,493 :: 		Write_to_Data_Lines(Hi(_data), Lo(_data));
ADD	R3, SP, #4
LDRB	R1, [R3, #0]
UXTB	R2, R1
ADDS	R1, R3, #1
LDRB	R1, [R1, #0]
UXTB	R0, R1
UXTB	R1, R2
BL	_Write_to_Data_Lines+0
;MikromediaGreenhouseProject_driver.c,494 :: 		TFT_WR = 0;
MOVW	R2, #lo_addr(GPIOF_ODR+0)
MOVT	R2, #hi_addr(GPIOF_ODR+0)
LDR	R1, [R2, #0]
BFC	R1, #11, #1
STR	R1, [R2, #0]
;MikromediaGreenhouseProject_driver.c,495 :: 		asm nop;
NOP
;MikromediaGreenhouseProject_driver.c,496 :: 		TFT_WR = 1;
MOVW	R2, #lo_addr(GPIOF_ODR+0)
MOVT	R2, #hi_addr(GPIOF_ODR+0)
LDR	R1, [R2, #0]
ORR	R1, R1, #2048
STR	R1, [R2, #0]
;MikromediaGreenhouseProject_driver.c,497 :: 		}
L_end_Write_Data:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Write_Data
_TFT_Get_Data:
;MikromediaGreenhouseProject_driver.c,500 :: 		char* TFT_Get_Data(unsigned long offset, unsigned long count, unsigned long *num) {
; offset start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R2, [SP, #16]
MOV	R2, R0
STR	R1, [SP, #12]
; offset end address is: 0 (R0)
; offset start address is: 8 (R2)
;MikromediaGreenhouseProject_driver.c,504 :: 		start_sector = Mmc_Get_File_Write_Sector() + offset/512;
BL	_Mmc_Get_File_Write_Sector+0
LSRS	R3, R2, #9
ADDS	R4, R0, R3
STR	R4, [SP, #4]
;MikromediaGreenhouseProject_driver.c,505 :: 		fpos = (unsigned long)offset%512;
MOVW	R3, #511
AND	R3, R2, R3, LSL #0
; offset end address is: 8 (R2)
STRH	R3, [SP, #8]
;MikromediaGreenhouseProject_driver.c,507 :: 		if(start_sector == currentSector+1) {
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
LDR	R3, [R3, #0]
ADDS	R3, R3, #1
CMP	R4, R3
IT	NE
BNE	L_TFT_Get_Data0
;MikromediaGreenhouseProject_driver.c,508 :: 		Mmc_Multi_Read_Sector(f16_sector.fSect);
MOVW	R0, #lo_addr(_f16_sector+0)
MOVT	R0, #hi_addr(_f16_sector+0)
BL	_Mmc_Multi_Read_Sector+0
;MikromediaGreenhouseProject_driver.c,509 :: 		currentSector = start_sector;
LDR	R4, [SP, #4]
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
STR	R4, [R3, #0]
;MikromediaGreenhouseProject_driver.c,510 :: 		} else if (start_sector != currentSector) {
IT	AL
BAL	L_TFT_Get_Data1
L_TFT_Get_Data0:
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
LDR	R4, [R3, #0]
LDR	R3, [SP, #4]
CMP	R3, R4
IT	EQ
BEQ	L_TFT_Get_Data2
;MikromediaGreenhouseProject_driver.c,511 :: 		if(currentSector != -1)
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
LDR	R3, [R3, #0]
CMP	R3, #-1
IT	EQ
BEQ	L_TFT_Get_Data3
;MikromediaGreenhouseProject_driver.c,512 :: 		Mmc_Multi_Read_Stop();
BL	_Mmc_Multi_Read_Stop+0
L_TFT_Get_Data3:
;MikromediaGreenhouseProject_driver.c,513 :: 		Mmc_Multi_Read_Start(start_sector);
LDR	R0, [SP, #4]
BL	_Mmc_Multi_Read_Start+0
;MikromediaGreenhouseProject_driver.c,514 :: 		Mmc_Multi_Read_Sector(f16_sector.fSect);
MOVW	R0, #lo_addr(_f16_sector+0)
MOVT	R0, #hi_addr(_f16_sector+0)
BL	_Mmc_Multi_Read_Sector+0
;MikromediaGreenhouseProject_driver.c,515 :: 		currentSector = start_sector;
LDR	R4, [SP, #4]
MOVW	R3, #lo_addr(_currentSector+0)
MOVT	R3, #hi_addr(_currentSector+0)
STR	R4, [R3, #0]
;MikromediaGreenhouseProject_driver.c,516 :: 		}
L_TFT_Get_Data2:
L_TFT_Get_Data1:
;MikromediaGreenhouseProject_driver.c,518 :: 		if(count>512-fpos)
LDRH	R3, [SP, #8]
RSB	R4, R3, #512
UXTH	R4, R4
LDR	R3, [SP, #12]
CMP	R3, R4
IT	LS
BLS	L_TFT_Get_Data4
;MikromediaGreenhouseProject_driver.c,519 :: 		*num = 512-fpos;
LDRH	R3, [SP, #8]
RSB	R4, R3, #512
UXTH	R4, R4
LDR	R3, [SP, #16]
STR	R4, [R3, #0]
IT	AL
BAL	L_TFT_Get_Data5
L_TFT_Get_Data4:
;MikromediaGreenhouseProject_driver.c,521 :: 		*num = count;
LDR	R4, [SP, #12]
LDR	R3, [SP, #16]
STR	R4, [R3, #0]
L_TFT_Get_Data5:
;MikromediaGreenhouseProject_driver.c,523 :: 		return f16_sector.fSect+fpos;
LDRH	R4, [SP, #8]
MOVW	R3, #lo_addr(_f16_sector+0)
MOVT	R3, #hi_addr(_f16_sector+0)
ADDS	R3, R3, R4
MOV	R0, R3
;MikromediaGreenhouseProject_driver.c,524 :: 		}
L_end_TFT_Get_Data:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _TFT_Get_Data
MikromediaGreenhouseProject_driver_InitializeTouchPanel:
;MikromediaGreenhouseProject_driver.c,525 :: 		static void InitializeTouchPanel() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MikromediaGreenhouseProject_driver.c,526 :: 		TFT_Set_Active(Set_Index, Write_Command, Write_Data);
MOVW	R2, #lo_addr(_Write_Data+0)
MOVT	R2, #hi_addr(_Write_Data+0)
MOVW	R1, #lo_addr(_Write_Command+0)
MOVT	R1, #hi_addr(_Write_Command+0)
MOVW	R0, #lo_addr(_Set_Index+0)
MOVT	R0, #hi_addr(_Set_Index+0)
BL	_TFT_Set_Active+0
;MikromediaGreenhouseProject_driver.c,527 :: 		TFT_Init_SSD1963_7Inch_800x480(800, 480);
MOVW	R1, #480
MOVW	R0, #800
BL	_TFT_Init_SSD1963_7Inch_800x480+0
;MikromediaGreenhouseProject_driver.c,528 :: 		TFT_Set_Ext_Buffer(TFT_Get_Data);
MOVW	R0, #lo_addr(_TFT_Get_Data+0)
MOVT	R0, #hi_addr(_TFT_Get_Data+0)
BL	_TFT_Set_Ext_Buffer+0
;MikromediaGreenhouseProject_driver.c,530 :: 		TFT_Set_DBC_SSD1963(255);
MOVS	R0, #255
BL	_TFT_Set_DBC_SSD1963+0
;MikromediaGreenhouseProject_driver.c,532 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,533 :: 		PressedObject = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PressedObject+0)
MOVT	R0, #hi_addr(_PressedObject+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,534 :: 		PressedObjectType = -1;
MOVW	R1, #65535
SXTH	R1, R1
MOVW	R0, #lo_addr(_PressedObjectType+0)
MOVT	R0, #hi_addr(_PressedObjectType+0)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,535 :: 		}
L_end_InitializeTouchPanel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of MikromediaGreenhouseProject_driver_InitializeTouchPanel
MikromediaGreenhouseProject_driver_InitializeObjects:
;MikromediaGreenhouseProject_driver.c,801 :: 		static void InitializeObjects() {
;MikromediaGreenhouseProject_driver.c,802 :: 		Screen1.Color                     = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,803 :: 		Screen1.Width                     = 800;
MOVW	R1, #800
MOVW	R0, #lo_addr(_Screen1+2)
MOVT	R0, #hi_addr(_Screen1+2)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,804 :: 		Screen1.Height                    = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Screen1+4)
MOVT	R0, #hi_addr(_Screen1+4)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,805 :: 		Screen1.ButtonsCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+8)
MOVT	R0, #hi_addr(_Screen1+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,806 :: 		Screen1.Buttons_RoundCount        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen1+16)
MOVT	R0, #hi_addr(_Screen1+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,807 :: 		Screen1.Buttons_Round             = Screen1_Buttons_Round;
MOVW	R1, #lo_addr(_Screen1_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen1_Buttons_Round+0)
MOVW	R0, #lo_addr(_Screen1+20)
MOVT	R0, #hi_addr(_Screen1+20)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,808 :: 		Screen1.LabelsCount               = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Screen1+24)
MOVT	R0, #hi_addr(_Screen1+24)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,809 :: 		Screen1.Labels                    = Screen1_Labels;
MOVW	R1, #lo_addr(_Screen1_Labels+0)
MOVT	R1, #hi_addr(_Screen1_Labels+0)
MOVW	R0, #lo_addr(_Screen1+28)
MOVT	R0, #hi_addr(_Screen1+28)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,810 :: 		Screen1.ImagesCount               = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Screen1+32)
MOVT	R0, #hi_addr(_Screen1+32)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,811 :: 		Screen1.Images                    = Screen1_Images;
MOVW	R1, #lo_addr(_Screen1_Images+0)
MOVT	R1, #hi_addr(_Screen1_Images+0)
MOVW	R0, #lo_addr(_Screen1+36)
MOVT	R0, #hi_addr(_Screen1+36)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,812 :: 		Screen1.CirclesCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen1+40)
MOVT	R0, #hi_addr(_Screen1+40)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,813 :: 		Screen1.Circles                   = Screen1_Circles;
MOVW	R1, #lo_addr(_Screen1_Circles+0)
MOVT	R1, #hi_addr(_Screen1_Circles+0)
MOVW	R0, #lo_addr(_Screen1+44)
MOVT	R0, #hi_addr(_Screen1+44)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,814 :: 		Screen1.ProgressBarsCount         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+48)
MOVT	R0, #hi_addr(_Screen1+48)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,815 :: 		Screen1.ObjectsCount              = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_Screen1+6)
MOVT	R0, #hi_addr(_Screen1+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,817 :: 		Screen2.Color                     = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+0)
MOVT	R0, #hi_addr(_Screen2+0)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,818 :: 		Screen2.Width                     = 800;
MOVW	R1, #800
MOVW	R0, #lo_addr(_Screen2+2)
MOVT	R0, #hi_addr(_Screen2+2)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,819 :: 		Screen2.Height                    = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Screen2+4)
MOVT	R0, #hi_addr(_Screen2+4)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,820 :: 		Screen2.ButtonsCount              = 34;
MOVS	R1, #34
MOVW	R0, #lo_addr(_Screen2+8)
MOVT	R0, #hi_addr(_Screen2+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,821 :: 		Screen2.Buttons                   = Screen2_Buttons;
MOVW	R1, #lo_addr(_Screen2_Buttons+0)
MOVT	R1, #hi_addr(_Screen2_Buttons+0)
MOVW	R0, #lo_addr(_Screen2+12)
MOVT	R0, #hi_addr(_Screen2+12)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,822 :: 		Screen2.Buttons_RoundCount        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen2+16)
MOVT	R0, #hi_addr(_Screen2+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,823 :: 		Screen2.Buttons_Round             = Screen2_Buttons_Round;
MOVW	R1, #lo_addr(_Screen2_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen2_Buttons_Round+0)
MOVW	R0, #lo_addr(_Screen2+20)
MOVT	R0, #hi_addr(_Screen2+20)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,824 :: 		Screen2.LabelsCount               = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Screen2+24)
MOVT	R0, #hi_addr(_Screen2+24)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,825 :: 		Screen2.Labels                    = Screen2_Labels;
MOVW	R1, #lo_addr(_Screen2_Labels+0)
MOVT	R1, #hi_addr(_Screen2_Labels+0)
MOVW	R0, #lo_addr(_Screen2+28)
MOVT	R0, #hi_addr(_Screen2+28)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,826 :: 		Screen2.ImagesCount               = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Screen2+32)
MOVT	R0, #hi_addr(_Screen2+32)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,827 :: 		Screen2.Images                    = Screen2_Images;
MOVW	R1, #lo_addr(_Screen2_Images+0)
MOVT	R1, #hi_addr(_Screen2_Images+0)
MOVW	R0, #lo_addr(_Screen2+36)
MOVT	R0, #hi_addr(_Screen2+36)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,828 :: 		Screen2.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+40)
MOVT	R0, #hi_addr(_Screen2+40)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,829 :: 		Screen2.ProgressBarsCount         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen2+48)
MOVT	R0, #hi_addr(_Screen2+48)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,830 :: 		Screen2.ProgressBars              = Screen2_ProgressBars;
MOVW	R1, #lo_addr(_Screen2_ProgressBars+0)
MOVT	R1, #hi_addr(_Screen2_ProgressBars+0)
MOVW	R0, #lo_addr(_Screen2+52)
MOVT	R0, #hi_addr(_Screen2+52)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,831 :: 		Screen2.ObjectsCount              = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Screen2+6)
MOVT	R0, #hi_addr(_Screen2+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,833 :: 		Screen3.Color                     = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+0)
MOVT	R0, #hi_addr(_Screen3+0)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,834 :: 		Screen3.Width                     = 800;
MOVW	R1, #800
MOVW	R0, #lo_addr(_Screen3+2)
MOVT	R0, #hi_addr(_Screen3+2)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,835 :: 		Screen3.Height                    = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Screen3+4)
MOVT	R0, #hi_addr(_Screen3+4)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,836 :: 		Screen3.ButtonsCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+8)
MOVT	R0, #hi_addr(_Screen3+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,837 :: 		Screen3.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+16)
MOVT	R0, #hi_addr(_Screen3+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,838 :: 		Screen3.LabelsCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+24)
MOVT	R0, #hi_addr(_Screen3+24)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,839 :: 		Screen3.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen3+32)
MOVT	R0, #hi_addr(_Screen3+32)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,840 :: 		Screen3.Images                    = Screen3_Images;
MOVW	R1, #lo_addr(_Screen3_Images+0)
MOVT	R1, #hi_addr(_Screen3_Images+0)
MOVW	R0, #lo_addr(_Screen3+36)
MOVT	R0, #hi_addr(_Screen3+36)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,841 :: 		Screen3.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+40)
MOVT	R0, #hi_addr(_Screen3+40)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,842 :: 		Screen3.ProgressBarsCount         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+48)
MOVT	R0, #hi_addr(_Screen3+48)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,843 :: 		Screen3.ObjectsCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen3+6)
MOVT	R0, #hi_addr(_Screen3+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,846 :: 		Image2.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Image2+0)
MOVT	R0, #hi_addr(_Image2+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,847 :: 		Image2.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+4)
MOVT	R0, #hi_addr(_Image2+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,848 :: 		Image2.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+6)
MOVT	R0, #hi_addr(_Image2+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,849 :: 		Image2.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+8)
MOVT	R0, #hi_addr(_Image2+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,850 :: 		Image2.Width           = 800;
MOVW	R1, #800
MOVW	R0, #lo_addr(_Image2+10)
MOVT	R0, #hi_addr(_Image2+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,851 :: 		Image2.Height          = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Image2+12)
MOVT	R0, #hi_addr(_Image2+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,852 :: 		Image2.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+22)
MOVT	R0, #hi_addr(_Image2+22)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,853 :: 		Image2.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+23)
MOVT	R0, #hi_addr(_Image2+23)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,854 :: 		Image2.Picture_Name    = Greenhouse7800x480bmpv2_bmp;
MOVW	R1, #57560
MOVW	R0, #lo_addr(_Image2+16)
MOVT	R0, #hi_addr(_Image2+16)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,855 :: 		Image2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+20)
MOVT	R0, #hi_addr(_Image2+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,856 :: 		Image2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+21)
MOVT	R0, #hi_addr(_Image2+21)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,858 :: 		Image4.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Image4+0)
MOVT	R0, #hi_addr(_Image4+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,859 :: 		Image4.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image4+4)
MOVT	R0, #hi_addr(_Image4+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,860 :: 		Image4.Left            = 590;
MOVW	R1, #590
MOVW	R0, #lo_addr(_Image4+6)
MOVT	R0, #hi_addr(_Image4+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,861 :: 		Image4.Top             = 405;
MOVW	R1, #405
MOVW	R0, #lo_addr(_Image4+8)
MOVT	R0, #hi_addr(_Image4+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,862 :: 		Image4.Width           = 210;
MOVS	R1, #210
MOVW	R0, #lo_addr(_Image4+10)
MOVT	R0, #hi_addr(_Image4+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,863 :: 		Image4.Height          = 75;
MOVS	R1, #75
MOVW	R0, #lo_addr(_Image4+12)
MOVT	R0, #hi_addr(_Image4+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,864 :: 		Image4.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+22)
MOVT	R0, #hi_addr(_Image4+22)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,865 :: 		Image4.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image4+23)
MOVT	R0, #hi_addr(_Image4+23)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,866 :: 		Image4.Picture_Name    = Greenhouse7800x480bmpbuttoncrop1_bmp;
MOVW	R1, #39134
MOVT	R1, #12
MOVW	R0, #lo_addr(_Image4+16)
MOVT	R0, #hi_addr(_Image4+16)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,867 :: 		Image4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image4+20)
MOVT	R0, #hi_addr(_Image4+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,868 :: 		Image4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image4+21)
MOVT	R0, #hi_addr(_Image4+21)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,870 :: 		temperature_label.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_temperature_label+0)
MOVT	R0, #hi_addr(_temperature_label+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,871 :: 		temperature_label.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_temperature_label+4)
MOVT	R0, #hi_addr(_temperature_label+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,872 :: 		temperature_label.Left            = 500;
MOVW	R1, #500
MOVW	R0, #lo_addr(_temperature_label+6)
MOVT	R0, #hi_addr(_temperature_label+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,873 :: 		temperature_label.Top             = 70;
MOVS	R1, #70
MOVW	R0, #lo_addr(_temperature_label+8)
MOVT	R0, #hi_addr(_temperature_label+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,874 :: 		temperature_label.Width           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_temperature_label+10)
MOVT	R0, #hi_addr(_temperature_label+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,875 :: 		temperature_label.Height          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_temperature_label+12)
MOVT	R0, #hi_addr(_temperature_label+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,876 :: 		temperature_label.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_temperature_label+27)
MOVT	R0, #hi_addr(_temperature_label+27)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,877 :: 		temperature_label.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_temperature_label+28)
MOVT	R0, #hi_addr(_temperature_label+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,878 :: 		temperature_label.Caption         = temperature_label_Caption;
MOVW	R1, #lo_addr(_temperature_label_Caption+0)
MOVT	R1, #hi_addr(_temperature_label_Caption+0)
MOVW	R0, #lo_addr(_temperature_label+16)
MOVT	R0, #hi_addr(_temperature_label+16)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,879 :: 		temperature_label.FontName        = Tahoma48x48_Bold;
MOVW	R1, #22935
MOVW	R0, #lo_addr(_temperature_label+20)
MOVT	R0, #hi_addr(_temperature_label+20)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,880 :: 		temperature_label.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_temperature_label+24)
MOVT	R0, #hi_addr(_temperature_label+24)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,881 :: 		temperature_label.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_temperature_label+26)
MOVT	R0, #hi_addr(_temperature_label+26)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,883 :: 		Label1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label1+0)
MOVT	R0, #hi_addr(_Label1+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,884 :: 		Label1.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Label1+4)
MOVT	R0, #hi_addr(_Label1+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,885 :: 		Label1.Left            = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Label1+6)
MOVT	R0, #hi_addr(_Label1+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,886 :: 		Label1.Top             = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label1+8)
MOVT	R0, #hi_addr(_Label1+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,887 :: 		Label1.Width           = 281;
MOVW	R1, #281
MOVW	R0, #lo_addr(_Label1+10)
MOVT	R0, #hi_addr(_Label1+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,888 :: 		Label1.Height          = 53;
MOVS	R1, #53
MOVW	R0, #lo_addr(_Label1+12)
MOVT	R0, #hi_addr(_Label1+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,889 :: 		Label1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+27)
MOVT	R0, #hi_addr(_Label1+27)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,890 :: 		Label1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+28)
MOVT	R0, #hi_addr(_Label1+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,891 :: 		Label1.Caption         = Label1_Caption;
MOVW	R1, #lo_addr(_Label1_Caption+0)
MOVT	R1, #hi_addr(_Label1_Caption+0)
MOVW	R0, #lo_addr(_Label1+16)
MOVT	R0, #hi_addr(_Label1+16)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,892 :: 		Label1.FontName        = Tahoma48x48_BoldItalic;
MOVW	R1, #38015
MOVW	R0, #lo_addr(_Label1+20)
MOVT	R0, #hi_addr(_Label1+20)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,893 :: 		Label1.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_Label1+24)
MOVT	R0, #hi_addr(_Label1+24)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,894 :: 		Label1.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+26)
MOVT	R0, #hi_addr(_Label1+26)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,896 :: 		Label2.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label2+0)
MOVT	R0, #hi_addr(_Label2+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,897 :: 		Label2.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label2+4)
MOVT	R0, #hi_addr(_Label2+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,898 :: 		Label2.Left            = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Label2+6)
MOVT	R0, #hi_addr(_Label2+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,899 :: 		Label2.Top             = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Label2+8)
MOVT	R0, #hi_addr(_Label2+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,900 :: 		Label2.Width           = 202;
MOVS	R1, #202
MOVW	R0, #lo_addr(_Label2+10)
MOVT	R0, #hi_addr(_Label2+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,901 :: 		Label2.Height          = 53;
MOVS	R1, #53
MOVW	R0, #lo_addr(_Label2+12)
MOVT	R0, #hi_addr(_Label2+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,902 :: 		Label2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label2+27)
MOVT	R0, #hi_addr(_Label2+27)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,903 :: 		Label2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label2+28)
MOVT	R0, #hi_addr(_Label2+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,904 :: 		Label2.Caption         = Label2_Caption;
MOVW	R1, #lo_addr(_Label2_Caption+0)
MOVT	R1, #hi_addr(_Label2_Caption+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,905 :: 		Label2.FontName        = Tahoma48x48_BoldItalic;
MOVW	R1, #38015
MOVW	R0, #lo_addr(_Label2+20)
MOVT	R0, #hi_addr(_Label2+20)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,906 :: 		Label2.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,907 :: 		Label2.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+26)
MOVT	R0, #hi_addr(_Label2+26)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,909 :: 		humidity_label.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_humidity_label+0)
MOVT	R0, #hi_addr(_humidity_label+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,910 :: 		humidity_label.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_humidity_label+4)
MOVT	R0, #hi_addr(_humidity_label+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,911 :: 		humidity_label.Left            = 500;
MOVW	R1, #500
MOVW	R0, #lo_addr(_humidity_label+6)
MOVT	R0, #hi_addr(_humidity_label+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,912 :: 		humidity_label.Top             = 150;
MOVS	R1, #150
MOVW	R0, #lo_addr(_humidity_label+8)
MOVT	R0, #hi_addr(_humidity_label+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,913 :: 		humidity_label.Width           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_humidity_label+10)
MOVT	R0, #hi_addr(_humidity_label+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,914 :: 		humidity_label.Height          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_humidity_label+12)
MOVT	R0, #hi_addr(_humidity_label+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,915 :: 		humidity_label.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_humidity_label+27)
MOVT	R0, #hi_addr(_humidity_label+27)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,916 :: 		humidity_label.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_humidity_label+28)
MOVT	R0, #hi_addr(_humidity_label+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,917 :: 		humidity_label.Caption         = humidity_label_Caption;
MOVW	R1, #lo_addr(_humidity_label_Caption+0)
MOVT	R1, #hi_addr(_humidity_label_Caption+0)
MOVW	R0, #lo_addr(_humidity_label+16)
MOVT	R0, #hi_addr(_humidity_label+16)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,918 :: 		humidity_label.FontName        = Tahoma48x48_Bold;
MOVW	R1, #22935
MOVW	R0, #lo_addr(_humidity_label+20)
MOVT	R0, #hi_addr(_humidity_label+20)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,919 :: 		humidity_label.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_humidity_label+24)
MOVT	R0, #hi_addr(_humidity_label+24)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,920 :: 		humidity_label.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_humidity_label+26)
MOVT	R0, #hi_addr(_humidity_label+26)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,922 :: 		Label3.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label3+0)
MOVT	R0, #hi_addr(_Label3+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,923 :: 		Label3.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Label3+4)
MOVT	R0, #hi_addr(_Label3+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,924 :: 		Label3.Left            = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Label3+6)
MOVT	R0, #hi_addr(_Label3+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,925 :: 		Label3.Top             = 140;
MOVS	R1, #140
MOVW	R0, #lo_addr(_Label3+8)
MOVT	R0, #hi_addr(_Label3+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,926 :: 		Label3.Width           = 72;
MOVS	R1, #72
MOVW	R0, #lo_addr(_Label3+10)
MOVT	R0, #hi_addr(_Label3+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,927 :: 		Label3.Height          = 53;
MOVS	R1, #53
MOVW	R0, #lo_addr(_Label3+12)
MOVT	R0, #hi_addr(_Label3+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,928 :: 		Label3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+27)
MOVT	R0, #hi_addr(_Label3+27)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,929 :: 		Label3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+28)
MOVT	R0, #hi_addr(_Label3+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,930 :: 		Label3.Caption         = Label3_Caption;
MOVW	R1, #lo_addr(_Label3_Caption+0)
MOVT	R1, #hi_addr(_Label3_Caption+0)
MOVW	R0, #lo_addr(_Label3+16)
MOVT	R0, #hi_addr(_Label3+16)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,931 :: 		Label3.FontName        = Tahoma48x48_BoldItalic;
MOVW	R1, #38015
MOVW	R0, #lo_addr(_Label3+20)
MOVT	R0, #hi_addr(_Label3+20)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,932 :: 		Label3.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_Label3+24)
MOVT	R0, #hi_addr(_Label3+24)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,933 :: 		Label3.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+26)
MOVT	R0, #hi_addr(_Label3+26)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,935 :: 		uv_label.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_uv_label+0)
MOVT	R0, #hi_addr(_uv_label+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,936 :: 		uv_label.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_uv_label+4)
MOVT	R0, #hi_addr(_uv_label+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,937 :: 		uv_label.Left            = 500;
MOVW	R1, #500
MOVW	R0, #lo_addr(_uv_label+6)
MOVT	R0, #hi_addr(_uv_label+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,938 :: 		uv_label.Top             = 230;
MOVS	R1, #230
MOVW	R0, #lo_addr(_uv_label+8)
MOVT	R0, #hi_addr(_uv_label+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,939 :: 		uv_label.Width           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uv_label+10)
MOVT	R0, #hi_addr(_uv_label+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,940 :: 		uv_label.Height          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uv_label+12)
MOVT	R0, #hi_addr(_uv_label+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,941 :: 		uv_label.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_uv_label+27)
MOVT	R0, #hi_addr(_uv_label+27)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,942 :: 		uv_label.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_uv_label+28)
MOVT	R0, #hi_addr(_uv_label+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,943 :: 		uv_label.Caption         = uv_label_Caption;
MOVW	R1, #lo_addr(_uv_label_Caption+0)
MOVT	R1, #hi_addr(_uv_label_Caption+0)
MOVW	R0, #lo_addr(_uv_label+16)
MOVT	R0, #hi_addr(_uv_label+16)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,944 :: 		uv_label.FontName        = Tahoma48x48_Bold;
MOVW	R1, #22935
MOVW	R0, #lo_addr(_uv_label+20)
MOVT	R0, #hi_addr(_uv_label+20)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,945 :: 		uv_label.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_uv_label+24)
MOVT	R0, #hi_addr(_uv_label+24)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,946 :: 		uv_label.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uv_label+26)
MOVT	R0, #hi_addr(_uv_label+26)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,948 :: 		Label4.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label4+0)
MOVT	R0, #hi_addr(_Label4+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,949 :: 		Label4.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Label4+4)
MOVT	R0, #hi_addr(_Label4+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,950 :: 		Label4.Left            = 51;
MOVS	R1, #51
MOVW	R0, #lo_addr(_Label4+6)
MOVT	R0, #hi_addr(_Label4+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,951 :: 		Label4.Top             = 200;
MOVS	R1, #200
MOVW	R0, #lo_addr(_Label4+8)
MOVT	R0, #hi_addr(_Label4+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,952 :: 		Label4.Width           = 198;
MOVS	R1, #198
MOVW	R0, #lo_addr(_Label4+10)
MOVT	R0, #hi_addr(_Label4+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,953 :: 		Label4.Height          = 53;
MOVS	R1, #53
MOVW	R0, #lo_addr(_Label4+12)
MOVT	R0, #hi_addr(_Label4+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,954 :: 		Label4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label4+27)
MOVT	R0, #hi_addr(_Label4+27)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,955 :: 		Label4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label4+28)
MOVT	R0, #hi_addr(_Label4+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,956 :: 		Label4.Caption         = Label4_Caption;
MOVW	R1, #lo_addr(_Label4_Caption+0)
MOVT	R1, #hi_addr(_Label4_Caption+0)
MOVW	R0, #lo_addr(_Label4+16)
MOVT	R0, #hi_addr(_Label4+16)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,957 :: 		Label4.FontName        = Tahoma48x48_BoldItalic;
MOVW	R1, #38015
MOVW	R0, #lo_addr(_Label4+20)
MOVT	R0, #hi_addr(_Label4+20)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,958 :: 		Label4.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_Label4+24)
MOVT	R0, #hi_addr(_Label4+24)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,959 :: 		Label4.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+26)
MOVT	R0, #hi_addr(_Label4+26)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,961 :: 		Label5.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label5+0)
MOVT	R0, #hi_addr(_Label5+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,962 :: 		Label5.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Label5+4)
MOVT	R0, #hi_addr(_Label5+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,963 :: 		Label5.Left            = 700;
MOVW	R1, #700
MOVW	R0, #lo_addr(_Label5+6)
MOVT	R0, #hi_addr(_Label5+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,964 :: 		Label5.Top             = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Label5+8)
MOVT	R0, #hi_addr(_Label5+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,965 :: 		Label5.Width           = 113;
MOVS	R1, #113
MOVW	R0, #lo_addr(_Label5+10)
MOVT	R0, #hi_addr(_Label5+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,966 :: 		Label5.Height          = 53;
MOVS	R1, #53
MOVW	R0, #lo_addr(_Label5+12)
MOVT	R0, #hi_addr(_Label5+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,967 :: 		Label5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label5+27)
MOVT	R0, #hi_addr(_Label5+27)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,968 :: 		Label5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label5+28)
MOVT	R0, #hi_addr(_Label5+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,969 :: 		Label5.Caption         = Label5_Caption;
MOVW	R1, #lo_addr(_Label5_Caption+0)
MOVT	R1, #hi_addr(_Label5_Caption+0)
MOVW	R0, #lo_addr(_Label5+16)
MOVT	R0, #hi_addr(_Label5+16)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,970 :: 		Label5.FontName        = Tahoma48x48_Bold;
MOVW	R1, #22935
MOVW	R0, #lo_addr(_Label5+20)
MOVT	R0, #hi_addr(_Label5+20)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,971 :: 		Label5.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_Label5+24)
MOVT	R0, #hi_addr(_Label5+24)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,972 :: 		Label5.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+26)
MOVT	R0, #hi_addr(_Label5+26)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,974 :: 		Label6.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label6+0)
MOVT	R0, #hi_addr(_Label6+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,975 :: 		Label6.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Label6+4)
MOVT	R0, #hi_addr(_Label6+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,976 :: 		Label6.Left            = 700;
MOVW	R1, #700
MOVW	R0, #lo_addr(_Label6+6)
MOVT	R0, #hi_addr(_Label6+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,977 :: 		Label6.Top             = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Label6+8)
MOVT	R0, #hi_addr(_Label6+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,978 :: 		Label6.Width           = 63;
MOVS	R1, #63
MOVW	R0, #lo_addr(_Label6+10)
MOVT	R0, #hi_addr(_Label6+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,979 :: 		Label6.Height          = 53;
MOVS	R1, #53
MOVW	R0, #lo_addr(_Label6+12)
MOVT	R0, #hi_addr(_Label6+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,980 :: 		Label6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label6+27)
MOVT	R0, #hi_addr(_Label6+27)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,981 :: 		Label6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label6+28)
MOVT	R0, #hi_addr(_Label6+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,982 :: 		Label6.Caption         = Label6_Caption;
MOVW	R1, #lo_addr(_Label6_Caption+0)
MOVT	R1, #hi_addr(_Label6_Caption+0)
MOVW	R0, #lo_addr(_Label6+16)
MOVT	R0, #hi_addr(_Label6+16)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,983 :: 		Label6.FontName        = Tahoma48x48_Bold;
MOVW	R1, #22935
MOVW	R0, #lo_addr(_Label6+20)
MOVT	R0, #hi_addr(_Label6+20)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,984 :: 		Label6.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_Label6+24)
MOVT	R0, #hi_addr(_Label6+24)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,985 :: 		Label6.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+26)
MOVT	R0, #hi_addr(_Label6+26)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,987 :: 		Label10.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label10+0)
MOVT	R0, #hi_addr(_Label10+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,988 :: 		Label10.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Label10+4)
MOVT	R0, #hi_addr(_Label10+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,989 :: 		Label10.Left            = 500;
MOVW	R1, #500
MOVW	R0, #lo_addr(_Label10+6)
MOVT	R0, #hi_addr(_Label10+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,990 :: 		Label10.Top             = 310;
MOVW	R1, #310
MOVW	R0, #lo_addr(_Label10+8)
MOVT	R0, #hi_addr(_Label10+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,991 :: 		Label10.Width           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+10)
MOVT	R0, #hi_addr(_Label10+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,992 :: 		Label10.Height          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+12)
MOVT	R0, #hi_addr(_Label10+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,993 :: 		Label10.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label10+27)
MOVT	R0, #hi_addr(_Label10+27)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,994 :: 		Label10.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label10+28)
MOVT	R0, #hi_addr(_Label10+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,995 :: 		Label10.Caption         = Label10_Caption;
MOVW	R1, #lo_addr(_Label10_Caption+0)
MOVT	R1, #hi_addr(_Label10_Caption+0)
MOVW	R0, #lo_addr(_Label10+16)
MOVT	R0, #hi_addr(_Label10+16)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,996 :: 		Label10.FontName        = Tahoma48x48_Bold;
MOVW	R1, #22935
MOVW	R0, #lo_addr(_Label10+20)
MOVT	R0, #hi_addr(_Label10+20)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,997 :: 		Label10.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label10+24)
MOVT	R0, #hi_addr(_Label10+24)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,998 :: 		Label10.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+26)
MOVT	R0, #hi_addr(_Label10+26)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1000 :: 		Circle1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Circle1+0)
MOVT	R0, #hi_addr(_Circle1+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1001 :: 		Circle1.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Circle1+4)
MOVT	R0, #hi_addr(_Circle1+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1002 :: 		Circle1.Left            = 705;
MOVW	R1, #705
MOVW	R0, #lo_addr(_Circle1+6)
MOVT	R0, #hi_addr(_Circle1+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1003 :: 		Circle1.Top             = 35;
MOVS	R1, #35
MOVW	R0, #lo_addr(_Circle1+8)
MOVT	R0, #hi_addr(_Circle1+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1004 :: 		Circle1.Radius          = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Circle1+10)
MOVT	R0, #hi_addr(_Circle1+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1005 :: 		Circle1.Pen_Width       = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Circle1+12)
MOVT	R0, #hi_addr(_Circle1+12)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1006 :: 		Circle1.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_Circle1+14)
MOVT	R0, #hi_addr(_Circle1+14)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1007 :: 		Circle1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Circle1+16)
MOVT	R0, #hi_addr(_Circle1+16)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1008 :: 		Circle1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Circle1+17)
MOVT	R0, #hi_addr(_Circle1+17)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1009 :: 		Circle1.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+18)
MOVT	R0, #hi_addr(_Circle1+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1010 :: 		Circle1.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+19)
MOVT	R0, #hi_addr(_Circle1+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1011 :: 		Circle1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+20)
MOVT	R0, #hi_addr(_Circle1+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1012 :: 		Circle1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Circle1+22)
MOVT	R0, #hi_addr(_Circle1+22)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1013 :: 		Circle1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Circle1+24)
MOVT	R0, #hi_addr(_Circle1+24)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1014 :: 		Circle1.Color           = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_Circle1+26)
MOVT	R0, #hi_addr(_Circle1+26)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1015 :: 		Circle1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Circle1+28)
MOVT	R0, #hi_addr(_Circle1+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1016 :: 		Circle1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Circle1+30)
MOVT	R0, #hi_addr(_Circle1+30)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1018 :: 		ButtonRound1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_ButtonRound1+0)
MOVT	R0, #hi_addr(_ButtonRound1+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1019 :: 		ButtonRound1.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_ButtonRound1+4)
MOVT	R0, #hi_addr(_ButtonRound1+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1020 :: 		ButtonRound1.Left            = 600;
MOVW	R1, #600
MOVW	R0, #lo_addr(_ButtonRound1+6)
MOVT	R0, #hi_addr(_ButtonRound1+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1021 :: 		ButtonRound1.Top             = 415;
MOVW	R1, #415
MOVW	R0, #lo_addr(_ButtonRound1+8)
MOVT	R0, #hi_addr(_ButtonRound1+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1022 :: 		ButtonRound1.Width           = 191;
MOVS	R1, #191
MOVW	R0, #lo_addr(_ButtonRound1+10)
MOVT	R0, #hi_addr(_ButtonRound1+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1023 :: 		ButtonRound1.Height          = 55;
MOVS	R1, #55
MOVW	R0, #lo_addr(_ButtonRound1+12)
MOVT	R0, #hi_addr(_ButtonRound1+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1024 :: 		ButtonRound1.Pen_Width       = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_ButtonRound1+14)
MOVT	R0, #hi_addr(_ButtonRound1+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1025 :: 		ButtonRound1.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ButtonRound1+16)
MOVT	R0, #hi_addr(_ButtonRound1+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1026 :: 		ButtonRound1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+18)
MOVT	R0, #hi_addr(_ButtonRound1+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1027 :: 		ButtonRound1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+19)
MOVT	R0, #hi_addr(_ButtonRound1+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1028 :: 		ButtonRound1.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+20)
MOVT	R0, #hi_addr(_ButtonRound1+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1029 :: 		ButtonRound1.Caption         = ButtonRound1_Caption;
MOVW	R1, #lo_addr(_ButtonRound1_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound1_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound1+24)
MOVT	R0, #hi_addr(_ButtonRound1+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1030 :: 		ButtonRound1.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+28)
MOVT	R0, #hi_addr(_ButtonRound1+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1031 :: 		ButtonRound1.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+29)
MOVT	R0, #hi_addr(_ButtonRound1+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1032 :: 		ButtonRound1.FontName        = Tahoma39x48_Regular;
MOVW	R1, #9103
MOVW	R0, #lo_addr(_ButtonRound1+32)
MOVT	R0, #hi_addr(_ButtonRound1+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1033 :: 		ButtonRound1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+49)
MOVT	R0, #hi_addr(_ButtonRound1+49)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1034 :: 		ButtonRound1.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ButtonRound1+36)
MOVT	R0, #hi_addr(_ButtonRound1+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1035 :: 		ButtonRound1.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+38)
MOVT	R0, #hi_addr(_ButtonRound1+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1036 :: 		ButtonRound1.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+39)
MOVT	R0, #hi_addr(_ButtonRound1+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1037 :: 		ButtonRound1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+40)
MOVT	R0, #hi_addr(_ButtonRound1+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1038 :: 		ButtonRound1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound1+42)
MOVT	R0, #hi_addr(_ButtonRound1+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1039 :: 		ButtonRound1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound1+44)
MOVT	R0, #hi_addr(_ButtonRound1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1040 :: 		ButtonRound1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound1+46)
MOVT	R0, #hi_addr(_ButtonRound1+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1041 :: 		ButtonRound1.Press_Color     = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+50)
MOVT	R0, #hi_addr(_ButtonRound1+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1042 :: 		ButtonRound1.Corner_Radius   = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_ButtonRound1+48)
MOVT	R0, #hi_addr(_ButtonRound1+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1043 :: 		ButtonRound1.OnClickPtr      = ButtonRound1OnClick;
MOVW	R1, #lo_addr(_ButtonRound1OnClick+0)
MOVT	R1, #hi_addr(_ButtonRound1OnClick+0)
MOVW	R0, #lo_addr(_ButtonRound1+60)
MOVT	R0, #hi_addr(_ButtonRound1+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1045 :: 		Image6.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Image6+0)
MOVT	R0, #hi_addr(_Image6+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1046 :: 		Image6.Order           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Image6+4)
MOVT	R0, #hi_addr(_Image6+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1047 :: 		Image6.Left            = 500;
MOVW	R1, #500
MOVW	R0, #lo_addr(_Image6+6)
MOVT	R0, #hi_addr(_Image6+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1048 :: 		Image6.Top             = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Image6+8)
MOVT	R0, #hi_addr(_Image6+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1049 :: 		Image6.Width           = 110;
MOVS	R1, #110
MOVW	R0, #lo_addr(_Image6+10)
MOVT	R0, #hi_addr(_Image6+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1050 :: 		Image6.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image6+12)
MOVT	R0, #hi_addr(_Image6+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1051 :: 		Image6.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image6+22)
MOVT	R0, #hi_addr(_Image6+22)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1052 :: 		Image6.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image6+23)
MOVT	R0, #hi_addr(_Image6+23)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1053 :: 		Image6.Picture_Name    = Greenhouse7800x480bmpv2slice1_bmp;
MOVW	R1, #5104
MOVT	R1, #13
MOVW	R0, #lo_addr(_Image6+16)
MOVT	R0, #hi_addr(_Image6+16)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1054 :: 		Image6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image6+20)
MOVT	R0, #hi_addr(_Image6+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1055 :: 		Image6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image6+21)
MOVT	R0, #hi_addr(_Image6+21)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1057 :: 		Image7.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Image7+0)
MOVT	R0, #hi_addr(_Image7+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1058 :: 		Image7.Order           = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Image7+4)
MOVT	R0, #hi_addr(_Image7+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1059 :: 		Image7.Left            = 500;
MOVW	R1, #500
MOVW	R0, #lo_addr(_Image7+6)
MOVT	R0, #hi_addr(_Image7+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1060 :: 		Image7.Top             = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_Image7+8)
MOVT	R0, #hi_addr(_Image7+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1061 :: 		Image7.Width           = 110;
MOVS	R1, #110
MOVW	R0, #lo_addr(_Image7+10)
MOVT	R0, #hi_addr(_Image7+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1062 :: 		Image7.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image7+12)
MOVT	R0, #hi_addr(_Image7+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1063 :: 		Image7.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image7+22)
MOVT	R0, #hi_addr(_Image7+22)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1064 :: 		Image7.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image7+23)
MOVT	R0, #hi_addr(_Image7+23)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1065 :: 		Image7.Picture_Name    = Greenhouse7800x480bmpv2slice2_bmp;
MOVW	R1, #16110
MOVT	R1, #13
MOVW	R0, #lo_addr(_Image7+16)
MOVT	R0, #hi_addr(_Image7+16)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1066 :: 		Image7.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image7+20)
MOVT	R0, #hi_addr(_Image7+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1067 :: 		Image7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image7+21)
MOVT	R0, #hi_addr(_Image7+21)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1069 :: 		Image8.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Image8+0)
MOVT	R0, #hi_addr(_Image8+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1070 :: 		Image8.Order           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Image8+4)
MOVT	R0, #hi_addr(_Image8+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1071 :: 		Image8.Left            = 500;
MOVW	R1, #500
MOVW	R0, #lo_addr(_Image8+6)
MOVT	R0, #hi_addr(_Image8+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1072 :: 		Image8.Top             = 140;
MOVS	R1, #140
MOVW	R0, #lo_addr(_Image8+8)
MOVT	R0, #hi_addr(_Image8+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1073 :: 		Image8.Width           = 110;
MOVS	R1, #110
MOVW	R0, #lo_addr(_Image8+10)
MOVT	R0, #hi_addr(_Image8+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1074 :: 		Image8.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image8+12)
MOVT	R0, #hi_addr(_Image8+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1075 :: 		Image8.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image8+22)
MOVT	R0, #hi_addr(_Image8+22)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1076 :: 		Image8.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image8+23)
MOVT	R0, #hi_addr(_Image8+23)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1077 :: 		Image8.Picture_Name    = Greenhouse7800x480bmpv2slice3_bmp;
MOVW	R1, #27116
MOVT	R1, #13
MOVW	R0, #lo_addr(_Image8+16)
MOVT	R0, #hi_addr(_Image8+16)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1078 :: 		Image8.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image8+20)
MOVT	R0, #hi_addr(_Image8+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1079 :: 		Image8.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image8+21)
MOVT	R0, #hi_addr(_Image8+21)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1081 :: 		Image9.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Image9+0)
MOVT	R0, #hi_addr(_Image9+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1082 :: 		Image9.Order           = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Image9+4)
MOVT	R0, #hi_addr(_Image9+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1083 :: 		Image9.Left            = 500;
MOVW	R1, #500
MOVW	R0, #lo_addr(_Image9+6)
MOVT	R0, #hi_addr(_Image9+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1084 :: 		Image9.Top             = 200;
MOVS	R1, #200
MOVW	R0, #lo_addr(_Image9+8)
MOVT	R0, #hi_addr(_Image9+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1085 :: 		Image9.Width           = 110;
MOVS	R1, #110
MOVW	R0, #lo_addr(_Image9+10)
MOVT	R0, #hi_addr(_Image9+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1086 :: 		Image9.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image9+12)
MOVT	R0, #hi_addr(_Image9+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1087 :: 		Image9.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image9+22)
MOVT	R0, #hi_addr(_Image9+22)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1088 :: 		Image9.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image9+23)
MOVT	R0, #hi_addr(_Image9+23)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1089 :: 		Image9.Picture_Name    = Greenhouse7800x480bmpv2slice4_bmp;
MOVW	R1, #38122
MOVT	R1, #13
MOVW	R0, #lo_addr(_Image9+16)
MOVT	R0, #hi_addr(_Image9+16)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1090 :: 		Image9.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image9+20)
MOVT	R0, #hi_addr(_Image9+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1091 :: 		Image9.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image9+21)
MOVT	R0, #hi_addr(_Image9+21)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1093 :: 		Image10.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Image10+0)
MOVT	R0, #hi_addr(_Image10+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1094 :: 		Image10.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image10+4)
MOVT	R0, #hi_addr(_Image10+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1095 :: 		Image10.Left            = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_Image10+6)
MOVT	R0, #hi_addr(_Image10+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1096 :: 		Image10.Top             = 180;
MOVS	R1, #180
MOVW	R0, #lo_addr(_Image10+8)
MOVT	R0, #hi_addr(_Image10+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1097 :: 		Image10.Width           = 720;
MOVW	R1, #720
MOVW	R0, #lo_addr(_Image10+10)
MOVT	R0, #hi_addr(_Image10+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1098 :: 		Image10.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Image10+12)
MOVT	R0, #hi_addr(_Image10+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1099 :: 		Image10.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image10+22)
MOVT	R0, #hi_addr(_Image10+22)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1100 :: 		Image10.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image10+23)
MOVT	R0, #hi_addr(_Image10+23)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1101 :: 		Image10.Picture_Name    = Greenhouse7800x480bmpv3crop1_bmp;
MOVW	R1, #49128
MOVT	R1, #13
MOVW	R0, #lo_addr(_Image10+16)
MOVT	R0, #hi_addr(_Image10+16)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1102 :: 		Image10.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image10+20)
MOVT	R0, #hi_addr(_Image10+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1103 :: 		Image10.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image10+21)
MOVT	R0, #hi_addr(_Image10+21)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1105 :: 		Image3.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Image3+0)
MOVT	R0, #hi_addr(_Image3+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1106 :: 		Image3.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image3+4)
MOVT	R0, #hi_addr(_Image3+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1107 :: 		Image3.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+6)
MOVT	R0, #hi_addr(_Image3+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1108 :: 		Image3.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+8)
MOVT	R0, #hi_addr(_Image3+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1109 :: 		Image3.Width           = 800;
MOVW	R1, #800
MOVW	R0, #lo_addr(_Image3+10)
MOVT	R0, #hi_addr(_Image3+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1110 :: 		Image3.Height          = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Image3+12)
MOVT	R0, #hi_addr(_Image3+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1111 :: 		Image3.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+22)
MOVT	R0, #hi_addr(_Image3+22)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1112 :: 		Image3.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image3+23)
MOVT	R0, #hi_addr(_Image3+23)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1113 :: 		Image3.Picture_Name    = Greenhouse7800x480bmpv3_bmp;
MOVW	R1, #55598
MOVT	R1, #14
MOVW	R0, #lo_addr(_Image3+16)
MOVT	R0, #hi_addr(_Image3+16)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1114 :: 		Image3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image3+20)
MOVT	R0, #hi_addr(_Image3+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1115 :: 		Image3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image3+21)
MOVT	R0, #hi_addr(_Image3+21)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1117 :: 		ProgressBar1.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_ProgressBar1+0)
MOVT	R0, #hi_addr(_ProgressBar1+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1118 :: 		ProgressBar1.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_ProgressBar1+4)
MOVT	R0, #hi_addr(_ProgressBar1+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1119 :: 		ProgressBar1.Left            = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_ProgressBar1+6)
MOVT	R0, #hi_addr(_ProgressBar1+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1120 :: 		ProgressBar1.Top             = 180;
MOVS	R1, #180
MOVW	R0, #lo_addr(_ProgressBar1+8)
MOVT	R0, #hi_addr(_ProgressBar1+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1121 :: 		ProgressBar1.Width           = 720;
MOVW	R1, #720
MOVW	R0, #lo_addr(_ProgressBar1+10)
MOVT	R0, #hi_addr(_ProgressBar1+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1122 :: 		ProgressBar1.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_ProgressBar1+12)
MOVT	R0, #hi_addr(_ProgressBar1+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1123 :: 		ProgressBar1.Pen_Width       = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ProgressBar1+14)
MOVT	R0, #hi_addr(_ProgressBar1+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1124 :: 		ProgressBar1.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ProgressBar1+16)
MOVT	R0, #hi_addr(_ProgressBar1+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1125 :: 		ProgressBar1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar1+18)
MOVT	R0, #hi_addr(_ProgressBar1+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1126 :: 		ProgressBar1.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar1+19)
MOVT	R0, #hi_addr(_ProgressBar1+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1127 :: 		ProgressBar1.Caption         = ProgressBar1_Caption;
MOVW	R1, #lo_addr(_ProgressBar1_Caption+0)
MOVT	R1, #hi_addr(_ProgressBar1_Caption+0)
MOVW	R0, #lo_addr(_ProgressBar1+20)
MOVT	R0, #hi_addr(_ProgressBar1+20)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1128 :: 		ProgressBar1.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_ProgressBar1+24)
MOVT	R0, #hi_addr(_ProgressBar1+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1129 :: 		ProgressBar1.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ProgressBar1+28)
MOVT	R0, #hi_addr(_ProgressBar1+28)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1130 :: 		ProgressBar1.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar1+30)
MOVT	R0, #hi_addr(_ProgressBar1+30)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1131 :: 		ProgressBar1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar1+31)
MOVT	R0, #hi_addr(_ProgressBar1+31)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1132 :: 		ProgressBar1.Gradient_Start_Color = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ProgressBar1+32)
MOVT	R0, #hi_addr(_ProgressBar1+32)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1133 :: 		ProgressBar1.Gradient_End_Color = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ProgressBar1+34)
MOVT	R0, #hi_addr(_ProgressBar1+34)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1134 :: 		ProgressBar1.Color           = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ProgressBar1+36)
MOVT	R0, #hi_addr(_ProgressBar1+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1135 :: 		ProgressBar1.Background_Color = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ProgressBar1+38)
MOVT	R0, #hi_addr(_ProgressBar1+38)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1136 :: 		ProgressBar1.Min             = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_ProgressBar1+40)
MOVT	R0, #hi_addr(_ProgressBar1+40)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1137 :: 		ProgressBar1.Max             = 170;
MOVS	R1, #170
MOVW	R0, #lo_addr(_ProgressBar1+42)
MOVT	R0, #hi_addr(_ProgressBar1+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1138 :: 		ProgressBar1.Position        = 90;
MOVS	R1, #90
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1139 :: 		ProgressBar1.Prev_Position   = 90;
MOVS	R1, #90
MOVW	R0, #lo_addr(_ProgressBar1+46)
MOVT	R0, #hi_addr(_ProgressBar1+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1140 :: 		ProgressBar1.Show_Position   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar1+48)
MOVT	R0, #hi_addr(_ProgressBar1+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1141 :: 		ProgressBar1.Show_Percentage = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar1+49)
MOVT	R0, #hi_addr(_ProgressBar1+49)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1142 :: 		ProgressBar1.Smooth          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar1+50)
MOVT	R0, #hi_addr(_ProgressBar1+50)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1143 :: 		ProgressBar1.Rounded         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar1+51)
MOVT	R0, #hi_addr(_ProgressBar1+51)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1144 :: 		ProgressBar1.Corner_Radius   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar1+52)
MOVT	R0, #hi_addr(_ProgressBar1+52)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1146 :: 		servo_position_button_2.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_servo_position_button_2+0)
MOVT	R0, #hi_addr(_servo_position_button_2+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1147 :: 		servo_position_button_2.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_servo_position_button_2+4)
MOVT	R0, #hi_addr(_servo_position_button_2+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1148 :: 		servo_position_button_2.Left            = 120;
MOVS	R1, #120
MOVW	R0, #lo_addr(_servo_position_button_2+6)
MOVT	R0, #hi_addr(_servo_position_button_2+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1149 :: 		servo_position_button_2.Top             = 180;
MOVS	R1, #180
MOVW	R0, #lo_addr(_servo_position_button_2+8)
MOVT	R0, #hi_addr(_servo_position_button_2+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1150 :: 		servo_position_button_2.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_servo_position_button_2+10)
MOVT	R0, #hi_addr(_servo_position_button_2+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1151 :: 		servo_position_button_2.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_servo_position_button_2+12)
MOVT	R0, #hi_addr(_servo_position_button_2+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1152 :: 		servo_position_button_2.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_2+14)
MOVT	R0, #hi_addr(_servo_position_button_2+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1153 :: 		servo_position_button_2.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_position_button_2+16)
MOVT	R0, #hi_addr(_servo_position_button_2+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1154 :: 		servo_position_button_2.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_2+18)
MOVT	R0, #hi_addr(_servo_position_button_2+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1155 :: 		servo_position_button_2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_2+19)
MOVT	R0, #hi_addr(_servo_position_button_2+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1156 :: 		servo_position_button_2.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_2+20)
MOVT	R0, #hi_addr(_servo_position_button_2+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1157 :: 		servo_position_button_2.Caption         = servo_position_button_2_Caption;
MOVW	R1, #lo_addr(_servo_position_button_2_Caption+0)
MOVT	R1, #hi_addr(_servo_position_button_2_Caption+0)
MOVW	R0, #lo_addr(_servo_position_button_2+24)
MOVT	R0, #hi_addr(_servo_position_button_2+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1158 :: 		servo_position_button_2.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_2+28)
MOVT	R0, #hi_addr(_servo_position_button_2+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1159 :: 		servo_position_button_2.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_2+29)
MOVT	R0, #hi_addr(_servo_position_button_2+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1160 :: 		servo_position_button_2.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_servo_position_button_2+32)
MOVT	R0, #hi_addr(_servo_position_button_2+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1161 :: 		servo_position_button_2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_2+48)
MOVT	R0, #hi_addr(_servo_position_button_2+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1162 :: 		servo_position_button_2.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_position_button_2+36)
MOVT	R0, #hi_addr(_servo_position_button_2+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1163 :: 		servo_position_button_2.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_2+38)
MOVT	R0, #hi_addr(_servo_position_button_2+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1164 :: 		servo_position_button_2.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_2+39)
MOVT	R0, #hi_addr(_servo_position_button_2+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1165 :: 		servo_position_button_2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_2+40)
MOVT	R0, #hi_addr(_servo_position_button_2+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1166 :: 		servo_position_button_2.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_servo_position_button_2+42)
MOVT	R0, #hi_addr(_servo_position_button_2+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1167 :: 		servo_position_button_2.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_servo_position_button_2+44)
MOVT	R0, #hi_addr(_servo_position_button_2+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1168 :: 		servo_position_button_2.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_2+46)
MOVT	R0, #hi_addr(_servo_position_button_2+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1169 :: 		servo_position_button_2.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_position_button_2+50)
MOVT	R0, #hi_addr(_servo_position_button_2+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1170 :: 		servo_position_button_2.OnClickPtr      = servo_position_button_2OnClick;
MOVW	R1, #lo_addr(_servo_position_button_2OnClick+0)
MOVT	R1, #hi_addr(_servo_position_button_2OnClick+0)
MOVW	R0, #lo_addr(_servo_position_button_2+60)
MOVT	R0, #hi_addr(_servo_position_button_2+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1172 :: 		servo_position_button_1.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_servo_position_button_1+0)
MOVT	R0, #hi_addr(_servo_position_button_1+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1173 :: 		servo_position_button_1.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_servo_position_button_1+4)
MOVT	R0, #hi_addr(_servo_position_button_1+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1174 :: 		servo_position_button_1.Left            = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_servo_position_button_1+6)
MOVT	R0, #hi_addr(_servo_position_button_1+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1175 :: 		servo_position_button_1.Top             = 180;
MOVS	R1, #180
MOVW	R0, #lo_addr(_servo_position_button_1+8)
MOVT	R0, #hi_addr(_servo_position_button_1+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1176 :: 		servo_position_button_1.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_servo_position_button_1+10)
MOVT	R0, #hi_addr(_servo_position_button_1+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1177 :: 		servo_position_button_1.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_servo_position_button_1+12)
MOVT	R0, #hi_addr(_servo_position_button_1+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1178 :: 		servo_position_button_1.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_1+14)
MOVT	R0, #hi_addr(_servo_position_button_1+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1179 :: 		servo_position_button_1.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_position_button_1+16)
MOVT	R0, #hi_addr(_servo_position_button_1+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1180 :: 		servo_position_button_1.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_1+18)
MOVT	R0, #hi_addr(_servo_position_button_1+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1181 :: 		servo_position_button_1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_1+19)
MOVT	R0, #hi_addr(_servo_position_button_1+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1182 :: 		servo_position_button_1.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_1+20)
MOVT	R0, #hi_addr(_servo_position_button_1+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1183 :: 		servo_position_button_1.Caption         = servo_position_button_1_Caption;
MOVW	R1, #lo_addr(_servo_position_button_1_Caption+0)
MOVT	R1, #hi_addr(_servo_position_button_1_Caption+0)
MOVW	R0, #lo_addr(_servo_position_button_1+24)
MOVT	R0, #hi_addr(_servo_position_button_1+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1184 :: 		servo_position_button_1.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_1+28)
MOVT	R0, #hi_addr(_servo_position_button_1+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1185 :: 		servo_position_button_1.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_1+29)
MOVT	R0, #hi_addr(_servo_position_button_1+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1186 :: 		servo_position_button_1.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_servo_position_button_1+32)
MOVT	R0, #hi_addr(_servo_position_button_1+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1187 :: 		servo_position_button_1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_1+48)
MOVT	R0, #hi_addr(_servo_position_button_1+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1188 :: 		servo_position_button_1.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_position_button_1+36)
MOVT	R0, #hi_addr(_servo_position_button_1+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1189 :: 		servo_position_button_1.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_1+38)
MOVT	R0, #hi_addr(_servo_position_button_1+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1190 :: 		servo_position_button_1.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_1+39)
MOVT	R0, #hi_addr(_servo_position_button_1+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1191 :: 		servo_position_button_1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_1+40)
MOVT	R0, #hi_addr(_servo_position_button_1+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1192 :: 		servo_position_button_1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_servo_position_button_1+42)
MOVT	R0, #hi_addr(_servo_position_button_1+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1193 :: 		servo_position_button_1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_servo_position_button_1+44)
MOVT	R0, #hi_addr(_servo_position_button_1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1194 :: 		servo_position_button_1.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_1+46)
MOVT	R0, #hi_addr(_servo_position_button_1+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1195 :: 		servo_position_button_1.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_position_button_1+50)
MOVT	R0, #hi_addr(_servo_position_button_1+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1196 :: 		servo_position_button_1.OnClickPtr      = servo_position_button_1OnClick;
MOVW	R1, #lo_addr(_servo_position_button_1OnClick+0)
MOVT	R1, #hi_addr(_servo_position_button_1OnClick+0)
MOVW	R0, #lo_addr(_servo_position_button_1+60)
MOVT	R0, #hi_addr(_servo_position_button_1+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1198 :: 		Image5.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Image5+0)
MOVT	R0, #hi_addr(_Image5+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1199 :: 		Image5.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Image5+4)
MOVT	R0, #hi_addr(_Image5+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1200 :: 		Image5.Left            = 590;
MOVW	R1, #590
MOVW	R0, #lo_addr(_Image5+6)
MOVT	R0, #hi_addr(_Image5+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1201 :: 		Image5.Top             = 405;
MOVW	R1, #405
MOVW	R0, #lo_addr(_Image5+8)
MOVT	R0, #hi_addr(_Image5+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1202 :: 		Image5.Width           = 210;
MOVS	R1, #210
MOVW	R0, #lo_addr(_Image5+10)
MOVT	R0, #hi_addr(_Image5+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1203 :: 		Image5.Height          = 75;
MOVS	R1, #75
MOVW	R0, #lo_addr(_Image5+12)
MOVT	R0, #hi_addr(_Image5+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1204 :: 		Image5.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+22)
MOVT	R0, #hi_addr(_Image5+22)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1205 :: 		Image5.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image5+23)
MOVT	R0, #hi_addr(_Image5+23)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1206 :: 		Image5.Picture_Name    = Greenhouse7800x480bmpbuttoncrop1_bmp;
MOVW	R1, #39134
MOVT	R1, #12
MOVW	R0, #lo_addr(_Image5+16)
MOVT	R0, #hi_addr(_Image5+16)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1207 :: 		Image5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image5+20)
MOVT	R0, #hi_addr(_Image5+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1208 :: 		Image5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image5+21)
MOVT	R0, #hi_addr(_Image5+21)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1210 :: 		servo_number_button_1.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_servo_number_button_1+0)
MOVT	R0, #hi_addr(_servo_number_button_1+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1211 :: 		servo_number_button_1.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_servo_number_button_1+4)
MOVT	R0, #hi_addr(_servo_number_button_1+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1212 :: 		servo_number_button_1.Left            = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_servo_number_button_1+6)
MOVT	R0, #hi_addr(_servo_number_button_1+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1213 :: 		servo_number_button_1.Top             = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_servo_number_button_1+8)
MOVT	R0, #hi_addr(_servo_number_button_1+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1214 :: 		servo_number_button_1.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_servo_number_button_1+10)
MOVT	R0, #hi_addr(_servo_number_button_1+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1215 :: 		servo_number_button_1.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_servo_number_button_1+12)
MOVT	R0, #hi_addr(_servo_number_button_1+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1216 :: 		servo_number_button_1.Pen_Width       = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_servo_number_button_1+14)
MOVT	R0, #hi_addr(_servo_number_button_1+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1217 :: 		servo_number_button_1.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_1+16)
MOVT	R0, #hi_addr(_servo_number_button_1+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1218 :: 		servo_number_button_1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_1+18)
MOVT	R0, #hi_addr(_servo_number_button_1+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1219 :: 		servo_number_button_1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_1+19)
MOVT	R0, #hi_addr(_servo_number_button_1+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1220 :: 		servo_number_button_1.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_1+20)
MOVT	R0, #hi_addr(_servo_number_button_1+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1221 :: 		servo_number_button_1.Caption         = servo_number_button_1_Caption;
MOVW	R1, #lo_addr(_servo_number_button_1_Caption+0)
MOVT	R1, #hi_addr(_servo_number_button_1_Caption+0)
MOVW	R0, #lo_addr(_servo_number_button_1+24)
MOVT	R0, #hi_addr(_servo_number_button_1+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1222 :: 		servo_number_button_1.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_1+28)
MOVT	R0, #hi_addr(_servo_number_button_1+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1223 :: 		servo_number_button_1.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_1+29)
MOVT	R0, #hi_addr(_servo_number_button_1+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1224 :: 		servo_number_button_1.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_servo_number_button_1+32)
MOVT	R0, #hi_addr(_servo_number_button_1+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1225 :: 		servo_number_button_1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_1+48)
MOVT	R0, #hi_addr(_servo_number_button_1+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1226 :: 		servo_number_button_1.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_1+36)
MOVT	R0, #hi_addr(_servo_number_button_1+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1227 :: 		servo_number_button_1.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_1+38)
MOVT	R0, #hi_addr(_servo_number_button_1+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1228 :: 		servo_number_button_1.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_1+39)
MOVT	R0, #hi_addr(_servo_number_button_1+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1229 :: 		servo_number_button_1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_1+40)
MOVT	R0, #hi_addr(_servo_number_button_1+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1230 :: 		servo_number_button_1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_servo_number_button_1+42)
MOVT	R0, #hi_addr(_servo_number_button_1+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1231 :: 		servo_number_button_1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_servo_number_button_1+44)
MOVT	R0, #hi_addr(_servo_number_button_1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1232 :: 		servo_number_button_1.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_1+46)
MOVT	R0, #hi_addr(_servo_number_button_1+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1233 :: 		servo_number_button_1.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_1+50)
MOVT	R0, #hi_addr(_servo_number_button_1+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1234 :: 		servo_number_button_1.OnClickPtr      = servo_number_button_1OnClick;
MOVW	R1, #lo_addr(_servo_number_button_1OnClick+0)
MOVT	R1, #hi_addr(_servo_number_button_1OnClick+0)
MOVW	R0, #lo_addr(_servo_number_button_1+60)
MOVT	R0, #hi_addr(_servo_number_button_1+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1236 :: 		servo_number_button_2.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_servo_number_button_2+0)
MOVT	R0, #hi_addr(_servo_number_button_2+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1237 :: 		servo_number_button_2.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_servo_number_button_2+4)
MOVT	R0, #hi_addr(_servo_number_button_2+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1238 :: 		servo_number_button_2.Left            = 120;
MOVS	R1, #120
MOVW	R0, #lo_addr(_servo_number_button_2+6)
MOVT	R0, #hi_addr(_servo_number_button_2+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1239 :: 		servo_number_button_2.Top             = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_servo_number_button_2+8)
MOVT	R0, #hi_addr(_servo_number_button_2+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1240 :: 		servo_number_button_2.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_servo_number_button_2+10)
MOVT	R0, #hi_addr(_servo_number_button_2+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1241 :: 		servo_number_button_2.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_servo_number_button_2+12)
MOVT	R0, #hi_addr(_servo_number_button_2+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1242 :: 		servo_number_button_2.Pen_Width       = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_servo_number_button_2+14)
MOVT	R0, #hi_addr(_servo_number_button_2+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1243 :: 		servo_number_button_2.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_2+16)
MOVT	R0, #hi_addr(_servo_number_button_2+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1244 :: 		servo_number_button_2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_2+18)
MOVT	R0, #hi_addr(_servo_number_button_2+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1245 :: 		servo_number_button_2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_2+19)
MOVT	R0, #hi_addr(_servo_number_button_2+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1246 :: 		servo_number_button_2.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_2+20)
MOVT	R0, #hi_addr(_servo_number_button_2+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1247 :: 		servo_number_button_2.Caption         = servo_number_button_2_Caption;
MOVW	R1, #lo_addr(_servo_number_button_2_Caption+0)
MOVT	R1, #hi_addr(_servo_number_button_2_Caption+0)
MOVW	R0, #lo_addr(_servo_number_button_2+24)
MOVT	R0, #hi_addr(_servo_number_button_2+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1248 :: 		servo_number_button_2.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_2+28)
MOVT	R0, #hi_addr(_servo_number_button_2+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1249 :: 		servo_number_button_2.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_2+29)
MOVT	R0, #hi_addr(_servo_number_button_2+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1250 :: 		servo_number_button_2.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_servo_number_button_2+32)
MOVT	R0, #hi_addr(_servo_number_button_2+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1251 :: 		servo_number_button_2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_2+48)
MOVT	R0, #hi_addr(_servo_number_button_2+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1252 :: 		servo_number_button_2.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_2+36)
MOVT	R0, #hi_addr(_servo_number_button_2+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1253 :: 		servo_number_button_2.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_2+38)
MOVT	R0, #hi_addr(_servo_number_button_2+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1254 :: 		servo_number_button_2.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_2+39)
MOVT	R0, #hi_addr(_servo_number_button_2+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1255 :: 		servo_number_button_2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_2+40)
MOVT	R0, #hi_addr(_servo_number_button_2+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1256 :: 		servo_number_button_2.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_servo_number_button_2+42)
MOVT	R0, #hi_addr(_servo_number_button_2+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1257 :: 		servo_number_button_2.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_servo_number_button_2+44)
MOVT	R0, #hi_addr(_servo_number_button_2+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1258 :: 		servo_number_button_2.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_2+46)
MOVT	R0, #hi_addr(_servo_number_button_2+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1259 :: 		servo_number_button_2.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_2+50)
MOVT	R0, #hi_addr(_servo_number_button_2+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1260 :: 		servo_number_button_2.OnClickPtr      = servo_number_button_2OnClick;
MOVW	R1, #lo_addr(_servo_number_button_2OnClick+0)
MOVT	R1, #hi_addr(_servo_number_button_2OnClick+0)
MOVW	R0, #lo_addr(_servo_number_button_2+60)
MOVT	R0, #hi_addr(_servo_number_button_2+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1262 :: 		servo_number_button_4.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_servo_number_button_4+0)
MOVT	R0, #hi_addr(_servo_number_button_4+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1263 :: 		servo_number_button_4.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_servo_number_button_4+4)
MOVT	R0, #hi_addr(_servo_number_button_4+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1264 :: 		servo_number_button_4.Left            = 281;
MOVW	R1, #281
MOVW	R0, #lo_addr(_servo_number_button_4+6)
MOVT	R0, #hi_addr(_servo_number_button_4+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1265 :: 		servo_number_button_4.Top             = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_servo_number_button_4+8)
MOVT	R0, #hi_addr(_servo_number_button_4+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1266 :: 		servo_number_button_4.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_servo_number_button_4+10)
MOVT	R0, #hi_addr(_servo_number_button_4+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1267 :: 		servo_number_button_4.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_servo_number_button_4+12)
MOVT	R0, #hi_addr(_servo_number_button_4+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1268 :: 		servo_number_button_4.Pen_Width       = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_servo_number_button_4+14)
MOVT	R0, #hi_addr(_servo_number_button_4+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1269 :: 		servo_number_button_4.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_4+16)
MOVT	R0, #hi_addr(_servo_number_button_4+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1270 :: 		servo_number_button_4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_4+18)
MOVT	R0, #hi_addr(_servo_number_button_4+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1271 :: 		servo_number_button_4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_4+19)
MOVT	R0, #hi_addr(_servo_number_button_4+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1272 :: 		servo_number_button_4.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_4+20)
MOVT	R0, #hi_addr(_servo_number_button_4+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1273 :: 		servo_number_button_4.Caption         = servo_number_button_4_Caption;
MOVW	R1, #lo_addr(_servo_number_button_4_Caption+0)
MOVT	R1, #hi_addr(_servo_number_button_4_Caption+0)
MOVW	R0, #lo_addr(_servo_number_button_4+24)
MOVT	R0, #hi_addr(_servo_number_button_4+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1274 :: 		servo_number_button_4.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_4+28)
MOVT	R0, #hi_addr(_servo_number_button_4+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1275 :: 		servo_number_button_4.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_4+29)
MOVT	R0, #hi_addr(_servo_number_button_4+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1276 :: 		servo_number_button_4.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_servo_number_button_4+32)
MOVT	R0, #hi_addr(_servo_number_button_4+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1277 :: 		servo_number_button_4.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_4+48)
MOVT	R0, #hi_addr(_servo_number_button_4+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1278 :: 		servo_number_button_4.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_4+36)
MOVT	R0, #hi_addr(_servo_number_button_4+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1279 :: 		servo_number_button_4.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_4+38)
MOVT	R0, #hi_addr(_servo_number_button_4+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1280 :: 		servo_number_button_4.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_4+39)
MOVT	R0, #hi_addr(_servo_number_button_4+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1281 :: 		servo_number_button_4.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_4+40)
MOVT	R0, #hi_addr(_servo_number_button_4+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1282 :: 		servo_number_button_4.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_servo_number_button_4+42)
MOVT	R0, #hi_addr(_servo_number_button_4+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1283 :: 		servo_number_button_4.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_servo_number_button_4+44)
MOVT	R0, #hi_addr(_servo_number_button_4+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1284 :: 		servo_number_button_4.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_4+46)
MOVT	R0, #hi_addr(_servo_number_button_4+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1285 :: 		servo_number_button_4.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_4+50)
MOVT	R0, #hi_addr(_servo_number_button_4+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1286 :: 		servo_number_button_4.OnClickPtr      = servo_number_button_4OnClick;
MOVW	R1, #lo_addr(_servo_number_button_4OnClick+0)
MOVT	R1, #hi_addr(_servo_number_button_4OnClick+0)
MOVW	R0, #lo_addr(_servo_number_button_4+60)
MOVT	R0, #hi_addr(_servo_number_button_4+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1288 :: 		servo_number_button_6.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_servo_number_button_6+0)
MOVT	R0, #hi_addr(_servo_number_button_6+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1289 :: 		servo_number_button_6.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_servo_number_button_6+4)
MOVT	R0, #hi_addr(_servo_number_button_6+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1290 :: 		servo_number_button_6.Left            = 440;
MOVW	R1, #440
MOVW	R0, #lo_addr(_servo_number_button_6+6)
MOVT	R0, #hi_addr(_servo_number_button_6+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1291 :: 		servo_number_button_6.Top             = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_servo_number_button_6+8)
MOVT	R0, #hi_addr(_servo_number_button_6+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1292 :: 		servo_number_button_6.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_servo_number_button_6+10)
MOVT	R0, #hi_addr(_servo_number_button_6+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1293 :: 		servo_number_button_6.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_servo_number_button_6+12)
MOVT	R0, #hi_addr(_servo_number_button_6+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1294 :: 		servo_number_button_6.Pen_Width       = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_servo_number_button_6+14)
MOVT	R0, #hi_addr(_servo_number_button_6+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1295 :: 		servo_number_button_6.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_6+16)
MOVT	R0, #hi_addr(_servo_number_button_6+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1296 :: 		servo_number_button_6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_6+18)
MOVT	R0, #hi_addr(_servo_number_button_6+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1297 :: 		servo_number_button_6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_6+19)
MOVT	R0, #hi_addr(_servo_number_button_6+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1298 :: 		servo_number_button_6.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_6+20)
MOVT	R0, #hi_addr(_servo_number_button_6+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1299 :: 		servo_number_button_6.Caption         = servo_number_button_6_Caption;
MOVW	R1, #lo_addr(_servo_number_button_6_Caption+0)
MOVT	R1, #hi_addr(_servo_number_button_6_Caption+0)
MOVW	R0, #lo_addr(_servo_number_button_6+24)
MOVT	R0, #hi_addr(_servo_number_button_6+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1300 :: 		servo_number_button_6.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_6+28)
MOVT	R0, #hi_addr(_servo_number_button_6+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1301 :: 		servo_number_button_6.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_6+29)
MOVT	R0, #hi_addr(_servo_number_button_6+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1302 :: 		servo_number_button_6.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_servo_number_button_6+32)
MOVT	R0, #hi_addr(_servo_number_button_6+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1303 :: 		servo_number_button_6.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_6+48)
MOVT	R0, #hi_addr(_servo_number_button_6+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1304 :: 		servo_number_button_6.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_6+36)
MOVT	R0, #hi_addr(_servo_number_button_6+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1305 :: 		servo_number_button_6.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_6+38)
MOVT	R0, #hi_addr(_servo_number_button_6+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1306 :: 		servo_number_button_6.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_6+39)
MOVT	R0, #hi_addr(_servo_number_button_6+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1307 :: 		servo_number_button_6.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_6+40)
MOVT	R0, #hi_addr(_servo_number_button_6+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1308 :: 		servo_number_button_6.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_servo_number_button_6+42)
MOVT	R0, #hi_addr(_servo_number_button_6+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1309 :: 		servo_number_button_6.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_servo_number_button_6+44)
MOVT	R0, #hi_addr(_servo_number_button_6+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1310 :: 		servo_number_button_6.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_6+46)
MOVT	R0, #hi_addr(_servo_number_button_6+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1311 :: 		servo_number_button_6.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_6+50)
MOVT	R0, #hi_addr(_servo_number_button_6+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1312 :: 		servo_number_button_6.OnClickPtr      = servo_number_button_6OnClick;
MOVW	R1, #lo_addr(_servo_number_button_6OnClick+0)
MOVT	R1, #hi_addr(_servo_number_button_6OnClick+0)
MOVW	R0, #lo_addr(_servo_number_button_6+60)
MOVT	R0, #hi_addr(_servo_number_button_6+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1314 :: 		servo_number_button_5.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_servo_number_button_5+0)
MOVT	R0, #hi_addr(_servo_number_button_5+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1315 :: 		servo_number_button_5.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_servo_number_button_5+4)
MOVT	R0, #hi_addr(_servo_number_button_5+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1316 :: 		servo_number_button_5.Left            = 360;
MOVW	R1, #360
MOVW	R0, #lo_addr(_servo_number_button_5+6)
MOVT	R0, #hi_addr(_servo_number_button_5+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1317 :: 		servo_number_button_5.Top             = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_servo_number_button_5+8)
MOVT	R0, #hi_addr(_servo_number_button_5+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1318 :: 		servo_number_button_5.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_servo_number_button_5+10)
MOVT	R0, #hi_addr(_servo_number_button_5+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1319 :: 		servo_number_button_5.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_servo_number_button_5+12)
MOVT	R0, #hi_addr(_servo_number_button_5+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1320 :: 		servo_number_button_5.Pen_Width       = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_servo_number_button_5+14)
MOVT	R0, #hi_addr(_servo_number_button_5+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1321 :: 		servo_number_button_5.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_5+16)
MOVT	R0, #hi_addr(_servo_number_button_5+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1322 :: 		servo_number_button_5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_5+18)
MOVT	R0, #hi_addr(_servo_number_button_5+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1323 :: 		servo_number_button_5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_5+19)
MOVT	R0, #hi_addr(_servo_number_button_5+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1324 :: 		servo_number_button_5.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_5+20)
MOVT	R0, #hi_addr(_servo_number_button_5+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1325 :: 		servo_number_button_5.Caption         = servo_number_button_5_Caption;
MOVW	R1, #lo_addr(_servo_number_button_5_Caption+0)
MOVT	R1, #hi_addr(_servo_number_button_5_Caption+0)
MOVW	R0, #lo_addr(_servo_number_button_5+24)
MOVT	R0, #hi_addr(_servo_number_button_5+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1326 :: 		servo_number_button_5.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_5+28)
MOVT	R0, #hi_addr(_servo_number_button_5+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1327 :: 		servo_number_button_5.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_5+29)
MOVT	R0, #hi_addr(_servo_number_button_5+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1328 :: 		servo_number_button_5.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_servo_number_button_5+32)
MOVT	R0, #hi_addr(_servo_number_button_5+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1329 :: 		servo_number_button_5.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_5+48)
MOVT	R0, #hi_addr(_servo_number_button_5+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1330 :: 		servo_number_button_5.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_5+36)
MOVT	R0, #hi_addr(_servo_number_button_5+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1331 :: 		servo_number_button_5.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_5+38)
MOVT	R0, #hi_addr(_servo_number_button_5+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1332 :: 		servo_number_button_5.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_5+39)
MOVT	R0, #hi_addr(_servo_number_button_5+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1333 :: 		servo_number_button_5.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_5+40)
MOVT	R0, #hi_addr(_servo_number_button_5+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1334 :: 		servo_number_button_5.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_servo_number_button_5+42)
MOVT	R0, #hi_addr(_servo_number_button_5+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1335 :: 		servo_number_button_5.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_servo_number_button_5+44)
MOVT	R0, #hi_addr(_servo_number_button_5+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1336 :: 		servo_number_button_5.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_5+46)
MOVT	R0, #hi_addr(_servo_number_button_5+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1337 :: 		servo_number_button_5.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_5+50)
MOVT	R0, #hi_addr(_servo_number_button_5+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1338 :: 		servo_number_button_5.OnClickPtr      = servo_number_button_5OnClick;
MOVW	R1, #lo_addr(_servo_number_button_5OnClick+0)
MOVT	R1, #hi_addr(_servo_number_button_5OnClick+0)
MOVW	R0, #lo_addr(_servo_number_button_5+60)
MOVT	R0, #hi_addr(_servo_number_button_5+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1340 :: 		servo_number_button_7.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_servo_number_button_7+0)
MOVT	R0, #hi_addr(_servo_number_button_7+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1341 :: 		servo_number_button_7.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_servo_number_button_7+4)
MOVT	R0, #hi_addr(_servo_number_button_7+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1342 :: 		servo_number_button_7.Left            = 520;
MOVW	R1, #520
MOVW	R0, #lo_addr(_servo_number_button_7+6)
MOVT	R0, #hi_addr(_servo_number_button_7+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1343 :: 		servo_number_button_7.Top             = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_servo_number_button_7+8)
MOVT	R0, #hi_addr(_servo_number_button_7+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1344 :: 		servo_number_button_7.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_servo_number_button_7+10)
MOVT	R0, #hi_addr(_servo_number_button_7+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1345 :: 		servo_number_button_7.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_servo_number_button_7+12)
MOVT	R0, #hi_addr(_servo_number_button_7+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1346 :: 		servo_number_button_7.Pen_Width       = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_servo_number_button_7+14)
MOVT	R0, #hi_addr(_servo_number_button_7+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1347 :: 		servo_number_button_7.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_7+16)
MOVT	R0, #hi_addr(_servo_number_button_7+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1348 :: 		servo_number_button_7.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_7+18)
MOVT	R0, #hi_addr(_servo_number_button_7+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1349 :: 		servo_number_button_7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_7+19)
MOVT	R0, #hi_addr(_servo_number_button_7+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1350 :: 		servo_number_button_7.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_7+20)
MOVT	R0, #hi_addr(_servo_number_button_7+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1351 :: 		servo_number_button_7.Caption         = servo_number_button_7_Caption;
MOVW	R1, #lo_addr(_servo_number_button_7_Caption+0)
MOVT	R1, #hi_addr(_servo_number_button_7_Caption+0)
MOVW	R0, #lo_addr(_servo_number_button_7+24)
MOVT	R0, #hi_addr(_servo_number_button_7+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1352 :: 		servo_number_button_7.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_7+28)
MOVT	R0, #hi_addr(_servo_number_button_7+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1353 :: 		servo_number_button_7.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_7+29)
MOVT	R0, #hi_addr(_servo_number_button_7+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1354 :: 		servo_number_button_7.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_servo_number_button_7+32)
MOVT	R0, #hi_addr(_servo_number_button_7+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1355 :: 		servo_number_button_7.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_7+48)
MOVT	R0, #hi_addr(_servo_number_button_7+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1356 :: 		servo_number_button_7.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_7+36)
MOVT	R0, #hi_addr(_servo_number_button_7+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1357 :: 		servo_number_button_7.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_7+38)
MOVT	R0, #hi_addr(_servo_number_button_7+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1358 :: 		servo_number_button_7.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_7+39)
MOVT	R0, #hi_addr(_servo_number_button_7+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1359 :: 		servo_number_button_7.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_7+40)
MOVT	R0, #hi_addr(_servo_number_button_7+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1360 :: 		servo_number_button_7.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_servo_number_button_7+42)
MOVT	R0, #hi_addr(_servo_number_button_7+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1361 :: 		servo_number_button_7.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_servo_number_button_7+44)
MOVT	R0, #hi_addr(_servo_number_button_7+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1362 :: 		servo_number_button_7.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_7+46)
MOVT	R0, #hi_addr(_servo_number_button_7+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1363 :: 		servo_number_button_7.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_7+50)
MOVT	R0, #hi_addr(_servo_number_button_7+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1364 :: 		servo_number_button_7.OnClickPtr      = servo_number_button_7OnClick;
MOVW	R1, #lo_addr(_servo_number_button_7OnClick+0)
MOVT	R1, #hi_addr(_servo_number_button_7OnClick+0)
MOVW	R0, #lo_addr(_servo_number_button_7+60)
MOVT	R0, #hi_addr(_servo_number_button_7+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1366 :: 		servo_number_button_8.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_servo_number_button_8+0)
MOVT	R0, #hi_addr(_servo_number_button_8+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1367 :: 		servo_number_button_8.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_servo_number_button_8+4)
MOVT	R0, #hi_addr(_servo_number_button_8+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1368 :: 		servo_number_button_8.Left            = 600;
MOVW	R1, #600
MOVW	R0, #lo_addr(_servo_number_button_8+6)
MOVT	R0, #hi_addr(_servo_number_button_8+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1369 :: 		servo_number_button_8.Top             = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_servo_number_button_8+8)
MOVT	R0, #hi_addr(_servo_number_button_8+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1370 :: 		servo_number_button_8.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_servo_number_button_8+10)
MOVT	R0, #hi_addr(_servo_number_button_8+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1371 :: 		servo_number_button_8.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_servo_number_button_8+12)
MOVT	R0, #hi_addr(_servo_number_button_8+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1372 :: 		servo_number_button_8.Pen_Width       = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_servo_number_button_8+14)
MOVT	R0, #hi_addr(_servo_number_button_8+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1373 :: 		servo_number_button_8.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_8+16)
MOVT	R0, #hi_addr(_servo_number_button_8+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1374 :: 		servo_number_button_8.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_8+18)
MOVT	R0, #hi_addr(_servo_number_button_8+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1375 :: 		servo_number_button_8.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_8+19)
MOVT	R0, #hi_addr(_servo_number_button_8+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1376 :: 		servo_number_button_8.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_8+20)
MOVT	R0, #hi_addr(_servo_number_button_8+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1377 :: 		servo_number_button_8.Caption         = servo_number_button_8_Caption;
MOVW	R1, #lo_addr(_servo_number_button_8_Caption+0)
MOVT	R1, #hi_addr(_servo_number_button_8_Caption+0)
MOVW	R0, #lo_addr(_servo_number_button_8+24)
MOVT	R0, #hi_addr(_servo_number_button_8+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1378 :: 		servo_number_button_8.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_8+28)
MOVT	R0, #hi_addr(_servo_number_button_8+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1379 :: 		servo_number_button_8.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_8+29)
MOVT	R0, #hi_addr(_servo_number_button_8+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1380 :: 		servo_number_button_8.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_servo_number_button_8+32)
MOVT	R0, #hi_addr(_servo_number_button_8+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1381 :: 		servo_number_button_8.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_8+48)
MOVT	R0, #hi_addr(_servo_number_button_8+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1382 :: 		servo_number_button_8.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_8+36)
MOVT	R0, #hi_addr(_servo_number_button_8+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1383 :: 		servo_number_button_8.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_8+38)
MOVT	R0, #hi_addr(_servo_number_button_8+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1384 :: 		servo_number_button_8.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_8+39)
MOVT	R0, #hi_addr(_servo_number_button_8+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1385 :: 		servo_number_button_8.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_8+40)
MOVT	R0, #hi_addr(_servo_number_button_8+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1386 :: 		servo_number_button_8.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_servo_number_button_8+42)
MOVT	R0, #hi_addr(_servo_number_button_8+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1387 :: 		servo_number_button_8.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_servo_number_button_8+44)
MOVT	R0, #hi_addr(_servo_number_button_8+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1388 :: 		servo_number_button_8.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_8+46)
MOVT	R0, #hi_addr(_servo_number_button_8+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1389 :: 		servo_number_button_8.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_8+50)
MOVT	R0, #hi_addr(_servo_number_button_8+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1390 :: 		servo_number_button_8.OnClickPtr      = servo_number_button_8OnClick;
MOVW	R1, #lo_addr(_servo_number_button_8OnClick+0)
MOVT	R1, #hi_addr(_servo_number_button_8OnClick+0)
MOVW	R0, #lo_addr(_servo_number_button_8+60)
MOVT	R0, #hi_addr(_servo_number_button_8+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1392 :: 		servo_number_button_9.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_servo_number_button_9+0)
MOVT	R0, #hi_addr(_servo_number_button_9+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1393 :: 		servo_number_button_9.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_servo_number_button_9+4)
MOVT	R0, #hi_addr(_servo_number_button_9+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1394 :: 		servo_number_button_9.Left            = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_servo_number_button_9+6)
MOVT	R0, #hi_addr(_servo_number_button_9+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1395 :: 		servo_number_button_9.Top             = 90;
MOVS	R1, #90
MOVW	R0, #lo_addr(_servo_number_button_9+8)
MOVT	R0, #hi_addr(_servo_number_button_9+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1396 :: 		servo_number_button_9.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_servo_number_button_9+10)
MOVT	R0, #hi_addr(_servo_number_button_9+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1397 :: 		servo_number_button_9.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_servo_number_button_9+12)
MOVT	R0, #hi_addr(_servo_number_button_9+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1398 :: 		servo_number_button_9.Pen_Width       = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_servo_number_button_9+14)
MOVT	R0, #hi_addr(_servo_number_button_9+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1399 :: 		servo_number_button_9.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_9+16)
MOVT	R0, #hi_addr(_servo_number_button_9+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1400 :: 		servo_number_button_9.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_9+18)
MOVT	R0, #hi_addr(_servo_number_button_9+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1401 :: 		servo_number_button_9.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_9+19)
MOVT	R0, #hi_addr(_servo_number_button_9+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1402 :: 		servo_number_button_9.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_9+20)
MOVT	R0, #hi_addr(_servo_number_button_9+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1403 :: 		servo_number_button_9.Caption         = servo_number_button_9_Caption;
MOVW	R1, #lo_addr(_servo_number_button_9_Caption+0)
MOVT	R1, #hi_addr(_servo_number_button_9_Caption+0)
MOVW	R0, #lo_addr(_servo_number_button_9+24)
MOVT	R0, #hi_addr(_servo_number_button_9+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1404 :: 		servo_number_button_9.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_9+28)
MOVT	R0, #hi_addr(_servo_number_button_9+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1405 :: 		servo_number_button_9.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_9+29)
MOVT	R0, #hi_addr(_servo_number_button_9+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1406 :: 		servo_number_button_9.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_servo_number_button_9+32)
MOVT	R0, #hi_addr(_servo_number_button_9+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1407 :: 		servo_number_button_9.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_9+48)
MOVT	R0, #hi_addr(_servo_number_button_9+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1408 :: 		servo_number_button_9.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_9+36)
MOVT	R0, #hi_addr(_servo_number_button_9+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1409 :: 		servo_number_button_9.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_9+38)
MOVT	R0, #hi_addr(_servo_number_button_9+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1410 :: 		servo_number_button_9.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_9+39)
MOVT	R0, #hi_addr(_servo_number_button_9+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1411 :: 		servo_number_button_9.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_9+40)
MOVT	R0, #hi_addr(_servo_number_button_9+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1412 :: 		servo_number_button_9.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_servo_number_button_9+42)
MOVT	R0, #hi_addr(_servo_number_button_9+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1413 :: 		servo_number_button_9.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_servo_number_button_9+44)
MOVT	R0, #hi_addr(_servo_number_button_9+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1414 :: 		servo_number_button_9.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_9+46)
MOVT	R0, #hi_addr(_servo_number_button_9+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1415 :: 		servo_number_button_9.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_9+50)
MOVT	R0, #hi_addr(_servo_number_button_9+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1416 :: 		servo_number_button_9.OnClickPtr      = servo_number_button_9OnClick;
MOVW	R1, #lo_addr(_servo_number_button_9OnClick+0)
MOVT	R1, #hi_addr(_servo_number_button_9OnClick+0)
MOVW	R0, #lo_addr(_servo_number_button_9+60)
MOVT	R0, #hi_addr(_servo_number_button_9+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1418 :: 		servo_number_button_10.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_servo_number_button_10+0)
MOVT	R0, #hi_addr(_servo_number_button_10+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1419 :: 		servo_number_button_10.Order           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_servo_number_button_10+4)
MOVT	R0, #hi_addr(_servo_number_button_10+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1420 :: 		servo_number_button_10.Left            = 120;
MOVS	R1, #120
MOVW	R0, #lo_addr(_servo_number_button_10+6)
MOVT	R0, #hi_addr(_servo_number_button_10+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1421 :: 		servo_number_button_10.Top             = 90;
MOVS	R1, #90
MOVW	R0, #lo_addr(_servo_number_button_10+8)
MOVT	R0, #hi_addr(_servo_number_button_10+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1422 :: 		servo_number_button_10.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_servo_number_button_10+10)
MOVT	R0, #hi_addr(_servo_number_button_10+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1423 :: 		servo_number_button_10.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_servo_number_button_10+12)
MOVT	R0, #hi_addr(_servo_number_button_10+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1424 :: 		servo_number_button_10.Pen_Width       = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_servo_number_button_10+14)
MOVT	R0, #hi_addr(_servo_number_button_10+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1425 :: 		servo_number_button_10.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_10+16)
MOVT	R0, #hi_addr(_servo_number_button_10+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1426 :: 		servo_number_button_10.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_10+18)
MOVT	R0, #hi_addr(_servo_number_button_10+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1427 :: 		servo_number_button_10.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_10+19)
MOVT	R0, #hi_addr(_servo_number_button_10+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1428 :: 		servo_number_button_10.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_10+20)
MOVT	R0, #hi_addr(_servo_number_button_10+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1429 :: 		servo_number_button_10.Caption         = servo_number_button_10_Caption;
MOVW	R1, #lo_addr(_servo_number_button_10_Caption+0)
MOVT	R1, #hi_addr(_servo_number_button_10_Caption+0)
MOVW	R0, #lo_addr(_servo_number_button_10+24)
MOVT	R0, #hi_addr(_servo_number_button_10+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1430 :: 		servo_number_button_10.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_10+28)
MOVT	R0, #hi_addr(_servo_number_button_10+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1431 :: 		servo_number_button_10.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_10+29)
MOVT	R0, #hi_addr(_servo_number_button_10+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1432 :: 		servo_number_button_10.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_servo_number_button_10+32)
MOVT	R0, #hi_addr(_servo_number_button_10+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1433 :: 		servo_number_button_10.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_10+48)
MOVT	R0, #hi_addr(_servo_number_button_10+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1434 :: 		servo_number_button_10.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_10+36)
MOVT	R0, #hi_addr(_servo_number_button_10+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1435 :: 		servo_number_button_10.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_10+38)
MOVT	R0, #hi_addr(_servo_number_button_10+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1436 :: 		servo_number_button_10.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_10+39)
MOVT	R0, #hi_addr(_servo_number_button_10+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1437 :: 		servo_number_button_10.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_10+40)
MOVT	R0, #hi_addr(_servo_number_button_10+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1438 :: 		servo_number_button_10.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_servo_number_button_10+42)
MOVT	R0, #hi_addr(_servo_number_button_10+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1439 :: 		servo_number_button_10.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_servo_number_button_10+44)
MOVT	R0, #hi_addr(_servo_number_button_10+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1440 :: 		servo_number_button_10.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_10+46)
MOVT	R0, #hi_addr(_servo_number_button_10+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1441 :: 		servo_number_button_10.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_10+50)
MOVT	R0, #hi_addr(_servo_number_button_10+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1442 :: 		servo_number_button_10.OnClickPtr      = servo_number_button_10OnClick;
MOVW	R1, #lo_addr(_servo_number_button_10OnClick+0)
MOVT	R1, #hi_addr(_servo_number_button_10OnClick+0)
MOVW	R0, #lo_addr(_servo_number_button_10+60)
MOVT	R0, #hi_addr(_servo_number_button_10+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1444 :: 		servo_number_button_11.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_servo_number_button_11+0)
MOVT	R0, #hi_addr(_servo_number_button_11+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1445 :: 		servo_number_button_11.Order           = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_servo_number_button_11+4)
MOVT	R0, #hi_addr(_servo_number_button_11+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1446 :: 		servo_number_button_11.Left            = 200;
MOVS	R1, #200
MOVW	R0, #lo_addr(_servo_number_button_11+6)
MOVT	R0, #hi_addr(_servo_number_button_11+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1447 :: 		servo_number_button_11.Top             = 90;
MOVS	R1, #90
MOVW	R0, #lo_addr(_servo_number_button_11+8)
MOVT	R0, #hi_addr(_servo_number_button_11+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1448 :: 		servo_number_button_11.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_servo_number_button_11+10)
MOVT	R0, #hi_addr(_servo_number_button_11+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1449 :: 		servo_number_button_11.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_servo_number_button_11+12)
MOVT	R0, #hi_addr(_servo_number_button_11+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1450 :: 		servo_number_button_11.Pen_Width       = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_servo_number_button_11+14)
MOVT	R0, #hi_addr(_servo_number_button_11+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1451 :: 		servo_number_button_11.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_11+16)
MOVT	R0, #hi_addr(_servo_number_button_11+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1452 :: 		servo_number_button_11.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_11+18)
MOVT	R0, #hi_addr(_servo_number_button_11+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1453 :: 		servo_number_button_11.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_11+19)
MOVT	R0, #hi_addr(_servo_number_button_11+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1454 :: 		servo_number_button_11.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_11+20)
MOVT	R0, #hi_addr(_servo_number_button_11+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1455 :: 		servo_number_button_11.Caption         = servo_number_button_11_Caption;
MOVW	R1, #lo_addr(_servo_number_button_11_Caption+0)
MOVT	R1, #hi_addr(_servo_number_button_11_Caption+0)
MOVW	R0, #lo_addr(_servo_number_button_11+24)
MOVT	R0, #hi_addr(_servo_number_button_11+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1456 :: 		servo_number_button_11.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_11+28)
MOVT	R0, #hi_addr(_servo_number_button_11+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1457 :: 		servo_number_button_11.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_11+29)
MOVT	R0, #hi_addr(_servo_number_button_11+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1458 :: 		servo_number_button_11.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_servo_number_button_11+32)
MOVT	R0, #hi_addr(_servo_number_button_11+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1459 :: 		servo_number_button_11.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_11+48)
MOVT	R0, #hi_addr(_servo_number_button_11+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1460 :: 		servo_number_button_11.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_11+36)
MOVT	R0, #hi_addr(_servo_number_button_11+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1461 :: 		servo_number_button_11.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_11+38)
MOVT	R0, #hi_addr(_servo_number_button_11+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1462 :: 		servo_number_button_11.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_11+39)
MOVT	R0, #hi_addr(_servo_number_button_11+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1463 :: 		servo_number_button_11.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_11+40)
MOVT	R0, #hi_addr(_servo_number_button_11+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1464 :: 		servo_number_button_11.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_servo_number_button_11+42)
MOVT	R0, #hi_addr(_servo_number_button_11+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1465 :: 		servo_number_button_11.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_servo_number_button_11+44)
MOVT	R0, #hi_addr(_servo_number_button_11+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1466 :: 		servo_number_button_11.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_11+46)
MOVT	R0, #hi_addr(_servo_number_button_11+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1467 :: 		servo_number_button_11.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_11+50)
MOVT	R0, #hi_addr(_servo_number_button_11+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1468 :: 		servo_number_button_11.OnClickPtr      = servo_number_button_11OnClick;
MOVW	R1, #lo_addr(_servo_number_button_11OnClick+0)
MOVT	R1, #hi_addr(_servo_number_button_11OnClick+0)
MOVW	R0, #lo_addr(_servo_number_button_11+60)
MOVT	R0, #hi_addr(_servo_number_button_11+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1470 :: 		servo_number_button_12.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_servo_number_button_12+0)
MOVT	R0, #hi_addr(_servo_number_button_12+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1471 :: 		servo_number_button_12.Order           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_servo_number_button_12+4)
MOVT	R0, #hi_addr(_servo_number_button_12+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1472 :: 		servo_number_button_12.Left            = 280;
MOVW	R1, #280
MOVW	R0, #lo_addr(_servo_number_button_12+6)
MOVT	R0, #hi_addr(_servo_number_button_12+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1473 :: 		servo_number_button_12.Top             = 90;
MOVS	R1, #90
MOVW	R0, #lo_addr(_servo_number_button_12+8)
MOVT	R0, #hi_addr(_servo_number_button_12+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1474 :: 		servo_number_button_12.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_servo_number_button_12+10)
MOVT	R0, #hi_addr(_servo_number_button_12+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1475 :: 		servo_number_button_12.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_servo_number_button_12+12)
MOVT	R0, #hi_addr(_servo_number_button_12+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1476 :: 		servo_number_button_12.Pen_Width       = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_servo_number_button_12+14)
MOVT	R0, #hi_addr(_servo_number_button_12+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1477 :: 		servo_number_button_12.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_12+16)
MOVT	R0, #hi_addr(_servo_number_button_12+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1478 :: 		servo_number_button_12.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_12+18)
MOVT	R0, #hi_addr(_servo_number_button_12+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1479 :: 		servo_number_button_12.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_12+19)
MOVT	R0, #hi_addr(_servo_number_button_12+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1480 :: 		servo_number_button_12.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_12+20)
MOVT	R0, #hi_addr(_servo_number_button_12+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1481 :: 		servo_number_button_12.Caption         = servo_number_button_12_Caption;
MOVW	R1, #lo_addr(_servo_number_button_12_Caption+0)
MOVT	R1, #hi_addr(_servo_number_button_12_Caption+0)
MOVW	R0, #lo_addr(_servo_number_button_12+24)
MOVT	R0, #hi_addr(_servo_number_button_12+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1482 :: 		servo_number_button_12.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_12+28)
MOVT	R0, #hi_addr(_servo_number_button_12+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1483 :: 		servo_number_button_12.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_12+29)
MOVT	R0, #hi_addr(_servo_number_button_12+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1484 :: 		servo_number_button_12.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_servo_number_button_12+32)
MOVT	R0, #hi_addr(_servo_number_button_12+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1485 :: 		servo_number_button_12.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_12+48)
MOVT	R0, #hi_addr(_servo_number_button_12+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1486 :: 		servo_number_button_12.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_12+36)
MOVT	R0, #hi_addr(_servo_number_button_12+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1487 :: 		servo_number_button_12.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_12+38)
MOVT	R0, #hi_addr(_servo_number_button_12+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1488 :: 		servo_number_button_12.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_12+39)
MOVT	R0, #hi_addr(_servo_number_button_12+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1489 :: 		servo_number_button_12.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_12+40)
MOVT	R0, #hi_addr(_servo_number_button_12+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1490 :: 		servo_number_button_12.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_servo_number_button_12+42)
MOVT	R0, #hi_addr(_servo_number_button_12+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1491 :: 		servo_number_button_12.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_servo_number_button_12+44)
MOVT	R0, #hi_addr(_servo_number_button_12+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1492 :: 		servo_number_button_12.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_12+46)
MOVT	R0, #hi_addr(_servo_number_button_12+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1493 :: 		servo_number_button_12.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_12+50)
MOVT	R0, #hi_addr(_servo_number_button_12+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1494 :: 		servo_number_button_12.OnClickPtr      = servo_number_button_12OnClick;
MOVW	R1, #lo_addr(_servo_number_button_12OnClick+0)
MOVT	R1, #hi_addr(_servo_number_button_12OnClick+0)
MOVW	R0, #lo_addr(_servo_number_button_12+60)
MOVT	R0, #hi_addr(_servo_number_button_12+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1496 :: 		servo_number_button_13.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_servo_number_button_13+0)
MOVT	R0, #hi_addr(_servo_number_button_13+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1497 :: 		servo_number_button_13.Order           = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_servo_number_button_13+4)
MOVT	R0, #hi_addr(_servo_number_button_13+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1498 :: 		servo_number_button_13.Left            = 360;
MOVW	R1, #360
MOVW	R0, #lo_addr(_servo_number_button_13+6)
MOVT	R0, #hi_addr(_servo_number_button_13+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1499 :: 		servo_number_button_13.Top             = 90;
MOVS	R1, #90
MOVW	R0, #lo_addr(_servo_number_button_13+8)
MOVT	R0, #hi_addr(_servo_number_button_13+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1500 :: 		servo_number_button_13.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_servo_number_button_13+10)
MOVT	R0, #hi_addr(_servo_number_button_13+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1501 :: 		servo_number_button_13.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_servo_number_button_13+12)
MOVT	R0, #hi_addr(_servo_number_button_13+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1502 :: 		servo_number_button_13.Pen_Width       = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_servo_number_button_13+14)
MOVT	R0, #hi_addr(_servo_number_button_13+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1503 :: 		servo_number_button_13.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_13+16)
MOVT	R0, #hi_addr(_servo_number_button_13+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1504 :: 		servo_number_button_13.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_13+18)
MOVT	R0, #hi_addr(_servo_number_button_13+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1505 :: 		servo_number_button_13.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_13+19)
MOVT	R0, #hi_addr(_servo_number_button_13+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1506 :: 		servo_number_button_13.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_13+20)
MOVT	R0, #hi_addr(_servo_number_button_13+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1507 :: 		servo_number_button_13.Caption         = servo_number_button_13_Caption;
MOVW	R1, #lo_addr(_servo_number_button_13_Caption+0)
MOVT	R1, #hi_addr(_servo_number_button_13_Caption+0)
MOVW	R0, #lo_addr(_servo_number_button_13+24)
MOVT	R0, #hi_addr(_servo_number_button_13+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1508 :: 		servo_number_button_13.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_13+28)
MOVT	R0, #hi_addr(_servo_number_button_13+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1509 :: 		servo_number_button_13.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_13+29)
MOVT	R0, #hi_addr(_servo_number_button_13+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1510 :: 		servo_number_button_13.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_servo_number_button_13+32)
MOVT	R0, #hi_addr(_servo_number_button_13+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1511 :: 		servo_number_button_13.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_13+48)
MOVT	R0, #hi_addr(_servo_number_button_13+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1512 :: 		servo_number_button_13.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_13+36)
MOVT	R0, #hi_addr(_servo_number_button_13+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1513 :: 		servo_number_button_13.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_13+38)
MOVT	R0, #hi_addr(_servo_number_button_13+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1514 :: 		servo_number_button_13.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_13+39)
MOVT	R0, #hi_addr(_servo_number_button_13+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1515 :: 		servo_number_button_13.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_13+40)
MOVT	R0, #hi_addr(_servo_number_button_13+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1516 :: 		servo_number_button_13.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_servo_number_button_13+42)
MOVT	R0, #hi_addr(_servo_number_button_13+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1517 :: 		servo_number_button_13.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_servo_number_button_13+44)
MOVT	R0, #hi_addr(_servo_number_button_13+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1518 :: 		servo_number_button_13.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_13+46)
MOVT	R0, #hi_addr(_servo_number_button_13+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1519 :: 		servo_number_button_13.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_13+50)
MOVT	R0, #hi_addr(_servo_number_button_13+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1520 :: 		servo_number_button_13.OnClickPtr      = servo_number_button_13OnClick;
MOVW	R1, #lo_addr(_servo_number_button_13OnClick+0)
MOVT	R1, #hi_addr(_servo_number_button_13OnClick+0)
MOVW	R0, #lo_addr(_servo_number_button_13+60)
MOVT	R0, #hi_addr(_servo_number_button_13+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1522 :: 		servo_number_button_14.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_servo_number_button_14+0)
MOVT	R0, #hi_addr(_servo_number_button_14+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1523 :: 		servo_number_button_14.Order           = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_servo_number_button_14+4)
MOVT	R0, #hi_addr(_servo_number_button_14+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1524 :: 		servo_number_button_14.Left            = 440;
MOVW	R1, #440
MOVW	R0, #lo_addr(_servo_number_button_14+6)
MOVT	R0, #hi_addr(_servo_number_button_14+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1525 :: 		servo_number_button_14.Top             = 90;
MOVS	R1, #90
MOVW	R0, #lo_addr(_servo_number_button_14+8)
MOVT	R0, #hi_addr(_servo_number_button_14+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1526 :: 		servo_number_button_14.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_servo_number_button_14+10)
MOVT	R0, #hi_addr(_servo_number_button_14+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1527 :: 		servo_number_button_14.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_servo_number_button_14+12)
MOVT	R0, #hi_addr(_servo_number_button_14+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1528 :: 		servo_number_button_14.Pen_Width       = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_servo_number_button_14+14)
MOVT	R0, #hi_addr(_servo_number_button_14+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1529 :: 		servo_number_button_14.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_14+16)
MOVT	R0, #hi_addr(_servo_number_button_14+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1530 :: 		servo_number_button_14.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_14+18)
MOVT	R0, #hi_addr(_servo_number_button_14+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1531 :: 		servo_number_button_14.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_14+19)
MOVT	R0, #hi_addr(_servo_number_button_14+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1532 :: 		servo_number_button_14.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_14+20)
MOVT	R0, #hi_addr(_servo_number_button_14+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1533 :: 		servo_number_button_14.Caption         = servo_number_button_14_Caption;
MOVW	R1, #lo_addr(_servo_number_button_14_Caption+0)
MOVT	R1, #hi_addr(_servo_number_button_14_Caption+0)
MOVW	R0, #lo_addr(_servo_number_button_14+24)
MOVT	R0, #hi_addr(_servo_number_button_14+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1534 :: 		servo_number_button_14.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_14+28)
MOVT	R0, #hi_addr(_servo_number_button_14+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1535 :: 		servo_number_button_14.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_14+29)
MOVT	R0, #hi_addr(_servo_number_button_14+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1536 :: 		servo_number_button_14.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_servo_number_button_14+32)
MOVT	R0, #hi_addr(_servo_number_button_14+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1537 :: 		servo_number_button_14.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_14+48)
MOVT	R0, #hi_addr(_servo_number_button_14+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1538 :: 		servo_number_button_14.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_14+36)
MOVT	R0, #hi_addr(_servo_number_button_14+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1539 :: 		servo_number_button_14.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_14+38)
MOVT	R0, #hi_addr(_servo_number_button_14+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1540 :: 		servo_number_button_14.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_14+39)
MOVT	R0, #hi_addr(_servo_number_button_14+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1541 :: 		servo_number_button_14.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_14+40)
MOVT	R0, #hi_addr(_servo_number_button_14+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1542 :: 		servo_number_button_14.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_servo_number_button_14+42)
MOVT	R0, #hi_addr(_servo_number_button_14+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1543 :: 		servo_number_button_14.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_servo_number_button_14+44)
MOVT	R0, #hi_addr(_servo_number_button_14+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1544 :: 		servo_number_button_14.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_14+46)
MOVT	R0, #hi_addr(_servo_number_button_14+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1545 :: 		servo_number_button_14.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_14+50)
MOVT	R0, #hi_addr(_servo_number_button_14+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1546 :: 		servo_number_button_14.OnClickPtr      = servo_number_button_14OnClick;
MOVW	R1, #lo_addr(_servo_number_button_14OnClick+0)
MOVT	R1, #hi_addr(_servo_number_button_14OnClick+0)
MOVW	R0, #lo_addr(_servo_number_button_14+60)
MOVT	R0, #hi_addr(_servo_number_button_14+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1548 :: 		servo_number_button_15.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_servo_number_button_15+0)
MOVT	R0, #hi_addr(_servo_number_button_15+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1549 :: 		servo_number_button_15.Order           = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_servo_number_button_15+4)
MOVT	R0, #hi_addr(_servo_number_button_15+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1550 :: 		servo_number_button_15.Left            = 520;
MOVW	R1, #520
MOVW	R0, #lo_addr(_servo_number_button_15+6)
MOVT	R0, #hi_addr(_servo_number_button_15+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1551 :: 		servo_number_button_15.Top             = 90;
MOVS	R1, #90
MOVW	R0, #lo_addr(_servo_number_button_15+8)
MOVT	R0, #hi_addr(_servo_number_button_15+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1552 :: 		servo_number_button_15.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_servo_number_button_15+10)
MOVT	R0, #hi_addr(_servo_number_button_15+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1553 :: 		servo_number_button_15.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_servo_number_button_15+12)
MOVT	R0, #hi_addr(_servo_number_button_15+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1554 :: 		servo_number_button_15.Pen_Width       = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_servo_number_button_15+14)
MOVT	R0, #hi_addr(_servo_number_button_15+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1555 :: 		servo_number_button_15.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_15+16)
MOVT	R0, #hi_addr(_servo_number_button_15+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1556 :: 		servo_number_button_15.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_15+18)
MOVT	R0, #hi_addr(_servo_number_button_15+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1557 :: 		servo_number_button_15.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_15+19)
MOVT	R0, #hi_addr(_servo_number_button_15+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1558 :: 		servo_number_button_15.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_15+20)
MOVT	R0, #hi_addr(_servo_number_button_15+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1559 :: 		servo_number_button_15.Caption         = servo_number_button_15_Caption;
MOVW	R1, #lo_addr(_servo_number_button_15_Caption+0)
MOVT	R1, #hi_addr(_servo_number_button_15_Caption+0)
MOVW	R0, #lo_addr(_servo_number_button_15+24)
MOVT	R0, #hi_addr(_servo_number_button_15+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1560 :: 		servo_number_button_15.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_15+28)
MOVT	R0, #hi_addr(_servo_number_button_15+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1561 :: 		servo_number_button_15.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_15+29)
MOVT	R0, #hi_addr(_servo_number_button_15+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1562 :: 		servo_number_button_15.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_servo_number_button_15+32)
MOVT	R0, #hi_addr(_servo_number_button_15+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1563 :: 		servo_number_button_15.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_15+48)
MOVT	R0, #hi_addr(_servo_number_button_15+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1564 :: 		servo_number_button_15.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_15+36)
MOVT	R0, #hi_addr(_servo_number_button_15+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1565 :: 		servo_number_button_15.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_15+38)
MOVT	R0, #hi_addr(_servo_number_button_15+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1566 :: 		servo_number_button_15.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_15+39)
MOVT	R0, #hi_addr(_servo_number_button_15+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1567 :: 		servo_number_button_15.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_15+40)
MOVT	R0, #hi_addr(_servo_number_button_15+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1568 :: 		servo_number_button_15.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_servo_number_button_15+42)
MOVT	R0, #hi_addr(_servo_number_button_15+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1569 :: 		servo_number_button_15.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_servo_number_button_15+44)
MOVT	R0, #hi_addr(_servo_number_button_15+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1570 :: 		servo_number_button_15.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_15+46)
MOVT	R0, #hi_addr(_servo_number_button_15+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1571 :: 		servo_number_button_15.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_15+50)
MOVT	R0, #hi_addr(_servo_number_button_15+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1572 :: 		servo_number_button_15.OnClickPtr      = servo_number_button_15OnClick;
MOVW	R1, #lo_addr(_servo_number_button_15OnClick+0)
MOVT	R1, #hi_addr(_servo_number_button_15OnClick+0)
MOVW	R0, #lo_addr(_servo_number_button_15+60)
MOVT	R0, #hi_addr(_servo_number_button_15+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1574 :: 		servo_number_button_16.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_servo_number_button_16+0)
MOVT	R0, #hi_addr(_servo_number_button_16+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1575 :: 		servo_number_button_16.Order           = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_servo_number_button_16+4)
MOVT	R0, #hi_addr(_servo_number_button_16+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1576 :: 		servo_number_button_16.Left            = 600;
MOVW	R1, #600
MOVW	R0, #lo_addr(_servo_number_button_16+6)
MOVT	R0, #hi_addr(_servo_number_button_16+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1577 :: 		servo_number_button_16.Top             = 90;
MOVS	R1, #90
MOVW	R0, #lo_addr(_servo_number_button_16+8)
MOVT	R0, #hi_addr(_servo_number_button_16+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1578 :: 		servo_number_button_16.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_servo_number_button_16+10)
MOVT	R0, #hi_addr(_servo_number_button_16+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1579 :: 		servo_number_button_16.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_servo_number_button_16+12)
MOVT	R0, #hi_addr(_servo_number_button_16+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1580 :: 		servo_number_button_16.Pen_Width       = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_servo_number_button_16+14)
MOVT	R0, #hi_addr(_servo_number_button_16+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1581 :: 		servo_number_button_16.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_16+16)
MOVT	R0, #hi_addr(_servo_number_button_16+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1582 :: 		servo_number_button_16.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_16+18)
MOVT	R0, #hi_addr(_servo_number_button_16+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1583 :: 		servo_number_button_16.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_16+19)
MOVT	R0, #hi_addr(_servo_number_button_16+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1584 :: 		servo_number_button_16.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_16+20)
MOVT	R0, #hi_addr(_servo_number_button_16+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1585 :: 		servo_number_button_16.Caption         = servo_number_button_16_Caption;
MOVW	R1, #lo_addr(_servo_number_button_16_Caption+0)
MOVT	R1, #hi_addr(_servo_number_button_16_Caption+0)
MOVW	R0, #lo_addr(_servo_number_button_16+24)
MOVT	R0, #hi_addr(_servo_number_button_16+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1586 :: 		servo_number_button_16.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_16+28)
MOVT	R0, #hi_addr(_servo_number_button_16+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1587 :: 		servo_number_button_16.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_16+29)
MOVT	R0, #hi_addr(_servo_number_button_16+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1588 :: 		servo_number_button_16.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_servo_number_button_16+32)
MOVT	R0, #hi_addr(_servo_number_button_16+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1589 :: 		servo_number_button_16.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_16+48)
MOVT	R0, #hi_addr(_servo_number_button_16+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1590 :: 		servo_number_button_16.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_16+36)
MOVT	R0, #hi_addr(_servo_number_button_16+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1591 :: 		servo_number_button_16.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_16+38)
MOVT	R0, #hi_addr(_servo_number_button_16+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1592 :: 		servo_number_button_16.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_16+39)
MOVT	R0, #hi_addr(_servo_number_button_16+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1593 :: 		servo_number_button_16.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_16+40)
MOVT	R0, #hi_addr(_servo_number_button_16+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1594 :: 		servo_number_button_16.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_servo_number_button_16+42)
MOVT	R0, #hi_addr(_servo_number_button_16+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1595 :: 		servo_number_button_16.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_servo_number_button_16+44)
MOVT	R0, #hi_addr(_servo_number_button_16+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1596 :: 		servo_number_button_16.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_16+46)
MOVT	R0, #hi_addr(_servo_number_button_16+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1597 :: 		servo_number_button_16.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_16+50)
MOVT	R0, #hi_addr(_servo_number_button_16+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1598 :: 		servo_number_button_16.OnClickPtr      = servo_number_button_16OnClick;
MOVW	R1, #lo_addr(_servo_number_button_16OnClick+0)
MOVT	R1, #hi_addr(_servo_number_button_16OnClick+0)
MOVW	R0, #lo_addr(_servo_number_button_16+60)
MOVT	R0, #hi_addr(_servo_number_button_16+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1600 :: 		servo_number_button_3.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_servo_number_button_3+0)
MOVT	R0, #hi_addr(_servo_number_button_3+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1601 :: 		servo_number_button_3.Order           = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_servo_number_button_3+4)
MOVT	R0, #hi_addr(_servo_number_button_3+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1602 :: 		servo_number_button_3.Left            = 200;
MOVS	R1, #200
MOVW	R0, #lo_addr(_servo_number_button_3+6)
MOVT	R0, #hi_addr(_servo_number_button_3+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1603 :: 		servo_number_button_3.Top             = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_servo_number_button_3+8)
MOVT	R0, #hi_addr(_servo_number_button_3+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1604 :: 		servo_number_button_3.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_servo_number_button_3+10)
MOVT	R0, #hi_addr(_servo_number_button_3+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1605 :: 		servo_number_button_3.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_servo_number_button_3+12)
MOVT	R0, #hi_addr(_servo_number_button_3+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1606 :: 		servo_number_button_3.Pen_Width       = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_servo_number_button_3+14)
MOVT	R0, #hi_addr(_servo_number_button_3+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1607 :: 		servo_number_button_3.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_3+16)
MOVT	R0, #hi_addr(_servo_number_button_3+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1608 :: 		servo_number_button_3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_3+18)
MOVT	R0, #hi_addr(_servo_number_button_3+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1609 :: 		servo_number_button_3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_3+19)
MOVT	R0, #hi_addr(_servo_number_button_3+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1610 :: 		servo_number_button_3.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_3+20)
MOVT	R0, #hi_addr(_servo_number_button_3+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1611 :: 		servo_number_button_3.Caption         = servo_number_button_3_Caption;
MOVW	R1, #lo_addr(_servo_number_button_3_Caption+0)
MOVT	R1, #hi_addr(_servo_number_button_3_Caption+0)
MOVW	R0, #lo_addr(_servo_number_button_3+24)
MOVT	R0, #hi_addr(_servo_number_button_3+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1612 :: 		servo_number_button_3.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_3+28)
MOVT	R0, #hi_addr(_servo_number_button_3+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1613 :: 		servo_number_button_3.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_3+29)
MOVT	R0, #hi_addr(_servo_number_button_3+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1614 :: 		servo_number_button_3.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_servo_number_button_3+32)
MOVT	R0, #hi_addr(_servo_number_button_3+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1615 :: 		servo_number_button_3.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_3+48)
MOVT	R0, #hi_addr(_servo_number_button_3+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1616 :: 		servo_number_button_3.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_3+36)
MOVT	R0, #hi_addr(_servo_number_button_3+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1617 :: 		servo_number_button_3.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_3+38)
MOVT	R0, #hi_addr(_servo_number_button_3+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1618 :: 		servo_number_button_3.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_3+39)
MOVT	R0, #hi_addr(_servo_number_button_3+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1619 :: 		servo_number_button_3.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_3+40)
MOVT	R0, #hi_addr(_servo_number_button_3+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1620 :: 		servo_number_button_3.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_servo_number_button_3+42)
MOVT	R0, #hi_addr(_servo_number_button_3+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1621 :: 		servo_number_button_3.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_servo_number_button_3+44)
MOVT	R0, #hi_addr(_servo_number_button_3+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1622 :: 		servo_number_button_3.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_3+46)
MOVT	R0, #hi_addr(_servo_number_button_3+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1623 :: 		servo_number_button_3.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_3+50)
MOVT	R0, #hi_addr(_servo_number_button_3+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1624 :: 		servo_number_button_3.OnClickPtr      = servo_number_button_3OnClick;
MOVW	R1, #lo_addr(_servo_number_button_3OnClick+0)
MOVT	R1, #hi_addr(_servo_number_button_3OnClick+0)
MOVW	R0, #lo_addr(_servo_number_button_3+60)
MOVT	R0, #hi_addr(_servo_number_button_3+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1626 :: 		servo_number_button_all.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_servo_number_button_all+0)
MOVT	R0, #hi_addr(_servo_number_button_all+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1627 :: 		servo_number_button_all.Order           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_servo_number_button_all+4)
MOVT	R0, #hi_addr(_servo_number_button_all+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1628 :: 		servo_number_button_all.Left            = 681;
MOVW	R1, #681
MOVW	R0, #lo_addr(_servo_number_button_all+6)
MOVT	R0, #hi_addr(_servo_number_button_all+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1629 :: 		servo_number_button_all.Top             = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_servo_number_button_all+8)
MOVT	R0, #hi_addr(_servo_number_button_all+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1630 :: 		servo_number_button_all.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_servo_number_button_all+10)
MOVT	R0, #hi_addr(_servo_number_button_all+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1631 :: 		servo_number_button_all.Height          = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_servo_number_button_all+12)
MOVT	R0, #hi_addr(_servo_number_button_all+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1632 :: 		servo_number_button_all.Pen_Width       = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_servo_number_button_all+14)
MOVT	R0, #hi_addr(_servo_number_button_all+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1633 :: 		servo_number_button_all.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_all+16)
MOVT	R0, #hi_addr(_servo_number_button_all+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1634 :: 		servo_number_button_all.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_all+18)
MOVT	R0, #hi_addr(_servo_number_button_all+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1635 :: 		servo_number_button_all.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_all+19)
MOVT	R0, #hi_addr(_servo_number_button_all+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1636 :: 		servo_number_button_all.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_all+20)
MOVT	R0, #hi_addr(_servo_number_button_all+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1637 :: 		servo_number_button_all.Caption         = servo_number_button_all_Caption;
MOVW	R1, #lo_addr(_servo_number_button_all_Caption+0)
MOVT	R1, #hi_addr(_servo_number_button_all_Caption+0)
MOVW	R0, #lo_addr(_servo_number_button_all+24)
MOVT	R0, #hi_addr(_servo_number_button_all+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1638 :: 		servo_number_button_all.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_all+28)
MOVT	R0, #hi_addr(_servo_number_button_all+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1639 :: 		servo_number_button_all.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_all+29)
MOVT	R0, #hi_addr(_servo_number_button_all+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1640 :: 		servo_number_button_all.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_servo_number_button_all+32)
MOVT	R0, #hi_addr(_servo_number_button_all+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1641 :: 		servo_number_button_all.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_number_button_all+48)
MOVT	R0, #hi_addr(_servo_number_button_all+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1642 :: 		servo_number_button_all.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_all+36)
MOVT	R0, #hi_addr(_servo_number_button_all+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1643 :: 		servo_number_button_all.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_all+38)
MOVT	R0, #hi_addr(_servo_number_button_all+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1644 :: 		servo_number_button_all.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_all+39)
MOVT	R0, #hi_addr(_servo_number_button_all+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1645 :: 		servo_number_button_all.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_all+40)
MOVT	R0, #hi_addr(_servo_number_button_all+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1646 :: 		servo_number_button_all.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_servo_number_button_all+42)
MOVT	R0, #hi_addr(_servo_number_button_all+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1647 :: 		servo_number_button_all.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_servo_number_button_all+44)
MOVT	R0, #hi_addr(_servo_number_button_all+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1648 :: 		servo_number_button_all.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_number_button_all+46)
MOVT	R0, #hi_addr(_servo_number_button_all+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1649 :: 		servo_number_button_all.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_all+50)
MOVT	R0, #hi_addr(_servo_number_button_all+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1650 :: 		servo_number_button_all.OnClickPtr      = servo_number_button_allOnClick;
MOVW	R1, #lo_addr(_servo_number_button_allOnClick+0)
MOVT	R1, #hi_addr(_servo_number_button_allOnClick+0)
MOVW	R0, #lo_addr(_servo_number_button_all+60)
MOVT	R0, #hi_addr(_servo_number_button_all+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1652 :: 		servo_position_button_3.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_servo_position_button_3+0)
MOVT	R0, #hi_addr(_servo_position_button_3+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1653 :: 		servo_position_button_3.Order           = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_servo_position_button_3+4)
MOVT	R0, #hi_addr(_servo_position_button_3+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1654 :: 		servo_position_button_3.Left            = 200;
MOVS	R1, #200
MOVW	R0, #lo_addr(_servo_position_button_3+6)
MOVT	R0, #hi_addr(_servo_position_button_3+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1655 :: 		servo_position_button_3.Top             = 180;
MOVS	R1, #180
MOVW	R0, #lo_addr(_servo_position_button_3+8)
MOVT	R0, #hi_addr(_servo_position_button_3+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1656 :: 		servo_position_button_3.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_servo_position_button_3+10)
MOVT	R0, #hi_addr(_servo_position_button_3+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1657 :: 		servo_position_button_3.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_servo_position_button_3+12)
MOVT	R0, #hi_addr(_servo_position_button_3+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1658 :: 		servo_position_button_3.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_3+14)
MOVT	R0, #hi_addr(_servo_position_button_3+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1659 :: 		servo_position_button_3.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_position_button_3+16)
MOVT	R0, #hi_addr(_servo_position_button_3+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1660 :: 		servo_position_button_3.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_3+18)
MOVT	R0, #hi_addr(_servo_position_button_3+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1661 :: 		servo_position_button_3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_3+19)
MOVT	R0, #hi_addr(_servo_position_button_3+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1662 :: 		servo_position_button_3.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_3+20)
MOVT	R0, #hi_addr(_servo_position_button_3+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1663 :: 		servo_position_button_3.Caption         = servo_position_button_3_Caption;
MOVW	R1, #lo_addr(_servo_position_button_3_Caption+0)
MOVT	R1, #hi_addr(_servo_position_button_3_Caption+0)
MOVW	R0, #lo_addr(_servo_position_button_3+24)
MOVT	R0, #hi_addr(_servo_position_button_3+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1664 :: 		servo_position_button_3.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_3+28)
MOVT	R0, #hi_addr(_servo_position_button_3+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1665 :: 		servo_position_button_3.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_3+29)
MOVT	R0, #hi_addr(_servo_position_button_3+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1666 :: 		servo_position_button_3.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_servo_position_button_3+32)
MOVT	R0, #hi_addr(_servo_position_button_3+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1667 :: 		servo_position_button_3.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_3+48)
MOVT	R0, #hi_addr(_servo_position_button_3+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1668 :: 		servo_position_button_3.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_position_button_3+36)
MOVT	R0, #hi_addr(_servo_position_button_3+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1669 :: 		servo_position_button_3.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_3+38)
MOVT	R0, #hi_addr(_servo_position_button_3+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1670 :: 		servo_position_button_3.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_3+39)
MOVT	R0, #hi_addr(_servo_position_button_3+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1671 :: 		servo_position_button_3.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_3+40)
MOVT	R0, #hi_addr(_servo_position_button_3+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1672 :: 		servo_position_button_3.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_servo_position_button_3+42)
MOVT	R0, #hi_addr(_servo_position_button_3+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1673 :: 		servo_position_button_3.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_servo_position_button_3+44)
MOVT	R0, #hi_addr(_servo_position_button_3+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1674 :: 		servo_position_button_3.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_3+46)
MOVT	R0, #hi_addr(_servo_position_button_3+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1675 :: 		servo_position_button_3.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_position_button_3+50)
MOVT	R0, #hi_addr(_servo_position_button_3+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1676 :: 		servo_position_button_3.OnClickPtr      = servo_position_button_3OnClick;
MOVW	R1, #lo_addr(_servo_position_button_3OnClick+0)
MOVT	R1, #hi_addr(_servo_position_button_3OnClick+0)
MOVW	R0, #lo_addr(_servo_position_button_3+60)
MOVT	R0, #hi_addr(_servo_position_button_3+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1678 :: 		servo_position_button_4.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_servo_position_button_4+0)
MOVT	R0, #hi_addr(_servo_position_button_4+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1679 :: 		servo_position_button_4.Order           = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_servo_position_button_4+4)
MOVT	R0, #hi_addr(_servo_position_button_4+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1680 :: 		servo_position_button_4.Left            = 280;
MOVW	R1, #280
MOVW	R0, #lo_addr(_servo_position_button_4+6)
MOVT	R0, #hi_addr(_servo_position_button_4+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1681 :: 		servo_position_button_4.Top             = 180;
MOVS	R1, #180
MOVW	R0, #lo_addr(_servo_position_button_4+8)
MOVT	R0, #hi_addr(_servo_position_button_4+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1682 :: 		servo_position_button_4.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_servo_position_button_4+10)
MOVT	R0, #hi_addr(_servo_position_button_4+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1683 :: 		servo_position_button_4.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_servo_position_button_4+12)
MOVT	R0, #hi_addr(_servo_position_button_4+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1684 :: 		servo_position_button_4.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_4+14)
MOVT	R0, #hi_addr(_servo_position_button_4+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1685 :: 		servo_position_button_4.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_position_button_4+16)
MOVT	R0, #hi_addr(_servo_position_button_4+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1686 :: 		servo_position_button_4.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_4+18)
MOVT	R0, #hi_addr(_servo_position_button_4+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1687 :: 		servo_position_button_4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_4+19)
MOVT	R0, #hi_addr(_servo_position_button_4+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1688 :: 		servo_position_button_4.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_4+20)
MOVT	R0, #hi_addr(_servo_position_button_4+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1689 :: 		servo_position_button_4.Caption         = servo_position_button_4_Caption;
MOVW	R1, #lo_addr(_servo_position_button_4_Caption+0)
MOVT	R1, #hi_addr(_servo_position_button_4_Caption+0)
MOVW	R0, #lo_addr(_servo_position_button_4+24)
MOVT	R0, #hi_addr(_servo_position_button_4+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1690 :: 		servo_position_button_4.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_4+28)
MOVT	R0, #hi_addr(_servo_position_button_4+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1691 :: 		servo_position_button_4.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_4+29)
MOVT	R0, #hi_addr(_servo_position_button_4+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1692 :: 		servo_position_button_4.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_servo_position_button_4+32)
MOVT	R0, #hi_addr(_servo_position_button_4+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1693 :: 		servo_position_button_4.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_4+48)
MOVT	R0, #hi_addr(_servo_position_button_4+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1694 :: 		servo_position_button_4.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_position_button_4+36)
MOVT	R0, #hi_addr(_servo_position_button_4+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1695 :: 		servo_position_button_4.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_4+38)
MOVT	R0, #hi_addr(_servo_position_button_4+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1696 :: 		servo_position_button_4.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_4+39)
MOVT	R0, #hi_addr(_servo_position_button_4+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1697 :: 		servo_position_button_4.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_4+40)
MOVT	R0, #hi_addr(_servo_position_button_4+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1698 :: 		servo_position_button_4.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_servo_position_button_4+42)
MOVT	R0, #hi_addr(_servo_position_button_4+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1699 :: 		servo_position_button_4.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_servo_position_button_4+44)
MOVT	R0, #hi_addr(_servo_position_button_4+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1700 :: 		servo_position_button_4.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_4+46)
MOVT	R0, #hi_addr(_servo_position_button_4+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1701 :: 		servo_position_button_4.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_position_button_4+50)
MOVT	R0, #hi_addr(_servo_position_button_4+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1702 :: 		servo_position_button_4.OnClickPtr      = servo_position_button_4OnClick;
MOVW	R1, #lo_addr(_servo_position_button_4OnClick+0)
MOVT	R1, #hi_addr(_servo_position_button_4OnClick+0)
MOVW	R0, #lo_addr(_servo_position_button_4+60)
MOVT	R0, #hi_addr(_servo_position_button_4+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1704 :: 		servo_position_button_5.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_servo_position_button_5+0)
MOVT	R0, #hi_addr(_servo_position_button_5+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1705 :: 		servo_position_button_5.Order           = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_servo_position_button_5+4)
MOVT	R0, #hi_addr(_servo_position_button_5+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1706 :: 		servo_position_button_5.Left            = 360;
MOVW	R1, #360
MOVW	R0, #lo_addr(_servo_position_button_5+6)
MOVT	R0, #hi_addr(_servo_position_button_5+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1707 :: 		servo_position_button_5.Top             = 180;
MOVS	R1, #180
MOVW	R0, #lo_addr(_servo_position_button_5+8)
MOVT	R0, #hi_addr(_servo_position_button_5+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1708 :: 		servo_position_button_5.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_servo_position_button_5+10)
MOVT	R0, #hi_addr(_servo_position_button_5+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1709 :: 		servo_position_button_5.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_servo_position_button_5+12)
MOVT	R0, #hi_addr(_servo_position_button_5+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1710 :: 		servo_position_button_5.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_5+14)
MOVT	R0, #hi_addr(_servo_position_button_5+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1711 :: 		servo_position_button_5.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_position_button_5+16)
MOVT	R0, #hi_addr(_servo_position_button_5+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1712 :: 		servo_position_button_5.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_5+18)
MOVT	R0, #hi_addr(_servo_position_button_5+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1713 :: 		servo_position_button_5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_5+19)
MOVT	R0, #hi_addr(_servo_position_button_5+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1714 :: 		servo_position_button_5.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_5+20)
MOVT	R0, #hi_addr(_servo_position_button_5+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1715 :: 		servo_position_button_5.Caption         = servo_position_button_5_Caption;
MOVW	R1, #lo_addr(_servo_position_button_5_Caption+0)
MOVT	R1, #hi_addr(_servo_position_button_5_Caption+0)
MOVW	R0, #lo_addr(_servo_position_button_5+24)
MOVT	R0, #hi_addr(_servo_position_button_5+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1716 :: 		servo_position_button_5.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_5+28)
MOVT	R0, #hi_addr(_servo_position_button_5+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1717 :: 		servo_position_button_5.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_5+29)
MOVT	R0, #hi_addr(_servo_position_button_5+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1718 :: 		servo_position_button_5.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_servo_position_button_5+32)
MOVT	R0, #hi_addr(_servo_position_button_5+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1719 :: 		servo_position_button_5.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_5+48)
MOVT	R0, #hi_addr(_servo_position_button_5+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1720 :: 		servo_position_button_5.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_position_button_5+36)
MOVT	R0, #hi_addr(_servo_position_button_5+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1721 :: 		servo_position_button_5.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_5+38)
MOVT	R0, #hi_addr(_servo_position_button_5+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1722 :: 		servo_position_button_5.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_5+39)
MOVT	R0, #hi_addr(_servo_position_button_5+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1723 :: 		servo_position_button_5.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_5+40)
MOVT	R0, #hi_addr(_servo_position_button_5+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1724 :: 		servo_position_button_5.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_servo_position_button_5+42)
MOVT	R0, #hi_addr(_servo_position_button_5+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1725 :: 		servo_position_button_5.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_servo_position_button_5+44)
MOVT	R0, #hi_addr(_servo_position_button_5+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1726 :: 		servo_position_button_5.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_5+46)
MOVT	R0, #hi_addr(_servo_position_button_5+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1727 :: 		servo_position_button_5.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_position_button_5+50)
MOVT	R0, #hi_addr(_servo_position_button_5+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1728 :: 		servo_position_button_5.OnClickPtr      = servo_position_button_5OnClick;
MOVW	R1, #lo_addr(_servo_position_button_5OnClick+0)
MOVT	R1, #hi_addr(_servo_position_button_5OnClick+0)
MOVW	R0, #lo_addr(_servo_position_button_5+60)
MOVT	R0, #hi_addr(_servo_position_button_5+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1730 :: 		servo_position_button_6.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_servo_position_button_6+0)
MOVT	R0, #hi_addr(_servo_position_button_6+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1731 :: 		servo_position_button_6.Order           = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_servo_position_button_6+4)
MOVT	R0, #hi_addr(_servo_position_button_6+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1732 :: 		servo_position_button_6.Left            = 440;
MOVW	R1, #440
MOVW	R0, #lo_addr(_servo_position_button_6+6)
MOVT	R0, #hi_addr(_servo_position_button_6+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1733 :: 		servo_position_button_6.Top             = 180;
MOVS	R1, #180
MOVW	R0, #lo_addr(_servo_position_button_6+8)
MOVT	R0, #hi_addr(_servo_position_button_6+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1734 :: 		servo_position_button_6.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_servo_position_button_6+10)
MOVT	R0, #hi_addr(_servo_position_button_6+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1735 :: 		servo_position_button_6.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_servo_position_button_6+12)
MOVT	R0, #hi_addr(_servo_position_button_6+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1736 :: 		servo_position_button_6.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_6+14)
MOVT	R0, #hi_addr(_servo_position_button_6+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1737 :: 		servo_position_button_6.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_position_button_6+16)
MOVT	R0, #hi_addr(_servo_position_button_6+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1738 :: 		servo_position_button_6.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_6+18)
MOVT	R0, #hi_addr(_servo_position_button_6+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1739 :: 		servo_position_button_6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_6+19)
MOVT	R0, #hi_addr(_servo_position_button_6+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1740 :: 		servo_position_button_6.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_6+20)
MOVT	R0, #hi_addr(_servo_position_button_6+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1741 :: 		servo_position_button_6.Caption         = servo_position_button_6_Caption;
MOVW	R1, #lo_addr(_servo_position_button_6_Caption+0)
MOVT	R1, #hi_addr(_servo_position_button_6_Caption+0)
MOVW	R0, #lo_addr(_servo_position_button_6+24)
MOVT	R0, #hi_addr(_servo_position_button_6+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1742 :: 		servo_position_button_6.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_6+28)
MOVT	R0, #hi_addr(_servo_position_button_6+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1743 :: 		servo_position_button_6.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_6+29)
MOVT	R0, #hi_addr(_servo_position_button_6+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1744 :: 		servo_position_button_6.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_servo_position_button_6+32)
MOVT	R0, #hi_addr(_servo_position_button_6+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1745 :: 		servo_position_button_6.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_6+48)
MOVT	R0, #hi_addr(_servo_position_button_6+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1746 :: 		servo_position_button_6.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_position_button_6+36)
MOVT	R0, #hi_addr(_servo_position_button_6+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1747 :: 		servo_position_button_6.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_6+38)
MOVT	R0, #hi_addr(_servo_position_button_6+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1748 :: 		servo_position_button_6.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_6+39)
MOVT	R0, #hi_addr(_servo_position_button_6+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1749 :: 		servo_position_button_6.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_6+40)
MOVT	R0, #hi_addr(_servo_position_button_6+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1750 :: 		servo_position_button_6.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_servo_position_button_6+42)
MOVT	R0, #hi_addr(_servo_position_button_6+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1751 :: 		servo_position_button_6.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_servo_position_button_6+44)
MOVT	R0, #hi_addr(_servo_position_button_6+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1752 :: 		servo_position_button_6.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_6+46)
MOVT	R0, #hi_addr(_servo_position_button_6+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1753 :: 		servo_position_button_6.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_position_button_6+50)
MOVT	R0, #hi_addr(_servo_position_button_6+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1754 :: 		servo_position_button_6.OnClickPtr      = servo_position_button_6OnClick;
MOVW	R1, #lo_addr(_servo_position_button_6OnClick+0)
MOVT	R1, #hi_addr(_servo_position_button_6OnClick+0)
MOVW	R0, #lo_addr(_servo_position_button_6+60)
MOVT	R0, #hi_addr(_servo_position_button_6+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1756 :: 		servo_position_button_7.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_servo_position_button_7+0)
MOVT	R0, #hi_addr(_servo_position_button_7+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1757 :: 		servo_position_button_7.Order           = 27;
MOVS	R1, #27
MOVW	R0, #lo_addr(_servo_position_button_7+4)
MOVT	R0, #hi_addr(_servo_position_button_7+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1758 :: 		servo_position_button_7.Left            = 520;
MOVW	R1, #520
MOVW	R0, #lo_addr(_servo_position_button_7+6)
MOVT	R0, #hi_addr(_servo_position_button_7+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1759 :: 		servo_position_button_7.Top             = 180;
MOVS	R1, #180
MOVW	R0, #lo_addr(_servo_position_button_7+8)
MOVT	R0, #hi_addr(_servo_position_button_7+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1760 :: 		servo_position_button_7.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_servo_position_button_7+10)
MOVT	R0, #hi_addr(_servo_position_button_7+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1761 :: 		servo_position_button_7.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_servo_position_button_7+12)
MOVT	R0, #hi_addr(_servo_position_button_7+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1762 :: 		servo_position_button_7.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_7+14)
MOVT	R0, #hi_addr(_servo_position_button_7+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1763 :: 		servo_position_button_7.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_position_button_7+16)
MOVT	R0, #hi_addr(_servo_position_button_7+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1764 :: 		servo_position_button_7.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_7+18)
MOVT	R0, #hi_addr(_servo_position_button_7+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1765 :: 		servo_position_button_7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_7+19)
MOVT	R0, #hi_addr(_servo_position_button_7+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1766 :: 		servo_position_button_7.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_7+20)
MOVT	R0, #hi_addr(_servo_position_button_7+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1767 :: 		servo_position_button_7.Caption         = servo_position_button_7_Caption;
MOVW	R1, #lo_addr(_servo_position_button_7_Caption+0)
MOVT	R1, #hi_addr(_servo_position_button_7_Caption+0)
MOVW	R0, #lo_addr(_servo_position_button_7+24)
MOVT	R0, #hi_addr(_servo_position_button_7+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1768 :: 		servo_position_button_7.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_7+28)
MOVT	R0, #hi_addr(_servo_position_button_7+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1769 :: 		servo_position_button_7.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_7+29)
MOVT	R0, #hi_addr(_servo_position_button_7+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1770 :: 		servo_position_button_7.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_servo_position_button_7+32)
MOVT	R0, #hi_addr(_servo_position_button_7+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1771 :: 		servo_position_button_7.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_7+48)
MOVT	R0, #hi_addr(_servo_position_button_7+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1772 :: 		servo_position_button_7.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_position_button_7+36)
MOVT	R0, #hi_addr(_servo_position_button_7+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1773 :: 		servo_position_button_7.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_7+38)
MOVT	R0, #hi_addr(_servo_position_button_7+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1774 :: 		servo_position_button_7.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_7+39)
MOVT	R0, #hi_addr(_servo_position_button_7+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1775 :: 		servo_position_button_7.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_7+40)
MOVT	R0, #hi_addr(_servo_position_button_7+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1776 :: 		servo_position_button_7.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_servo_position_button_7+42)
MOVT	R0, #hi_addr(_servo_position_button_7+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1777 :: 		servo_position_button_7.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_servo_position_button_7+44)
MOVT	R0, #hi_addr(_servo_position_button_7+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1778 :: 		servo_position_button_7.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_7+46)
MOVT	R0, #hi_addr(_servo_position_button_7+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1779 :: 		servo_position_button_7.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_position_button_7+50)
MOVT	R0, #hi_addr(_servo_position_button_7+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1780 :: 		servo_position_button_7.OnClickPtr      = servo_position_button_7OnClick;
MOVW	R1, #lo_addr(_servo_position_button_7OnClick+0)
MOVT	R1, #hi_addr(_servo_position_button_7OnClick+0)
MOVW	R0, #lo_addr(_servo_position_button_7+60)
MOVT	R0, #hi_addr(_servo_position_button_7+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1782 :: 		servo_position_button_8.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_servo_position_button_8+0)
MOVT	R0, #hi_addr(_servo_position_button_8+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1783 :: 		servo_position_button_8.Order           = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_servo_position_button_8+4)
MOVT	R0, #hi_addr(_servo_position_button_8+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1784 :: 		servo_position_button_8.Left            = 601;
MOVW	R1, #601
MOVW	R0, #lo_addr(_servo_position_button_8+6)
MOVT	R0, #hi_addr(_servo_position_button_8+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1785 :: 		servo_position_button_8.Top             = 180;
MOVS	R1, #180
MOVW	R0, #lo_addr(_servo_position_button_8+8)
MOVT	R0, #hi_addr(_servo_position_button_8+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1786 :: 		servo_position_button_8.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_servo_position_button_8+10)
MOVT	R0, #hi_addr(_servo_position_button_8+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1787 :: 		servo_position_button_8.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_servo_position_button_8+12)
MOVT	R0, #hi_addr(_servo_position_button_8+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1788 :: 		servo_position_button_8.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_8+14)
MOVT	R0, #hi_addr(_servo_position_button_8+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1789 :: 		servo_position_button_8.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_position_button_8+16)
MOVT	R0, #hi_addr(_servo_position_button_8+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1790 :: 		servo_position_button_8.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_8+18)
MOVT	R0, #hi_addr(_servo_position_button_8+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1791 :: 		servo_position_button_8.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_8+19)
MOVT	R0, #hi_addr(_servo_position_button_8+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1792 :: 		servo_position_button_8.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_8+20)
MOVT	R0, #hi_addr(_servo_position_button_8+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1793 :: 		servo_position_button_8.Caption         = servo_position_button_8_Caption;
MOVW	R1, #lo_addr(_servo_position_button_8_Caption+0)
MOVT	R1, #hi_addr(_servo_position_button_8_Caption+0)
MOVW	R0, #lo_addr(_servo_position_button_8+24)
MOVT	R0, #hi_addr(_servo_position_button_8+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1794 :: 		servo_position_button_8.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_8+28)
MOVT	R0, #hi_addr(_servo_position_button_8+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1795 :: 		servo_position_button_8.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_8+29)
MOVT	R0, #hi_addr(_servo_position_button_8+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1796 :: 		servo_position_button_8.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_servo_position_button_8+32)
MOVT	R0, #hi_addr(_servo_position_button_8+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1797 :: 		servo_position_button_8.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_8+48)
MOVT	R0, #hi_addr(_servo_position_button_8+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1798 :: 		servo_position_button_8.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_position_button_8+36)
MOVT	R0, #hi_addr(_servo_position_button_8+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1799 :: 		servo_position_button_8.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_8+38)
MOVT	R0, #hi_addr(_servo_position_button_8+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1800 :: 		servo_position_button_8.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_8+39)
MOVT	R0, #hi_addr(_servo_position_button_8+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1801 :: 		servo_position_button_8.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_8+40)
MOVT	R0, #hi_addr(_servo_position_button_8+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1802 :: 		servo_position_button_8.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_servo_position_button_8+42)
MOVT	R0, #hi_addr(_servo_position_button_8+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1803 :: 		servo_position_button_8.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_servo_position_button_8+44)
MOVT	R0, #hi_addr(_servo_position_button_8+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1804 :: 		servo_position_button_8.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_8+46)
MOVT	R0, #hi_addr(_servo_position_button_8+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1805 :: 		servo_position_button_8.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_position_button_8+50)
MOVT	R0, #hi_addr(_servo_position_button_8+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1806 :: 		servo_position_button_8.OnClickPtr      = servo_position_button_8OnClick;
MOVW	R1, #lo_addr(_servo_position_button_8OnClick+0)
MOVT	R1, #hi_addr(_servo_position_button_8OnClick+0)
MOVW	R0, #lo_addr(_servo_position_button_8+60)
MOVT	R0, #hi_addr(_servo_position_button_8+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1808 :: 		servo_position_button_9.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_servo_position_button_9+0)
MOVT	R0, #hi_addr(_servo_position_button_9+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1809 :: 		servo_position_button_9.Order           = 29;
MOVS	R1, #29
MOVW	R0, #lo_addr(_servo_position_button_9+4)
MOVT	R0, #hi_addr(_servo_position_button_9+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1810 :: 		servo_position_button_9.Left            = 680;
MOVW	R1, #680
MOVW	R0, #lo_addr(_servo_position_button_9+6)
MOVT	R0, #hi_addr(_servo_position_button_9+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1811 :: 		servo_position_button_9.Top             = 180;
MOVS	R1, #180
MOVW	R0, #lo_addr(_servo_position_button_9+8)
MOVT	R0, #hi_addr(_servo_position_button_9+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1812 :: 		servo_position_button_9.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_servo_position_button_9+10)
MOVT	R0, #hi_addr(_servo_position_button_9+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1813 :: 		servo_position_button_9.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_servo_position_button_9+12)
MOVT	R0, #hi_addr(_servo_position_button_9+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1814 :: 		servo_position_button_9.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_9+14)
MOVT	R0, #hi_addr(_servo_position_button_9+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1815 :: 		servo_position_button_9.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_position_button_9+16)
MOVT	R0, #hi_addr(_servo_position_button_9+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1816 :: 		servo_position_button_9.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_9+18)
MOVT	R0, #hi_addr(_servo_position_button_9+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1817 :: 		servo_position_button_9.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_9+19)
MOVT	R0, #hi_addr(_servo_position_button_9+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1818 :: 		servo_position_button_9.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_9+20)
MOVT	R0, #hi_addr(_servo_position_button_9+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1819 :: 		servo_position_button_9.Caption         = servo_position_button_9_Caption;
MOVW	R1, #lo_addr(_servo_position_button_9_Caption+0)
MOVT	R1, #hi_addr(_servo_position_button_9_Caption+0)
MOVW	R0, #lo_addr(_servo_position_button_9+24)
MOVT	R0, #hi_addr(_servo_position_button_9+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1820 :: 		servo_position_button_9.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_9+28)
MOVT	R0, #hi_addr(_servo_position_button_9+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1821 :: 		servo_position_button_9.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_9+29)
MOVT	R0, #hi_addr(_servo_position_button_9+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1822 :: 		servo_position_button_9.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_servo_position_button_9+32)
MOVT	R0, #hi_addr(_servo_position_button_9+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1823 :: 		servo_position_button_9.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_position_button_9+48)
MOVT	R0, #hi_addr(_servo_position_button_9+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1824 :: 		servo_position_button_9.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_position_button_9+36)
MOVT	R0, #hi_addr(_servo_position_button_9+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1825 :: 		servo_position_button_9.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_9+38)
MOVT	R0, #hi_addr(_servo_position_button_9+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1826 :: 		servo_position_button_9.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_9+39)
MOVT	R0, #hi_addr(_servo_position_button_9+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1827 :: 		servo_position_button_9.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_9+40)
MOVT	R0, #hi_addr(_servo_position_button_9+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1828 :: 		servo_position_button_9.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_servo_position_button_9+42)
MOVT	R0, #hi_addr(_servo_position_button_9+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1829 :: 		servo_position_button_9.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_servo_position_button_9+44)
MOVT	R0, #hi_addr(_servo_position_button_9+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1830 :: 		servo_position_button_9.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_position_button_9+46)
MOVT	R0, #hi_addr(_servo_position_button_9+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1831 :: 		servo_position_button_9.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_position_button_9+50)
MOVT	R0, #hi_addr(_servo_position_button_9+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1832 :: 		servo_position_button_9.OnClickPtr      = servo_position_button_9OnClick;
MOVW	R1, #lo_addr(_servo_position_button_9OnClick+0)
MOVT	R1, #hi_addr(_servo_position_button_9OnClick+0)
MOVW	R0, #lo_addr(_servo_position_button_9+60)
MOVT	R0, #hi_addr(_servo_position_button_9+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1834 :: 		fan_speed_button_1.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_fan_speed_button_1+0)
MOVT	R0, #hi_addr(_fan_speed_button_1+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1835 :: 		fan_speed_button_1.Order           = 30;
MOVS	R1, #30
MOVW	R0, #lo_addr(_fan_speed_button_1+4)
MOVT	R0, #hi_addr(_fan_speed_button_1+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1836 :: 		fan_speed_button_1.Left            = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_fan_speed_button_1+6)
MOVT	R0, #hi_addr(_fan_speed_button_1+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1837 :: 		fan_speed_button_1.Top             = 270;
MOVW	R1, #270
MOVW	R0, #lo_addr(_fan_speed_button_1+8)
MOVT	R0, #hi_addr(_fan_speed_button_1+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1838 :: 		fan_speed_button_1.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_fan_speed_button_1+10)
MOVT	R0, #hi_addr(_fan_speed_button_1+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1839 :: 		fan_speed_button_1.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_fan_speed_button_1+12)
MOVT	R0, #hi_addr(_fan_speed_button_1+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1840 :: 		fan_speed_button_1.Pen_Width       = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_fan_speed_button_1+14)
MOVT	R0, #hi_addr(_fan_speed_button_1+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1841 :: 		fan_speed_button_1.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_1+16)
MOVT	R0, #hi_addr(_fan_speed_button_1+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1842 :: 		fan_speed_button_1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_1+18)
MOVT	R0, #hi_addr(_fan_speed_button_1+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1843 :: 		fan_speed_button_1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_1+19)
MOVT	R0, #hi_addr(_fan_speed_button_1+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1844 :: 		fan_speed_button_1.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_1+20)
MOVT	R0, #hi_addr(_fan_speed_button_1+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1845 :: 		fan_speed_button_1.Caption         = fan_speed_button_1_Caption;
MOVW	R1, #lo_addr(_fan_speed_button_1_Caption+0)
MOVT	R1, #hi_addr(_fan_speed_button_1_Caption+0)
MOVW	R0, #lo_addr(_fan_speed_button_1+24)
MOVT	R0, #hi_addr(_fan_speed_button_1+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1846 :: 		fan_speed_button_1.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_1+28)
MOVT	R0, #hi_addr(_fan_speed_button_1+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1847 :: 		fan_speed_button_1.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_1+29)
MOVT	R0, #hi_addr(_fan_speed_button_1+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1848 :: 		fan_speed_button_1.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_fan_speed_button_1+32)
MOVT	R0, #hi_addr(_fan_speed_button_1+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1849 :: 		fan_speed_button_1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_1+48)
MOVT	R0, #hi_addr(_fan_speed_button_1+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1850 :: 		fan_speed_button_1.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_1+36)
MOVT	R0, #hi_addr(_fan_speed_button_1+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1851 :: 		fan_speed_button_1.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_1+38)
MOVT	R0, #hi_addr(_fan_speed_button_1+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1852 :: 		fan_speed_button_1.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_1+39)
MOVT	R0, #hi_addr(_fan_speed_button_1+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1853 :: 		fan_speed_button_1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_1+40)
MOVT	R0, #hi_addr(_fan_speed_button_1+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1854 :: 		fan_speed_button_1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_fan_speed_button_1+42)
MOVT	R0, #hi_addr(_fan_speed_button_1+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1855 :: 		fan_speed_button_1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_fan_speed_button_1+44)
MOVT	R0, #hi_addr(_fan_speed_button_1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1856 :: 		fan_speed_button_1.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_1+46)
MOVT	R0, #hi_addr(_fan_speed_button_1+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1857 :: 		fan_speed_button_1.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_1+50)
MOVT	R0, #hi_addr(_fan_speed_button_1+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1858 :: 		fan_speed_button_1.OnClickPtr      = fan_speed_button_1OnClick;
MOVW	R1, #lo_addr(_fan_speed_button_1OnClick+0)
MOVT	R1, #hi_addr(_fan_speed_button_1OnClick+0)
MOVW	R0, #lo_addr(_fan_speed_button_1+60)
MOVT	R0, #hi_addr(_fan_speed_button_1+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1860 :: 		fan_speed_button_3.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_fan_speed_button_3+0)
MOVT	R0, #hi_addr(_fan_speed_button_3+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1861 :: 		fan_speed_button_3.Order           = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_fan_speed_button_3+4)
MOVT	R0, #hi_addr(_fan_speed_button_3+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1862 :: 		fan_speed_button_3.Left            = 200;
MOVS	R1, #200
MOVW	R0, #lo_addr(_fan_speed_button_3+6)
MOVT	R0, #hi_addr(_fan_speed_button_3+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1863 :: 		fan_speed_button_3.Top             = 270;
MOVW	R1, #270
MOVW	R0, #lo_addr(_fan_speed_button_3+8)
MOVT	R0, #hi_addr(_fan_speed_button_3+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1864 :: 		fan_speed_button_3.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_fan_speed_button_3+10)
MOVT	R0, #hi_addr(_fan_speed_button_3+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1865 :: 		fan_speed_button_3.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_fan_speed_button_3+12)
MOVT	R0, #hi_addr(_fan_speed_button_3+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1866 :: 		fan_speed_button_3.Pen_Width       = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_fan_speed_button_3+14)
MOVT	R0, #hi_addr(_fan_speed_button_3+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1867 :: 		fan_speed_button_3.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_3+16)
MOVT	R0, #hi_addr(_fan_speed_button_3+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1868 :: 		fan_speed_button_3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_3+18)
MOVT	R0, #hi_addr(_fan_speed_button_3+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1869 :: 		fan_speed_button_3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_3+19)
MOVT	R0, #hi_addr(_fan_speed_button_3+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1870 :: 		fan_speed_button_3.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_3+20)
MOVT	R0, #hi_addr(_fan_speed_button_3+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1871 :: 		fan_speed_button_3.Caption         = fan_speed_button_3_Caption;
MOVW	R1, #lo_addr(_fan_speed_button_3_Caption+0)
MOVT	R1, #hi_addr(_fan_speed_button_3_Caption+0)
MOVW	R0, #lo_addr(_fan_speed_button_3+24)
MOVT	R0, #hi_addr(_fan_speed_button_3+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1872 :: 		fan_speed_button_3.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_3+28)
MOVT	R0, #hi_addr(_fan_speed_button_3+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1873 :: 		fan_speed_button_3.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_3+29)
MOVT	R0, #hi_addr(_fan_speed_button_3+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1874 :: 		fan_speed_button_3.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_fan_speed_button_3+32)
MOVT	R0, #hi_addr(_fan_speed_button_3+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1875 :: 		fan_speed_button_3.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_3+48)
MOVT	R0, #hi_addr(_fan_speed_button_3+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1876 :: 		fan_speed_button_3.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_3+36)
MOVT	R0, #hi_addr(_fan_speed_button_3+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1877 :: 		fan_speed_button_3.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_3+38)
MOVT	R0, #hi_addr(_fan_speed_button_3+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1878 :: 		fan_speed_button_3.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_3+39)
MOVT	R0, #hi_addr(_fan_speed_button_3+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1879 :: 		fan_speed_button_3.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_3+40)
MOVT	R0, #hi_addr(_fan_speed_button_3+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1880 :: 		fan_speed_button_3.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_fan_speed_button_3+42)
MOVT	R0, #hi_addr(_fan_speed_button_3+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1881 :: 		fan_speed_button_3.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_fan_speed_button_3+44)
MOVT	R0, #hi_addr(_fan_speed_button_3+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1882 :: 		fan_speed_button_3.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_3+46)
MOVT	R0, #hi_addr(_fan_speed_button_3+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1883 :: 		fan_speed_button_3.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_3+50)
MOVT	R0, #hi_addr(_fan_speed_button_3+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1884 :: 		fan_speed_button_3.OnClickPtr      = fan_speed_button_3OnClick;
MOVW	R1, #lo_addr(_fan_speed_button_3OnClick+0)
MOVT	R1, #hi_addr(_fan_speed_button_3OnClick+0)
MOVW	R0, #lo_addr(_fan_speed_button_3+60)
MOVT	R0, #hi_addr(_fan_speed_button_3+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1886 :: 		fan_speed_button_5.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_fan_speed_button_5+0)
MOVT	R0, #hi_addr(_fan_speed_button_5+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1887 :: 		fan_speed_button_5.Order           = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_fan_speed_button_5+4)
MOVT	R0, #hi_addr(_fan_speed_button_5+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1888 :: 		fan_speed_button_5.Left            = 360;
MOVW	R1, #360
MOVW	R0, #lo_addr(_fan_speed_button_5+6)
MOVT	R0, #hi_addr(_fan_speed_button_5+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1889 :: 		fan_speed_button_5.Top             = 270;
MOVW	R1, #270
MOVW	R0, #lo_addr(_fan_speed_button_5+8)
MOVT	R0, #hi_addr(_fan_speed_button_5+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1890 :: 		fan_speed_button_5.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_fan_speed_button_5+10)
MOVT	R0, #hi_addr(_fan_speed_button_5+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1891 :: 		fan_speed_button_5.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_fan_speed_button_5+12)
MOVT	R0, #hi_addr(_fan_speed_button_5+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1892 :: 		fan_speed_button_5.Pen_Width       = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_fan_speed_button_5+14)
MOVT	R0, #hi_addr(_fan_speed_button_5+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1893 :: 		fan_speed_button_5.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_5+16)
MOVT	R0, #hi_addr(_fan_speed_button_5+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1894 :: 		fan_speed_button_5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_5+18)
MOVT	R0, #hi_addr(_fan_speed_button_5+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1895 :: 		fan_speed_button_5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_5+19)
MOVT	R0, #hi_addr(_fan_speed_button_5+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1896 :: 		fan_speed_button_5.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_5+20)
MOVT	R0, #hi_addr(_fan_speed_button_5+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1897 :: 		fan_speed_button_5.Caption         = fan_speed_button_5_Caption;
MOVW	R1, #lo_addr(_fan_speed_button_5_Caption+0)
MOVT	R1, #hi_addr(_fan_speed_button_5_Caption+0)
MOVW	R0, #lo_addr(_fan_speed_button_5+24)
MOVT	R0, #hi_addr(_fan_speed_button_5+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1898 :: 		fan_speed_button_5.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_5+28)
MOVT	R0, #hi_addr(_fan_speed_button_5+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1899 :: 		fan_speed_button_5.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_5+29)
MOVT	R0, #hi_addr(_fan_speed_button_5+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1900 :: 		fan_speed_button_5.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_fan_speed_button_5+32)
MOVT	R0, #hi_addr(_fan_speed_button_5+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1901 :: 		fan_speed_button_5.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_5+48)
MOVT	R0, #hi_addr(_fan_speed_button_5+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1902 :: 		fan_speed_button_5.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_5+36)
MOVT	R0, #hi_addr(_fan_speed_button_5+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1903 :: 		fan_speed_button_5.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_5+38)
MOVT	R0, #hi_addr(_fan_speed_button_5+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1904 :: 		fan_speed_button_5.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_5+39)
MOVT	R0, #hi_addr(_fan_speed_button_5+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1905 :: 		fan_speed_button_5.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_5+40)
MOVT	R0, #hi_addr(_fan_speed_button_5+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1906 :: 		fan_speed_button_5.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_fan_speed_button_5+42)
MOVT	R0, #hi_addr(_fan_speed_button_5+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1907 :: 		fan_speed_button_5.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_fan_speed_button_5+44)
MOVT	R0, #hi_addr(_fan_speed_button_5+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1908 :: 		fan_speed_button_5.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_5+46)
MOVT	R0, #hi_addr(_fan_speed_button_5+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1909 :: 		fan_speed_button_5.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_5+50)
MOVT	R0, #hi_addr(_fan_speed_button_5+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1910 :: 		fan_speed_button_5.OnClickPtr      = fan_speed_button_5OnClick;
MOVW	R1, #lo_addr(_fan_speed_button_5OnClick+0)
MOVT	R1, #hi_addr(_fan_speed_button_5OnClick+0)
MOVW	R0, #lo_addr(_fan_speed_button_5+60)
MOVT	R0, #hi_addr(_fan_speed_button_5+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1912 :: 		fan_speed_button_stop.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_fan_speed_button_stop+0)
MOVT	R0, #hi_addr(_fan_speed_button_stop+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1913 :: 		fan_speed_button_stop.Order           = 33;
MOVS	R1, #33
MOVW	R0, #lo_addr(_fan_speed_button_stop+4)
MOVT	R0, #hi_addr(_fan_speed_button_stop+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1914 :: 		fan_speed_button_stop.Left            = 600;
MOVW	R1, #600
MOVW	R0, #lo_addr(_fan_speed_button_stop+6)
MOVT	R0, #hi_addr(_fan_speed_button_stop+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1915 :: 		fan_speed_button_stop.Top             = 270;
MOVW	R1, #270
MOVW	R0, #lo_addr(_fan_speed_button_stop+8)
MOVT	R0, #hi_addr(_fan_speed_button_stop+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1916 :: 		fan_speed_button_stop.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_fan_speed_button_stop+10)
MOVT	R0, #hi_addr(_fan_speed_button_stop+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1917 :: 		fan_speed_button_stop.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_fan_speed_button_stop+12)
MOVT	R0, #hi_addr(_fan_speed_button_stop+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1918 :: 		fan_speed_button_stop.Pen_Width       = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_fan_speed_button_stop+14)
MOVT	R0, #hi_addr(_fan_speed_button_stop+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1919 :: 		fan_speed_button_stop.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_stop+16)
MOVT	R0, #hi_addr(_fan_speed_button_stop+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1920 :: 		fan_speed_button_stop.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_stop+18)
MOVT	R0, #hi_addr(_fan_speed_button_stop+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1921 :: 		fan_speed_button_stop.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_stop+19)
MOVT	R0, #hi_addr(_fan_speed_button_stop+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1922 :: 		fan_speed_button_stop.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_stop+20)
MOVT	R0, #hi_addr(_fan_speed_button_stop+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1923 :: 		fan_speed_button_stop.Caption         = fan_speed_button_stop_Caption;
MOVW	R1, #lo_addr(_fan_speed_button_stop_Caption+0)
MOVT	R1, #hi_addr(_fan_speed_button_stop_Caption+0)
MOVW	R0, #lo_addr(_fan_speed_button_stop+24)
MOVT	R0, #hi_addr(_fan_speed_button_stop+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1924 :: 		fan_speed_button_stop.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_stop+28)
MOVT	R0, #hi_addr(_fan_speed_button_stop+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1925 :: 		fan_speed_button_stop.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_stop+29)
MOVT	R0, #hi_addr(_fan_speed_button_stop+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1926 :: 		fan_speed_button_stop.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_fan_speed_button_stop+32)
MOVT	R0, #hi_addr(_fan_speed_button_stop+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1927 :: 		fan_speed_button_stop.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_stop+48)
MOVT	R0, #hi_addr(_fan_speed_button_stop+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1928 :: 		fan_speed_button_stop.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_stop+36)
MOVT	R0, #hi_addr(_fan_speed_button_stop+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1929 :: 		fan_speed_button_stop.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_stop+38)
MOVT	R0, #hi_addr(_fan_speed_button_stop+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1930 :: 		fan_speed_button_stop.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_stop+39)
MOVT	R0, #hi_addr(_fan_speed_button_stop+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1931 :: 		fan_speed_button_stop.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_stop+40)
MOVT	R0, #hi_addr(_fan_speed_button_stop+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1932 :: 		fan_speed_button_stop.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_fan_speed_button_stop+42)
MOVT	R0, #hi_addr(_fan_speed_button_stop+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1933 :: 		fan_speed_button_stop.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_fan_speed_button_stop+44)
MOVT	R0, #hi_addr(_fan_speed_button_stop+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1934 :: 		fan_speed_button_stop.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_stop+46)
MOVT	R0, #hi_addr(_fan_speed_button_stop+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1935 :: 		fan_speed_button_stop.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_stop+50)
MOVT	R0, #hi_addr(_fan_speed_button_stop+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1936 :: 		fan_speed_button_stop.OnClickPtr      = fan_speed_button_stopOnClick;
MOVW	R1, #lo_addr(_fan_speed_button_stopOnClick+0)
MOVT	R1, #hi_addr(_fan_speed_button_stopOnClick+0)
MOVW	R0, #lo_addr(_fan_speed_button_stop+60)
MOVT	R0, #hi_addr(_fan_speed_button_stop+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1938 :: 		Label7.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Label7+0)
MOVT	R0, #hi_addr(_Label7+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1939 :: 		Label7.Order           = 34;
MOVS	R1, #34
MOVW	R0, #lo_addr(_Label7+4)
MOVT	R0, #hi_addr(_Label7+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1940 :: 		Label7.Left            = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_Label7+6)
MOVT	R0, #hi_addr(_Label7+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1941 :: 		Label7.Top             = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Label7+8)
MOVT	R0, #hi_addr(_Label7+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1942 :: 		Label7.Width           = 174;
MOVS	R1, #174
MOVW	R0, #lo_addr(_Label7+10)
MOVT	R0, #hi_addr(_Label7+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1943 :: 		Label7.Height          = 27;
MOVS	R1, #27
MOVW	R0, #lo_addr(_Label7+12)
MOVT	R0, #hi_addr(_Label7+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1944 :: 		Label7.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label7+27)
MOVT	R0, #hi_addr(_Label7+27)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1945 :: 		Label7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label7+28)
MOVT	R0, #hi_addr(_Label7+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1946 :: 		Label7.Caption         = Label7_Caption;
MOVW	R1, #lo_addr(_Label7_Caption+0)
MOVT	R1, #hi_addr(_Label7_Caption+0)
MOVW	R0, #lo_addr(_Label7+16)
MOVT	R0, #hi_addr(_Label7+16)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1947 :: 		Label7.FontName        = Tahoma24x24_Bold;
MOVW	R1, #4463
MOVW	R0, #lo_addr(_Label7+20)
MOVT	R0, #hi_addr(_Label7+20)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1948 :: 		Label7.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_Label7+24)
MOVT	R0, #hi_addr(_Label7+24)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1949 :: 		Label7.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+26)
MOVT	R0, #hi_addr(_Label7+26)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1951 :: 		Label8.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Label8+0)
MOVT	R0, #hi_addr(_Label8+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1952 :: 		Label8.Order           = 35;
MOVS	R1, #35
MOVW	R0, #lo_addr(_Label8+4)
MOVT	R0, #hi_addr(_Label8+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1953 :: 		Label8.Left            = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_Label8+6)
MOVT	R0, #hi_addr(_Label8+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1954 :: 		Label8.Top             = 150;
MOVS	R1, #150
MOVW	R0, #lo_addr(_Label8+8)
MOVT	R0, #hi_addr(_Label8+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1955 :: 		Label8.Width           = 190;
MOVS	R1, #190
MOVW	R0, #lo_addr(_Label8+10)
MOVT	R0, #hi_addr(_Label8+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1956 :: 		Label8.Height          = 27;
MOVS	R1, #27
MOVW	R0, #lo_addr(_Label8+12)
MOVT	R0, #hi_addr(_Label8+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1957 :: 		Label8.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label8+27)
MOVT	R0, #hi_addr(_Label8+27)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1958 :: 		Label8.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label8+28)
MOVT	R0, #hi_addr(_Label8+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1959 :: 		Label8.Caption         = Label8_Caption;
MOVW	R1, #lo_addr(_Label8_Caption+0)
MOVT	R1, #hi_addr(_Label8_Caption+0)
MOVW	R0, #lo_addr(_Label8+16)
MOVT	R0, #hi_addr(_Label8+16)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1960 :: 		Label8.FontName        = Tahoma24x24_Bold;
MOVW	R1, #4463
MOVW	R0, #lo_addr(_Label8+20)
MOVT	R0, #hi_addr(_Label8+20)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1961 :: 		Label8.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_Label8+24)
MOVT	R0, #hi_addr(_Label8+24)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1962 :: 		Label8.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+26)
MOVT	R0, #hi_addr(_Label8+26)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1964 :: 		Label9.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Label9+0)
MOVT	R0, #hi_addr(_Label9+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1965 :: 		Label9.Order           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label9+4)
MOVT	R0, #hi_addr(_Label9+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1966 :: 		Label9.Left            = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_Label9+6)
MOVT	R0, #hi_addr(_Label9+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1967 :: 		Label9.Top             = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Label9+8)
MOVT	R0, #hi_addr(_Label9+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1968 :: 		Label9.Width           = 122;
MOVS	R1, #122
MOVW	R0, #lo_addr(_Label9+10)
MOVT	R0, #hi_addr(_Label9+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1969 :: 		Label9.Height          = 27;
MOVS	R1, #27
MOVW	R0, #lo_addr(_Label9+12)
MOVT	R0, #hi_addr(_Label9+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1970 :: 		Label9.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label9+27)
MOVT	R0, #hi_addr(_Label9+27)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1971 :: 		Label9.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label9+28)
MOVT	R0, #hi_addr(_Label9+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1972 :: 		Label9.Caption         = Label9_Caption;
MOVW	R1, #lo_addr(_Label9_Caption+0)
MOVT	R1, #hi_addr(_Label9_Caption+0)
MOVW	R0, #lo_addr(_Label9+16)
MOVT	R0, #hi_addr(_Label9+16)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1973 :: 		Label9.FontName        = Tahoma24x24_Bold;
MOVW	R1, #4463
MOVW	R0, #lo_addr(_Label9+20)
MOVT	R0, #hi_addr(_Label9+20)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1974 :: 		Label9.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_Label9+24)
MOVT	R0, #hi_addr(_Label9+24)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1975 :: 		Label9.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+26)
MOVT	R0, #hi_addr(_Label9+26)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1977 :: 		fan_speed_button_7.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_fan_speed_button_7+0)
MOVT	R0, #hi_addr(_fan_speed_button_7+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1978 :: 		fan_speed_button_7.Order           = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_fan_speed_button_7+4)
MOVT	R0, #hi_addr(_fan_speed_button_7+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1979 :: 		fan_speed_button_7.Left            = 520;
MOVW	R1, #520
MOVW	R0, #lo_addr(_fan_speed_button_7+6)
MOVT	R0, #hi_addr(_fan_speed_button_7+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1980 :: 		fan_speed_button_7.Top             = 270;
MOVW	R1, #270
MOVW	R0, #lo_addr(_fan_speed_button_7+8)
MOVT	R0, #hi_addr(_fan_speed_button_7+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1981 :: 		fan_speed_button_7.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_fan_speed_button_7+10)
MOVT	R0, #hi_addr(_fan_speed_button_7+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1982 :: 		fan_speed_button_7.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_fan_speed_button_7+12)
MOVT	R0, #hi_addr(_fan_speed_button_7+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1983 :: 		fan_speed_button_7.Pen_Width       = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_fan_speed_button_7+14)
MOVT	R0, #hi_addr(_fan_speed_button_7+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1984 :: 		fan_speed_button_7.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_7+16)
MOVT	R0, #hi_addr(_fan_speed_button_7+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1985 :: 		fan_speed_button_7.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_7+18)
MOVT	R0, #hi_addr(_fan_speed_button_7+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1986 :: 		fan_speed_button_7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_7+19)
MOVT	R0, #hi_addr(_fan_speed_button_7+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1987 :: 		fan_speed_button_7.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_7+20)
MOVT	R0, #hi_addr(_fan_speed_button_7+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1988 :: 		fan_speed_button_7.Caption         = fan_speed_button_7_Caption;
MOVW	R1, #lo_addr(_fan_speed_button_7_Caption+0)
MOVT	R1, #hi_addr(_fan_speed_button_7_Caption+0)
MOVW	R0, #lo_addr(_fan_speed_button_7+24)
MOVT	R0, #hi_addr(_fan_speed_button_7+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1989 :: 		fan_speed_button_7.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_7+28)
MOVT	R0, #hi_addr(_fan_speed_button_7+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1990 :: 		fan_speed_button_7.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_7+29)
MOVT	R0, #hi_addr(_fan_speed_button_7+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1991 :: 		fan_speed_button_7.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_fan_speed_button_7+32)
MOVT	R0, #hi_addr(_fan_speed_button_7+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1992 :: 		fan_speed_button_7.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_7+48)
MOVT	R0, #hi_addr(_fan_speed_button_7+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1993 :: 		fan_speed_button_7.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_7+36)
MOVT	R0, #hi_addr(_fan_speed_button_7+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1994 :: 		fan_speed_button_7.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_7+38)
MOVT	R0, #hi_addr(_fan_speed_button_7+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1995 :: 		fan_speed_button_7.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_7+39)
MOVT	R0, #hi_addr(_fan_speed_button_7+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1996 :: 		fan_speed_button_7.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_7+40)
MOVT	R0, #hi_addr(_fan_speed_button_7+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1997 :: 		fan_speed_button_7.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_fan_speed_button_7+42)
MOVT	R0, #hi_addr(_fan_speed_button_7+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1998 :: 		fan_speed_button_7.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_fan_speed_button_7+44)
MOVT	R0, #hi_addr(_fan_speed_button_7+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,1999 :: 		fan_speed_button_7.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_7+46)
MOVT	R0, #hi_addr(_fan_speed_button_7+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2000 :: 		fan_speed_button_7.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_7+50)
MOVT	R0, #hi_addr(_fan_speed_button_7+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2001 :: 		fan_speed_button_7.OnClickPtr      = fan_speed_button_7OnClick;
MOVW	R1, #lo_addr(_fan_speed_button_7OnClick+0)
MOVT	R1, #hi_addr(_fan_speed_button_7OnClick+0)
MOVW	R0, #lo_addr(_fan_speed_button_7+60)
MOVT	R0, #hi_addr(_fan_speed_button_7+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2003 :: 		ButtonRound2.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_ButtonRound2+0)
MOVT	R0, #hi_addr(_ButtonRound2+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2004 :: 		ButtonRound2.Order           = 38;
MOVS	R1, #38
MOVW	R0, #lo_addr(_ButtonRound2+4)
MOVT	R0, #hi_addr(_ButtonRound2+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2005 :: 		ButtonRound2.Left            = 600;
MOVW	R1, #600
MOVW	R0, #lo_addr(_ButtonRound2+6)
MOVT	R0, #hi_addr(_ButtonRound2+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2006 :: 		ButtonRound2.Top             = 415;
MOVW	R1, #415
MOVW	R0, #lo_addr(_ButtonRound2+8)
MOVT	R0, #hi_addr(_ButtonRound2+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2007 :: 		ButtonRound2.Width           = 190;
MOVS	R1, #190
MOVW	R0, #lo_addr(_ButtonRound2+10)
MOVT	R0, #hi_addr(_ButtonRound2+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2008 :: 		ButtonRound2.Height          = 55;
MOVS	R1, #55
MOVW	R0, #lo_addr(_ButtonRound2+12)
MOVT	R0, #hi_addr(_ButtonRound2+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2009 :: 		ButtonRound2.Pen_Width       = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_ButtonRound2+14)
MOVT	R0, #hi_addr(_ButtonRound2+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2010 :: 		ButtonRound2.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ButtonRound2+16)
MOVT	R0, #hi_addr(_ButtonRound2+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2011 :: 		ButtonRound2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+18)
MOVT	R0, #hi_addr(_ButtonRound2+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2012 :: 		ButtonRound2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+19)
MOVT	R0, #hi_addr(_ButtonRound2+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2013 :: 		ButtonRound2.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+20)
MOVT	R0, #hi_addr(_ButtonRound2+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2014 :: 		ButtonRound2.Caption         = ButtonRound2_Caption;
MOVW	R1, #lo_addr(_ButtonRound2_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound2_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound2+24)
MOVT	R0, #hi_addr(_ButtonRound2+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2015 :: 		ButtonRound2.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+28)
MOVT	R0, #hi_addr(_ButtonRound2+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2016 :: 		ButtonRound2.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+29)
MOVT	R0, #hi_addr(_ButtonRound2+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2017 :: 		ButtonRound2.FontName        = Tahoma39x48_Regular;
MOVW	R1, #9103
MOVW	R0, #lo_addr(_ButtonRound2+32)
MOVT	R0, #hi_addr(_ButtonRound2+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2018 :: 		ButtonRound2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+49)
MOVT	R0, #hi_addr(_ButtonRound2+49)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2019 :: 		ButtonRound2.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ButtonRound2+36)
MOVT	R0, #hi_addr(_ButtonRound2+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2020 :: 		ButtonRound2.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+38)
MOVT	R0, #hi_addr(_ButtonRound2+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2021 :: 		ButtonRound2.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+39)
MOVT	R0, #hi_addr(_ButtonRound2+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2022 :: 		ButtonRound2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+40)
MOVT	R0, #hi_addr(_ButtonRound2+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2023 :: 		ButtonRound2.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound2+42)
MOVT	R0, #hi_addr(_ButtonRound2+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2024 :: 		ButtonRound2.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound2+44)
MOVT	R0, #hi_addr(_ButtonRound2+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2025 :: 		ButtonRound2.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound2+46)
MOVT	R0, #hi_addr(_ButtonRound2+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2026 :: 		ButtonRound2.Press_Color     = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+50)
MOVT	R0, #hi_addr(_ButtonRound2+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2027 :: 		ButtonRound2.Corner_Radius   = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_ButtonRound2+48)
MOVT	R0, #hi_addr(_ButtonRound2+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2028 :: 		ButtonRound2.OnClickPtr      = ButtonRound2OnClick;
MOVW	R1, #lo_addr(_ButtonRound2OnClick+0)
MOVT	R1, #hi_addr(_ButtonRound2OnClick+0)
MOVW	R0, #lo_addr(_ButtonRound2+60)
MOVT	R0, #hi_addr(_ButtonRound2+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2030 :: 		fan_speed_button_2.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_fan_speed_button_2+0)
MOVT	R0, #hi_addr(_fan_speed_button_2+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2031 :: 		fan_speed_button_2.Order           = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_fan_speed_button_2+4)
MOVT	R0, #hi_addr(_fan_speed_button_2+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2032 :: 		fan_speed_button_2.Left            = 120;
MOVS	R1, #120
MOVW	R0, #lo_addr(_fan_speed_button_2+6)
MOVT	R0, #hi_addr(_fan_speed_button_2+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2033 :: 		fan_speed_button_2.Top             = 270;
MOVW	R1, #270
MOVW	R0, #lo_addr(_fan_speed_button_2+8)
MOVT	R0, #hi_addr(_fan_speed_button_2+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2034 :: 		fan_speed_button_2.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_fan_speed_button_2+10)
MOVT	R0, #hi_addr(_fan_speed_button_2+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2035 :: 		fan_speed_button_2.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_fan_speed_button_2+12)
MOVT	R0, #hi_addr(_fan_speed_button_2+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2036 :: 		fan_speed_button_2.Pen_Width       = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_fan_speed_button_2+14)
MOVT	R0, #hi_addr(_fan_speed_button_2+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2037 :: 		fan_speed_button_2.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_2+16)
MOVT	R0, #hi_addr(_fan_speed_button_2+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2038 :: 		fan_speed_button_2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_2+18)
MOVT	R0, #hi_addr(_fan_speed_button_2+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2039 :: 		fan_speed_button_2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_2+19)
MOVT	R0, #hi_addr(_fan_speed_button_2+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2040 :: 		fan_speed_button_2.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_2+20)
MOVT	R0, #hi_addr(_fan_speed_button_2+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2041 :: 		fan_speed_button_2.Caption         = fan_speed_button_2_Caption;
MOVW	R1, #lo_addr(_fan_speed_button_2_Caption+0)
MOVT	R1, #hi_addr(_fan_speed_button_2_Caption+0)
MOVW	R0, #lo_addr(_fan_speed_button_2+24)
MOVT	R0, #hi_addr(_fan_speed_button_2+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2042 :: 		fan_speed_button_2.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_2+28)
MOVT	R0, #hi_addr(_fan_speed_button_2+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2043 :: 		fan_speed_button_2.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_2+29)
MOVT	R0, #hi_addr(_fan_speed_button_2+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2044 :: 		fan_speed_button_2.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_fan_speed_button_2+32)
MOVT	R0, #hi_addr(_fan_speed_button_2+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2045 :: 		fan_speed_button_2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_2+48)
MOVT	R0, #hi_addr(_fan_speed_button_2+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2046 :: 		fan_speed_button_2.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_2+36)
MOVT	R0, #hi_addr(_fan_speed_button_2+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2047 :: 		fan_speed_button_2.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_2+38)
MOVT	R0, #hi_addr(_fan_speed_button_2+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2048 :: 		fan_speed_button_2.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_2+39)
MOVT	R0, #hi_addr(_fan_speed_button_2+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2049 :: 		fan_speed_button_2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_2+40)
MOVT	R0, #hi_addr(_fan_speed_button_2+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2050 :: 		fan_speed_button_2.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_fan_speed_button_2+42)
MOVT	R0, #hi_addr(_fan_speed_button_2+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2051 :: 		fan_speed_button_2.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_fan_speed_button_2+44)
MOVT	R0, #hi_addr(_fan_speed_button_2+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2052 :: 		fan_speed_button_2.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_2+46)
MOVT	R0, #hi_addr(_fan_speed_button_2+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2053 :: 		fan_speed_button_2.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_2+50)
MOVT	R0, #hi_addr(_fan_speed_button_2+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2054 :: 		fan_speed_button_2.OnClickPtr      = fan_speed_button_2OnClick;
MOVW	R1, #lo_addr(_fan_speed_button_2OnClick+0)
MOVT	R1, #hi_addr(_fan_speed_button_2OnClick+0)
MOVW	R0, #lo_addr(_fan_speed_button_2+60)
MOVT	R0, #hi_addr(_fan_speed_button_2+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2056 :: 		fan_speed_button_4.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_fan_speed_button_4+0)
MOVT	R0, #hi_addr(_fan_speed_button_4+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2057 :: 		fan_speed_button_4.Order           = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_fan_speed_button_4+4)
MOVT	R0, #hi_addr(_fan_speed_button_4+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2058 :: 		fan_speed_button_4.Left            = 281;
MOVW	R1, #281
MOVW	R0, #lo_addr(_fan_speed_button_4+6)
MOVT	R0, #hi_addr(_fan_speed_button_4+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2059 :: 		fan_speed_button_4.Top             = 270;
MOVW	R1, #270
MOVW	R0, #lo_addr(_fan_speed_button_4+8)
MOVT	R0, #hi_addr(_fan_speed_button_4+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2060 :: 		fan_speed_button_4.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_fan_speed_button_4+10)
MOVT	R0, #hi_addr(_fan_speed_button_4+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2061 :: 		fan_speed_button_4.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_fan_speed_button_4+12)
MOVT	R0, #hi_addr(_fan_speed_button_4+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2062 :: 		fan_speed_button_4.Pen_Width       = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_fan_speed_button_4+14)
MOVT	R0, #hi_addr(_fan_speed_button_4+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2063 :: 		fan_speed_button_4.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_4+16)
MOVT	R0, #hi_addr(_fan_speed_button_4+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2064 :: 		fan_speed_button_4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_4+18)
MOVT	R0, #hi_addr(_fan_speed_button_4+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2065 :: 		fan_speed_button_4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_4+19)
MOVT	R0, #hi_addr(_fan_speed_button_4+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2066 :: 		fan_speed_button_4.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_4+20)
MOVT	R0, #hi_addr(_fan_speed_button_4+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2067 :: 		fan_speed_button_4.Caption         = fan_speed_button_4_Caption;
MOVW	R1, #lo_addr(_fan_speed_button_4_Caption+0)
MOVT	R1, #hi_addr(_fan_speed_button_4_Caption+0)
MOVW	R0, #lo_addr(_fan_speed_button_4+24)
MOVT	R0, #hi_addr(_fan_speed_button_4+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2068 :: 		fan_speed_button_4.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_4+28)
MOVT	R0, #hi_addr(_fan_speed_button_4+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2069 :: 		fan_speed_button_4.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_4+29)
MOVT	R0, #hi_addr(_fan_speed_button_4+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2070 :: 		fan_speed_button_4.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_fan_speed_button_4+32)
MOVT	R0, #hi_addr(_fan_speed_button_4+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2071 :: 		fan_speed_button_4.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_4+48)
MOVT	R0, #hi_addr(_fan_speed_button_4+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2072 :: 		fan_speed_button_4.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_4+36)
MOVT	R0, #hi_addr(_fan_speed_button_4+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2073 :: 		fan_speed_button_4.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_4+38)
MOVT	R0, #hi_addr(_fan_speed_button_4+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2074 :: 		fan_speed_button_4.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_4+39)
MOVT	R0, #hi_addr(_fan_speed_button_4+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2075 :: 		fan_speed_button_4.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_4+40)
MOVT	R0, #hi_addr(_fan_speed_button_4+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2076 :: 		fan_speed_button_4.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_fan_speed_button_4+42)
MOVT	R0, #hi_addr(_fan_speed_button_4+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2077 :: 		fan_speed_button_4.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_fan_speed_button_4+44)
MOVT	R0, #hi_addr(_fan_speed_button_4+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2078 :: 		fan_speed_button_4.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_4+46)
MOVT	R0, #hi_addr(_fan_speed_button_4+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2079 :: 		fan_speed_button_4.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_4+50)
MOVT	R0, #hi_addr(_fan_speed_button_4+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2080 :: 		fan_speed_button_4.OnClickPtr      = fan_speed_button_4OnClick;
MOVW	R1, #lo_addr(_fan_speed_button_4OnClick+0)
MOVT	R1, #hi_addr(_fan_speed_button_4OnClick+0)
MOVW	R0, #lo_addr(_fan_speed_button_4+60)
MOVT	R0, #hi_addr(_fan_speed_button_4+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2082 :: 		fan_speed_button_6.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_fan_speed_button_6+0)
MOVT	R0, #hi_addr(_fan_speed_button_6+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2083 :: 		fan_speed_button_6.Order           = 41;
MOVS	R1, #41
MOVW	R0, #lo_addr(_fan_speed_button_6+4)
MOVT	R0, #hi_addr(_fan_speed_button_6+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2084 :: 		fan_speed_button_6.Left            = 440;
MOVW	R1, #440
MOVW	R0, #lo_addr(_fan_speed_button_6+6)
MOVT	R0, #hi_addr(_fan_speed_button_6+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2085 :: 		fan_speed_button_6.Top             = 270;
MOVW	R1, #270
MOVW	R0, #lo_addr(_fan_speed_button_6+8)
MOVT	R0, #hi_addr(_fan_speed_button_6+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2086 :: 		fan_speed_button_6.Width           = 80;
MOVS	R1, #80
MOVW	R0, #lo_addr(_fan_speed_button_6+10)
MOVT	R0, #hi_addr(_fan_speed_button_6+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2087 :: 		fan_speed_button_6.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_fan_speed_button_6+12)
MOVT	R0, #hi_addr(_fan_speed_button_6+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2088 :: 		fan_speed_button_6.Pen_Width       = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_fan_speed_button_6+14)
MOVT	R0, #hi_addr(_fan_speed_button_6+14)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2089 :: 		fan_speed_button_6.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_6+16)
MOVT	R0, #hi_addr(_fan_speed_button_6+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2090 :: 		fan_speed_button_6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_6+18)
MOVT	R0, #hi_addr(_fan_speed_button_6+18)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2091 :: 		fan_speed_button_6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_6+19)
MOVT	R0, #hi_addr(_fan_speed_button_6+19)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2092 :: 		fan_speed_button_6.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_6+20)
MOVT	R0, #hi_addr(_fan_speed_button_6+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2093 :: 		fan_speed_button_6.Caption         = fan_speed_button_6_Caption;
MOVW	R1, #lo_addr(_fan_speed_button_6_Caption+0)
MOVT	R1, #hi_addr(_fan_speed_button_6_Caption+0)
MOVW	R0, #lo_addr(_fan_speed_button_6+24)
MOVT	R0, #hi_addr(_fan_speed_button_6+24)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2094 :: 		fan_speed_button_6.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_6+28)
MOVT	R0, #hi_addr(_fan_speed_button_6+28)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2095 :: 		fan_speed_button_6.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_6+29)
MOVT	R0, #hi_addr(_fan_speed_button_6+29)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2096 :: 		fan_speed_button_6.FontName        = Tahoma20x21_Bold;
MOVW	R1, #585
MOVW	R0, #lo_addr(_fan_speed_button_6+32)
MOVT	R0, #hi_addr(_fan_speed_button_6+32)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2097 :: 		fan_speed_button_6.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_button_6+48)
MOVT	R0, #hi_addr(_fan_speed_button_6+48)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2098 :: 		fan_speed_button_6.Font_Color      = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_6+36)
MOVT	R0, #hi_addr(_fan_speed_button_6+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2099 :: 		fan_speed_button_6.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_6+38)
MOVT	R0, #hi_addr(_fan_speed_button_6+38)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2100 :: 		fan_speed_button_6.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_6+39)
MOVT	R0, #hi_addr(_fan_speed_button_6+39)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2101 :: 		fan_speed_button_6.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_6+40)
MOVT	R0, #hi_addr(_fan_speed_button_6+40)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2102 :: 		fan_speed_button_6.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_fan_speed_button_6+42)
MOVT	R0, #hi_addr(_fan_speed_button_6+42)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2103 :: 		fan_speed_button_6.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_fan_speed_button_6+44)
MOVT	R0, #hi_addr(_fan_speed_button_6+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2104 :: 		fan_speed_button_6.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_button_6+46)
MOVT	R0, #hi_addr(_fan_speed_button_6+46)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2105 :: 		fan_speed_button_6.Press_Color     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_6+50)
MOVT	R0, #hi_addr(_fan_speed_button_6+50)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2106 :: 		fan_speed_button_6.OnClickPtr      = fan_speed_button_6OnClick;
MOVW	R1, #lo_addr(_fan_speed_button_6OnClick+0)
MOVT	R1, #hi_addr(_fan_speed_button_6OnClick+0)
MOVW	R0, #lo_addr(_fan_speed_button_6+60)
MOVT	R0, #hi_addr(_fan_speed_button_6+60)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2108 :: 		Image1.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_Image1+0)
MOVT	R0, #hi_addr(_Image1+0)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2109 :: 		Image1.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+4)
MOVT	R0, #hi_addr(_Image1+4)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2110 :: 		Image1.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+6)
MOVT	R0, #hi_addr(_Image1+6)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2111 :: 		Image1.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+8)
MOVT	R0, #hi_addr(_Image1+8)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2112 :: 		Image1.Width           = 800;
MOVW	R1, #800
MOVW	R0, #lo_addr(_Image1+10)
MOVT	R0, #hi_addr(_Image1+10)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2113 :: 		Image1.Height          = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Image1+12)
MOVT	R0, #hi_addr(_Image1+12)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2114 :: 		Image1.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+22)
MOVT	R0, #hi_addr(_Image1+22)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2115 :: 		Image1.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+23)
MOVT	R0, #hi_addr(_Image1+23)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2116 :: 		Image1.Picture_Name    = Greenhouse7800x480bmp_bmp;
MOVW	R1, #37172
MOVT	R1, #26
MOVW	R0, #lo_addr(_Image1+16)
MOVT	R0, #hi_addr(_Image1+16)
STR	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2117 :: 		Image1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+20)
MOVT	R0, #hi_addr(_Image1+20)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2118 :: 		Image1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+21)
MOVT	R0, #hi_addr(_Image1+21)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2119 :: 		}
L_end_InitializeObjects:
BX	LR
; end of MikromediaGreenhouseProject_driver_InitializeObjects
MikromediaGreenhouseProject_driver_IsInsideObject:
;MikromediaGreenhouseProject_driver.c,2121 :: 		static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
; Top start address is: 12 (R3)
; Left start address is: 8 (R2)
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
; Top end address is: 12 (R3)
; Left end address is: 8 (R2)
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
; Left start address is: 8 (R2)
; Top start address is: 12 (R3)
; Width start address is: 20 (R5)
LDRH	R5, [SP, #0]
; Height start address is: 24 (R6)
LDRH	R6, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2122 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
CMP	R2, R0
IT	HI
BHI	L_MikromediaGreenhouseProject_driver_IsInsideObject281
ADDS	R4, R2, R5
UXTH	R4, R4
; Left end address is: 8 (R2)
; Width end address is: 20 (R5)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R0
IT	CC
BCC	L_MikromediaGreenhouseProject_driver_IsInsideObject280
; X end address is: 0 (R0)
;MikromediaGreenhouseProject_driver.c,2123 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
CMP	R3, R1
IT	HI
BHI	L_MikromediaGreenhouseProject_driver_IsInsideObject279
ADDS	R4, R3, R6
UXTH	R4, R4
; Top end address is: 12 (R3)
; Height end address is: 24 (R6)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R1
IT	CC
BCC	L_MikromediaGreenhouseProject_driver_IsInsideObject278
; Y end address is: 4 (R1)
L_MikromediaGreenhouseProject_driver_IsInsideObject277:
;MikromediaGreenhouseProject_driver.c,2124 :: 		return 1;
MOVS	R0, #1
IT	AL
BAL	L_end_IsInsideObject
;MikromediaGreenhouseProject_driver.c,2122 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
L_MikromediaGreenhouseProject_driver_IsInsideObject281:
L_MikromediaGreenhouseProject_driver_IsInsideObject280:
;MikromediaGreenhouseProject_driver.c,2123 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
L_MikromediaGreenhouseProject_driver_IsInsideObject279:
L_MikromediaGreenhouseProject_driver_IsInsideObject278:
;MikromediaGreenhouseProject_driver.c,2126 :: 		return 0;
MOVS	R0, #0
;MikromediaGreenhouseProject_driver.c,2127 :: 		}
L_end_IsInsideObject:
BX	LR
; end of MikromediaGreenhouseProject_driver_IsInsideObject
_DrawButton:
;MikromediaGreenhouseProject_driver.c,2137 :: 		void DrawButton(TButton *Abutton) {
; Abutton start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; Abutton end address is: 0 (R0)
; Abutton start address is: 0 (R0)
;MikromediaGreenhouseProject_driver.c,2139 :: 		if (Abutton->Visible != 0) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawButton10
;MikromediaGreenhouseProject_driver.c,2140 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawButton11
;MikromediaGreenhouseProject_driver.c,2141 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;MikromediaGreenhouseProject_driver.c,2142 :: 		TFT_Set_Brush(Abutton->Transparent, Abutton->Press_Color, Abutton->Gradient, Abutton->Gradient_Orientation, Abutton->Gradient_End_Color, Abutton->Gradient_Start_Color);
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #40
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #50
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2143 :: 		}
IT	AL
BAL	L_DrawButton12
L_DrawButton11:
;MikromediaGreenhouseProject_driver.c,2145 :: 		TFT_Set_Brush(Abutton->Transparent, Abutton->Color, Abutton->Gradient, Abutton->Gradient_Orientation, Abutton->Gradient_Start_Color, Abutton->Gradient_End_Color);
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #40
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #46
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2146 :: 		}
L_DrawButton12:
;MikromediaGreenhouseProject_driver.c,2147 :: 		TFT_Set_Pen(Abutton->Pen_Color, Abutton->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2148 :: 		TFT_Rectangle(Abutton->Left, Abutton->Top, Abutton->Left + Abutton->Width - 1, Abutton->Top + Abutton->Height - 1);
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUBS	R5, R1, #1
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #1
SXTH	R2, R2
SXTH	R1, R4
STR	R0, [SP, #4]
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
LDR	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2149 :: 		if (Abutton->VerticalText != 0)
ADDW	R1, R0, #38
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawButton13
;MikromediaGreenhouseProject_driver.c,2150 :: 		TFT_Set_Ext_Font(Abutton->FontName, Abutton->Font_Color, FO_VERTICAL_COLUMN);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #2
BL	_TFT_Set_Ext_Font+0
LDR	R0, [SP, #4]
IT	AL
BAL	L_DrawButton14
L_DrawButton13:
;MikromediaGreenhouseProject_driver.c,2152 :: 		TFT_Set_Ext_Font(Abutton->FontName, Abutton->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Ext_Font+0
LDR	R0, [SP, #4]
L_DrawButton14:
;MikromediaGreenhouseProject_driver.c,2153 :: 		TFT_Write_Text_Return_Pos(Abutton->Caption, Abutton->Left, Abutton->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text_Return_Pos+0
LDR	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2154 :: 		if (Abutton->TextAlign == _taLeft)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawButton15
;MikromediaGreenhouseProject_driver.c,2155 :: 		ALeft = Abutton->Left + 4;
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R1, R1, #4
STRH	R1, [SP, #8]
IT	AL
BAL	L_DrawButton16
L_DrawButton15:
;MikromediaGreenhouseProject_driver.c,2156 :: 		else if (Abutton->TextAlign == _taCenter)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawButton17
;MikromediaGreenhouseProject_driver.c,2157 :: 		ALeft = Abutton->Left + (Abutton->Width - caption_length) / 2;
ADDS	R1, R0, #6
LDRH	R3, [R1, #0]
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R1, R3, R1
STRH	R1, [SP, #8]
IT	AL
BAL	L_DrawButton18
L_DrawButton17:
;MikromediaGreenhouseProject_driver.c,2158 :: 		else if (Abutton->TextAlign == _taRight)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawButton19
;MikromediaGreenhouseProject_driver.c,2159 :: 		ALeft = Abutton->Left + Abutton->Width - caption_length - 4;
ADDS	R1, R0, #6
LDRH	R2, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R2, R2, R1
UXTH	R2, R2
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
SUBS	R1, R1, #4
STRH	R1, [SP, #8]
L_DrawButton19:
L_DrawButton18:
L_DrawButton16:
;MikromediaGreenhouseProject_driver.c,2161 :: 		if (Abutton->TextAlignVertical == _tavTop)
ADDW	R1, R0, #29
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawButton20
;MikromediaGreenhouseProject_driver.c,2162 :: 		ATop = Abutton->Top + 4;
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
ADDS	R1, R1, #4
STRH	R1, [SP, #10]
IT	AL
BAL	L_DrawButton21
L_DrawButton20:
;MikromediaGreenhouseProject_driver.c,2163 :: 		else if (Abutton->TextAlignVertical == _tavMiddle)
ADDW	R1, R0, #29
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawButton22
;MikromediaGreenhouseProject_driver.c,2164 :: 		ATop = Abutton->Top + ((Abutton->Height - caption_height) / 2);
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R1, R3, R1
STRH	R1, [SP, #10]
IT	AL
BAL	L_DrawButton23
L_DrawButton22:
;MikromediaGreenhouseProject_driver.c,2165 :: 		else if (Abutton->TextAlignVertical == _tavBottom)
ADDW	R1, R0, #29
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawButton24
;MikromediaGreenhouseProject_driver.c,2166 :: 		ATop = Abutton->Top + (Abutton->Height - caption_height - 4);
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
SUBS	R1, R1, #4
UXTH	R1, R1
ADDS	R1, R3, R1
STRH	R1, [SP, #10]
L_DrawButton24:
L_DrawButton23:
L_DrawButton21:
;MikromediaGreenhouseProject_driver.c,2168 :: 		TFT_Write_Text(Abutton->Caption, ALeft, ATop);
ADDW	R1, R0, #24
; Abutton end address is: 0 (R0)
LDR	R1, [R1, #0]
LDRH	R2, [SP, #10]
MOV	R0, R1
LDRH	R1, [SP, #8]
BL	_TFT_Write_Text+0
;MikromediaGreenhouseProject_driver.c,2169 :: 		}
L_DrawButton10:
;MikromediaGreenhouseProject_driver.c,2170 :: 		}
L_end_DrawButton:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DrawButton
_DrawRoundButton:
;MikromediaGreenhouseProject_driver.c,2172 :: 		void DrawRoundButton(TButton_Round *Around_button) {
; Around_button start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; Around_button end address is: 0 (R0)
; Around_button start address is: 0 (R0)
;MikromediaGreenhouseProject_driver.c,2174 :: 		if (Around_button->Visible != 0) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawRoundButton25
;MikromediaGreenhouseProject_driver.c,2175 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton26
;MikromediaGreenhouseProject_driver.c,2176 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;MikromediaGreenhouseProject_driver.c,2178 :: 		Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
UXTH	R5, R1
;MikromediaGreenhouseProject_driver.c,2177 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
ADDW	R1, R0, #40
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #50
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;MikromediaGreenhouseProject_driver.c,2178 :: 		Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;MikromediaGreenhouseProject_driver.c,2177 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2179 :: 		}
IT	AL
BAL	L_DrawRoundButton27
L_DrawRoundButton26:
;MikromediaGreenhouseProject_driver.c,2182 :: 		Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R5, R1
;MikromediaGreenhouseProject_driver.c,2181 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
ADDW	R1, R0, #40
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #46
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;MikromediaGreenhouseProject_driver.c,2182 :: 		Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;MikromediaGreenhouseProject_driver.c,2181 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2183 :: 		}
L_DrawRoundButton27:
;MikromediaGreenhouseProject_driver.c,2184 :: 		TFT_Set_Pen(Around_button->Pen_Color, Around_button->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2187 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
ADDW	R1, R0, #48
LDRB	R1, [R1, #0]
UXTB	R6, R1
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUBS	R5, R1, #2
;MikromediaGreenhouseProject_driver.c,2186 :: 		Around_button->Left + Around_button->Width - 2,
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #2
;MikromediaGreenhouseProject_driver.c,2185 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
ADDS	R2, R2, #1
ADDS	R1, R4, #1
;MikromediaGreenhouseProject_driver.c,2187 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
STR	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2185 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
UXTH	R0, R1
UXTH	R1, R2
;MikromediaGreenhouseProject_driver.c,2186 :: 		Around_button->Left + Around_button->Width - 2,
UXTH	R2, R3
;MikromediaGreenhouseProject_driver.c,2187 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
UXTH	R3, R5
PUSH	(R6)
BL	_TFT_Rectangle_Round_Edges+0
ADD	SP, SP, #4
LDR	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2188 :: 		if (Around_button->VerticalText != 0)
ADDW	R1, R0, #38
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawRoundButton28
;MikromediaGreenhouseProject_driver.c,2189 :: 		TFT_Set_Ext_Font(Around_button->FontName, Around_button->Font_Color, FO_VERTICAL_COLUMN);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #2
BL	_TFT_Set_Ext_Font+0
LDR	R0, [SP, #4]
IT	AL
BAL	L_DrawRoundButton29
L_DrawRoundButton28:
;MikromediaGreenhouseProject_driver.c,2191 :: 		TFT_Set_Ext_Font(Around_button->FontName, Around_button->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Ext_Font+0
LDR	R0, [SP, #4]
L_DrawRoundButton29:
;MikromediaGreenhouseProject_driver.c,2192 :: 		TFT_Write_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text_Return_Pos+0
LDR	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2193 :: 		if (Around_button->TextAlign == _taLeft)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawRoundButton30
;MikromediaGreenhouseProject_driver.c,2194 :: 		ALeft = Around_button->Left + 4;
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R1, R1, #4
STRH	R1, [SP, #8]
IT	AL
BAL	L_DrawRoundButton31
L_DrawRoundButton30:
;MikromediaGreenhouseProject_driver.c,2195 :: 		else if (Around_button->TextAlign == _taCenter)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton32
;MikromediaGreenhouseProject_driver.c,2196 :: 		ALeft = Around_button->Left + (Around_button->Width - caption_length) / 2;
ADDS	R1, R0, #6
LDRH	R3, [R1, #0]
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R1, R3, R1
STRH	R1, [SP, #8]
IT	AL
BAL	L_DrawRoundButton33
L_DrawRoundButton32:
;MikromediaGreenhouseProject_driver.c,2197 :: 		else if (Around_button->TextAlign == _taRight)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawRoundButton34
;MikromediaGreenhouseProject_driver.c,2198 :: 		ALeft = Around_button->Left + Around_button->Width - caption_length - 4;
ADDS	R1, R0, #6
LDRH	R2, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R2, R2, R1
UXTH	R2, R2
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
SUBS	R1, R1, #4
STRH	R1, [SP, #8]
L_DrawRoundButton34:
L_DrawRoundButton33:
L_DrawRoundButton31:
;MikromediaGreenhouseProject_driver.c,2200 :: 		if (Around_button->TextAlignVertical == _tavTop)
ADDW	R1, R0, #29
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawRoundButton35
;MikromediaGreenhouseProject_driver.c,2201 :: 		ATop = Around_button->Top + 3;
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
ADDS	R1, R1, #3
STRH	R1, [SP, #10]
IT	AL
BAL	L_DrawRoundButton36
L_DrawRoundButton35:
;MikromediaGreenhouseProject_driver.c,2202 :: 		else if (Around_button->TextAlignVertical == _tavMiddle)
ADDW	R1, R0, #29
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton37
;MikromediaGreenhouseProject_driver.c,2203 :: 		ATop = Around_button->Top + (Around_button->Height - caption_height) / 2;
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R1, R3, R1
STRH	R1, [SP, #10]
IT	AL
BAL	L_DrawRoundButton38
L_DrawRoundButton37:
;MikromediaGreenhouseProject_driver.c,2204 :: 		else if (Around_button->TextAlignVertical == _tavBottom)
ADDW	R1, R0, #29
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawRoundButton39
;MikromediaGreenhouseProject_driver.c,2205 :: 		ATop  = Around_button->Top + Around_button->Height - caption_height - 4;
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R2, R2, R1
UXTH	R2, R2
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
SUBS	R1, R1, #4
STRH	R1, [SP, #10]
L_DrawRoundButton39:
L_DrawRoundButton38:
L_DrawRoundButton36:
;MikromediaGreenhouseProject_driver.c,2207 :: 		TFT_Write_Text(Around_button->Caption, ALeft, ATop);
ADDW	R1, R0, #24
; Around_button end address is: 0 (R0)
LDR	R1, [R1, #0]
LDRH	R2, [SP, #10]
MOV	R0, R1
LDRH	R1, [SP, #8]
BL	_TFT_Write_Text+0
;MikromediaGreenhouseProject_driver.c,2208 :: 		}
L_DrawRoundButton25:
;MikromediaGreenhouseProject_driver.c,2209 :: 		}
L_end_DrawRoundButton:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DrawRoundButton
_DrawLabel:
;MikromediaGreenhouseProject_driver.c,2211 :: 		void DrawLabel(TLabel *ALabel) {
; ALabel start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ALabel end address is: 0 (R0)
; ALabel start address is: 0 (R0)
;MikromediaGreenhouseProject_driver.c,2212 :: 		if (ALabel->Visible != 0) {
ADDW	R1, R0, #27
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawLabel40
;MikromediaGreenhouseProject_driver.c,2213 :: 		if (ALabel->VerticalText != 0)
ADDW	R1, R0, #26
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawLabel41
;MikromediaGreenhouseProject_driver.c,2214 :: 		TFT_Set_Ext_Font(ALabel->FontName, ALabel->Font_Color, FO_VERTICAL_COLUMN);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #2
BL	_TFT_Set_Ext_Font+0
LDR	R0, [SP, #4]
IT	AL
BAL	L_DrawLabel42
L_DrawLabel41:
;MikromediaGreenhouseProject_driver.c,2216 :: 		TFT_Set_Ext_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Ext_Font+0
LDR	R0, [SP, #4]
L_DrawLabel42:
;MikromediaGreenhouseProject_driver.c,2217 :: 		TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #16
; ALabel end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text+0
;MikromediaGreenhouseProject_driver.c,2218 :: 		}
L_DrawLabel40:
;MikromediaGreenhouseProject_driver.c,2219 :: 		}
L_end_DrawLabel:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawLabel
_DrawImage:
;MikromediaGreenhouseProject_driver.c,2221 :: 		void DrawImage(TImage *AImage) {
; AImage start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; AImage end address is: 0 (R0)
; AImage start address is: 0 (R0)
;MikromediaGreenhouseProject_driver.c,2222 :: 		if (AImage->Visible != 0) {
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawImage43
;MikromediaGreenhouseProject_driver.c,2223 :: 		TFT_Ext_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
ADDW	R1, R0, #23
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #16
LDR	R1, [R1, #0]
MOV	R3, R1
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDS	R1, R0, #6
; AImage end address is: 0 (R0)
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
MOV	R2, R3
UXTB	R3, R4
BL	_TFT_Ext_Image+0
;MikromediaGreenhouseProject_driver.c,2224 :: 		}
L_DrawImage43:
;MikromediaGreenhouseProject_driver.c,2225 :: 		}
L_end_DrawImage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DrawImage
_DrawCircle:
;MikromediaGreenhouseProject_driver.c,2227 :: 		void DrawCircle(TCircle *ACircle) {
; ACircle start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ACircle end address is: 0 (R0)
; ACircle start address is: 0 (R0)
;MikromediaGreenhouseProject_driver.c,2228 :: 		if (ACircle->Visible != 0) {
ADDW	R1, R0, #16
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawCircle44
;MikromediaGreenhouseProject_driver.c,2229 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCircle45
;MikromediaGreenhouseProject_driver.c,2230 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;MikromediaGreenhouseProject_driver.c,2232 :: 		ACircle->Gradient_End_Color, ACircle->Gradient_Start_Color);
ADDW	R1, R0, #22
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R5, R1
;MikromediaGreenhouseProject_driver.c,2231 :: 		TFT_Set_Brush(ACircle->Transparent, ACircle->Press_Color, ACircle->Gradient, ACircle->Gradient_Orientation,
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #19
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #30
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;MikromediaGreenhouseProject_driver.c,2232 :: 		ACircle->Gradient_End_Color, ACircle->Gradient_Start_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;MikromediaGreenhouseProject_driver.c,2231 :: 		TFT_Set_Brush(ACircle->Transparent, ACircle->Press_Color, ACircle->Gradient, ACircle->Gradient_Orientation,
LDR	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2233 :: 		}
IT	AL
BAL	L_DrawCircle46
L_DrawCircle45:
;MikromediaGreenhouseProject_driver.c,2236 :: 		ACircle->Gradient_Start_Color, ACircle->Gradient_End_Color);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #22
LDRH	R1, [R1, #0]
UXTH	R5, R1
;MikromediaGreenhouseProject_driver.c,2235 :: 		TFT_Set_Brush(ACircle->Transparent, ACircle->Color, ACircle->Gradient, ACircle->Gradient_Orientation,
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #19
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;MikromediaGreenhouseProject_driver.c,2236 :: 		ACircle->Gradient_Start_Color, ACircle->Gradient_End_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;MikromediaGreenhouseProject_driver.c,2235 :: 		TFT_Set_Brush(ACircle->Transparent, ACircle->Color, ACircle->Gradient, ACircle->Gradient_Orientation,
LDR	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2237 :: 		}
L_DrawCircle46:
;MikromediaGreenhouseProject_driver.c,2238 :: 		TFT_Set_Pen(ACircle->Pen_Color, ACircle->Pen_Width);
ADDW	R1, R0, #12
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #14
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2241 :: 		ACircle->Radius);
ADDW	R1, R0, #10
LDRH	R4, [R1, #0]
SXTH	R3, R4
;MikromediaGreenhouseProject_driver.c,2240 :: 		ACircle->Top + ACircle->Radius,
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
ADDS	R2, R1, R4
;MikromediaGreenhouseProject_driver.c,2239 :: 		TFT_Circle(ACircle->Left + ACircle->Radius,
ADDS	R1, R0, #6
; ACircle end address is: 0 (R0)
LDRH	R1, [R1, #0]
ADDS	R1, R1, R4
SXTH	R0, R1
;MikromediaGreenhouseProject_driver.c,2240 :: 		ACircle->Top + ACircle->Radius,
SXTH	R1, R2
;MikromediaGreenhouseProject_driver.c,2241 :: 		ACircle->Radius);
SXTH	R2, R3
BL	_TFT_Circle+0
;MikromediaGreenhouseProject_driver.c,2242 :: 		}
L_DrawCircle44:
;MikromediaGreenhouseProject_driver.c,2243 :: 		}
L_end_DrawCircle:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawCircle
_GetColorFromGradientRange:
;MikromediaGreenhouseProject_driver.c,2246 :: 		unsigned int distance, unsigned int range) {
; range start address is: 12 (R3)
; distance start address is: 8 (R2)
; end_color start address is: 4 (R1)
; start_color start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
UXTH	R7, R0
UXTH	R8, R1
UXTH	R9, R2
UXTH	R10, R3
; range end address is: 12 (R3)
; distance end address is: 8 (R2)
; end_color end address is: 4 (R1)
; start_color end address is: 0 (R0)
; start_color start address is: 28 (R7)
; end_color start address is: 32 (R8)
; distance start address is: 36 (R9)
; range start address is: 40 (R10)
;MikromediaGreenhouseProject_driver.c,2252 :: 		if (distance == 0)
CMP	R9, #0
IT	NE
BNE	L_GetColorFromGradientRange47
; end_color end address is: 32 (R8)
; distance end address is: 36 (R9)
; range end address is: 40 (R10)
;MikromediaGreenhouseProject_driver.c,2253 :: 		return start_color;
UXTH	R0, R7
; start_color end address is: 28 (R7)
IT	AL
BAL	L_end_GetColorFromGradientRange
L_GetColorFromGradientRange47:
;MikromediaGreenhouseProject_driver.c,2254 :: 		else if (distance == range)
; range start address is: 40 (R10)
; distance start address is: 36 (R9)
; end_color start address is: 32 (R8)
; start_color start address is: 28 (R7)
CMP	R9, R10
IT	NE
BNE	L_GetColorFromGradientRange49
; start_color end address is: 28 (R7)
; distance end address is: 36 (R9)
; range end address is: 40 (R10)
;MikromediaGreenhouseProject_driver.c,2255 :: 		return end_color;
UXTH	R0, R8
; end_color end address is: 32 (R8)
IT	AL
BAL	L_end_GetColorFromGradientRange
L_GetColorFromGradientRange49:
;MikromediaGreenhouseProject_driver.c,2257 :: 		TFT_Color16bitToRGB(start_color, &red_start, &green_start, &blue_start);
; range start address is: 40 (R10)
; distance start address is: 36 (R9)
; end_color start address is: 32 (R8)
; start_color start address is: 28 (R7)
ADD	R6, SP, #8
ADD	R5, SP, #6
ADD	R4, SP, #4
MOV	R3, R6
MOV	R2, R5
MOV	R1, R4
UXTH	R0, R7
; start_color end address is: 28 (R7)
BL	_TFT_Color16bitToRGB+0
;MikromediaGreenhouseProject_driver.c,2258 :: 		TFT_Color16bitToRGB(end_color, &red_end, &green_end, &blue_end);
ADD	R6, SP, #9
ADD	R5, SP, #7
ADD	R4, SP, #5
MOV	R3, R6
MOV	R2, R5
MOV	R1, R4
UXTH	R0, R8
; end_color end address is: 32 (R8)
BL	_TFT_Color16bitToRGB+0
;MikromediaGreenhouseProject_driver.c,2260 :: 		red_current   = red_start   + (long)distance * ((int)red_end   - red_start)   / range;
UXTH	R6, R9
LDRB	R5, [SP, #5]
LDRB	R4, [SP, #4]
SUB	R4, R5, R4
SXTH	R4, R4
MULS	R4, R6, R4
SDIV	R5, R4, R10
LDRB	R4, [SP, #4]
ADD	R8, R4, R5, LSL #0
;MikromediaGreenhouseProject_driver.c,2261 :: 		green_current = green_start + (long)distance * ((int)green_end - green_start) / range;
UXTH	R6, R9
LDRB	R5, [SP, #7]
LDRB	R4, [SP, #6]
SUB	R4, R5, R4
SXTH	R4, R4
MULS	R4, R6, R4
SDIV	R5, R4, R10
LDRB	R4, [SP, #6]
ADDS	R7, R4, R5
;MikromediaGreenhouseProject_driver.c,2262 :: 		blue_current  = blue_start  + (long)distance * ((int)blue_end  - blue_start)  / range;
UXTH	R6, R9
; distance end address is: 36 (R9)
LDRB	R5, [SP, #9]
LDRB	R4, [SP, #8]
SUB	R4, R5, R4
SXTH	R4, R4
MULS	R4, R6, R4
SDIV	R5, R4, R10
; range end address is: 40 (R10)
LDRB	R4, [SP, #8]
ADDS	R4, R4, R5
;MikromediaGreenhouseProject_driver.c,2263 :: 		return TFT_RGBToColor16bit(red_current, green_current, blue_current);
UXTB	R2, R4
UXTB	R1, R7
UXTB	R0, R8
BL	_TFT_RGBToColor16bit+0
;MikromediaGreenhouseProject_driver.c,2265 :: 		}
L_end_GetColorFromGradientRange:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _GetColorFromGradientRange
_Update_Percentage:
;MikromediaGreenhouseProject_driver.c,2267 :: 		void Update_Percentage(TProgressBar *AProgressBar, unsigned int locPosition) {
; locPosition start address is: 4 (R1)
; AProgressBar start address is: 0 (R0)
SUB	SP, SP, #16
STR	LR, [SP, #0]
; locPosition end address is: 4 (R1)
; AProgressBar end address is: 0 (R0)
; AProgressBar start address is: 0 (R0)
; locPosition start address is: 4 (R1)
;MikromediaGreenhouseProject_driver.c,2270 :: 		if (AProgressBar->Show_Position != 0) {
ADDW	R2, R0, #48
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Update_Percentage51
;MikromediaGreenhouseProject_driver.c,2271 :: 		if (AProgressBar->Show_Percentage != 0) {
ADDW	R2, R0, #49
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Update_Percentage52
;MikromediaGreenhouseProject_driver.c,2272 :: 		WordToStr(locPosition , tmpStr);
ADD	R2, SP, #8
STR	R0, [SP, #4]
UXTH	R0, R1
MOV	R1, R2
; locPosition end address is: 4 (R1)
BL	_WordToStr+0
;MikromediaGreenhouseProject_driver.c,2273 :: 		Ltrim(tmpStr);
ADD	R2, SP, #8
MOV	R0, R2
BL	_Ltrim+0
LDR	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2274 :: 		strcpy(AProgressBar->Caption, tmpStr);
ADD	R3, SP, #8
ADDW	R2, R0, #20
LDR	R2, [R2, #0]
STR	R0, [SP, #4]
MOV	R1, R3
MOV	R0, R2
BL	_strcpy+0
LDR	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2275 :: 		strcat(AProgressBar->Caption, "\%");
MOVW	R3, #lo_addr(?lstr1_MikromediaGreenhouseProject_driver+0)
MOVT	R3, #hi_addr(?lstr1_MikromediaGreenhouseProject_driver+0)
ADDW	R2, R0, #20
LDR	R2, [R2, #0]
STR	R0, [SP, #4]
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
LDR	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2276 :: 		} else {
IT	AL
BAL	L_Update_Percentage53
L_Update_Percentage52:
;MikromediaGreenhouseProject_driver.c,2277 :: 		WordToStr(AProgressBar->Position , tmpStr);
ADD	R3, SP, #8
ADDW	R2, R0, #44
LDRH	R2, [R2, #0]
STR	R0, [SP, #4]
MOV	R1, R3
UXTH	R0, R2
BL	_WordToStr+0
;MikromediaGreenhouseProject_driver.c,2278 :: 		Ltrim(tmpStr);
ADD	R2, SP, #8
MOV	R0, R2
BL	_Ltrim+0
LDR	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2279 :: 		strcpy(AProgressBar->Caption, tmpStr);
ADD	R3, SP, #8
ADDW	R2, R0, #20
LDR	R2, [R2, #0]
STR	R0, [SP, #4]
MOV	R1, R3
MOV	R0, R2
BL	_strcpy+0
LDR	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2280 :: 		}
L_Update_Percentage53:
;MikromediaGreenhouseProject_driver.c,2281 :: 		TFT_Set_Ext_Font(AProgressBar->FontName, AProgressBar->Font_Color, FO_HORIZONTAL);
ADDW	R2, R0, #28
LDRH	R2, [R2, #0]
UXTH	R3, R2
ADDW	R2, R0, #24
LDR	R2, [R2, #0]
STR	R0, [SP, #4]
UXTH	R1, R3
MOV	R0, R2
MOVS	R2, #0
BL	_TFT_Set_Ext_Font+0
LDR	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2282 :: 		TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
ADDW	R2, R0, #8
LDRH	R2, [R2, #0]
UXTH	R4, R2
ADDS	R2, R0, #6
LDRH	R2, [R2, #0]
UXTH	R3, R2
ADDW	R2, R0, #20
LDR	R2, [R2, #0]
STR	R0, [SP, #4]
UXTH	R1, R3
MOV	R0, R2
UXTH	R2, R4
BL	_TFT_Write_Text_Return_Pos+0
LDR	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2283 :: 		TFT_Write_Text(AProgressBar->Caption, AProgressBar->Left + (AProgressBar->Width - caption_length) / 2, AProgressBar->Top + (AProgressBar->Height - caption_height) / 2);
ADDW	R2, R0, #8
LDRH	R4, [R2, #0]
ADDW	R2, R0, #12
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(_caption_height+0)
MOVT	R2, #hi_addr(_caption_height+0)
LDRH	R2, [R2, #0]
SUB	R2, R3, R2
UXTH	R2, R2
LSRS	R2, R2, #1
UXTH	R2, R2
ADDS	R5, R4, R2
ADDS	R2, R0, #6
LDRH	R4, [R2, #0]
ADDW	R2, R0, #10
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(_caption_length+0)
MOVT	R2, #hi_addr(_caption_length+0)
LDRH	R2, [R2, #0]
SUB	R2, R3, R2
UXTH	R2, R2
LSRS	R2, R2, #1
UXTH	R2, R2
ADDS	R3, R4, R2
ADDW	R2, R0, #20
; AProgressBar end address is: 0 (R0)
LDR	R2, [R2, #0]
UXTH	R1, R3
MOV	R0, R2
UXTH	R2, R5
BL	_TFT_Write_Text+0
;MikromediaGreenhouseProject_driver.c,2284 :: 		}
L_Update_Percentage51:
;MikromediaGreenhouseProject_driver.c,2285 :: 		}
L_end_Update_Percentage:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _Update_Percentage
_Update_Sector:
;MikromediaGreenhouseProject_driver.c,2287 :: 		void Update_Sector(TProgressBar *AProgressBar, unsigned int AStartPos, unsigned int AEndPos, TProgressBarSector ASectorAction) {
; AProgressBar start address is: 0 (R0)
SUB	SP, SP, #32
STR	LR, [SP, #0]
STRH	R1, [SP, #16]
MOV	R1, R0
STRH	R2, [SP, #20]
STRB	R3, [SP, #24]
; AProgressBar end address is: 0 (R0)
; AProgressBar start address is: 4 (R1)
;MikromediaGreenhouseProject_driver.c,2288 :: 		unsigned int tmpWidth = 0;
;MikromediaGreenhouseProject_driver.c,2289 :: 		unsigned int tmpRound = 0;
;MikromediaGreenhouseProject_driver.c,2290 :: 		unsigned cnt = 0;
;MikromediaGreenhouseProject_driver.c,2293 :: 		unsigned int locPosition = 0;
;MikromediaGreenhouseProject_driver.c,2295 :: 		if (AStartPos == AEndPos)
LDRH	R5, [SP, #20]
LDRH	R4, [SP, #16]
CMP	R4, R5
IT	NE
BNE	L_Update_Sector54
; AProgressBar end address is: 4 (R1)
;MikromediaGreenhouseProject_driver.c,2296 :: 		return;
IT	AL
BAL	L_end_Update_Sector
L_Update_Sector54:
;MikromediaGreenhouseProject_driver.c,2299 :: 		if (AStartPos <= AProgressBar->Left) {
; AProgressBar start address is: 4 (R1)
ADDS	R4, R1, #6
LDRH	R5, [R4, #0]
LDRH	R4, [SP, #16]
CMP	R4, R5
IT	HI
BHI	L_Update_Sector55
;MikromediaGreenhouseProject_driver.c,2300 :: 		if (AProgressBar->Rounded != 0)
ADDW	R4, R1, #51
LDRB	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Update_Sector56
;MikromediaGreenhouseProject_driver.c,2301 :: 		AStartPos = AProgressBar->Left + AProgressBar->Corner_Radius;
ADDS	R4, R1, #6
LDRH	R5, [R4, #0]
ADDW	R4, R1, #52
LDRB	R4, [R4, #0]
ADDS	R4, R5, R4
STRH	R4, [SP, #16]
IT	AL
BAL	L_Update_Sector57
L_Update_Sector56:
;MikromediaGreenhouseProject_driver.c,2303 :: 		AStartPos = AProgressBar->Left + 1;
ADDS	R4, R1, #6
LDRH	R4, [R4, #0]
ADDS	R4, R4, #1
STRH	R4, [SP, #16]
L_Update_Sector57:
;MikromediaGreenhouseProject_driver.c,2304 :: 		}
L_Update_Sector55:
;MikromediaGreenhouseProject_driver.c,2306 :: 		if (AEndPos >= AProgressBar->Left + AProgressBar->Width) {
ADDS	R6, R1, #6
ADDW	R4, R1, #10
LDRH	R5, [R4, #0]
LDRH	R4, [R6, #0]
ADDS	R5, R4, R5
UXTH	R5, R5
LDRH	R4, [SP, #20]
CMP	R4, R5
IT	CC
BCC	L_Update_Sector58
;MikromediaGreenhouseProject_driver.c,2307 :: 		if (AProgressBar->Rounded != 0)
ADDW	R4, R1, #51
LDRB	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Update_Sector59
;MikromediaGreenhouseProject_driver.c,2308 :: 		AEndPos = AProgressBar->Left + AProgressBar->Width - (AProgressBar->Corner_Radius*2);
ADDS	R4, R1, #6
LDRH	R5, [R4, #0]
ADDW	R4, R1, #10
LDRH	R4, [R4, #0]
ADDS	R5, R5, R4
UXTH	R5, R5
ADDW	R4, R1, #52
LDRB	R4, [R4, #0]
LSLS	R4, R4, #1
SXTH	R4, R4
SUB	R4, R5, R4
STRH	R4, [SP, #20]
IT	AL
BAL	L_Update_Sector60
L_Update_Sector59:
;MikromediaGreenhouseProject_driver.c,2310 :: 		AEndPos = AProgressBar->Left + AProgressBar->Width - 1;
ADDS	R4, R1, #6
LDRH	R5, [R4, #0]
ADDW	R4, R1, #10
LDRH	R4, [R4, #0]
ADDS	R4, R5, R4
UXTH	R4, R4
SUBS	R4, R4, #1
STRH	R4, [SP, #20]
L_Update_Sector60:
;MikromediaGreenhouseProject_driver.c,2311 :: 		}
L_Update_Sector58:
;MikromediaGreenhouseProject_driver.c,2313 :: 		if (AProgressBar->Rounded != 0) {
ADDW	R4, R1, #51
LDRB	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Update_Sector61
;MikromediaGreenhouseProject_driver.c,2314 :: 		tmpRound = AProgressBar->Corner_Radius;
ADDW	R4, R1, #52
LDRB	R6, [R4, #0]
STRH	R6, [SP, #28]
;MikromediaGreenhouseProject_driver.c,2315 :: 		tmpWidth = AProgressBar->Width - AProgressBar->Corner_Radius * 2;
ADDW	R4, R1, #10
LDRH	R5, [R4, #0]
LSLS	R4, R6, #1
SXTH	R4, R4
SUB	R4, R5, R4
STRH	R4, [SP, #26]
;MikromediaGreenhouseProject_driver.c,2316 :: 		}
IT	AL
BAL	L_Update_Sector62
L_Update_Sector61:
;MikromediaGreenhouseProject_driver.c,2318 :: 		tmpRound = 0;
MOVS	R4, #0
STRH	R4, [SP, #28]
;MikromediaGreenhouseProject_driver.c,2319 :: 		tmpWidth = AProgressBar->Width;
ADDW	R4, R1, #10
LDRH	R4, [R4, #0]
STRH	R4, [SP, #26]
;MikromediaGreenhouseProject_driver.c,2320 :: 		}
L_Update_Sector62:
;MikromediaGreenhouseProject_driver.c,2323 :: 		TFT_Set_Pen(0, 0);
STR	R1, [SP, #4]
MOVS	R1, #0
MOVS	R0, #0
BL	_TFT_Set_Pen+0
LDR	R1, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2324 :: 		if (ASectorAction == _pbsFillSector) {
LDRB	R4, [SP, #24]
CMP	R4, #1
IT	NE
BNE	L_Update_Sector63
;MikromediaGreenhouseProject_driver.c,2325 :: 		if ((AProgressBar->Gradient != 0) && (AProgressBar->Gradient_Orientation != 0)) {
ADDW	R4, R1, #30
LDRB	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L__Update_Sector286
ADDW	R4, R1, #31
LDRB	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L__Update_Sector285
L__Update_Sector284:
;MikromediaGreenhouseProject_driver.c,2326 :: 		startcolor = GetColorFromGradientRange(AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color, AStartPos, AProgressBar->Left + tmpWidth + tmpRound);
ADDS	R4, R1, #6
LDRH	R5, [R4, #0]
LDRH	R4, [SP, #26]
ADDS	R5, R5, R4
UXTH	R5, R5
LDRH	R4, [SP, #28]
ADDS	R6, R5, R4
ADDW	R4, R1, #34
LDRH	R4, [R4, #0]
UXTH	R5, R4
ADDW	R4, R1, #32
LDRH	R4, [R4, #0]
STR	R1, [SP, #4]
UXTH	R3, R6
LDRH	R2, [SP, #16]
UXTH	R1, R5
UXTH	R0, R4
BL	_GetColorFromGradientRange+0
LDR	R1, [SP, #4]
STRH	R0, [SP, #12]
;MikromediaGreenhouseProject_driver.c,2327 :: 		endcolor   = GetColorFromGradientRange(AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color, AEndPos, AProgressBar->Left + tmpWidth + tmpRound);
ADDS	R4, R1, #6
LDRH	R5, [R4, #0]
LDRH	R4, [SP, #26]
ADDS	R5, R5, R4
UXTH	R5, R5
LDRH	R4, [SP, #28]
ADDS	R6, R5, R4
ADDW	R4, R1, #34
LDRH	R4, [R4, #0]
UXTH	R5, R4
ADDW	R4, R1, #32
LDRH	R4, [R4, #0]
STR	R1, [SP, #4]
UXTH	R3, R6
LDRH	R2, [SP, #20]
UXTH	R1, R5
UXTH	R0, R4
BL	_GetColorFromGradientRange+0
LDR	R1, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2328 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, startcolor, endcolor);
UXTH	R9, R0
LDRH	R8, [SP, #12]
ADDW	R4, R1, #31
LDRB	R4, [R4, #0]
UXTB	R7, R4
ADDW	R4, R1, #30
LDRB	R4, [R4, #0]
UXTB	R6, R4
ADDW	R4, R1, #36
LDRH	R4, [R4, #0]
UXTH	R5, R4
ADDW	R4, R1, #19
LDRB	R4, [R4, #0]
STR	R1, [SP, #4]
UXTB	R3, R7
UXTB	R2, R6
UXTH	R1, R5
UXTB	R0, R4
PUSH	36
PUSH	32
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R1, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2329 :: 		} else
IT	AL
BAL	L_Update_Sector67
;MikromediaGreenhouseProject_driver.c,2325 :: 		if ((AProgressBar->Gradient != 0) && (AProgressBar->Gradient_Orientation != 0)) {
L__Update_Sector286:
L__Update_Sector285:
;MikromediaGreenhouseProject_driver.c,2330 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
ADDW	R4, R1, #34
LDRH	R4, [R4, #0]
UXTH	R9, R4
ADDW	R4, R1, #32
LDRH	R4, [R4, #0]
UXTH	R8, R4
ADDW	R4, R1, #31
LDRB	R4, [R4, #0]
UXTB	R7, R4
ADDW	R4, R1, #30
LDRB	R4, [R4, #0]
UXTB	R6, R4
ADDW	R4, R1, #36
LDRH	R4, [R4, #0]
UXTH	R5, R4
ADDW	R4, R1, #19
LDRB	R4, [R4, #0]
STR	R1, [SP, #4]
UXTB	R3, R7
UXTB	R2, R6
UXTH	R1, R5
UXTB	R0, R4
PUSH	36
PUSH	32
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R1, [SP, #4]
L_Update_Sector67:
;MikromediaGreenhouseProject_driver.c,2331 :: 		} else {
IT	AL
BAL	L_Update_Sector68
L_Update_Sector63:
;MikromediaGreenhouseProject_driver.c,2332 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
MOVS	R7, #0
MOVS	R6, #0
ADDW	R4, R1, #38
LDRH	R4, [R4, #0]
UXTH	R5, R4
ADDW	R4, R1, #19
LDRB	R4, [R4, #0]
STR	R1, [SP, #4]
MOVS	R3, #0
MOVS	R2, #0
UXTH	R1, R5
UXTB	R0, R4
PUSH	(R7)
PUSH	(R6)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R1, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2333 :: 		AEndPos += 1;
LDRH	R4, [SP, #20]
ADDS	R4, R4, #1
STRH	R4, [SP, #20]
;MikromediaGreenhouseProject_driver.c,2334 :: 		}
L_Update_Sector68:
;MikromediaGreenhouseProject_driver.c,2335 :: 		TFT_Rectangle(AStartPos, AProgressBar->Top + 1, AEndPos, AProgressBar->Top + 1 + AProgressBar->Height - 1);
ADDW	R4, R1, #8
LDRH	R4, [R4, #0]
ADDS	R5, R4, #1
UXTH	R5, R5
ADDW	R4, R1, #12
LDRH	R4, [R4, #0]
ADDS	R4, R5, R4
UXTH	R4, R4
SUBS	R4, R4, #1
STR	R1, [SP, #4]
SXTH	R3, R4
LDRH	R2, [SP, #20]
SXTH	R1, R5
LDRH	R0, [SP, #16]
BL	_TFT_Rectangle+0
LDR	R1, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2338 :: 		if ((AProgressBar->Smooth == 0) && (ASectorAction == _pbsFillSector)) {
ADDW	R4, R1, #50
LDRB	R4, [R4, #0]
CMP	R4, #0
IT	NE
BNE	L__Update_Sector290
LDRB	R4, [SP, #24]
CMP	R4, #1
IT	NE
BNE	L__Update_Sector289
L__Update_Sector283:
;MikromediaGreenhouseProject_driver.c,2339 :: 		move_offset = 10;
MOVS	R4, #10
SXTH	R4, R4
STRH	R4, [SP, #14]
;MikromediaGreenhouseProject_driver.c,2340 :: 		TFT_Set_Pen(AProgressBar->Pen_Color, AProgressBar->Pen_Width);
ADDW	R4, R1, #14
LDRB	R4, [R4, #0]
UXTB	R5, R4
ADDW	R4, R1, #16
LDRH	R4, [R4, #0]
STR	R1, [SP, #4]
UXTB	R1, R5
UXTH	R0, R4
BL	_TFT_Set_Pen+0
LDR	R1, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2341 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
MOVS	R7, #0
MOVS	R6, #0
ADDW	R4, R1, #38
LDRH	R4, [R4, #0]
UXTH	R5, R4
ADDW	R4, R1, #19
LDRB	R4, [R4, #0]
STR	R1, [SP, #4]
MOVS	R3, #0
MOVS	R2, #0
UXTH	R1, R5
UXTB	R0, R4
PUSH	(R7)
PUSH	(R6)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R1, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2342 :: 		locPosition = AStartPos;
; locPosition start address is: 36 (R9)
LDRH	R9, [SP, #16]
; AProgressBar end address is: 4 (R1)
; locPosition end address is: 36 (R9)
MOV	R0, R1
UXTH	R2, R9
;MikromediaGreenhouseProject_driver.c,2343 :: 		while (locPosition < AEndPos) {
L_Update_Sector72:
; AProgressBar start address is: 0 (R0)
; locPosition start address is: 8 (R2)
; AProgressBar start address is: 0 (R0)
; AProgressBar end address is: 0 (R0)
LDRH	R4, [SP, #20]
CMP	R2, R4
IT	CS
BCS	L_Update_Sector73
; AProgressBar end address is: 0 (R0)
;MikromediaGreenhouseProject_driver.c,2344 :: 		if (((locPosition - AProgressBar->Left - tmpRound)%(move_offset + 3) == 0) && (locPosition - 3 > AProgressBar->Left + tmpRound)) {
; AProgressBar start address is: 0 (R0)
ADDS	R4, R0, #6
LDRH	R4, [R4, #0]
SUB	R5, R2, R4
UXTH	R5, R5
LDRH	R4, [SP, #28]
SUB	R6, R5, R4
UXTH	R6, R6
LDRSH	R4, [SP, #14]
ADDS	R5, R4, #3
SXTH	R5, R5
UDIV	R4, R6, R5
MLS	R4, R5, R4, R6
UXTH	R4, R4
CMP	R4, #0
IT	NE
BNE	L__Update_Sector288
SUBS	R6, R2, #3
UXTH	R6, R6
ADDS	R4, R0, #6
LDRH	R5, [R4, #0]
LDRH	R4, [SP, #28]
ADDS	R4, R5, R4
UXTH	R4, R4
CMP	R6, R4
IT	LS
BLS	L__Update_Sector287
L__Update_Sector282:
;MikromediaGreenhouseProject_driver.c,2345 :: 		if (locPosition + 3 >= AProgressBar->Left + tmpWidth + tmpRound)
ADDS	R6, R2, #3
UXTH	R6, R6
ADDS	R4, R0, #6
LDRH	R5, [R4, #0]
LDRH	R4, [SP, #26]
ADDS	R5, R5, R4
UXTH	R5, R5
LDRH	R4, [SP, #28]
ADDS	R4, R5, R4
UXTH	R4, R4
CMP	R6, R4
IT	CC
BCC	L_Update_Sector77
;MikromediaGreenhouseProject_driver.c,2346 :: 		TFT_Rectangle(locPosition - 3, AProgressBar->Top, AProgressBar->Left + tmpWidth + tmpRound, AProgressBar->Top + AProgressBar->Height);
ADDW	R4, R0, #8
LDRH	R8, [R4, #0]
ADDW	R4, R0, #12
LDRH	R4, [R4, #0]
ADD	R7, R8, R4, LSL #0
ADDS	R4, R0, #6
LDRH	R5, [R4, #0]
LDRH	R4, [SP, #26]
ADDS	R5, R5, R4
UXTH	R5, R5
LDRH	R4, [SP, #28]
ADDS	R6, R5, R4
SXTH	R5, R8
SUBS	R4, R2, #3
STR	R0, [SP, #4]
STRH	R2, [SP, #8]
SXTH	R3, R7
SXTH	R2, R6
SXTH	R1, R5
SXTH	R0, R4
BL	_TFT_Rectangle+0
LDRH	R2, [SP, #8]
LDR	R0, [SP, #4]
IT	AL
BAL	L_Update_Sector78
L_Update_Sector77:
;MikromediaGreenhouseProject_driver.c,2348 :: 		TFT_Rectangle(locPosition - 3, AProgressBar->Top, locPosition, AProgressBar->Top + AProgressBar->Height);
ADDW	R4, R0, #8
LDRH	R5, [R4, #0]
ADDW	R4, R0, #12
LDRH	R4, [R4, #0]
ADDS	R6, R5, R4
SXTH	R5, R5
SUBS	R4, R2, #3
STR	R0, [SP, #4]
STRH	R2, [SP, #8]
SXTH	R3, R6
SXTH	R2, R2
SXTH	R1, R5
SXTH	R0, R4
BL	_TFT_Rectangle+0
LDRH	R2, [SP, #8]
LDR	R0, [SP, #4]
L_Update_Sector78:
;MikromediaGreenhouseProject_driver.c,2349 :: 		locPosition += move_offset + 3;
LDRSH	R4, [SP, #14]
ADDS	R4, R4, #3
SXTH	R4, R4
ADD	R9, R2, R4, LSL #0
UXTH	R9, R9
; locPosition end address is: 8 (R2)
; locPosition start address is: 36 (R9)
;MikromediaGreenhouseProject_driver.c,2350 :: 		} else
; locPosition end address is: 36 (R9)
IT	AL
BAL	L_Update_Sector79
;MikromediaGreenhouseProject_driver.c,2344 :: 		if (((locPosition - AProgressBar->Left - tmpRound)%(move_offset + 3) == 0) && (locPosition - 3 > AProgressBar->Left + tmpRound)) {
L__Update_Sector288:
; locPosition start address is: 8 (R2)
L__Update_Sector287:
;MikromediaGreenhouseProject_driver.c,2351 :: 		locPosition++;
ADD	R9, R2, #1
UXTH	R9, R9
; locPosition end address is: 8 (R2)
; locPosition start address is: 36 (R9)
; locPosition end address is: 36 (R9)
L_Update_Sector79:
;MikromediaGreenhouseProject_driver.c,2352 :: 		}
; locPosition start address is: 36 (R9)
; AProgressBar end address is: 0 (R0)
; locPosition end address is: 36 (R9)
UXTH	R2, R9
IT	AL
BAL	L_Update_Sector72
L_Update_Sector73:
;MikromediaGreenhouseProject_driver.c,2338 :: 		if ((AProgressBar->Smooth == 0) && (ASectorAction == _pbsFillSector)) {
L__Update_Sector290:
L__Update_Sector289:
;MikromediaGreenhouseProject_driver.c,2354 :: 		}
L_end_Update_Sector:
LDR	LR, [SP, #0]
ADD	SP, SP, #32
BX	LR
; end of _Update_Sector
_UpdatePBPosition:
;MikromediaGreenhouseProject_driver.c,2356 :: 		void UpdatePBPosition(TProgressBar *AProgressBar) {
; AProgressBar start address is: 0 (R0)
SUB	SP, SP, #16
STR	LR, [SP, #0]
; AProgressBar end address is: 0 (R0)
; AProgressBar start address is: 0 (R0)
;MikromediaGreenhouseProject_driver.c,2358 :: 		unsigned long locPosition = 0;
;MikromediaGreenhouseProject_driver.c,2360 :: 		unsigned int locStartPos = 0;
;MikromediaGreenhouseProject_driver.c,2361 :: 		unsigned int locEndPos   = 0;
;MikromediaGreenhouseProject_driver.c,2363 :: 		if (AProgressBar->Prev_Position == AProgressBar->Position)
ADDW	R1, R0, #46
LDRH	R2, [R1, #0]
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
CMP	R2, R1
IT	NE
BNE	L_UpdatePBPosition80
; AProgressBar end address is: 0 (R0)
;MikromediaGreenhouseProject_driver.c,2364 :: 		return;
IT	AL
BAL	L_end_UpdatePBPosition
L_UpdatePBPosition80:
;MikromediaGreenhouseProject_driver.c,2366 :: 		locPosition = (unsigned long)(AProgressBar->Position - AProgressBar->Min) * 100 / (AProgressBar->Max - AProgressBar->Min);
; AProgressBar start address is: 0 (R0)
ADDW	R1, R0, #44
LDRH	R2, [R1, #0]
ADDW	R1, R0, #40
LDRH	R3, [R1, #0]
SUB	R1, R2, R3
UXTH	R1, R1
UXTH	R2, R1
MOVS	R1, #100
MULS	R2, R1, R2
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
SUB	R1, R1, R3
UXTH	R1, R1
UDIV	R1, R2, R1
STR	R1, [SP, #12]
;MikromediaGreenhouseProject_driver.c,2367 :: 		if (AProgressBar->Visible != 0) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_UpdatePBPosition81
;MikromediaGreenhouseProject_driver.c,2369 :: 		_temp = (AProgressBar->Position - AProgressBar->Min);
ADDW	R1, R0, #44
LDRH	R2, [R1, #0]
ADDW	R1, R0, #40
LDRH	R4, [R1, #0]
SUB	R5, R2, R4
UXTH	R5, R5
;MikromediaGreenhouseProject_driver.c,2370 :: 		_tempII = AProgressBar->Max - AProgressBar->Min;
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
SUB	R3, R1, R4
UXTH	R3, R3
;MikromediaGreenhouseProject_driver.c,2371 :: 		locEndPos = _temp * 100 / _tempII;
MOVS	R1, #100
MULS	R5, R1, R5
UXTH	R5, R5
UDIV	R5, R5, R3
UXTH	R5, R5
; locEndPos start address is: 20 (R5)
;MikromediaGreenhouseProject_driver.c,2372 :: 		_temp = (AProgressBar->Prev_Position - AProgressBar->Min);
ADDW	R1, R0, #46
LDRH	R1, [R1, #0]
SUB	R2, R1, R4
UXTH	R2, R2
;MikromediaGreenhouseProject_driver.c,2373 :: 		locStartPos =  _temp * 100 / _tempII;
MOVS	R1, #100
MULS	R1, R2, R1
UXTH	R1, R1
UDIV	R1, R1, R3
; locStartPos start address is: 16 (R4)
UXTH	R4, R1
;MikromediaGreenhouseProject_driver.c,2374 :: 		if (AProgressBar->Rounded != 0) {
ADDW	R1, R0, #51
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_UpdatePBPosition82
;MikromediaGreenhouseProject_driver.c,2375 :: 		_temp = AProgressBar->Width - (AProgressBar->Corner_Radius * 2);
ADDW	R1, R0, #10
LDRH	R3, [R1, #0]
ADDW	R1, R0, #52
LDRB	R2, [R1, #0]
LSLS	R1, R2, #1
SXTH	R1, R1
SUB	R8, R3, R1, LSL #0
UXTH	R8, R8
; _temp start address is: 32 (R8)
;MikromediaGreenhouseProject_driver.c,2376 :: 		_tempII = AProgressBar->Left + AProgressBar->Corner_Radius;
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R7, R1, R2
UXTH	R7, R7
; _tempII start address is: 28 (R7)
;MikromediaGreenhouseProject_driver.c,2377 :: 		} else {
; _tempII end address is: 28 (R7)
; _temp end address is: 32 (R8)
UXTH	R6, R7
IT	AL
BAL	L_UpdatePBPosition83
L_UpdatePBPosition82:
;MikromediaGreenhouseProject_driver.c,2378 :: 		_temp = (AProgressBar->Width - 2);
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
SUB	R8, R1, #2
UXTH	R8, R8
; _temp start address is: 32 (R8)
;MikromediaGreenhouseProject_driver.c,2379 :: 		_tempII = AProgressBar->Left + 1;
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R1, R1, #1
; _tempII start address is: 28 (R7)
UXTH	R7, R1
; _tempII end address is: 28 (R7)
; _temp end address is: 32 (R8)
UXTH	R6, R7
;MikromediaGreenhouseProject_driver.c,2380 :: 		}
L_UpdatePBPosition83:
;MikromediaGreenhouseProject_driver.c,2381 :: 		locStartPos = _tempII + locStartPos * _temp / 100;
; _tempII start address is: 24 (R6)
; _temp start address is: 32 (R8)
MUL	R2, R4, R8
UXTH	R2, R2
; locStartPos end address is: 16 (R4)
MOVS	R1, #100
UDIV	R1, R2, R1
UXTH	R1, R1
ADDS	R3, R6, R1
UXTH	R3, R3
; locStartPos start address is: 28 (R7)
UXTH	R7, R3
;MikromediaGreenhouseProject_driver.c,2382 :: 		locEndPos   = _tempII + locEndPos * _temp / 100;
MUL	R2, R5, R8
UXTH	R2, R2
; _temp end address is: 32 (R8)
; locEndPos end address is: 20 (R5)
MOVS	R1, #100
UDIV	R1, R2, R1
UXTH	R1, R1
ADDS	R1, R6, R1
UXTH	R1, R1
; _tempII end address is: 24 (R6)
; locEndPos start address is: 24 (R6)
UXTH	R6, R1
;MikromediaGreenhouseProject_driver.c,2384 :: 		if (locStartPos < locEndPos)
CMP	R3, R1
IT	CS
BCS	L_UpdatePBPosition84
;MikromediaGreenhouseProject_driver.c,2385 :: 		sector_action = _pbsFillSector;
; sector_action start address is: 4 (R1)
MOVS	R1, #1
; sector_action end address is: 4 (R1)
UXTH	R5, R6
UXTH	R6, R7
IT	AL
BAL	L_UpdatePBPosition85
L_UpdatePBPosition84:
;MikromediaGreenhouseProject_driver.c,2387 :: 		sector_action = _pbsClearSector;
; sector_action start address is: 4 (R1)
MOVS	R1, #0
;MikromediaGreenhouseProject_driver.c,2388 :: 		_temp = locStartPos;
; _temp start address is: 8 (R2)
UXTH	R2, R7
;MikromediaGreenhouseProject_driver.c,2389 :: 		locStartPos = locEndPos;
UXTH	R7, R6
;MikromediaGreenhouseProject_driver.c,2390 :: 		locEndPos = _temp;
UXTH	R6, R2
; _temp end address is: 8 (R2)
; locStartPos end address is: 28 (R7)
; locEndPos end address is: 24 (R6)
; sector_action end address is: 4 (R1)
UXTH	R5, R6
UXTH	R6, R7
;MikromediaGreenhouseProject_driver.c,2391 :: 		}
L_UpdatePBPosition85:
;MikromediaGreenhouseProject_driver.c,2392 :: 		Update_Sector(AProgressBar, locStartPos, locEndPos, sector_action);
; locEndPos start address is: 20 (R5)
; locStartPos start address is: 24 (R6)
; sector_action start address is: 4 (R1)
STRH	R6, [SP, #4]
; sector_action end address is: 4 (R1)
STRH	R5, [SP, #6]
STR	R0, [SP, #8]
UXTB	R3, R1
UXTH	R2, R5
UXTH	R1, R6
BL	_Update_Sector+0
LDR	R0, [SP, #8]
LDRH	R5, [SP, #6]
LDRH	R6, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2394 :: 		if (AProgressBar->Show_Position == 0) {
ADDW	R1, R0, #48
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_UpdatePBPosition86
; locEndPos end address is: 20 (R5)
; locStartPos end address is: 24 (R6)
;MikromediaGreenhouseProject_driver.c,2395 :: 		AProgressBar->Prev_Position = AProgressBar->Position;
ADDW	R2, R0, #46
ADDW	R1, R0, #44
; AProgressBar end address is: 0 (R0)
LDRH	R1, [R1, #0]
STRH	R1, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2396 :: 		return;
IT	AL
BAL	L_end_UpdatePBPosition
;MikromediaGreenhouseProject_driver.c,2397 :: 		}
L_UpdatePBPosition86:
;MikromediaGreenhouseProject_driver.c,2400 :: 		TFT_Set_Ext_Font(AProgressBar->FontName, AProgressBar->Font_Color, FO_HORIZONTAL);
; locStartPos start address is: 24 (R6)
; locEndPos start address is: 20 (R5)
; AProgressBar start address is: 0 (R0)
ADDW	R1, R0, #28
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STRH	R6, [SP, #4]
STRH	R5, [SP, #6]
STR	R0, [SP, #8]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Ext_Font+0
LDR	R0, [SP, #8]
;MikromediaGreenhouseProject_driver.c,2401 :: 		TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #8]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text_Return_Pos+0
LDR	R0, [SP, #8]
LDRH	R5, [SP, #6]
LDRH	R6, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2402 :: 		if (caption_length >  AProgressBar->Width)
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	LS
BLS	L_UpdatePBPosition87
;MikromediaGreenhouseProject_driver.c,2403 :: 		caption_length =  AProgressBar->Width;
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
STRH	R2, [R1, #0]
L_UpdatePBPosition87:
;MikromediaGreenhouseProject_driver.c,2404 :: 		_temp   = AProgressBar->Left + (AProgressBar->Width - caption_length) / 2;
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R3, #lo_addr(_caption_length+0)
MOVT	R3, #hi_addr(_caption_length+0)
LDRH	R1, [R3, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R2, R4, R1
UXTH	R2, R2
; _temp start address is: 16 (R4)
UXTH	R4, R2
;MikromediaGreenhouseProject_driver.c,2405 :: 		_tempII = AProgressBar->Left + (AProgressBar->Width - caption_length) / 2 + caption_length;
MOV	R1, R3
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
; _tempII start address is: 8 (R2)
UXTH	R2, R1
;MikromediaGreenhouseProject_driver.c,2408 :: 		if ((locEndPos <= _tempII) && (locStartPos <= _temp) && (locStartPos <= _tempII) && (locEndPos <= _temp))
CMP	R5, R1
IT	HI
BHI	L__UpdatePBPosition299
CMP	R6, R4
IT	HI
BHI	L__UpdatePBPosition298
CMP	R6, R2
IT	HI
BHI	L__UpdatePBPosition297
CMP	R5, R4
IT	HI
BHI	L__UpdatePBPosition296
; locEndPos end address is: 20 (R5)
; locStartPos end address is: 24 (R6)
L__UpdatePBPosition295:
;MikromediaGreenhouseProject_driver.c,2409 :: 		Update_Sector(AProgressBar, _temp, _tempII, _pbsClearSector);
STR	R0, [SP, #4]
MOVS	R3, #0
; _tempII end address is: 8 (R2)
UXTH	R1, R4
; _temp end address is: 16 (R4)
BL	_Update_Sector+0
LDR	R0, [SP, #4]
IT	AL
BAL	L_UpdatePBPosition91
;MikromediaGreenhouseProject_driver.c,2408 :: 		if ((locEndPos <= _tempII) && (locStartPos <= _temp) && (locStartPos <= _tempII) && (locEndPos <= _temp))
L__UpdatePBPosition299:
; _tempII start address is: 8 (R2)
; _temp start address is: 16 (R4)
; locStartPos start address is: 24 (R6)
; locEndPos start address is: 20 (R5)
L__UpdatePBPosition298:
L__UpdatePBPosition297:
L__UpdatePBPosition296:
;MikromediaGreenhouseProject_driver.c,2410 :: 		else if ((_tempII <= locEndPos) && (_temp <= locStartPos) && (_tempII <= locStartPos) && (_temp <= locEndPos))
CMP	R2, R5
IT	HI
BHI	L__UpdatePBPosition303
CMP	R4, R6
IT	HI
BHI	L__UpdatePBPosition302
CMP	R2, R6
IT	HI
BHI	L__UpdatePBPosition301
CMP	R4, R5
IT	HI
BHI	L__UpdatePBPosition300
; locEndPos end address is: 20 (R5)
; locStartPos end address is: 24 (R6)
L__UpdatePBPosition294:
;MikromediaGreenhouseProject_driver.c,2411 :: 		Update_Sector(AProgressBar, _temp, _tempII, _pbsFillSector);
STR	R0, [SP, #4]
MOVS	R3, #1
; _tempII end address is: 8 (R2)
UXTH	R1, R4
; _temp end address is: 16 (R4)
BL	_Update_Sector+0
LDR	R0, [SP, #4]
IT	AL
BAL	L_UpdatePBPosition95
;MikromediaGreenhouseProject_driver.c,2410 :: 		else if ((_tempII <= locEndPos) && (_temp <= locStartPos) && (_tempII <= locStartPos) && (_temp <= locEndPos))
L__UpdatePBPosition303:
; _tempII start address is: 8 (R2)
; _temp start address is: 16 (R4)
; locStartPos start address is: 24 (R6)
; locEndPos start address is: 20 (R5)
L__UpdatePBPosition302:
L__UpdatePBPosition301:
L__UpdatePBPosition300:
;MikromediaGreenhouseProject_driver.c,2412 :: 		else if ((locEndPos <= _tempII) && (locStartPos <= _temp) && (locStartPos <= _tempII) && (_temp <= locEndPos))
CMP	R5, R2
IT	HI
BHI	L__UpdatePBPosition307
CMP	R6, R4
IT	HI
BHI	L__UpdatePBPosition306
CMP	R6, R2
IT	HI
BHI	L__UpdatePBPosition305
CMP	R4, R5
IT	HI
BHI	L__UpdatePBPosition304
; locStartPos end address is: 24 (R6)
; _temp end address is: 16 (R4)
L__UpdatePBPosition293:
;MikromediaGreenhouseProject_driver.c,2413 :: 		Update_Sector(AProgressBar, locEndPos, _tempII, _pbsClearSector);
STR	R0, [SP, #4]
MOVS	R3, #0
; _tempII end address is: 8 (R2)
UXTH	R1, R5
; locEndPos end address is: 20 (R5)
BL	_Update_Sector+0
LDR	R0, [SP, #4]
IT	AL
BAL	L_UpdatePBPosition99
;MikromediaGreenhouseProject_driver.c,2412 :: 		else if ((locEndPos <= _tempII) && (locStartPos <= _temp) && (locStartPos <= _tempII) && (_temp <= locEndPos))
L__UpdatePBPosition307:
; _tempII start address is: 8 (R2)
; _temp start address is: 16 (R4)
; locStartPos start address is: 24 (R6)
; locEndPos start address is: 20 (R5)
L__UpdatePBPosition306:
L__UpdatePBPosition305:
L__UpdatePBPosition304:
;MikromediaGreenhouseProject_driver.c,2414 :: 		else if ((_tempII <= locEndPos) && (_temp <= locStartPos) && (locStartPos <= _tempII) && (_temp <= locEndPos))
CMP	R2, R5
IT	HI
BHI	L__UpdatePBPosition311
CMP	R4, R6
IT	HI
BHI	L__UpdatePBPosition310
CMP	R6, R2
IT	HI
BHI	L__UpdatePBPosition309
CMP	R4, R5
IT	HI
BHI	L__UpdatePBPosition308
; locEndPos end address is: 20 (R5)
; _tempII end address is: 8 (R2)
L__UpdatePBPosition292:
;MikromediaGreenhouseProject_driver.c,2415 :: 		Update_Sector(AProgressBar, _temp, locStartPos, _pbsFillSector);
STR	R0, [SP, #4]
MOVS	R3, #1
UXTH	R2, R6
; locStartPos end address is: 24 (R6)
UXTH	R1, R4
; _temp end address is: 16 (R4)
BL	_Update_Sector+0
LDR	R0, [SP, #4]
IT	AL
BAL	L_UpdatePBPosition103
;MikromediaGreenhouseProject_driver.c,2414 :: 		else if ((_tempII <= locEndPos) && (_temp <= locStartPos) && (locStartPos <= _tempII) && (_temp <= locEndPos))
L__UpdatePBPosition311:
; _tempII start address is: 8 (R2)
; _temp start address is: 16 (R4)
; locStartPos start address is: 24 (R6)
; locEndPos start address is: 20 (R5)
L__UpdatePBPosition310:
L__UpdatePBPosition309:
L__UpdatePBPosition308:
;MikromediaGreenhouseProject_driver.c,2416 :: 		else if ((locEndPos <= _tempII) && (_temp <= locStartPos) && (locStartPos <= _tempII) && (_temp <= locEndPos)) {
CMP	R5, R2
IT	HI
BHI	L__UpdatePBPosition315
CMP	R4, R6
IT	HI
BHI	L__UpdatePBPosition314
CMP	R6, R2
IT	HI
BHI	L__UpdatePBPosition313
CMP	R4, R5
IT	HI
BHI	L__UpdatePBPosition312
L__UpdatePBPosition291:
;MikromediaGreenhouseProject_driver.c,2417 :: 		Update_Sector(AProgressBar, _temp, locStartPos, _pbsFillSector);
STRH	R2, [SP, #4]
STRH	R5, [SP, #6]
STR	R0, [SP, #8]
MOVS	R3, #1
UXTH	R2, R6
; locStartPos end address is: 24 (R6)
UXTH	R1, R4
; _temp end address is: 16 (R4)
BL	_Update_Sector+0
LDR	R0, [SP, #8]
LDRH	R5, [SP, #6]
LDRH	R2, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2418 :: 		Update_Sector(AProgressBar, locEndPos, _tempII, _pbsClearSector);
STR	R0, [SP, #4]
MOVS	R3, #0
; _tempII end address is: 8 (R2)
UXTH	R1, R5
; locEndPos end address is: 20 (R5)
BL	_Update_Sector+0
LDR	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2416 :: 		else if ((locEndPos <= _tempII) && (_temp <= locStartPos) && (locStartPos <= _tempII) && (_temp <= locEndPos)) {
L__UpdatePBPosition315:
L__UpdatePBPosition314:
L__UpdatePBPosition313:
L__UpdatePBPosition312:
;MikromediaGreenhouseProject_driver.c,2419 :: 		}
L_UpdatePBPosition103:
L_UpdatePBPosition99:
L_UpdatePBPosition95:
L_UpdatePBPosition91:
;MikromediaGreenhouseProject_driver.c,2422 :: 		Update_Percentage(AProgressBar, locPosition);
STR	R0, [SP, #4]
LDR	R1, [SP, #12]
BL	_Update_Percentage+0
LDR	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2423 :: 		AProgressBar->Prev_Position = AProgressBar->Position;
ADDW	R2, R0, #46
ADDW	R1, R0, #44
; AProgressBar end address is: 0 (R0)
LDRH	R1, [R1, #0]
STRH	R1, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2424 :: 		}
L_UpdatePBPosition81:
;MikromediaGreenhouseProject_driver.c,2425 :: 		}
L_end_UpdatePBPosition:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _UpdatePBPosition
_DrawProgressBar:
;MikromediaGreenhouseProject_driver.c,2427 :: 		void DrawProgressBar(TProgressBar *AProgressBar) {
; AProgressBar start address is: 0 (R0)
SUB	SP, SP, #24
STR	LR, [SP, #0]
MOV	R7, R0
; AProgressBar end address is: 0 (R0)
; AProgressBar start address is: 28 (R7)
;MikromediaGreenhouseProject_driver.c,2428 :: 		unsigned long locPosition = 0;
;MikromediaGreenhouseProject_driver.c,2429 :: 		int move_offset = 0;
;MikromediaGreenhouseProject_driver.c,2430 :: 		unsigned cnt = 0;
;MikromediaGreenhouseProject_driver.c,2431 :: 		unsigned int tmpWidth = 0;
;MikromediaGreenhouseProject_driver.c,2432 :: 		unsigned int tmpRound = 0;
;MikromediaGreenhouseProject_driver.c,2435 :: 		move_offset = 10;
MOVS	R1, #10
SXTH	R1, R1
STRH	R1, [SP, #16]
;MikromediaGreenhouseProject_driver.c,2436 :: 		_tmpI = AProgressBar->Position - AProgressBar->Min;
ADDW	R1, R7, #44
LDRH	R2, [R1, #0]
ADDW	R1, R7, #40
LDRH	R3, [R1, #0]
SUB	R2, R2, R3
UXTH	R2, R2
;MikromediaGreenhouseProject_driver.c,2437 :: 		_tmpII = AProgressBar->Max - AProgressBar->Min;
ADDW	R1, R7, #42
LDRH	R1, [R1, #0]
SUB	R3, R1, R3
UXTH	R3, R3
;MikromediaGreenhouseProject_driver.c,2438 :: 		locPosition = (unsigned long)_tmpI * 100 / _tmpII;
MOVS	R1, #100
MULS	R1, R2, R1
UDIV	R1, R1, R3
STR	R1, [SP, #12]
;MikromediaGreenhouseProject_driver.c,2439 :: 		if (AProgressBar->Visible != 0) {
ADDW	R1, R7, #18
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawProgressBar107
;MikromediaGreenhouseProject_driver.c,2440 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
MOVS	R4, #0
MOVS	R3, #0
ADDW	R1, R7, #38
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R7, #19
LDRB	R1, [R1, #0]
PUSH	(R4)
PUSH	(R3)
MOVS	R3, #0
UXTB	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;MikromediaGreenhouseProject_driver.c,2441 :: 		TFT_Set_Pen(AProgressBar->Pen_Color, AProgressBar->Pen_Width);
ADDW	R1, R7, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R7, #16
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
;MikromediaGreenhouseProject_driver.c,2443 :: 		if (AProgressBar->Rounded != 0) {
ADDW	R1, R7, #51
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawProgressBar108
;MikromediaGreenhouseProject_driver.c,2444 :: 		tmpRound = AProgressBar->Corner_Radius;
ADDW	R1, R7, #52
LDRB	R3, [R1, #0]
STRH	R3, [SP, #22]
;MikromediaGreenhouseProject_driver.c,2445 :: 		cnt = move_offset + tmpRound;
LDRH	R2, [SP, #22]
LDRSH	R1, [SP, #16]
ADDS	R1, R1, R2
STRH	R1, [SP, #18]
;MikromediaGreenhouseProject_driver.c,2446 :: 		tmpWidth = AProgressBar->Width - AProgressBar->Corner_Radius * 2;
ADDW	R1, R7, #10
LDRH	R2, [R1, #0]
LSLS	R1, R3, #1
SXTH	R1, R1
SUB	R1, R2, R1
STRH	R1, [SP, #20]
;MikromediaGreenhouseProject_driver.c,2447 :: 		} else {
IT	AL
BAL	L_DrawProgressBar109
L_DrawProgressBar108:
;MikromediaGreenhouseProject_driver.c,2448 :: 		tmpRound = 0;
MOVS	R1, #0
STRH	R1, [SP, #22]
;MikromediaGreenhouseProject_driver.c,2449 :: 		cnt = move_offset;
LDRSH	R1, [SP, #16]
STRH	R1, [SP, #18]
;MikromediaGreenhouseProject_driver.c,2450 :: 		tmpWidth = AProgressBar->Width;
ADDW	R1, R7, #10
LDRH	R1, [R1, #0]
STRH	R1, [SP, #20]
;MikromediaGreenhouseProject_driver.c,2451 :: 		}
L_DrawProgressBar109:
;MikromediaGreenhouseProject_driver.c,2453 :: 		if ((AProgressBar->Gradient != 0) && (AProgressBar->Gradient_Orientation != 0)) {
ADDW	R1, R7, #30
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L__DrawProgressBar318
ADDW	R1, R7, #31
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L__DrawProgressBar317
L__DrawProgressBar316:
;MikromediaGreenhouseProject_driver.c,2455 :: 		0, AProgressBar->Max - AProgressBar->Min);
ADDW	R1, R7, #42
LDRH	R2, [R1, #0]
ADDW	R1, R7, #40
LDRH	R1, [R1, #0]
SUB	R3, R2, R1
;MikromediaGreenhouseProject_driver.c,2454 :: 		startcolor = GetColorFromGradientRange(AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color,
ADDW	R1, R7, #34
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R7, #32
LDRH	R1, [R1, #0]
;MikromediaGreenhouseProject_driver.c,2455 :: 		0, AProgressBar->Max - AProgressBar->Min);
STR	R7, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2454 :: 		startcolor = GetColorFromGradientRange(AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color,
UXTH	R0, R1
UXTH	R1, R2
;MikromediaGreenhouseProject_driver.c,2455 :: 		0, AProgressBar->Max - AProgressBar->Min);
MOVS	R2, #0
BL	_GetColorFromGradientRange+0
LDR	R7, [SP, #4]
STRH	R0, [SP, #8]
;MikromediaGreenhouseProject_driver.c,2457 :: 		AProgressBar->Position - AProgressBar->Min, AProgressBar->Max - AProgressBar->Min);
ADDW	R1, R7, #42
LDRH	R3, [R1, #0]
ADDW	R1, R7, #40
LDRH	R2, [R1, #0]
SUB	R4, R3, R2
ADDW	R1, R7, #44
LDRH	R1, [R1, #0]
SUB	R3, R1, R2
;MikromediaGreenhouseProject_driver.c,2456 :: 		endcolor   = GetColorFromGradientRange(AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color,
ADDW	R1, R7, #34
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R7, #32
LDRH	R1, [R1, #0]
;MikromediaGreenhouseProject_driver.c,2457 :: 		AProgressBar->Position - AProgressBar->Min, AProgressBar->Max - AProgressBar->Min);
STR	R7, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2456 :: 		endcolor   = GetColorFromGradientRange(AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color,
UXTH	R0, R1
UXTH	R1, R2
;MikromediaGreenhouseProject_driver.c,2457 :: 		AProgressBar->Position - AProgressBar->Min, AProgressBar->Max - AProgressBar->Min);
UXTH	R2, R3
UXTH	R3, R4
BL	_GetColorFromGradientRange+0
LDR	R7, [SP, #4]
STRH	R0, [SP, #10]
;MikromediaGreenhouseProject_driver.c,2458 :: 		} else {
IT	AL
BAL	L_DrawProgressBar113
;MikromediaGreenhouseProject_driver.c,2453 :: 		if ((AProgressBar->Gradient != 0) && (AProgressBar->Gradient_Orientation != 0)) {
L__DrawProgressBar318:
L__DrawProgressBar317:
;MikromediaGreenhouseProject_driver.c,2459 :: 		startcolor = AProgressBar->Gradient_Start_Color;
ADDW	R1, R7, #32
LDRH	R1, [R1, #0]
STRH	R1, [SP, #8]
;MikromediaGreenhouseProject_driver.c,2460 :: 		endcolor   = AProgressBar->Gradient_End_Color;
ADDW	R1, R7, #34
LDRH	R1, [R1, #0]
STRH	R1, [SP, #10]
;MikromediaGreenhouseProject_driver.c,2461 :: 		}
L_DrawProgressBar113:
;MikromediaGreenhouseProject_driver.c,2464 :: 		if (AProgressBar->Rounded != 0)
ADDW	R1, R7, #51
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawProgressBar114
;MikromediaGreenhouseProject_driver.c,2466 :: 		AProgressBar->Top + AProgressBar->Height, AProgressBar->Corner_Radius);
ADDW	R1, R7, #52
LDRB	R1, [R1, #0]
UXTB	R6, R1
ADDW	R1, R7, #8
LDRH	R2, [R1, #0]
ADDW	R1, R7, #12
LDRH	R1, [R1, #0]
ADDS	R5, R2, R1
;MikromediaGreenhouseProject_driver.c,2465 :: 		TFT_Rectangle_Round_Edges(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + AProgressBar->Width,
ADDS	R1, R7, #6
LDRH	R4, [R1, #0]
ADDW	R1, R7, #10
LDRH	R1, [R1, #0]
ADDS	R3, R4, R1
UXTH	R1, R4
;MikromediaGreenhouseProject_driver.c,2466 :: 		AProgressBar->Top + AProgressBar->Height, AProgressBar->Corner_Radius);
STR	R7, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2465 :: 		TFT_Rectangle_Round_Edges(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + AProgressBar->Width,
UXTH	R0, R1
UXTH	R1, R2
UXTH	R2, R3
;MikromediaGreenhouseProject_driver.c,2466 :: 		AProgressBar->Top + AProgressBar->Height, AProgressBar->Corner_Radius);
UXTH	R3, R5
PUSH	(R6)
BL	_TFT_Rectangle_Round_Edges+0
ADD	SP, SP, #4
LDR	R7, [SP, #4]
IT	AL
BAL	L_DrawProgressBar115
L_DrawProgressBar114:
;MikromediaGreenhouseProject_driver.c,2469 :: 		AProgressBar->Top + AProgressBar->Height);
ADDW	R1, R7, #8
LDRH	R2, [R1, #0]
ADDW	R1, R7, #12
LDRH	R1, [R1, #0]
ADDS	R5, R2, R1
;MikromediaGreenhouseProject_driver.c,2468 :: 		TFT_Rectangle(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + AProgressBar->Width,
ADDS	R1, R7, #6
LDRH	R4, [R1, #0]
ADDW	R1, R7, #10
LDRH	R1, [R1, #0]
ADDS	R3, R4, R1
SXTH	R2, R2
SXTH	R1, R4
;MikromediaGreenhouseProject_driver.c,2469 :: 		AProgressBar->Top + AProgressBar->Height);
STR	R7, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2468 :: 		TFT_Rectangle(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + AProgressBar->Width,
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
;MikromediaGreenhouseProject_driver.c,2469 :: 		AProgressBar->Top + AProgressBar->Height);
SXTH	R3, R5
BL	_TFT_Rectangle+0
LDR	R7, [SP, #4]
L_DrawProgressBar115:
;MikromediaGreenhouseProject_driver.c,2471 :: 		if (locPosition > 0) {
LDR	R1, [SP, #12]
CMP	R1, #0
IT	LS
BLS	L__DrawProgressBar320
;MikromediaGreenhouseProject_driver.c,2472 :: 		if (AProgressBar->Rounded != 0) {
ADDW	R1, R7, #51
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawProgressBar117
;MikromediaGreenhouseProject_driver.c,2474 :: 		AProgressBar->Gradient_Orientation, startcolor, endcolor);
LDRH	R6, [SP, #10]
LDRH	R5, [SP, #8]
ADDW	R1, R7, #31
LDRB	R1, [R1, #0]
UXTB	R4, R1
;MikromediaGreenhouseProject_driver.c,2473 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient,
ADDW	R1, R7, #30
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R7, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R7, #19
LDRB	R1, [R1, #0]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
;MikromediaGreenhouseProject_driver.c,2474 :: 		AProgressBar->Gradient_Orientation, startcolor, endcolor);
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;MikromediaGreenhouseProject_driver.c,2477 :: 		AProgressBar->Top + AProgressBar->Height);
ADDW	R1, R7, #8
LDRH	R6, [R1, #0]
ADDW	R1, R7, #12
LDRH	R1, [R1, #0]
ADDS	R5, R6, R1
;MikromediaGreenhouseProject_driver.c,2476 :: 		AProgressBar->Left + AProgressBar->Corner_Radius + locPosition * (AProgressBar->Width-AProgressBar->Corner_Radius*2) / 100,
ADDS	R1, R7, #6
LDRH	R2, [R1, #0]
ADDW	R1, R7, #52
LDRB	R4, [R1, #0]
ADDS	R3, R2, R4
UXTH	R3, R3
ADDW	R1, R7, #10
LDRH	R2, [R1, #0]
LSLS	R1, R4, #1
SXTH	R1, R1
SUB	R2, R2, R1
UXTH	R2, R2
LDR	R1, [SP, #12]
MULS	R2, R1, R2
MOVS	R1, #100
UDIV	R1, R2, R1
ADDS	R2, R3, R1
;MikromediaGreenhouseProject_driver.c,2475 :: 		TFT_Rectangle(AProgressBar->Left + AProgressBar->Corner_Radius, AProgressBar->Top,
SXTH	R1, R6
;MikromediaGreenhouseProject_driver.c,2477 :: 		AProgressBar->Top + AProgressBar->Height);
STR	R7, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2476 :: 		AProgressBar->Left + AProgressBar->Corner_Radius + locPosition * (AProgressBar->Width-AProgressBar->Corner_Radius*2) / 100,
SXTH	R2, R2
;MikromediaGreenhouseProject_driver.c,2475 :: 		TFT_Rectangle(AProgressBar->Left + AProgressBar->Corner_Radius, AProgressBar->Top,
SXTH	R0, R3
;MikromediaGreenhouseProject_driver.c,2477 :: 		AProgressBar->Top + AProgressBar->Height);
SXTH	R3, R5
BL	_TFT_Rectangle+0
LDR	R7, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2478 :: 		} else {
IT	AL
BAL	L_DrawProgressBar118
L_DrawProgressBar117:
;MikromediaGreenhouseProject_driver.c,2480 :: 		AProgressBar->Gradient_Orientation, startcolor, endcolor);
LDRH	R6, [SP, #10]
LDRH	R5, [SP, #8]
ADDW	R1, R7, #31
LDRB	R1, [R1, #0]
UXTB	R4, R1
;MikromediaGreenhouseProject_driver.c,2479 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient,
ADDW	R1, R7, #30
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R7, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R7, #19
LDRB	R1, [R1, #0]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
;MikromediaGreenhouseProject_driver.c,2480 :: 		AProgressBar->Gradient_Orientation, startcolor, endcolor);
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;MikromediaGreenhouseProject_driver.c,2482 :: 		AProgressBar->Top + AProgressBar->Height);
ADDW	R1, R7, #8
LDRH	R6, [R1, #0]
ADDW	R1, R7, #12
LDRH	R1, [R1, #0]
ADDS	R5, R6, R1
;MikromediaGreenhouseProject_driver.c,2481 :: 		TFT_Rectangle(AProgressBar->Left, AProgressBar->Top,  AProgressBar->Left + (locPosition * AProgressBar->Width) / 100,
ADDS	R1, R7, #6
LDRH	R4, [R1, #0]
ADDW	R1, R7, #10
LDRH	R2, [R1, #0]
LDR	R1, [SP, #12]
MULS	R2, R1, R2
MOVS	R1, #100
UDIV	R1, R2, R1
ADDS	R3, R4, R1
SXTH	R2, R6
SXTH	R1, R4
;MikromediaGreenhouseProject_driver.c,2482 :: 		AProgressBar->Top + AProgressBar->Height);
STR	R7, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2481 :: 		TFT_Rectangle(AProgressBar->Left, AProgressBar->Top,  AProgressBar->Left + (locPosition * AProgressBar->Width) / 100,
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
;MikromediaGreenhouseProject_driver.c,2482 :: 		AProgressBar->Top + AProgressBar->Height);
SXTH	R3, R5
BL	_TFT_Rectangle+0
LDR	R7, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2483 :: 		}
L_DrawProgressBar118:
;MikromediaGreenhouseProject_driver.c,2485 :: 		if (AProgressBar->Smooth == 0) {
ADDW	R1, R7, #50
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L__DrawProgressBar319
;MikromediaGreenhouseProject_driver.c,2486 :: 		TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
MOVS	R4, #0
MOVS	R3, #0
ADDW	R1, R7, #38
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R7, #19
LDRB	R1, [R1, #0]
PUSH	(R4)
PUSH	(R3)
MOVS	R3, #0
UXTB	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
; AProgressBar end address is: 28 (R7)
MOV	R0, R7
;MikromediaGreenhouseProject_driver.c,2487 :: 		while (cnt-tmpRound < (locPosition * tmpWidth) / 100) {
L_DrawProgressBar120:
; AProgressBar start address is: 0 (R0)
LDRH	R2, [SP, #22]
LDRH	R1, [SP, #18]
SUB	R3, R1, R2
UXTH	R3, R3
LDRH	R2, [SP, #20]
LDR	R1, [SP, #12]
MULS	R2, R1, R2
MOVS	R1, #100
UDIV	R1, R2, R1
CMP	R3, R1
IT	CS
BCS	L_DrawProgressBar121
;MikromediaGreenhouseProject_driver.c,2488 :: 		if  (cnt - tmpRound + 3 >=  tmpWidth * locPosition)
LDRH	R2, [SP, #22]
LDRH	R1, [SP, #18]
SUB	R1, R1, R2
UXTH	R1, R1
ADDS	R3, R1, #3
UXTH	R3, R3
LDR	R2, [SP, #12]
LDRH	R1, [SP, #20]
MULS	R1, R2, R1
CMP	R3, R1
IT	CC
BCC	L_DrawProgressBar122
;MikromediaGreenhouseProject_driver.c,2489 :: 		TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top, AProgressBar->Left + tmpRound  + tmpWidth * locPosition , AProgressBar->Top + AProgressBar->Height);
ADDW	R1, R0, #8
LDRH	R6, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R5, R6, R1
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
LDRH	R1, [SP, #22]
ADDS	R3, R4, R1
UXTH	R3, R3
LDR	R2, [SP, #12]
LDRH	R1, [SP, #20]
MULS	R1, R2, R1
ADDS	R3, R3, R1
SXTH	R2, R6
LDRH	R1, [SP, #18]
ADDS	R1, R4, R1
STR	R0, [SP, #4]
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
LDR	R0, [SP, #4]
IT	AL
BAL	L_DrawProgressBar123
L_DrawProgressBar122:
;MikromediaGreenhouseProject_driver.c,2491 :: 		TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top,  AProgressBar->Left + cnt + 3, AProgressBar->Top + AProgressBar->Height);
ADDW	R1, R0, #8
LDRH	R5, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R4, R5, R1
ADDS	R1, R0, #6
LDRH	R2, [R1, #0]
LDRH	R1, [SP, #18]
ADDS	R3, R2, R1
UXTH	R3, R3
ADDS	R2, R3, #3
SXTH	R1, R5
STR	R0, [SP, #4]
SXTH	R2, R2
SXTH	R0, R3
SXTH	R3, R4
BL	_TFT_Rectangle+0
LDR	R0, [SP, #4]
L_DrawProgressBar123:
;MikromediaGreenhouseProject_driver.c,2492 :: 		cnt = cnt + move_offset + 3;
LDRSH	R2, [SP, #16]
LDRH	R1, [SP, #18]
ADDS	R1, R1, R2
UXTH	R1, R1
ADDS	R1, R1, #3
STRH	R1, [SP, #18]
;MikromediaGreenhouseProject_driver.c,2493 :: 		}
IT	AL
BAL	L_DrawProgressBar120
L_DrawProgressBar121:
;MikromediaGreenhouseProject_driver.c,2494 :: 		}
IT	AL
BAL	L_DrawProgressBar119
; AProgressBar end address is: 0 (R0)
L__DrawProgressBar319:
;MikromediaGreenhouseProject_driver.c,2485 :: 		if (AProgressBar->Smooth == 0) {
MOV	R0, R7
;MikromediaGreenhouseProject_driver.c,2494 :: 		}
L_DrawProgressBar119:
;MikromediaGreenhouseProject_driver.c,2495 :: 		}
; AProgressBar start address is: 0 (R0)
; AProgressBar end address is: 0 (R0)
IT	AL
BAL	L_DrawProgressBar116
L__DrawProgressBar320:
;MikromediaGreenhouseProject_driver.c,2471 :: 		if (locPosition > 0) {
MOV	R0, R7
;MikromediaGreenhouseProject_driver.c,2495 :: 		}
L_DrawProgressBar116:
;MikromediaGreenhouseProject_driver.c,2497 :: 		Update_Percentage(AProgressBar, locPosition);
; AProgressBar start address is: 0 (R0)
STR	R0, [SP, #4]
LDR	R1, [SP, #12]
BL	_Update_Percentage+0
LDR	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2498 :: 		AProgressBar->Prev_Position = AProgressBar->Position;
ADDW	R2, R0, #46
ADDW	R1, R0, #44
; AProgressBar end address is: 0 (R0)
LDRH	R1, [R1, #0]
STRH	R1, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2499 :: 		}
L_DrawProgressBar107:
;MikromediaGreenhouseProject_driver.c,2500 :: 		}
L_end_DrawProgressBar:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _DrawProgressBar
_DrawScreen:
;MikromediaGreenhouseProject_driver.c,2502 :: 		void DrawScreen(TScreen *aScreen) {
; aScreen start address is: 0 (R0)
SUB	SP, SP, #60
STR	LR, [SP, #0]
; aScreen end address is: 0 (R0)
; aScreen start address is: 0 (R0)
;MikromediaGreenhouseProject_driver.c,2520 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;MikromediaGreenhouseProject_driver.c,2521 :: 		order = 0;
MOVS	R1, #0
STRH	R1, [SP, #8]
;MikromediaGreenhouseProject_driver.c,2522 :: 		button_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #10]
;MikromediaGreenhouseProject_driver.c,2523 :: 		round_button_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #16]
;MikromediaGreenhouseProject_driver.c,2524 :: 		label_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #24]
;MikromediaGreenhouseProject_driver.c,2525 :: 		image_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #32]
;MikromediaGreenhouseProject_driver.c,2526 :: 		circle_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #40]
;MikromediaGreenhouseProject_driver.c,2527 :: 		progress_bar_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #48]
;MikromediaGreenhouseProject_driver.c,2528 :: 		CurrentScreen = aScreen;
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
STR	R0, [R1, #0]
; aScreen end address is: 0 (R0)
;MikromediaGreenhouseProject_driver.c,2530 :: 		for (it = 255; it >= 0; it--)
; it start address is: 8 (R2)
MOVS	R2, #255
SXTH	R2, R2
; it end address is: 8 (R2)
SXTH	R0, R2
L_DrawScreen124:
; it start address is: 0 (R0)
CMP	R0, #0
IT	LT
BLT	L_DrawScreen125
;MikromediaGreenhouseProject_driver.c,2532 :: 		TFT_Set_DBC_SSD1963(it);
STRH	R0, [SP, #4]
UXTB	R0, R0
BL	_TFT_Set_DBC_SSD1963+0
LDRSH	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2533 :: 		Delay_1ms( );
BL	_Delay_1ms+0
;MikromediaGreenhouseProject_driver.c,2530 :: 		for (it = 255; it >= 0; it--)
SUBS	R1, R0, #1
; it end address is: 0 (R0)
; it start address is: 8 (R2)
SXTH	R2, R1
;MikromediaGreenhouseProject_driver.c,2534 :: 		}
SXTH	R0, R2
; it end address is: 8 (R2)
IT	AL
BAL	L_DrawScreen124
L_DrawScreen125:
;MikromediaGreenhouseProject_driver.c,2536 :: 		if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen323
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen322
IT	AL
BAL	L_DrawScreen129
L__DrawScreen323:
L__DrawScreen322:
;MikromediaGreenhouseProject_driver.c,2537 :: 		save_bled = TFT_BLED;
MOVW	R3, #lo_addr(GPIOF_ODR+0)
MOVT	R3, #hi_addr(GPIOF_ODR+0)
LDR	R2, [R3, #0]
UBFX	R1, R2, #10, #1
STRB	R1, [SP, #56]
;MikromediaGreenhouseProject_driver.c,2538 :: 		TFT_BLED           = 0;
LDR	R1, [R3, #0]
BFC	R1, #10, #1
STR	R1, [R3, #0]
;MikromediaGreenhouseProject_driver.c,2539 :: 		TFT_Set_Active(Set_Index, Write_Command, Write_Data);
MOVW	R3, #lo_addr(_Write_Data+0)
MOVT	R3, #hi_addr(_Write_Data+0)
MOVW	R2, #lo_addr(_Write_Command+0)
MOVT	R2, #hi_addr(_Write_Command+0)
MOVW	R1, #lo_addr(_Set_Index+0)
MOVT	R1, #hi_addr(_Set_Index+0)
MOV	R0, R1
MOV	R1, R2
MOV	R2, R3
BL	_TFT_Set_Active+0
;MikromediaGreenhouseProject_driver.c,2540 :: 		TFT_Init_SSD1963(CurrentScreen->Width, CurrentScreen->Height);
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_TFT_Init_SSD1963+0
;MikromediaGreenhouseProject_driver.c,2541 :: 		STMPE610_SetSize(CurrentScreen->Width, CurrentScreen->Height);
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_STMPE610_SetSize+0
;MikromediaGreenhouseProject_driver.c,2542 :: 		TFT_Set_Ext_Buffer(TFT_Get_Data);
MOVW	R1, #lo_addr(_TFT_Get_Data+0)
MOVT	R1, #hi_addr(_TFT_Get_Data+0)
MOV	R0, R1
BL	_TFT_Set_Ext_Buffer+0
;MikromediaGreenhouseProject_driver.c,2543 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
;MikromediaGreenhouseProject_driver.c,2544 :: 		TFT_Set_DBC_SSD1963(255);
MOVS	R0, #255
BL	_TFT_Set_DBC_SSD1963+0
;MikromediaGreenhouseProject_driver.c,2545 :: 		display_width = CurrentScreen->Width;
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #2
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
STRH	R2, [R1, #0]
;MikromediaGreenhouseProject_driver.c,2546 :: 		display_height = CurrentScreen->Height;
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
STRH	R2, [R1, #0]
;MikromediaGreenhouseProject_driver.c,2547 :: 		TFT_BLED           = save_bled;
LDRB	R3, [SP, #56]
MOVW	R2, #lo_addr(GPIOF_ODR+0)
MOVT	R2, #hi_addr(GPIOF_ODR+0)
LDR	R1, [R2, #0]
BFI	R1, R3, #10, #1
STR	R1, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2548 :: 		}
IT	AL
BAL	L_DrawScreen130
L_DrawScreen129:
;MikromediaGreenhouseProject_driver.c,2550 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
L_DrawScreen130:
;MikromediaGreenhouseProject_driver.c,2553 :: 		while (order < CurrentScreen->ObjectsCount) {
L_DrawScreen131:
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #6
LDRH	R2, [R1, #0]
LDRH	R1, [SP, #8]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen132
;MikromediaGreenhouseProject_driver.c,2554 :: 		if (button_idx < CurrentScreen->ButtonsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #8
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #10]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen133
;MikromediaGreenhouseProject_driver.c,2555 :: 		local_button = GetButton(button_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #12
LDR	R2, [R1, #0]
LDRB	R1, [SP, #10]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #12]
;MikromediaGreenhouseProject_driver.c,2556 :: 		if (order == local_button->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #8]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen134
;MikromediaGreenhouseProject_driver.c,2557 :: 		button_idx++;
LDRB	R1, [SP, #10]
ADDS	R1, R1, #1
STRB	R1, [SP, #10]
;MikromediaGreenhouseProject_driver.c,2558 :: 		order++;
LDRH	R1, [SP, #8]
ADDS	R1, R1, #1
STRH	R1, [SP, #8]
;MikromediaGreenhouseProject_driver.c,2559 :: 		DrawButton(local_button);
LDR	R0, [SP, #12]
BL	_DrawButton+0
;MikromediaGreenhouseProject_driver.c,2560 :: 		}
L_DrawScreen134:
;MikromediaGreenhouseProject_driver.c,2561 :: 		}
L_DrawScreen133:
;MikromediaGreenhouseProject_driver.c,2563 :: 		if (round_button_idx < CurrentScreen->Buttons_RoundCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #16
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #16]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen135
;MikromediaGreenhouseProject_driver.c,2564 :: 		local_round_button = GetRoundButton(round_button_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #20
LDR	R2, [R1, #0]
LDRB	R1, [SP, #16]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #20]
;MikromediaGreenhouseProject_driver.c,2565 :: 		if (order == local_round_button->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #8]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen136
;MikromediaGreenhouseProject_driver.c,2566 :: 		round_button_idx++;
LDRB	R1, [SP, #16]
ADDS	R1, R1, #1
STRB	R1, [SP, #16]
;MikromediaGreenhouseProject_driver.c,2567 :: 		order++;
LDRH	R1, [SP, #8]
ADDS	R1, R1, #1
STRH	R1, [SP, #8]
;MikromediaGreenhouseProject_driver.c,2568 :: 		DrawRoundButton(local_round_button);
LDR	R0, [SP, #20]
BL	_DrawRoundButton+0
;MikromediaGreenhouseProject_driver.c,2569 :: 		}
L_DrawScreen136:
;MikromediaGreenhouseProject_driver.c,2570 :: 		}
L_DrawScreen135:
;MikromediaGreenhouseProject_driver.c,2572 :: 		if (label_idx < CurrentScreen->LabelsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #24
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #24]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen137
;MikromediaGreenhouseProject_driver.c,2573 :: 		local_label = GetLabel(label_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #28
LDR	R2, [R1, #0]
LDRB	R1, [SP, #24]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #28]
;MikromediaGreenhouseProject_driver.c,2574 :: 		if (order == local_label->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #8]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen138
;MikromediaGreenhouseProject_driver.c,2575 :: 		label_idx++;
LDRB	R1, [SP, #24]
ADDS	R1, R1, #1
STRB	R1, [SP, #24]
;MikromediaGreenhouseProject_driver.c,2576 :: 		order++;
LDRH	R1, [SP, #8]
ADDS	R1, R1, #1
STRH	R1, [SP, #8]
;MikromediaGreenhouseProject_driver.c,2577 :: 		DrawLabel(local_label);
LDR	R0, [SP, #28]
BL	_DrawLabel+0
;MikromediaGreenhouseProject_driver.c,2578 :: 		}
L_DrawScreen138:
;MikromediaGreenhouseProject_driver.c,2579 :: 		}
L_DrawScreen137:
;MikromediaGreenhouseProject_driver.c,2581 :: 		if (circle_idx < CurrentScreen->CirclesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #40
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #40]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen139
;MikromediaGreenhouseProject_driver.c,2582 :: 		local_circle = GetCircle(circle_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #44
LDR	R2, [R1, #0]
LDRB	R1, [SP, #40]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #44]
;MikromediaGreenhouseProject_driver.c,2583 :: 		if (order == local_circle->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #8]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen140
;MikromediaGreenhouseProject_driver.c,2584 :: 		circle_idx++;
LDRB	R1, [SP, #40]
ADDS	R1, R1, #1
STRB	R1, [SP, #40]
;MikromediaGreenhouseProject_driver.c,2585 :: 		order++;
LDRH	R1, [SP, #8]
ADDS	R1, R1, #1
STRH	R1, [SP, #8]
;MikromediaGreenhouseProject_driver.c,2586 :: 		DrawCircle(local_circle);
LDR	R0, [SP, #44]
BL	_DrawCircle+0
;MikromediaGreenhouseProject_driver.c,2587 :: 		}
L_DrawScreen140:
;MikromediaGreenhouseProject_driver.c,2588 :: 		}
L_DrawScreen139:
;MikromediaGreenhouseProject_driver.c,2590 :: 		if (image_idx < CurrentScreen->ImagesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #32
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #32]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen141
;MikromediaGreenhouseProject_driver.c,2591 :: 		local_image = GetImage(image_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #36
LDR	R2, [R1, #0]
LDRB	R1, [SP, #32]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #36]
;MikromediaGreenhouseProject_driver.c,2592 :: 		if (order == local_image->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #8]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen142
;MikromediaGreenhouseProject_driver.c,2593 :: 		image_idx++;
LDRB	R1, [SP, #32]
ADDS	R1, R1, #1
STRB	R1, [SP, #32]
;MikromediaGreenhouseProject_driver.c,2594 :: 		order++;
LDRH	R1, [SP, #8]
ADDS	R1, R1, #1
STRH	R1, [SP, #8]
;MikromediaGreenhouseProject_driver.c,2595 :: 		DrawImage(local_image);
LDR	R0, [SP, #36]
BL	_DrawImage+0
;MikromediaGreenhouseProject_driver.c,2596 :: 		}
L_DrawScreen142:
;MikromediaGreenhouseProject_driver.c,2597 :: 		}
L_DrawScreen141:
;MikromediaGreenhouseProject_driver.c,2599 :: 		if (progress_bar_idx < CurrentScreen->ProgressBarsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #48
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #48]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen143
;MikromediaGreenhouseProject_driver.c,2600 :: 		local_progress_bar = GetProgressBar(progress_bar_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #52
LDR	R2, [R1, #0]
LDRB	R1, [SP, #48]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #52]
;MikromediaGreenhouseProject_driver.c,2601 :: 		if (order == local_progress_bar->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #8]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen144
;MikromediaGreenhouseProject_driver.c,2602 :: 		progress_bar_idx++;
LDRB	R1, [SP, #48]
ADDS	R1, R1, #1
STRB	R1, [SP, #48]
;MikromediaGreenhouseProject_driver.c,2603 :: 		order++;
LDRH	R1, [SP, #8]
ADDS	R1, R1, #1
STRH	R1, [SP, #8]
;MikromediaGreenhouseProject_driver.c,2604 :: 		DrawProgressBar(local_progress_bar);
LDR	R0, [SP, #52]
BL	_DrawProgressBar+0
;MikromediaGreenhouseProject_driver.c,2605 :: 		}
L_DrawScreen144:
;MikromediaGreenhouseProject_driver.c,2606 :: 		}
L_DrawScreen143:
;MikromediaGreenhouseProject_driver.c,2607 :: 		}
IT	AL
BAL	L_DrawScreen131
L_DrawScreen132:
;MikromediaGreenhouseProject_driver.c,2609 :: 		for (it = 0; it <= 255; it++)
; it start address is: 0 (R0)
MOVS	R0, #0
SXTH	R0, R0
; it end address is: 0 (R0)
L_DrawScreen145:
; it start address is: 0 (R0)
CMP	R0, #255
IT	GT
BGT	L_DrawScreen146
;MikromediaGreenhouseProject_driver.c,2611 :: 		TFT_Set_DBC_SSD1963(it);
STRH	R0, [SP, #4]
UXTB	R0, R0
BL	_TFT_Set_DBC_SSD1963+0
LDRSH	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2612 :: 		Delay_1ms( );
BL	_Delay_1ms+0
;MikromediaGreenhouseProject_driver.c,2609 :: 		for (it = 0; it <= 255; it++)
ADDS	R1, R0, #1
; it end address is: 0 (R0)
; it start address is: 4 (R1)
;MikromediaGreenhouseProject_driver.c,2613 :: 		}
SXTH	R0, R1
; it end address is: 4 (R1)
IT	AL
BAL	L_DrawScreen145
L_DrawScreen146:
;MikromediaGreenhouseProject_driver.c,2614 :: 		}
L_end_DrawScreen:
LDR	LR, [SP, #0]
ADD	SP, SP, #60
BX	LR
; end of _DrawScreen
_Get_Object:
;MikromediaGreenhouseProject_driver.c,2616 :: 		void Get_Object(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;MikromediaGreenhouseProject_driver.c,2617 :: 		button_order        = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
STRH	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2618 :: 		round_button_order  = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
STRH	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2619 :: 		label_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2620 :: 		image_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
STRH	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2621 :: 		circle_order        = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
STRH	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2623 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ButtonsCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 0 (R0)
; Y end address is: 4 (R1)
UXTH	R8, R0
UXTH	R7, R1
L_Get_Object148:
; Y start address is: 28 (R7)
; X start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object149
;MikromediaGreenhouseProject_driver.c,2624 :: 		local_button = GetButton(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #12
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_button+0)
MOVT	R2, #hi_addr(_local_button+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2625 :: 		if (local_button->Active != 0) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object151
;MikromediaGreenhouseProject_driver.c,2627 :: 		local_button->Width, local_button->Height) == 1) {
MOVW	R6, #lo_addr(_local_button+0)
MOVT	R6, #hi_addr(_local_button+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;MikromediaGreenhouseProject_driver.c,2626 :: 		if (IsInsideObject(X, Y, local_button->Left, local_button->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;MikromediaGreenhouseProject_driver.c,2627 :: 		local_button->Width, local_button->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	MikromediaGreenhouseProject_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object152
;MikromediaGreenhouseProject_driver.c,2628 :: 		button_order = local_button->Order;
MOVW	R4, #lo_addr(_local_button+0)
MOVT	R4, #hi_addr(_local_button+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
STRH	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2629 :: 		exec_button = local_button;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2630 :: 		}
L_Get_Object152:
;MikromediaGreenhouseProject_driver.c,2631 :: 		}
L_Get_Object151:
;MikromediaGreenhouseProject_driver.c,2623 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ButtonsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;MikromediaGreenhouseProject_driver.c,2632 :: 		}
IT	AL
BAL	L_Get_Object148
L_Get_Object149:
;MikromediaGreenhouseProject_driver.c,2635 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object153:
; X start address is: 28 (R7)
; Y start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #16
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object154
;MikromediaGreenhouseProject_driver.c,2636 :: 		local_round_button = GetRoundButton(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #20
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_round_button+0)
MOVT	R2, #hi_addr(_local_round_button+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2637 :: 		if (local_round_button->Active != 0) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object156
;MikromediaGreenhouseProject_driver.c,2639 :: 		local_round_button->Width, local_round_button->Height) == 1) {
MOVW	R6, #lo_addr(_local_round_button+0)
MOVT	R6, #hi_addr(_local_round_button+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;MikromediaGreenhouseProject_driver.c,2638 :: 		if (IsInsideObject(X, Y, local_round_button->Left, local_round_button->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R8
UXTH	R0, R7
;MikromediaGreenhouseProject_driver.c,2639 :: 		local_round_button->Width, local_round_button->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	MikromediaGreenhouseProject_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object157
;MikromediaGreenhouseProject_driver.c,2640 :: 		round_button_order = local_round_button->Order;
MOVW	R4, #lo_addr(_local_round_button+0)
MOVT	R4, #hi_addr(_local_round_button+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
STRH	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2641 :: 		exec_round_button = local_round_button;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2642 :: 		}
L_Get_Object157:
;MikromediaGreenhouseProject_driver.c,2643 :: 		}
L_Get_Object156:
;MikromediaGreenhouseProject_driver.c,2635 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;MikromediaGreenhouseProject_driver.c,2644 :: 		}
IT	AL
BAL	L_Get_Object153
L_Get_Object154:
;MikromediaGreenhouseProject_driver.c,2647 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object158:
; Y start address is: 28 (R7)
; X start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #24
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object159
;MikromediaGreenhouseProject_driver.c,2648 :: 		local_label = GetLabel(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_label+0)
MOVT	R2, #hi_addr(_local_label+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2649 :: 		if (local_label->Active != 0) {
ADDW	R2, R3, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object161
;MikromediaGreenhouseProject_driver.c,2651 :: 		local_label->Width, local_label->Height) == 1) {
MOVW	R6, #lo_addr(_local_label+0)
MOVT	R6, #hi_addr(_local_label+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;MikromediaGreenhouseProject_driver.c,2650 :: 		if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;MikromediaGreenhouseProject_driver.c,2651 :: 		local_label->Width, local_label->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	MikromediaGreenhouseProject_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object162
;MikromediaGreenhouseProject_driver.c,2652 :: 		label_order = local_label->Order;
MOVW	R4, #lo_addr(_local_label+0)
MOVT	R4, #hi_addr(_local_label+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2653 :: 		exec_label = local_label;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2654 :: 		}
L_Get_Object162:
;MikromediaGreenhouseProject_driver.c,2655 :: 		}
L_Get_Object161:
;MikromediaGreenhouseProject_driver.c,2647 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;MikromediaGreenhouseProject_driver.c,2656 :: 		}
IT	AL
BAL	L_Get_Object158
L_Get_Object159:
;MikromediaGreenhouseProject_driver.c,2659 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object163:
; X start address is: 28 (R7)
; Y start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #32
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object164
;MikromediaGreenhouseProject_driver.c,2660 :: 		local_image = GetImage(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #36
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_image+0)
MOVT	R2, #hi_addr(_local_image+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2661 :: 		if (local_image->Active != 0) {
ADDW	R2, R3, #21
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object166
;MikromediaGreenhouseProject_driver.c,2663 :: 		local_image->Width, local_image->Height) == 1) {
MOVW	R6, #lo_addr(_local_image+0)
MOVT	R6, #hi_addr(_local_image+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;MikromediaGreenhouseProject_driver.c,2662 :: 		if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R8
UXTH	R0, R7
;MikromediaGreenhouseProject_driver.c,2663 :: 		local_image->Width, local_image->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	MikromediaGreenhouseProject_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object167
;MikromediaGreenhouseProject_driver.c,2664 :: 		image_order = local_image->Order;
MOVW	R4, #lo_addr(_local_image+0)
MOVT	R4, #hi_addr(_local_image+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
STRH	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2665 :: 		exec_image = local_image;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2666 :: 		}
L_Get_Object167:
;MikromediaGreenhouseProject_driver.c,2667 :: 		}
L_Get_Object166:
;MikromediaGreenhouseProject_driver.c,2659 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;MikromediaGreenhouseProject_driver.c,2668 :: 		}
IT	AL
BAL	L_Get_Object163
L_Get_Object164:
;MikromediaGreenhouseProject_driver.c,2671 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CirclesCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object168:
; X start address is: 32 (R8)
; Y start address is: 28 (R7)
; Y start address is: 28 (R7)
; Y end address is: 28 (R7)
; X start address is: 32 (R8)
; X end address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #40
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object169
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
;MikromediaGreenhouseProject_driver.c,2672 :: 		local_circle = GetCircle(_object_count);
; X start address is: 32 (R8)
; Y start address is: 28 (R7)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #44
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_circle+0)
MOVT	R2, #hi_addr(_local_circle+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2673 :: 		if (local_circle->Active != 0) {
ADDW	R2, R3, #17
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object171
;MikromediaGreenhouseProject_driver.c,2675 :: 		(local_circle->Radius * 2), (local_circle->Radius * 2)) == 1) {
MOVW	R5, #lo_addr(_local_circle+0)
MOVT	R5, #hi_addr(_local_circle+0)
LDR	R2, [R5, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
LSLS	R4, R2, #1
UXTH	R4, R4
;MikromediaGreenhouseProject_driver.c,2674 :: 		if (IsInsideObject(X, Y, local_circle->Left, local_circle->Top,
MOV	R2, R5
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R5
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;MikromediaGreenhouseProject_driver.c,2675 :: 		(local_circle->Radius * 2), (local_circle->Radius * 2)) == 1) {
PUSH	(R4)
PUSH	(R4)
BL	MikromediaGreenhouseProject_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object172
;MikromediaGreenhouseProject_driver.c,2676 :: 		circle_order = local_circle->Order;
MOVW	R4, #lo_addr(_local_circle+0)
MOVT	R4, #hi_addr(_local_circle+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
STRH	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2677 :: 		exec_circle = local_circle;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2678 :: 		}
L_Get_Object172:
;MikromediaGreenhouseProject_driver.c,2679 :: 		}
L_Get_Object171:
;MikromediaGreenhouseProject_driver.c,2671 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CirclesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;MikromediaGreenhouseProject_driver.c,2680 :: 		}
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
IT	AL
BAL	L_Get_Object168
L_Get_Object169:
;MikromediaGreenhouseProject_driver.c,2682 :: 		_object_count = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2683 :: 		if (button_order >  _object_count )
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	LE
BLE	L_Get_Object173
;MikromediaGreenhouseProject_driver.c,2684 :: 		_object_count = button_order;
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object173:
;MikromediaGreenhouseProject_driver.c,2685 :: 		if (round_button_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object174
;MikromediaGreenhouseProject_driver.c,2686 :: 		_object_count = round_button_order;
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object174:
;MikromediaGreenhouseProject_driver.c,2687 :: 		if (label_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object175
;MikromediaGreenhouseProject_driver.c,2688 :: 		_object_count = label_order;
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object175:
;MikromediaGreenhouseProject_driver.c,2689 :: 		if (image_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object176
;MikromediaGreenhouseProject_driver.c,2690 :: 		_object_count = image_order;
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object176:
;MikromediaGreenhouseProject_driver.c,2691 :: 		if (circle_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object177
;MikromediaGreenhouseProject_driver.c,2692 :: 		_object_count = circle_order;
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object177:
;MikromediaGreenhouseProject_driver.c,2693 :: 		}
L_end_Get_Object:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Get_Object
_Process_TP_Press:
;MikromediaGreenhouseProject_driver.c,2696 :: 		void Process_TP_Press(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;MikromediaGreenhouseProject_driver.c,2697 :: 		exec_button         = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2698 :: 		exec_round_button   = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2699 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2700 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2701 :: 		exec_circle         = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2703 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;MikromediaGreenhouseProject_driver.c,2705 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Press178
;MikromediaGreenhouseProject_driver.c,2706 :: 		if (_object_count == button_order) {
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press179
;MikromediaGreenhouseProject_driver.c,2707 :: 		if (exec_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press180
;MikromediaGreenhouseProject_driver.c,2708 :: 		if (exec_button->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press181
;MikromediaGreenhouseProject_driver.c,2709 :: 		exec_button->OnPressPtr();
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R2, [R4, #0]
BLX	R2
;MikromediaGreenhouseProject_driver.c,2710 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;MikromediaGreenhouseProject_driver.c,2711 :: 		}
L_Process_TP_Press181:
;MikromediaGreenhouseProject_driver.c,2712 :: 		}
L_Process_TP_Press180:
;MikromediaGreenhouseProject_driver.c,2713 :: 		}
L_Process_TP_Press179:
;MikromediaGreenhouseProject_driver.c,2715 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press182
;MikromediaGreenhouseProject_driver.c,2716 :: 		if (exec_round_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press183
;MikromediaGreenhouseProject_driver.c,2717 :: 		if (exec_round_button->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press184
;MikromediaGreenhouseProject_driver.c,2718 :: 		exec_round_button->OnPressPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R2, [R4, #0]
BLX	R2
;MikromediaGreenhouseProject_driver.c,2719 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;MikromediaGreenhouseProject_driver.c,2720 :: 		}
L_Process_TP_Press184:
;MikromediaGreenhouseProject_driver.c,2721 :: 		}
L_Process_TP_Press183:
;MikromediaGreenhouseProject_driver.c,2722 :: 		}
L_Process_TP_Press182:
;MikromediaGreenhouseProject_driver.c,2724 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press185
;MikromediaGreenhouseProject_driver.c,2725 :: 		if (exec_label->Active != 0) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press186
;MikromediaGreenhouseProject_driver.c,2726 :: 		if (exec_label->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press187
;MikromediaGreenhouseProject_driver.c,2727 :: 		exec_label->OnPressPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
;MikromediaGreenhouseProject_driver.c,2728 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;MikromediaGreenhouseProject_driver.c,2729 :: 		}
L_Process_TP_Press187:
;MikromediaGreenhouseProject_driver.c,2730 :: 		}
L_Process_TP_Press186:
;MikromediaGreenhouseProject_driver.c,2731 :: 		}
L_Process_TP_Press185:
;MikromediaGreenhouseProject_driver.c,2733 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press188
;MikromediaGreenhouseProject_driver.c,2734 :: 		if (exec_image->Active != 0) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press189
;MikromediaGreenhouseProject_driver.c,2735 :: 		if (exec_image->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press190
;MikromediaGreenhouseProject_driver.c,2736 :: 		exec_image->OnPressPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;MikromediaGreenhouseProject_driver.c,2737 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;MikromediaGreenhouseProject_driver.c,2738 :: 		}
L_Process_TP_Press190:
;MikromediaGreenhouseProject_driver.c,2739 :: 		}
L_Process_TP_Press189:
;MikromediaGreenhouseProject_driver.c,2740 :: 		}
L_Process_TP_Press188:
;MikromediaGreenhouseProject_driver.c,2742 :: 		if (_object_count == circle_order) {
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press191
;MikromediaGreenhouseProject_driver.c,2743 :: 		if (exec_circle->Active != 0) {
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
ADDS	R2, #17
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press192
;MikromediaGreenhouseProject_driver.c,2744 :: 		if (exec_circle->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press193
;MikromediaGreenhouseProject_driver.c,2745 :: 		exec_circle->OnPressPtr();
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
;MikromediaGreenhouseProject_driver.c,2746 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;MikromediaGreenhouseProject_driver.c,2747 :: 		}
L_Process_TP_Press193:
;MikromediaGreenhouseProject_driver.c,2748 :: 		}
L_Process_TP_Press192:
;MikromediaGreenhouseProject_driver.c,2749 :: 		}
L_Process_TP_Press191:
;MikromediaGreenhouseProject_driver.c,2751 :: 		}
L_Process_TP_Press178:
;MikromediaGreenhouseProject_driver.c,2752 :: 		}
L_end_Process_TP_Press:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Process_TP_Press
_Process_TP_Up:
;MikromediaGreenhouseProject_driver.c,2754 :: 		void Process_TP_Up(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;MikromediaGreenhouseProject_driver.c,2756 :: 		switch (PressedObjectType) {
IT	AL
BAL	L_Process_TP_Up194
;MikromediaGreenhouseProject_driver.c,2758 :: 		case 0: {
L_Process_TP_Up196:
;MikromediaGreenhouseProject_driver.c,2759 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up197
;MikromediaGreenhouseProject_driver.c,2760 :: 		exec_button = (TButton*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2761 :: 		if ((exec_button->PressColEnabled != 0) && (exec_button->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #48
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L__Process_TP_Up328
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up327
L__Process_TP_Up326:
;MikromediaGreenhouseProject_driver.c,2762 :: 		DrawButton(exec_button);
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawButton+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2761 :: 		if ((exec_button->PressColEnabled != 0) && (exec_button->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up328:
L__Process_TP_Up327:
;MikromediaGreenhouseProject_driver.c,2764 :: 		break;
IT	AL
BAL	L_Process_TP_Up195
;MikromediaGreenhouseProject_driver.c,2765 :: 		}
L_Process_TP_Up197:
;MikromediaGreenhouseProject_driver.c,2766 :: 		break;
IT	AL
BAL	L_Process_TP_Up195
;MikromediaGreenhouseProject_driver.c,2769 :: 		case 1: {
L_Process_TP_Up201:
;MikromediaGreenhouseProject_driver.c,2770 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up202
;MikromediaGreenhouseProject_driver.c,2771 :: 		exec_round_button = (TButton_Round*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2772 :: 		if ((exec_round_button->PressColEnabled != 0) && (exec_round_button->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #49
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L__Process_TP_Up330
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up329
L__Process_TP_Up325:
;MikromediaGreenhouseProject_driver.c,2773 :: 		DrawRoundButton(exec_round_button);
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawRoundButton+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2772 :: 		if ((exec_round_button->PressColEnabled != 0) && (exec_round_button->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up330:
L__Process_TP_Up329:
;MikromediaGreenhouseProject_driver.c,2775 :: 		break;
IT	AL
BAL	L_Process_TP_Up195
;MikromediaGreenhouseProject_driver.c,2776 :: 		}
L_Process_TP_Up202:
;MikromediaGreenhouseProject_driver.c,2777 :: 		break;
IT	AL
BAL	L_Process_TP_Up195
;MikromediaGreenhouseProject_driver.c,2780 :: 		case 4: {
L_Process_TP_Up206:
;MikromediaGreenhouseProject_driver.c,2781 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up207
;MikromediaGreenhouseProject_driver.c,2782 :: 		exec_circle = (TCircle*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2783 :: 		if ((exec_circle->PressColEnabled != 0) && (exec_circle->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L__Process_TP_Up332
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up331
L__Process_TP_Up324:
;MikromediaGreenhouseProject_driver.c,2784 :: 		DrawCircle(exec_circle);
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawCircle+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;MikromediaGreenhouseProject_driver.c,2783 :: 		if ((exec_circle->PressColEnabled != 0) && (exec_circle->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up332:
L__Process_TP_Up331:
;MikromediaGreenhouseProject_driver.c,2786 :: 		break;
IT	AL
BAL	L_Process_TP_Up195
;MikromediaGreenhouseProject_driver.c,2787 :: 		}
L_Process_TP_Up207:
;MikromediaGreenhouseProject_driver.c,2788 :: 		break;
IT	AL
BAL	L_Process_TP_Up195
;MikromediaGreenhouseProject_driver.c,2790 :: 		}
L_Process_TP_Up194:
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up196
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #1
IT	EQ
BEQ	L_Process_TP_Up201
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #4
IT	EQ
BEQ	L_Process_TP_Up206
L_Process_TP_Up195:
;MikromediaGreenhouseProject_driver.c,2792 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2793 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2795 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;MikromediaGreenhouseProject_driver.c,2798 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Up211
;MikromediaGreenhouseProject_driver.c,2800 :: 		if (_object_count == button_order) {
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up212
;MikromediaGreenhouseProject_driver.c,2801 :: 		if (exec_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up213
;MikromediaGreenhouseProject_driver.c,2802 :: 		if (exec_button->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up214
;MikromediaGreenhouseProject_driver.c,2803 :: 		exec_button->OnUpPtr();
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up214:
;MikromediaGreenhouseProject_driver.c,2804 :: 		if (PressedObject == (void *)exec_button)
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up215
;MikromediaGreenhouseProject_driver.c,2805 :: 		if (exec_button->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up216
;MikromediaGreenhouseProject_driver.c,2806 :: 		exec_button->OnClickPtr();
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up216:
L_Process_TP_Up215:
;MikromediaGreenhouseProject_driver.c,2807 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2808 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2809 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;MikromediaGreenhouseProject_driver.c,2810 :: 		}
L_Process_TP_Up213:
;MikromediaGreenhouseProject_driver.c,2811 :: 		}
L_Process_TP_Up212:
;MikromediaGreenhouseProject_driver.c,2814 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up217
;MikromediaGreenhouseProject_driver.c,2815 :: 		if (exec_round_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up218
;MikromediaGreenhouseProject_driver.c,2816 :: 		if (exec_round_button->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up219
;MikromediaGreenhouseProject_driver.c,2817 :: 		exec_round_button->OnUpPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up219:
;MikromediaGreenhouseProject_driver.c,2818 :: 		if (PressedObject == (void *)exec_round_button)
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up220
;MikromediaGreenhouseProject_driver.c,2819 :: 		if (exec_round_button->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up221
;MikromediaGreenhouseProject_driver.c,2820 :: 		exec_round_button->OnClickPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up221:
L_Process_TP_Up220:
;MikromediaGreenhouseProject_driver.c,2821 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2822 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2823 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;MikromediaGreenhouseProject_driver.c,2824 :: 		}
L_Process_TP_Up218:
;MikromediaGreenhouseProject_driver.c,2825 :: 		}
L_Process_TP_Up217:
;MikromediaGreenhouseProject_driver.c,2828 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up222
;MikromediaGreenhouseProject_driver.c,2829 :: 		if (exec_label->Active != 0) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up223
;MikromediaGreenhouseProject_driver.c,2830 :: 		if (exec_label->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up224
;MikromediaGreenhouseProject_driver.c,2831 :: 		exec_label->OnUpPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up224:
;MikromediaGreenhouseProject_driver.c,2832 :: 		if (PressedObject == (void *)exec_label)
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up225
;MikromediaGreenhouseProject_driver.c,2833 :: 		if (exec_label->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up226
;MikromediaGreenhouseProject_driver.c,2834 :: 		exec_label->OnClickPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up226:
L_Process_TP_Up225:
;MikromediaGreenhouseProject_driver.c,2835 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2836 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2837 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;MikromediaGreenhouseProject_driver.c,2838 :: 		}
L_Process_TP_Up223:
;MikromediaGreenhouseProject_driver.c,2839 :: 		}
L_Process_TP_Up222:
;MikromediaGreenhouseProject_driver.c,2842 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up227
;MikromediaGreenhouseProject_driver.c,2843 :: 		if (exec_image->Active != 0) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up228
;MikromediaGreenhouseProject_driver.c,2844 :: 		if (exec_image->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up229
;MikromediaGreenhouseProject_driver.c,2845 :: 		exec_image->OnUpPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up229:
;MikromediaGreenhouseProject_driver.c,2846 :: 		if (PressedObject == (void *)exec_image)
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up230
;MikromediaGreenhouseProject_driver.c,2847 :: 		if (exec_image->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up231
;MikromediaGreenhouseProject_driver.c,2848 :: 		exec_image->OnClickPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up231:
L_Process_TP_Up230:
;MikromediaGreenhouseProject_driver.c,2849 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2850 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2851 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;MikromediaGreenhouseProject_driver.c,2852 :: 		}
L_Process_TP_Up228:
;MikromediaGreenhouseProject_driver.c,2853 :: 		}
L_Process_TP_Up227:
;MikromediaGreenhouseProject_driver.c,2856 :: 		if (_object_count == circle_order) {
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up232
;MikromediaGreenhouseProject_driver.c,2857 :: 		if (exec_circle->Active != 0) {
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
ADDS	R2, #17
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up233
;MikromediaGreenhouseProject_driver.c,2858 :: 		if (exec_circle->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up234
;MikromediaGreenhouseProject_driver.c,2859 :: 		exec_circle->OnUpPtr();
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up234:
;MikromediaGreenhouseProject_driver.c,2860 :: 		if (PressedObject == (void *)exec_circle)
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up235
;MikromediaGreenhouseProject_driver.c,2861 :: 		if (exec_circle->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up236
;MikromediaGreenhouseProject_driver.c,2862 :: 		exec_circle->OnClickPtr();
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up236:
L_Process_TP_Up235:
;MikromediaGreenhouseProject_driver.c,2863 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2864 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2865 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;MikromediaGreenhouseProject_driver.c,2866 :: 		}
L_Process_TP_Up233:
;MikromediaGreenhouseProject_driver.c,2867 :: 		}
L_Process_TP_Up232:
;MikromediaGreenhouseProject_driver.c,2869 :: 		}
L_Process_TP_Up211:
;MikromediaGreenhouseProject_driver.c,2870 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2871 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2872 :: 		}
L_end_Process_TP_Up:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Process_TP_Up
_Process_TP_Down:
;MikromediaGreenhouseProject_driver.c,2874 :: 		void Process_TP_Down(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;MikromediaGreenhouseProject_driver.c,2876 :: 		object_pressed      = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2877 :: 		exec_button         = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2878 :: 		exec_round_button   = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2879 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2880 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2881 :: 		exec_circle         = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2883 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;MikromediaGreenhouseProject_driver.c,2885 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Down237
;MikromediaGreenhouseProject_driver.c,2886 :: 		if (_object_count == button_order) {
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down238
;MikromediaGreenhouseProject_driver.c,2887 :: 		if (exec_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down239
;MikromediaGreenhouseProject_driver.c,2888 :: 		if (exec_button->PressColEnabled != 0) {
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #48
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down240
;MikromediaGreenhouseProject_driver.c,2889 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2890 :: 		DrawButton(exec_button);
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawButton+0
;MikromediaGreenhouseProject_driver.c,2891 :: 		}
L_Process_TP_Down240:
;MikromediaGreenhouseProject_driver.c,2892 :: 		PressedObject = (void *)exec_button;
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2893 :: 		PressedObjectType = 0;
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2894 :: 		if (exec_button->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down241
;MikromediaGreenhouseProject_driver.c,2895 :: 		exec_button->OnDownPtr();
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R2, [R4, #0]
BLX	R2
;MikromediaGreenhouseProject_driver.c,2896 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;MikromediaGreenhouseProject_driver.c,2897 :: 		}
L_Process_TP_Down241:
;MikromediaGreenhouseProject_driver.c,2898 :: 		}
L_Process_TP_Down239:
;MikromediaGreenhouseProject_driver.c,2899 :: 		}
L_Process_TP_Down238:
;MikromediaGreenhouseProject_driver.c,2901 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down242
;MikromediaGreenhouseProject_driver.c,2902 :: 		if (exec_round_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down243
;MikromediaGreenhouseProject_driver.c,2903 :: 		if (exec_round_button->PressColEnabled != 0) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #49
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down244
;MikromediaGreenhouseProject_driver.c,2904 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2905 :: 		DrawRoundButton(exec_round_button);
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawRoundButton+0
;MikromediaGreenhouseProject_driver.c,2906 :: 		}
L_Process_TP_Down244:
;MikromediaGreenhouseProject_driver.c,2907 :: 		PressedObject = (void *)exec_round_button;
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2908 :: 		PressedObjectType = 1;
MOVS	R3, #1
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2909 :: 		if (exec_round_button->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down245
;MikromediaGreenhouseProject_driver.c,2910 :: 		exec_round_button->OnDownPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R2, [R4, #0]
BLX	R2
;MikromediaGreenhouseProject_driver.c,2911 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;MikromediaGreenhouseProject_driver.c,2912 :: 		}
L_Process_TP_Down245:
;MikromediaGreenhouseProject_driver.c,2913 :: 		}
L_Process_TP_Down243:
;MikromediaGreenhouseProject_driver.c,2914 :: 		}
L_Process_TP_Down242:
;MikromediaGreenhouseProject_driver.c,2916 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down246
;MikromediaGreenhouseProject_driver.c,2917 :: 		if (exec_label->Active != 0) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down247
;MikromediaGreenhouseProject_driver.c,2918 :: 		PressedObject = (void *)exec_label;
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2919 :: 		PressedObjectType = 2;
MOVS	R3, #2
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2920 :: 		if (exec_label->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down248
;MikromediaGreenhouseProject_driver.c,2921 :: 		exec_label->OnDownPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;MikromediaGreenhouseProject_driver.c,2922 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;MikromediaGreenhouseProject_driver.c,2923 :: 		}
L_Process_TP_Down248:
;MikromediaGreenhouseProject_driver.c,2924 :: 		}
L_Process_TP_Down247:
;MikromediaGreenhouseProject_driver.c,2925 :: 		}
L_Process_TP_Down246:
;MikromediaGreenhouseProject_driver.c,2927 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down249
;MikromediaGreenhouseProject_driver.c,2928 :: 		if (exec_image->Active != 0) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down250
;MikromediaGreenhouseProject_driver.c,2929 :: 		PressedObject = (void *)exec_image;
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2930 :: 		PressedObjectType = 3;
MOVS	R3, #3
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2931 :: 		if (exec_image->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down251
;MikromediaGreenhouseProject_driver.c,2932 :: 		exec_image->OnDownPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R2, [R4, #0]
BLX	R2
;MikromediaGreenhouseProject_driver.c,2933 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;MikromediaGreenhouseProject_driver.c,2934 :: 		}
L_Process_TP_Down251:
;MikromediaGreenhouseProject_driver.c,2935 :: 		}
L_Process_TP_Down250:
;MikromediaGreenhouseProject_driver.c,2936 :: 		}
L_Process_TP_Down249:
;MikromediaGreenhouseProject_driver.c,2938 :: 		if (_object_count == circle_order) {
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down252
;MikromediaGreenhouseProject_driver.c,2939 :: 		if (exec_circle->Active != 0) {
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
ADDS	R2, #17
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down253
;MikromediaGreenhouseProject_driver.c,2940 :: 		if (exec_circle->PressColEnabled != 0) {
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down254
;MikromediaGreenhouseProject_driver.c,2941 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2942 :: 		DrawCircle(exec_circle);
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawCircle+0
;MikromediaGreenhouseProject_driver.c,2943 :: 		}
L_Process_TP_Down254:
;MikromediaGreenhouseProject_driver.c,2944 :: 		PressedObject = (void *)exec_circle;
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2945 :: 		PressedObjectType = 4;
MOVS	R3, #4
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MikromediaGreenhouseProject_driver.c,2946 :: 		if (exec_circle->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down255
;MikromediaGreenhouseProject_driver.c,2947 :: 		exec_circle->OnDownPtr();
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;MikromediaGreenhouseProject_driver.c,2948 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;MikromediaGreenhouseProject_driver.c,2949 :: 		}
L_Process_TP_Down255:
;MikromediaGreenhouseProject_driver.c,2950 :: 		}
L_Process_TP_Down253:
;MikromediaGreenhouseProject_driver.c,2951 :: 		}
L_Process_TP_Down252:
;MikromediaGreenhouseProject_driver.c,2953 :: 		}
L_Process_TP_Down237:
;MikromediaGreenhouseProject_driver.c,2954 :: 		}
L_end_Process_TP_Down:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Process_TP_Down
_Check_TP:
;MikromediaGreenhouseProject_driver.c,2956 :: 		void Check_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MikromediaGreenhouseProject_driver.c,2957 :: 		if (STMPE610_PressDetect()) {
BL	_STMPE610_PressDetect+0
CMP	R0, #0
IT	EQ
BEQ	L_Check_TP256
;MikromediaGreenhouseProject_driver.c,2958 :: 		if (STMPE610_GetLastCoordinates(&Xcoord, &Ycoord) == 0) {
MOVW	R1, #lo_addr(_Ycoord+0)
MOVT	R1, #hi_addr(_Ycoord+0)
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
BL	_STMPE610_GetLastCoordinates+0
CMP	R0, #0
IT	NE
BNE	L_Check_TP257
;MikromediaGreenhouseProject_driver.c,2960 :: 		Process_TP_Press(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Press+0
;MikromediaGreenhouseProject_driver.c,2961 :: 		if (PenDown == 0) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Check_TP258
;MikromediaGreenhouseProject_driver.c,2962 :: 		PenDown = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2963 :: 		Process_TP_Down(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Down+0
;MikromediaGreenhouseProject_driver.c,2964 :: 		}
L_Check_TP258:
;MikromediaGreenhouseProject_driver.c,2965 :: 		}
L_Check_TP257:
;MikromediaGreenhouseProject_driver.c,2966 :: 		}
IT	AL
BAL	L_Check_TP259
L_Check_TP256:
;MikromediaGreenhouseProject_driver.c,2967 :: 		else if (PenDown == 1) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Check_TP260
;MikromediaGreenhouseProject_driver.c,2968 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,2969 :: 		Process_TP_Up(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Up+0
;MikromediaGreenhouseProject_driver.c,2970 :: 		}
L_Check_TP260:
L_Check_TP259:
;MikromediaGreenhouseProject_driver.c,2971 :: 		}
L_end_Check_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Check_TP
_Init_MCU:
;MikromediaGreenhouseProject_driver.c,2973 :: 		void Init_MCU() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MikromediaGreenhouseProject_driver.c,2977 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;MikromediaGreenhouseProject_driver.c,2978 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
;MikromediaGreenhouseProject_driver.c,2979 :: 		GPIOB_ODR.B6 = 1;
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
LDR	R0, [R1, #0]
ORR	R0, R0, #64
STR	R0, [R1, #0]
;MikromediaGreenhouseProject_driver.c,2980 :: 		while (GPIOB_IDR.B7 == 0) {
L_Init_MCU261:
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
LDR	R1, [R0, #0]
UBFX	R0, R1, #7, #1
CMP	R0, #0
IT	NE
BNE	L_Init_MCU262
;MikromediaGreenhouseProject_driver.c,2981 :: 		GPIOB_ODR.B6 = 0;
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
LDR	R0, [R1, #0]
BFC	R0, #6, #1
STR	R0, [R1, #0]
;MikromediaGreenhouseProject_driver.c,2982 :: 		Delay_us(10);
MOVW	R7, #1995
MOVT	R7, #0
NOP
NOP
L_Init_MCU263:
SUBS	R7, R7, #1
BNE	L_Init_MCU263
NOP
NOP
;MikromediaGreenhouseProject_driver.c,2983 :: 		GPIOB_ODR.B6 = 1;
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
LDR	R0, [R1, #0]
ORR	R0, R0, #64
STR	R0, [R1, #0]
;MikromediaGreenhouseProject_driver.c,2984 :: 		Delay_us(10);
MOVW	R7, #1995
MOVT	R7, #0
NOP
NOP
L_Init_MCU265:
SUBS	R7, R7, #1
BNE	L_Init_MCU265
NOP
NOP
;MikromediaGreenhouseProject_driver.c,2985 :: 		}
IT	AL
BAL	L_Init_MCU261
L_Init_MCU262:
;MikromediaGreenhouseProject_driver.c,2986 :: 		I2C1_Init_Advanced(400000, &_GPIO_MODULE_I2C1_PB67);
MOVW	R1, #lo_addr(__GPIO_MODULE_I2C1_PB67+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_I2C1_PB67+0)
MOVW	R0, #6784
MOVT	R0, #6
BL	_I2C1_Init_Advanced+0
;MikromediaGreenhouseProject_driver.c,2988 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;MikromediaGreenhouseProject_driver.c,2989 :: 		GPIO_Digital_Output(&GPIOG_BASE, 0x00FF);
MOVS	R1, #255
MOVW	R0, #lo_addr(GPIOG_BASE+0)
MOVT	R0, #hi_addr(GPIOG_BASE+0)
BL	_GPIO_Digital_Output+0
;MikromediaGreenhouseProject_driver.c,2990 :: 		GPIO_Digital_Output(&GPIOE_BASE, 0xFF00);
MOVW	R1, #65280
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;MikromediaGreenhouseProject_driver.c,2991 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_4);
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;MikromediaGreenhouseProject_driver.c,2992 :: 		GPIOB_ODR.B4 = 0;
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
LDR	R0, [R1, #0]
BFC	R0, #4, #1
STR	R0, [R1, #0]
;MikromediaGreenhouseProject_driver.c,2993 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;MikromediaGreenhouseProject_driver.c,2994 :: 		TFT_Set_MM_Plus();
BL	_TFT_Set_MM_Plus+0
;MikromediaGreenhouseProject_driver.c,2995 :: 		STMPE610_SetDefaultMode();
BL	_STMPE610_SetDefaultMode+0
;MikromediaGreenhouseProject_driver.c,2996 :: 		}
L_end_Init_MCU:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_MCU
_Init_Ext_Mem:
;MikromediaGreenhouseProject_driver.c,2998 :: 		void Init_Ext_Mem() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MikromediaGreenhouseProject_driver.c,3000 :: 		SDIO_Reset();
BL	_SDIO_Reset+0
;MikromediaGreenhouseProject_driver.c,3003 :: 		| _SDIO_CFG_CLOCK_RISING_EDGE | _SDIO_CFG_HW_FLOW_DISABLE, 125, &_GPIO_MODULE_SDIO_D0_D3);
MOVW	R2, #lo_addr(__GPIO_MODULE_SDIO_D0_D3+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SDIO_D0_D3+0)
MOVS	R1, #125
MOV	R0, #2048
BL	_SDIO_Init+0
;MikromediaGreenhouseProject_driver.c,3006 :: 		GPIOD_PUPDRbits.PUPDR2 = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(GPIOD_PUPDRbits+0)
MOVT	R1, #hi_addr(GPIOD_PUPDRbits+0)
LDRB	R0, [R1, #0]
BFI	R0, R2, #4, #2
STRB	R0, [R1, #0]
;MikromediaGreenhouseProject_driver.c,3007 :: 		GPIOC_PUPDRbits.PUPDR8 = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(GPIOC_PUPDRbits+0)
MOVT	R1, #hi_addr(GPIOC_PUPDRbits+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #16, #2
STR	R0, [R1, #0]
;MikromediaGreenhouseProject_driver.c,3008 :: 		GPIOC_PUPDRbits.PUPDR9 = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(GPIOC_PUPDRbits+0)
MOVT	R1, #hi_addr(GPIOC_PUPDRbits+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #18, #2
STR	R0, [R1, #0]
;MikromediaGreenhouseProject_driver.c,3009 :: 		GPIOC_PUPDRbits.PUPDR10 = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(GPIOC_PUPDRbits+0)
MOVT	R1, #hi_addr(GPIOC_PUPDRbits+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #20, #2
STR	R0, [R1, #0]
;MikromediaGreenhouseProject_driver.c,3010 :: 		GPIOC_PUPDRbits.PUPDR11 = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(GPIOC_PUPDRbits+0)
MOVT	R1, #hi_addr(GPIOC_PUPDRbits+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #22, #2
STR	R0, [R1, #0]
;MikromediaGreenhouseProject_driver.c,3012 :: 		Mmc_Set_Interface(_MMC_INTERFACE_SDIO);
MOVS	R0, #1
BL	_Mmc_Set_Interface+0
;MikromediaGreenhouseProject_driver.c,3015 :: 		if (!Mmc_Fat_Init()) {
BL	_Mmc_Fat_Init+0
CMP	R0, #0
IT	NE
BNE	L_Init_Ext_Mem267
;MikromediaGreenhouseProject_driver.c,3018 :: 		| _SDIO_CFG_CLOCK_RISING_EDGE | _SDIO_CFG_HW_FLOW_DISABLE, 1, &_GPIO_MODULE_SDIO_D0_D3);
MOVW	R2, #lo_addr(__GPIO_MODULE_SDIO_D0_D3+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SDIO_D0_D3+0)
MOVS	R1, #1
MOV	R0, #2048
BL	_SDIO_Init+0
;MikromediaGreenhouseProject_driver.c,3021 :: 		Mmc_Fat_Assign("Mikromed.RES", 0);
MOVW	R0, #lo_addr(?lstr2_MikromediaGreenhouseProject_driver+0)
MOVT	R0, #hi_addr(?lstr2_MikromediaGreenhouseProject_driver+0)
MOVS	R1, #0
BL	_Mmc_Fat_Assign+0
;MikromediaGreenhouseProject_driver.c,3022 :: 		Mmc_Fat_Reset(&res_file_size);
MOVW	R0, #lo_addr(_res_file_size+0)
MOVT	R0, #hi_addr(_res_file_size+0)
BL	_Mmc_Fat_Reset+0
;MikromediaGreenhouseProject_driver.c,3023 :: 		}
L_Init_Ext_Mem267:
;MikromediaGreenhouseProject_driver.c,3024 :: 		}
L_end_Init_Ext_Mem:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_Ext_Mem
_STMPE610_Config:
;MikromediaGreenhouseProject_driver.c,3026 :: 		char STMPE610_Config()  {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MikromediaGreenhouseProject_driver.c,3027 :: 		STMPE610_SetI2CAddress(STMPE610_I2C_ADDR1);
MOVS	R0, #136
BL	_STMPE610_SetI2CAddress+0
;MikromediaGreenhouseProject_driver.c,3028 :: 		if (STMPE610_IsOperational() != 0){
BL	_STMPE610_IsOperational+0
CMP	R0, #0
IT	EQ
BEQ	L_STMPE610_Config268
;MikromediaGreenhouseProject_driver.c,3029 :: 		return STMPE610_IO_NOT_OPERATIONAL;
MOVS	R0, #4
IT	AL
BAL	L_end_STMPE610_Config
;MikromediaGreenhouseProject_driver.c,3030 :: 		}
L_STMPE610_Config268:
;MikromediaGreenhouseProject_driver.c,3032 :: 		STMPE610_Reset();
BL	_STMPE610_Reset+0
;MikromediaGreenhouseProject_driver.c,3033 :: 		STMPE610_Module(STMPE610_MODULE_TS | STMPE610_MODULE_ADC, STMPE610_ENABLE);
MOVS	R1, #1
MOVS	R0, #3
BL	_STMPE610_Module+0
;MikromediaGreenhouseProject_driver.c,3034 :: 		STMPE610_AlternateFunction(STMPE610_GPIO_PIN1, STMPE610_ENABLE);
MOVS	R1, #1
MOVS	R0, #2
BL	_STMPE610_AlternateFunction+0
;MikromediaGreenhouseProject_driver.c,3035 :: 		STMPE610_SetGPIOPin(STMPE610_GPIO_PIN1, 0);   // IN1 to "0" -> I2C communication
MOVS	R1, #0
MOVS	R0, #2
BL	_STMPE610_SetGPIOPin+0
;MikromediaGreenhouseProject_driver.c,3036 :: 		STMPE610_SetSize(800,480);
MOVW	R1, #480
MOVW	R0, #800
BL	_STMPE610_SetSize+0
;MikromediaGreenhouseProject_driver.c,3037 :: 		STMPE610_Module(STMPE610_MODULE_TS | STMPE610_MODULE_ADC, STMPE610_ENABLE);
MOVS	R1, #1
MOVS	R0, #3
BL	_STMPE610_Module+0
;MikromediaGreenhouseProject_driver.c,3038 :: 		STMPE610_EnableInterrupt(STMPE610_IE_TOUCH_DET | STMPE610_IE_FIFO_TH | STMPE610_IE_FIFO_0FLOW, STMPE610_ENABLE);
MOVS	R1, #1
MOVS	R0, #7
BL	_STMPE610_EnableInterrupt+0
;MikromediaGreenhouseProject_driver.c,3039 :: 		STMPE610_ConfigureInterrupt(STMPE610_INT_POLARITY_ACTIVE_HIGH | STMPE610_INT_TYPE_EDGE | STMPE610_INT_ENABLE_ALL);
MOVS	R0, #7
BL	_STMPE610_ConfigureInterrupt+0
;MikromediaGreenhouseProject_driver.c,3040 :: 		STMPE610_SetADC(STMPE610_ADC_CTRL1_SAMPLETIME_44 | STMPE610_ADC_CTRL1_ADC_12BIT | STMPE610_ADC_CTRL1_INT_REFERENCE);
MOVS	R0, #20
BL	_STMPE610_SetADC+0
;MikromediaGreenhouseProject_driver.c,3041 :: 		Delay_10ms(); Delay_10ms();
BL	_Delay_10ms+0
BL	_Delay_10ms+0
;MikromediaGreenhouseProject_driver.c,3042 :: 		STMPE610_SetADCClock(STMPE610_ADC_CTRL2_3250_kHZ);
MOVS	R0, #1
BL	_STMPE610_SetADCClock+0
;MikromediaGreenhouseProject_driver.c,3043 :: 		STMPE610_AlternateFunction(STMPE610_GPIO_PIN4 | STMPE610_GPIO_PIN5 | STMPE610_GPIO_PIN6 | STMPE610_GPIO_PIN7, STMPE610_DISABLE);
MOVS	R1, #0
MOVS	R0, #240
BL	_STMPE610_AlternateFunction+0
;MikromediaGreenhouseProject_driver.c,3044 :: 		STMPE610_ConfigureTSC(STMPE610_TSC_CFG_AVE_CTRL_4S, STMPE610_TSC_CFG_TOUCH_DET_DELAY_500uS, STMPE610_TSC_CFG_TOUCH_SETTLING_500uS);
MOVS	R2, #2
MOVS	R1, #24
MOVS	R0, #128
BL	_STMPE610_ConfigureTSC+0
;MikromediaGreenhouseProject_driver.c,3045 :: 		STMPE610_SetFIFOThreshold(1);
MOVS	R0, #1
BL	_STMPE610_SetFIFOThreshold+0
;MikromediaGreenhouseProject_driver.c,3046 :: 		STMPE610_ResetFIFO();
BL	_STMPE610_ResetFIFO+0
;MikromediaGreenhouseProject_driver.c,3047 :: 		STMPE610_TSIDrive(STMPE610_TSC_I_DRIVE_20mA);
MOVS	R0, #0
BL	_STMPE610_TSIDrive+0
;MikromediaGreenhouseProject_driver.c,3048 :: 		STMPE610_TSControl(STMPE610_TSC_CTRL_TRACK0 | STMPE610_TSC_CTRL_ACQU_XYZ | STMPE610_TSC_CTRL_ENABLE);
MOVS	R0, #1
BL	_STMPE610_TSControl+0
;MikromediaGreenhouseProject_driver.c,3049 :: 		STMPE610_ZDataFraction(STMPE610_FRACP4_WHOLP4);
MOVS	R0, #4
BL	_STMPE610_ZDataFraction+0
;MikromediaGreenhouseProject_driver.c,3050 :: 		STMPE610_SetTouchPressureThreshold(70);
MOVS	R0, #70
BL	_STMPE610_SetTouchPressureThreshold+0
;MikromediaGreenhouseProject_driver.c,3051 :: 		STMPE610_ClearInterrupts();
BL	_STMPE610_ClearInterrupts+0
;MikromediaGreenhouseProject_driver.c,3052 :: 		STMPE610_WriteReg(STMPE610_INT_CTRL_REG, 0x01);
MOVS	R1, #1
MOVS	R0, #9
BL	_STMPE610_WriteReg+0
;MikromediaGreenhouseProject_driver.c,3053 :: 		return STMPE610_OK;
MOVS	R0, #0
;MikromediaGreenhouseProject_driver.c,3054 :: 		}
L_end_STMPE610_Config:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _STMPE610_Config
_Start_TP:
;MikromediaGreenhouseProject_driver.c,3057 :: 		void Start_TP() {
SUB	SP, SP, #16
STR	LR, [SP, #0]
;MikromediaGreenhouseProject_driver.c,3059 :: 		Init_MCU();
BL	_Init_MCU+0
;MikromediaGreenhouseProject_driver.c,3061 :: 		Init_Ext_Mem();
BL	_Init_Ext_Mem+0
;MikromediaGreenhouseProject_driver.c,3063 :: 		InitializeTouchPanel();
BL	MikromediaGreenhouseProject_driver_InitializeTouchPanel+0
;MikromediaGreenhouseProject_driver.c,3064 :: 		if (STMPE610_Config() == STMPE610_OK) {
BL	_STMPE610_Config+0
CMP	R0, #0
IT	NE
BNE	L_Start_TP269
;MikromediaGreenhouseProject_driver.c,3065 :: 		} else {
IT	AL
BAL	L_Start_TP270
L_Start_TP269:
;MikromediaGreenhouseProject_driver.c,3066 :: 		while(1);
L_Start_TP271:
IT	AL
BAL	L_Start_TP271
;MikromediaGreenhouseProject_driver.c,3067 :: 		}
L_Start_TP270:
;MikromediaGreenhouseProject_driver.c,3071 :: 		TPConstsStruct.X_Min = 105;
MOVS	R0, #105
STRH	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,3072 :: 		TPConstsStruct.X_Max = 3925;
MOVW	R0, #3925
STRH	R0, [SP, #6]
;MikromediaGreenhouseProject_driver.c,3073 :: 		TPConstsStruct.Y_Min = 250;
MOVS	R0, #250
STRH	R0, [SP, #8]
;MikromediaGreenhouseProject_driver.c,3074 :: 		TPConstsStruct.Y_Max = 3820;
MOVW	R0, #3820
STRH	R0, [SP, #10]
;MikromediaGreenhouseProject_driver.c,3075 :: 		TPConstsStruct.Rotate = 0;
MOVS	R0, #0
STRB	R0, [SP, #12]
;MikromediaGreenhouseProject_driver.c,3076 :: 		STMPE610_SetCalibrationConsts(&TPConstsStruct);
ADD	R0, SP, #4
BL	_STMPE610_SetCalibrationConsts+0
;MikromediaGreenhouseProject_driver.c,3078 :: 		InitializeObjects();
BL	MikromediaGreenhouseProject_driver_InitializeObjects+0
;MikromediaGreenhouseProject_driver.c,3079 :: 		display_width = Screen1.Width;
MOVW	R0, #lo_addr(_Screen1+2)
MOVT	R0, #hi_addr(_Screen1+2)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_width+0)
MOVT	R0, #hi_addr(_display_width+0)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,3080 :: 		display_height = Screen1.Height;
MOVW	R0, #lo_addr(_Screen1+4)
MOVT	R0, #hi_addr(_Screen1+4)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_height+0)
MOVT	R0, #hi_addr(_display_height+0)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_driver.c,3081 :: 		DrawScreen(&Screen3);
MOVW	R0, #lo_addr(_Screen3+0)
MOVT	R0, #hi_addr(_Screen3+0)
BL	_DrawScreen+0
;MikromediaGreenhouseProject_driver.c,3082 :: 		}
L_end_Start_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _Start_TP
_updateLabel:
;MikromediaGreenhouseProject_driver.c,3084 :: 		void updateLabel( uint8_t * tftLabel, uint16_t x, uint16_t y )
; y start address is: 8 (R2)
; x start address is: 4 (R1)
; tftLabel start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R5, R0
UXTH	R6, R1
UXTH	R7, R2
; y end address is: 8 (R2)
; x end address is: 4 (R1)
; tftLabel end address is: 0 (R0)
; tftLabel start address is: 20 (R5)
; x start address is: 24 (R6)
; y start address is: 28 (R7)
;MikromediaGreenhouseProject_driver.c,3086 :: 		TFT_Set_Font( aux_Tahoma48x48_Bold, CL_LIME, FO_HORIZONTAL );
MOVS	R2, #0
MOVW	R1, #2016
MOVW	R0, #lo_addr(_aux_Tahoma48x48_Bold+0)
MOVT	R0, #hi_addr(_aux_Tahoma48x48_Bold+0)
BL	_TFT_Set_Font+0
;MikromediaGreenhouseProject_driver.c,3087 :: 		TFT_Write_Text( tftLabel, x, y );
UXTH	R2, R7
; y end address is: 28 (R7)
UXTH	R1, R6
; x end address is: 24 (R6)
MOV	R0, R5
; tftLabel end address is: 20 (R5)
BL	_TFT_Write_Text+0
;MikromediaGreenhouseProject_driver.c,3088 :: 		}
L_end_updateLabel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _updateLabel
_cleanLabel:
;MikromediaGreenhouseProject_driver.c,3090 :: 		void cleanLabel( uint8_t label_no )
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRB	R0, [SP, #4]
;MikromediaGreenhouseProject_driver.c,3092 :: 		if (label_no == 1) DrawImage(&Image6);
LDRB	R1, [SP, #4]
CMP	R1, #1
IT	NE
BNE	L_cleanLabel273
MOVW	R0, #lo_addr(_Image6+0)
MOVT	R0, #hi_addr(_Image6+0)
BL	_DrawImage+0
L_cleanLabel273:
;MikromediaGreenhouseProject_driver.c,3093 :: 		if (label_no == 2) DrawImage(&Image7);
LDRB	R1, [SP, #4]
CMP	R1, #2
IT	NE
BNE	L_cleanLabel274
MOVW	R0, #lo_addr(_Image7+0)
MOVT	R0, #hi_addr(_Image7+0)
BL	_DrawImage+0
L_cleanLabel274:
;MikromediaGreenhouseProject_driver.c,3094 :: 		if (label_no == 3) DrawImage(&Image8);
LDRB	R1, [SP, #4]
CMP	R1, #3
IT	NE
BNE	L_cleanLabel275
MOVW	R0, #lo_addr(_Image8+0)
MOVT	R0, #hi_addr(_Image8+0)
BL	_DrawImage+0
L_cleanLabel275:
;MikromediaGreenhouseProject_driver.c,3095 :: 		if (label_no == 4) DrawImage(&Image9);
LDRB	R1, [SP, #4]
CMP	R1, #4
IT	NE
BNE	L_cleanLabel276
MOVW	R0, #lo_addr(_Image9+0)
MOVT	R0, #hi_addr(_Image9+0)
BL	_DrawImage+0
L_cleanLabel276:
;MikromediaGreenhouseProject_driver.c,3096 :: 		}
L_end_cleanLabel:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _cleanLabel
MikromediaGreenhouseProject_driver____?ag:
L_end_MikromediaGreenhouseProject_driver___?ag:
BX	LR
; end of MikromediaGreenhouseProject_driver____?ag
