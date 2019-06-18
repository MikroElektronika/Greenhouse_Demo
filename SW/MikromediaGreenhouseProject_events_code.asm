_ButtonRound1OnClick:
;MikromediaGreenhouseProject_events_code.c,38 :: 		void ButtonRound1OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MikromediaGreenhouseProject_events_code.c,39 :: 		screen_flag = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,40 :: 		I2C_Set_Active( &I2C1_Start, &I2C1_Read, &I2C1_Write );
MOVW	R2, #lo_addr(_I2C1_Write+0)
MOVT	R2, #hi_addr(_I2C1_Write+0)
MOVW	R1, #lo_addr(_I2C1_Read+0)
MOVT	R1, #hi_addr(_I2C1_Read+0)
MOVW	R0, #lo_addr(_I2C1_Start+0)
MOVT	R0, #hi_addr(_I2C1_Start+0)
BL	_I2C_Set_Active+0
;MikromediaGreenhouseProject_events_code.c,41 :: 		Delay_ms(1);
MOVW	R7, #3387
MOVT	R7, #3
NOP
NOP
L_ButtonRound1OnClick0:
SUBS	R7, R7, #1
BNE	L_ButtonRound1OnClick0
NOP
NOP
;MikromediaGreenhouseProject_events_code.c,42 :: 		ButtonRound1.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_ButtonRound1+16)
MOVT	R0, #hi_addr(_ButtonRound1+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,43 :: 		ButtonRound1.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_ButtonRound1+36)
MOVT	R0, #hi_addr(_ButtonRound1+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,44 :: 		DrawImage(&Image4);
MOVW	R0, #lo_addr(_Image4+0)
MOVT	R0, #hi_addr(_Image4+0)
BL	_DrawImage+0
;MikromediaGreenhouseProject_events_code.c,45 :: 		DrawRoundButton(&ButtonRound1);
MOVW	R0, #lo_addr(_ButtonRound1+0)
MOVT	R0, #hi_addr(_ButtonRound1+0)
BL	_DrawRoundButton+0
;MikromediaGreenhouseProject_events_code.c,46 :: 		ButtonRound1.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ButtonRound1+16)
MOVT	R0, #hi_addr(_ButtonRound1+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,47 :: 		ButtonRound1.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ButtonRound1+36)
MOVT	R0, #hi_addr(_ButtonRound1+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,48 :: 		Delay_ms(100);
MOVW	R7, #11515
MOVT	R7, #305
NOP
NOP
L_ButtonRound1OnClick2:
SUBS	R7, R7, #1
BNE	L_ButtonRound1OnClick2
NOP
NOP
;MikromediaGreenhouseProject_events_code.c,49 :: 		DrawScreen(&Screen2);
MOVW	R0, #lo_addr(_Screen2+0)
MOVT	R0, #hi_addr(_Screen2+0)
BL	_DrawScreen+0
;MikromediaGreenhouseProject_events_code.c,50 :: 		I2C_Set_Active( &I2C2_Start, &I2C2_Read, &I2C2_Write );
MOVW	R2, #lo_addr(_I2C2_Write+0)
MOVT	R2, #hi_addr(_I2C2_Write+0)
MOVW	R1, #lo_addr(_I2C2_Read+0)
MOVT	R1, #hi_addr(_I2C2_Read+0)
MOVW	R0, #lo_addr(_I2C2_Start+0)
MOVT	R0, #hi_addr(_I2C2_Start+0)
BL	_I2C_Set_Active+0
;MikromediaGreenhouseProject_events_code.c,51 :: 		}
L_end_ButtonRound1OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ButtonRound1OnClick
_ButtonRound2OnClick:
;MikromediaGreenhouseProject_events_code.c,52 :: 		void ButtonRound2OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MikromediaGreenhouseProject_events_code.c,53 :: 		screen_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,54 :: 		I2C_Set_Active( &I2C1_Start, &I2C1_Read, &I2C1_Write );
MOVW	R2, #lo_addr(_I2C1_Write+0)
MOVT	R2, #hi_addr(_I2C1_Write+0)
MOVW	R1, #lo_addr(_I2C1_Read+0)
MOVT	R1, #hi_addr(_I2C1_Read+0)
MOVW	R0, #lo_addr(_I2C1_Start+0)
MOVT	R0, #hi_addr(_I2C1_Start+0)
BL	_I2C_Set_Active+0
;MikromediaGreenhouseProject_events_code.c,55 :: 		Delay_ms(1);
MOVW	R7, #3387
MOVT	R7, #3
NOP
NOP
L_ButtonRound2OnClick4:
SUBS	R7, R7, #1
BNE	L_ButtonRound2OnClick4
NOP
NOP
;MikromediaGreenhouseProject_events_code.c,56 :: 		ButtonRound2.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_ButtonRound2+16)
MOVT	R0, #hi_addr(_ButtonRound2+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,57 :: 		ButtonRound2.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_ButtonRound2+36)
MOVT	R0, #hi_addr(_ButtonRound2+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,58 :: 		DrawImage(&Image5);
MOVW	R0, #lo_addr(_Image5+0)
MOVT	R0, #hi_addr(_Image5+0)
BL	_DrawImage+0
;MikromediaGreenhouseProject_events_code.c,59 :: 		DrawRoundButton(&ButtonRound2);
MOVW	R0, #lo_addr(_ButtonRound2+0)
MOVT	R0, #hi_addr(_ButtonRound2+0)
BL	_DrawRoundButton+0
;MikromediaGreenhouseProject_events_code.c,60 :: 		ButtonRound2.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ButtonRound2+16)
MOVT	R0, #hi_addr(_ButtonRound2+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,61 :: 		ButtonRound2.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ButtonRound2+36)
MOVT	R0, #hi_addr(_ButtonRound2+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,62 :: 		Delay_ms(100);
MOVW	R7, #11515
MOVT	R7, #305
NOP
NOP
L_ButtonRound2OnClick6:
SUBS	R7, R7, #1
BNE	L_ButtonRound2OnClick6
NOP
NOP
;MikromediaGreenhouseProject_events_code.c,63 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;MikromediaGreenhouseProject_events_code.c,64 :: 		log_last( );
BL	_log_last+0
;MikromediaGreenhouseProject_events_code.c,65 :: 		I2C_Set_Active( &I2C2_Start, &I2C2_Read, &I2C2_Write );
MOVW	R2, #lo_addr(_I2C2_Write+0)
MOVT	R2, #hi_addr(_I2C2_Write+0)
MOVW	R1, #lo_addr(_I2C2_Read+0)
MOVT	R1, #hi_addr(_I2C2_Read+0)
MOVW	R0, #lo_addr(_I2C2_Start+0)
MOVT	R0, #hi_addr(_I2C2_Start+0)
BL	_I2C_Set_Active+0
;MikromediaGreenhouseProject_events_code.c,66 :: 		}
L_end_ButtonRound2OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ButtonRound2OnClick
_servo_number_button_1OnClick:
;MikromediaGreenhouseProject_events_code.c,67 :: 		void servo_number_button_1OnClick() {
;MikromediaGreenhouseProject_events_code.c,68 :: 		servo_num = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,69 :: 		servo_num_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_num_change_flag+0)
MOVT	R0, #hi_addr(_servo_num_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,70 :: 		}
L_end_servo_number_button_1OnClick:
BX	LR
; end of _servo_number_button_1OnClick
_servo_number_button_2OnClick:
;MikromediaGreenhouseProject_events_code.c,71 :: 		void servo_number_button_2OnClick() {
;MikromediaGreenhouseProject_events_code.c,72 :: 		servo_num = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,73 :: 		servo_num_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_num_change_flag+0)
MOVT	R0, #hi_addr(_servo_num_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,74 :: 		}
L_end_servo_number_button_2OnClick:
BX	LR
; end of _servo_number_button_2OnClick
_servo_number_button_3OnClick:
;MikromediaGreenhouseProject_events_code.c,75 :: 		void servo_number_button_3OnClick() {
;MikromediaGreenhouseProject_events_code.c,76 :: 		servo_num = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,77 :: 		servo_num_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_num_change_flag+0)
MOVT	R0, #hi_addr(_servo_num_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,78 :: 		}
L_end_servo_number_button_3OnClick:
BX	LR
; end of _servo_number_button_3OnClick
_servo_number_button_4OnClick:
;MikromediaGreenhouseProject_events_code.c,79 :: 		void servo_number_button_4OnClick() {
;MikromediaGreenhouseProject_events_code.c,80 :: 		servo_num = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,81 :: 		servo_num_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_num_change_flag+0)
MOVT	R0, #hi_addr(_servo_num_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,82 :: 		}
L_end_servo_number_button_4OnClick:
BX	LR
; end of _servo_number_button_4OnClick
_servo_number_button_5OnClick:
;MikromediaGreenhouseProject_events_code.c,83 :: 		void servo_number_button_5OnClick() {
;MikromediaGreenhouseProject_events_code.c,84 :: 		servo_num = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,85 :: 		servo_num_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_num_change_flag+0)
MOVT	R0, #hi_addr(_servo_num_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,86 :: 		}
L_end_servo_number_button_5OnClick:
BX	LR
; end of _servo_number_button_5OnClick
_servo_number_button_6OnClick:
;MikromediaGreenhouseProject_events_code.c,87 :: 		void servo_number_button_6OnClick() {
;MikromediaGreenhouseProject_events_code.c,88 :: 		servo_num = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,89 :: 		servo_num_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_num_change_flag+0)
MOVT	R0, #hi_addr(_servo_num_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,90 :: 		}
L_end_servo_number_button_6OnClick:
BX	LR
; end of _servo_number_button_6OnClick
_servo_number_button_7OnClick:
;MikromediaGreenhouseProject_events_code.c,91 :: 		void servo_number_button_7OnClick() {
;MikromediaGreenhouseProject_events_code.c,92 :: 		servo_num = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,93 :: 		servo_num_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_num_change_flag+0)
MOVT	R0, #hi_addr(_servo_num_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,94 :: 		}
L_end_servo_number_button_7OnClick:
BX	LR
; end of _servo_number_button_7OnClick
_servo_number_button_8OnClick:
;MikromediaGreenhouseProject_events_code.c,95 :: 		void servo_number_button_8OnClick() {
;MikromediaGreenhouseProject_events_code.c,96 :: 		servo_num = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,97 :: 		servo_num_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_num_change_flag+0)
MOVT	R0, #hi_addr(_servo_num_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,98 :: 		}
L_end_servo_number_button_8OnClick:
BX	LR
; end of _servo_number_button_8OnClick
_servo_number_button_9OnClick:
;MikromediaGreenhouseProject_events_code.c,99 :: 		void servo_number_button_9OnClick() {
;MikromediaGreenhouseProject_events_code.c,100 :: 		servo_num = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,101 :: 		servo_num_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_num_change_flag+0)
MOVT	R0, #hi_addr(_servo_num_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,102 :: 		}
L_end_servo_number_button_9OnClick:
BX	LR
; end of _servo_number_button_9OnClick
_servo_number_button_10OnClick:
;MikromediaGreenhouseProject_events_code.c,103 :: 		void servo_number_button_10OnClick() {
;MikromediaGreenhouseProject_events_code.c,104 :: 		servo_num = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,105 :: 		servo_num_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_num_change_flag+0)
MOVT	R0, #hi_addr(_servo_num_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,106 :: 		}
L_end_servo_number_button_10OnClick:
BX	LR
; end of _servo_number_button_10OnClick
_servo_number_button_11OnClick:
;MikromediaGreenhouseProject_events_code.c,107 :: 		void servo_number_button_11OnClick() {
;MikromediaGreenhouseProject_events_code.c,108 :: 		servo_num = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,109 :: 		servo_num_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_num_change_flag+0)
MOVT	R0, #hi_addr(_servo_num_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,110 :: 		}
L_end_servo_number_button_11OnClick:
BX	LR
; end of _servo_number_button_11OnClick
_servo_number_button_12OnClick:
;MikromediaGreenhouseProject_events_code.c,111 :: 		void servo_number_button_12OnClick() {
;MikromediaGreenhouseProject_events_code.c,112 :: 		servo_num = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,113 :: 		servo_num_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_num_change_flag+0)
MOVT	R0, #hi_addr(_servo_num_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,114 :: 		}
L_end_servo_number_button_12OnClick:
BX	LR
; end of _servo_number_button_12OnClick
_servo_number_button_13OnClick:
;MikromediaGreenhouseProject_events_code.c,115 :: 		void servo_number_button_13OnClick() {
;MikromediaGreenhouseProject_events_code.c,116 :: 		servo_num = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,117 :: 		servo_num_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_num_change_flag+0)
MOVT	R0, #hi_addr(_servo_num_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,118 :: 		}
L_end_servo_number_button_13OnClick:
BX	LR
; end of _servo_number_button_13OnClick
_servo_number_button_14OnClick:
;MikromediaGreenhouseProject_events_code.c,119 :: 		void servo_number_button_14OnClick() {
;MikromediaGreenhouseProject_events_code.c,120 :: 		servo_num = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,121 :: 		servo_num_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_num_change_flag+0)
MOVT	R0, #hi_addr(_servo_num_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,122 :: 		}
L_end_servo_number_button_14OnClick:
BX	LR
; end of _servo_number_button_14OnClick
_servo_number_button_15OnClick:
;MikromediaGreenhouseProject_events_code.c,123 :: 		void servo_number_button_15OnClick() {
;MikromediaGreenhouseProject_events_code.c,124 :: 		servo_num = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,125 :: 		servo_num_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_num_change_flag+0)
MOVT	R0, #hi_addr(_servo_num_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,126 :: 		}
L_end_servo_number_button_15OnClick:
BX	LR
; end of _servo_number_button_15OnClick
_servo_number_button_16OnClick:
;MikromediaGreenhouseProject_events_code.c,127 :: 		void servo_number_button_16OnClick() {
;MikromediaGreenhouseProject_events_code.c,128 :: 		servo_num = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,129 :: 		servo_num_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_num_change_flag+0)
MOVT	R0, #hi_addr(_servo_num_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,130 :: 		}
L_end_servo_number_button_16OnClick:
BX	LR
; end of _servo_number_button_16OnClick
_servo_number_button_allOnClick:
;MikromediaGreenhouseProject_events_code.c,131 :: 		void servo_number_button_allOnClick() {
;MikromediaGreenhouseProject_events_code.c,132 :: 		servo_num = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,133 :: 		servo_num_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_num_change_flag+0)
MOVT	R0, #hi_addr(_servo_num_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,134 :: 		}
L_end_servo_number_button_allOnClick:
BX	LR
; end of _servo_number_button_allOnClick
_servo_position_button_1OnClick:
;MikromediaGreenhouseProject_events_code.c,135 :: 		void servo_position_button_1OnClick() {
;MikromediaGreenhouseProject_events_code.c,136 :: 		servo_pos = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,137 :: 		servo_pos_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_pos_change_flag+0)
MOVT	R0, #hi_addr(_servo_pos_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,138 :: 		}
L_end_servo_position_button_1OnClick:
BX	LR
; end of _servo_position_button_1OnClick
_servo_position_button_2OnClick:
;MikromediaGreenhouseProject_events_code.c,139 :: 		void servo_position_button_2OnClick() {
;MikromediaGreenhouseProject_events_code.c,140 :: 		servo_pos = 30;
MOVS	R1, #30
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,141 :: 		servo_pos_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_pos_change_flag+0)
MOVT	R0, #hi_addr(_servo_pos_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,142 :: 		}
L_end_servo_position_button_2OnClick:
BX	LR
; end of _servo_position_button_2OnClick
_servo_position_button_3OnClick:
;MikromediaGreenhouseProject_events_code.c,143 :: 		void servo_position_button_3OnClick() {
;MikromediaGreenhouseProject_events_code.c,144 :: 		servo_pos = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,145 :: 		servo_pos_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_pos_change_flag+0)
MOVT	R0, #hi_addr(_servo_pos_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,146 :: 		}
L_end_servo_position_button_3OnClick:
BX	LR
; end of _servo_position_button_3OnClick
_servo_position_button_4OnClick:
;MikromediaGreenhouseProject_events_code.c,147 :: 		void servo_position_button_4OnClick() {
;MikromediaGreenhouseProject_events_code.c,148 :: 		servo_pos = 70;
MOVS	R1, #70
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,149 :: 		servo_pos_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_pos_change_flag+0)
MOVT	R0, #hi_addr(_servo_pos_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,150 :: 		}
L_end_servo_position_button_4OnClick:
BX	LR
; end of _servo_position_button_4OnClick
_servo_position_button_5OnClick:
;MikromediaGreenhouseProject_events_code.c,151 :: 		void servo_position_button_5OnClick() {
;MikromediaGreenhouseProject_events_code.c,152 :: 		servo_pos = 90;
MOVS	R1, #90
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,153 :: 		servo_pos_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_pos_change_flag+0)
MOVT	R0, #hi_addr(_servo_pos_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,154 :: 		}
L_end_servo_position_button_5OnClick:
BX	LR
; end of _servo_position_button_5OnClick
_servo_position_button_6OnClick:
;MikromediaGreenhouseProject_events_code.c,155 :: 		void servo_position_button_6OnClick() {
;MikromediaGreenhouseProject_events_code.c,156 :: 		servo_pos = 110;
MOVS	R1, #110
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,157 :: 		servo_pos_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_pos_change_flag+0)
MOVT	R0, #hi_addr(_servo_pos_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,158 :: 		}
L_end_servo_position_button_6OnClick:
BX	LR
; end of _servo_position_button_6OnClick
_servo_position_button_7OnClick:
;MikromediaGreenhouseProject_events_code.c,159 :: 		void servo_position_button_7OnClick() {
;MikromediaGreenhouseProject_events_code.c,160 :: 		servo_pos = 130;
MOVS	R1, #130
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,161 :: 		servo_pos_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_pos_change_flag+0)
MOVT	R0, #hi_addr(_servo_pos_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,162 :: 		}
L_end_servo_position_button_7OnClick:
BX	LR
; end of _servo_position_button_7OnClick
_servo_position_button_8OnClick:
;MikromediaGreenhouseProject_events_code.c,163 :: 		void servo_position_button_8OnClick() {
;MikromediaGreenhouseProject_events_code.c,164 :: 		servo_pos = 150;
MOVS	R1, #150
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,165 :: 		servo_pos_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_pos_change_flag+0)
MOVT	R0, #hi_addr(_servo_pos_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,166 :: 		}
L_end_servo_position_button_8OnClick:
BX	LR
; end of _servo_position_button_8OnClick
_servo_position_button_9OnClick:
;MikromediaGreenhouseProject_events_code.c,167 :: 		void servo_position_button_9OnClick() {
;MikromediaGreenhouseProject_events_code.c,168 :: 		servo_pos = 170;
MOVS	R1, #170
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,169 :: 		servo_pos_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_pos_change_flag+0)
MOVT	R0, #hi_addr(_servo_pos_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,170 :: 		}
L_end_servo_position_button_9OnClick:
BX	LR
; end of _servo_position_button_9OnClick
_fan_speed_button_1OnClick:
;MikromediaGreenhouseProject_events_code.c,171 :: 		void fan_speed_button_1OnClick() {
;MikromediaGreenhouseProject_events_code.c,172 :: 		fan_speed = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed+0)
MOVT	R0, #hi_addr(_fan_speed+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,173 :: 		fan_speed_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_change_flag+0)
MOVT	R0, #hi_addr(_fan_speed_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,174 :: 		}
L_end_fan_speed_button_1OnClick:
BX	LR
; end of _fan_speed_button_1OnClick
_fan_speed_button_2OnClick:
;MikromediaGreenhouseProject_events_code.c,175 :: 		void fan_speed_button_2OnClick() {
;MikromediaGreenhouseProject_events_code.c,176 :: 		fan_speed = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_fan_speed+0)
MOVT	R0, #hi_addr(_fan_speed+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,177 :: 		fan_speed_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_change_flag+0)
MOVT	R0, #hi_addr(_fan_speed_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,178 :: 		}
L_end_fan_speed_button_2OnClick:
BX	LR
; end of _fan_speed_button_2OnClick
_fan_speed_button_3OnClick:
;MikromediaGreenhouseProject_events_code.c,179 :: 		void fan_speed_button_3OnClick() {
;MikromediaGreenhouseProject_events_code.c,180 :: 		fan_speed = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_fan_speed+0)
MOVT	R0, #hi_addr(_fan_speed+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,181 :: 		fan_speed_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_change_flag+0)
MOVT	R0, #hi_addr(_fan_speed_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,182 :: 		}
L_end_fan_speed_button_3OnClick:
BX	LR
; end of _fan_speed_button_3OnClick
_fan_speed_button_4OnClick:
;MikromediaGreenhouseProject_events_code.c,183 :: 		void fan_speed_button_4OnClick() {
;MikromediaGreenhouseProject_events_code.c,184 :: 		fan_speed = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_fan_speed+0)
MOVT	R0, #hi_addr(_fan_speed+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,185 :: 		fan_speed_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_change_flag+0)
MOVT	R0, #hi_addr(_fan_speed_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,186 :: 		}
L_end_fan_speed_button_4OnClick:
BX	LR
; end of _fan_speed_button_4OnClick
_fan_speed_button_5OnClick:
;MikromediaGreenhouseProject_events_code.c,187 :: 		void fan_speed_button_5OnClick() {
;MikromediaGreenhouseProject_events_code.c,188 :: 		fan_speed = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_fan_speed+0)
MOVT	R0, #hi_addr(_fan_speed+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,189 :: 		fan_speed_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_change_flag+0)
MOVT	R0, #hi_addr(_fan_speed_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,190 :: 		}
L_end_fan_speed_button_5OnClick:
BX	LR
; end of _fan_speed_button_5OnClick
_fan_speed_button_6OnClick:
;MikromediaGreenhouseProject_events_code.c,191 :: 		void fan_speed_button_6OnClick() {
;MikromediaGreenhouseProject_events_code.c,192 :: 		fan_speed = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_fan_speed+0)
MOVT	R0, #hi_addr(_fan_speed+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,193 :: 		fan_speed_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_change_flag+0)
MOVT	R0, #hi_addr(_fan_speed_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,194 :: 		}
L_end_fan_speed_button_6OnClick:
BX	LR
; end of _fan_speed_button_6OnClick
_fan_speed_button_7OnClick:
;MikromediaGreenhouseProject_events_code.c,195 :: 		void fan_speed_button_7OnClick() {
;MikromediaGreenhouseProject_events_code.c,196 :: 		fan_speed = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_fan_speed+0)
MOVT	R0, #hi_addr(_fan_speed+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,197 :: 		fan_speed_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_change_flag+0)
MOVT	R0, #hi_addr(_fan_speed_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,198 :: 		}
L_end_fan_speed_button_7OnClick:
BX	LR
; end of _fan_speed_button_7OnClick
_fan_speed_button_stopOnClick:
;MikromediaGreenhouseProject_events_code.c,199 :: 		void fan_speed_button_stopOnClick() {
;MikromediaGreenhouseProject_events_code.c,200 :: 		fan_speed = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed+0)
MOVT	R0, #hi_addr(_fan_speed+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,201 :: 		fan_speed_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_change_flag+0)
MOVT	R0, #hi_addr(_fan_speed_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_events_code.c,202 :: 		}
L_end_fan_speed_button_stopOnClick:
BX	LR
; end of _fan_speed_button_stopOnClick
