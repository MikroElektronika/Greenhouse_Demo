MikromediaGreenhouseProject_main_g2c_configTimer:
;mikromediagreenhouseproject_timer.h,14 :: 		static void g2c_configTimer( )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromediagreenhouseproject_timer.h,16 :: 		RCC_APB1ENR.TIM3EN = 1;
MOVW	R1, #lo_addr(RCC_APB1ENR+0)
MOVT	R1, #hi_addr(RCC_APB1ENR+0)
LDR	R0, [R1, #0]
ORR	R0, R0, #2
STR	R0, [R1, #0]
;mikromediagreenhouseproject_timer.h,17 :: 		TIM3_CR1.CEN = 0;
MOVW	R1, #lo_addr(TIM3_CR1+0)
MOVT	R1, #hi_addr(TIM3_CR1+0)
LDR	R0, [R1, #0]
BFC	R0, #0, #1
STR	R0, [R1, #0]
;mikromediagreenhouseproject_timer.h,18 :: 		TIM3_PSC = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(TIM3_PSC+0)
MOVT	R0, #hi_addr(TIM3_PSC+0)
STR	R1, [R0, #0]
;mikromediagreenhouseproject_timer.h,19 :: 		TIM3_ARR = 49999;
MOVW	R1, #49999
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;mikromediagreenhouseproject_timer.h,20 :: 		NVIC_IntEnable( IVT_INT_TIM3 );
MOVW	R0, #45
BL	_NVIC_IntEnable+0
;mikromediagreenhouseproject_timer.h,21 :: 		TIM3_DIER.UIE = 1;
MOVW	R1, #lo_addr(TIM3_DIER+0)
MOVT	R1, #hi_addr(TIM3_DIER+0)
LDR	R0, [R1, #0]
ORR	R0, R0, #1
STR	R0, [R1, #0]
;mikromediagreenhouseproject_timer.h,22 :: 		TIM3_CR1.CEN = 1;
MOVW	R1, #lo_addr(TIM3_CR1+0)
MOVT	R1, #hi_addr(TIM3_CR1+0)
LDR	R0, [R1, #0]
ORR	R0, R0, #1
STR	R0, [R1, #0]
;mikromediagreenhouseproject_timer.h,23 :: 		}
L_end_g2c_configTimer:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of MikromediaGreenhouseProject_main_g2c_configTimer
_Timer_interrupt:
;mikromediagreenhouseproject_timer.h,25 :: 		void Timer_interrupt( ) iv IVT_INT_TIM3
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromediagreenhouseproject_timer.h,27 :: 		g2c_tick( );
BL	_g2c_tick+0
;mikromediagreenhouseproject_timer.h,28 :: 		taskTime++;
MOVW	R1, #lo_addr(_taskTime+0)
MOVT	R1, #hi_addr(_taskTime+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;mikromediagreenhouseproject_timer.h,29 :: 		TIM3_SR.UIF = 0;
MOVW	R1, #lo_addr(TIM3_SR+0)
MOVT	R1, #hi_addr(TIM3_SR+0)
LDR	R0, [R1, #0]
BFC	R0, #0, #1
STR	R0, [R1, #0]
;mikromediagreenhouseproject_timer.h,30 :: 		}
L_end_Timer_interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer_interrupt
_G2C_Int_Proc:
;MikromediaGreenhouseProject_main.c,166 :: 		void G2C_Int_Proc( ) iv IVT_INT_USART2 ics ICS_AUTO
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MikromediaGreenhouseProject_main.c,168 :: 		if( RXNE_USART2_ISR_bit )
MOVW	R0, #lo_addr(RXNE_USART2_ISR_bit+0)
MOVT	R0, #hi_addr(RXNE_USART2_ISR_bit+0)
_LX	[R0, ByteOffset(RXNE_USART2_ISR_bit+0)]
UBFX	R0, R1, BitPos(RXNE_USART2_ISR_bit+0), #1
CMP	R0, #0
IT	EQ
BEQ	L_G2C_Int_Proc0
;MikromediaGreenhouseProject_main.c,170 :: 		g2c_putc( UART2_Read( ) );
BL	_UART2_Read+0
UXTB	R0, R0
BL	_g2c_putc+0
;MikromediaGreenhouseProject_main.c,171 :: 		}
L_G2C_Int_Proc0:
;MikromediaGreenhouseProject_main.c,172 :: 		}
L_end_G2C_Int_Proc:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _G2C_Int_Proc
_systemInit:
;MikromediaGreenhouseProject_main.c,174 :: 		void systemInit( )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MikromediaGreenhouseProject_main.c,177 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_INPUT  );
MOVS	R2, #1
MOVS	R1, #7
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;MikromediaGreenhouseProject_main.c,178 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_RST_PIN, _GPIO_OUTPUT );
MOVS	R2, #0
MOVS	R1, #1
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;MikromediaGreenhouseProject_main.c,179 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN,  _GPIO_OUTPUT );
MOVS	R2, #0
MOVS	R1, #2
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;MikromediaGreenhouseProject_main.c,184 :: 		mikrobus_gpioInit( _MIKROBUS3, _MIKROBUS_INT_PIN, _GPIO_INPUT );
MOVS	R2, #1
MOVS	R1, #7
MOVS	R0, #2
BL	_mikrobus_gpioInit+0
;MikromediaGreenhouseProject_main.c,189 :: 		mikrobus_gpioInit( _MIKROBUS5, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );
MOVS	R2, #0
MOVS	R1, #2
MOVS	R0, #4
BL	_mikrobus_gpioInit+0
;MikromediaGreenhouseProject_main.c,192 :: 		mikrobus_uartInit( _MIKROBUS1, &_G2C_UART_CFG[0] );
MOVW	R0, #lo_addr(__G2C_UART_CFG+0)
MOVT	R0, #hi_addr(__G2C_UART_CFG+0)
MOV	R1, R0
MOVS	R0, #0
BL	_mikrobus_uartInit+0
;MikromediaGreenhouseProject_main.c,193 :: 		Delay_ms(300);
MOVW	R7, #34554
MOVT	R7, #915
NOP
NOP
L_systemInit1:
SUBS	R7, R7, #1
BNE	L_systemInit1
NOP
NOP
NOP
;MikromediaGreenhouseProject_main.c,196 :: 		mikrobus_i2cInit( _MIKROBUS2, &_TEMPHUM6_I2C_CFG[0] );
MOVW	R0, #lo_addr(__TEMPHUM6_I2C_CFG+0)
MOVT	R0, #hi_addr(__TEMPHUM6_I2C_CFG+0)
MOV	R1, R0
MOVS	R0, #1
BL	_mikrobus_i2cInit+0
;MikromediaGreenhouseProject_main.c,197 :: 		Delay_ms(500);
MOVW	R7, #57593
MOVT	R7, #1525
NOP
NOP
L_systemInit3:
SUBS	R7, R7, #1
BNE	L_systemInit3
NOP
NOP
NOP
NOP
;MikromediaGreenhouseProject_main.c,214 :: 		}
L_end_systemInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _systemInit
_applicationInit:
;MikromediaGreenhouseProject_main.c,216 :: 		void applicationInit( )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MikromediaGreenhouseProject_main.c,219 :: 		Start_TP( );
BL	_Start_TP+0
;MikromediaGreenhouseProject_main.c,220 :: 		Delay_ms(500);
MOVW	R7, #57593
MOVT	R7, #1525
NOP
NOP
L_applicationInit5:
SUBS	R7, R7, #1
BNE	L_applicationInit5
NOP
NOP
NOP
NOP
;MikromediaGreenhouseProject_main.c,222 :: 		drivers_init( );
BL	_drivers_init+0
;MikromediaGreenhouseProject_main.c,223 :: 		clicks_init( );
BL	_clicks_init+0
;MikromediaGreenhouseProject_main.c,225 :: 		taskTime = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_taskTime+0)
MOVT	R0, #hi_addr(_taskTime+0)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,227 :: 		servo_pos = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,228 :: 		servo_pos_1 = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_servo_pos_1+0)
MOVT	R0, #hi_addr(_servo_pos_1+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,229 :: 		servo_pos_2 = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_servo_pos_2+0)
MOVT	R0, #hi_addr(_servo_pos_2+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,230 :: 		servo_pos_3 = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_servo_pos_3+0)
MOVT	R0, #hi_addr(_servo_pos_3+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,231 :: 		servo_pos_4 = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_servo_pos_4+0)
MOVT	R0, #hi_addr(_servo_pos_4+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,232 :: 		servo_pos_5 = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_servo_pos_5+0)
MOVT	R0, #hi_addr(_servo_pos_5+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,233 :: 		servo_pos_6 = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_servo_pos_6+0)
MOVT	R0, #hi_addr(_servo_pos_6+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,234 :: 		servo_pos_7 = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_servo_pos_7+0)
MOVT	R0, #hi_addr(_servo_pos_7+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,235 :: 		servo_pos_8 = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_servo_pos_8+0)
MOVT	R0, #hi_addr(_servo_pos_8+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,236 :: 		servo_pos_9 = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_servo_pos_9+0)
MOVT	R0, #hi_addr(_servo_pos_9+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,237 :: 		servo_pos_10 = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_servo_pos_10+0)
MOVT	R0, #hi_addr(_servo_pos_10+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,238 :: 		servo_pos_11 = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_servo_pos_11+0)
MOVT	R0, #hi_addr(_servo_pos_11+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,239 :: 		servo_pos_12 = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_servo_pos_12+0)
MOVT	R0, #hi_addr(_servo_pos_12+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,240 :: 		servo_pos_13 = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_servo_pos_13+0)
MOVT	R0, #hi_addr(_servo_pos_13+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,241 :: 		servo_pos_14 = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_servo_pos_14+0)
MOVT	R0, #hi_addr(_servo_pos_14+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,242 :: 		servo_pos_15 = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_servo_pos_15+0)
MOVT	R0, #hi_addr(_servo_pos_15+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,243 :: 		servo_pos_16 = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_servo_pos_16+0)
MOVT	R0, #hi_addr(_servo_pos_16+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,244 :: 		servo_pos_all = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_servo_pos_all+0)
MOVT	R0, #hi_addr(_servo_pos_all+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,245 :: 		servo_pos_change_flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_pos_change_flag+0)
MOVT	R0, #hi_addr(_servo_pos_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,246 :: 		servo_num = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,247 :: 		servo_num_change_flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_num_change_flag+0)
MOVT	R0, #hi_addr(_servo_num_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,248 :: 		fan_speed = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed+0)
MOVT	R0, #hi_addr(_fan_speed+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,249 :: 		fan_speed_change_flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_change_flag+0)
MOVT	R0, #hi_addr(_fan_speed_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,251 :: 		basic_length = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_basic_length+0)
MOVT	R0, #hi_addr(_basic_length+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,252 :: 		reference1_length = strlen( g2c_actuarotRef_1 );
MOVW	R0, #lo_addr(MikromediaGreenhouseProject_main_g2c_actuarotRef_1+0)
MOVT	R0, #hi_addr(MikromediaGreenhouseProject_main_g2c_actuarotRef_1+0)
BL	_strlen+0
MOVW	R1, #lo_addr(_reference1_length+0)
MOVT	R1, #hi_addr(_reference1_length+0)
STRB	R0, [R1, #0]
;MikromediaGreenhouseProject_main.c,253 :: 		reference2_length = strlen( g2c_actuarotRef_2 );
MOVW	R0, #lo_addr(MikromediaGreenhouseProject_main_g2c_actuarotRef_2+0)
MOVT	R0, #hi_addr(MikromediaGreenhouseProject_main_g2c_actuarotRef_2+0)
BL	_strlen+0
MOVW	R1, #lo_addr(_reference2_length+0)
MOVT	R1, #hi_addr(_reference2_length+0)
STRB	R0, [R1, #0]
;MikromediaGreenhouseProject_main.c,254 :: 		message_flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_message_flag+0)
MOVT	R0, #hi_addr(_message_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,256 :: 		screen_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,258 :: 		temphum6_temperature = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temphum6_temperature+0)
MOVT	R0, #hi_addr(_temphum6_temperature+0)
VSTR	#1, S0, [R0, #0]
;MikromediaGreenhouseProject_main.c,259 :: 		last_temperature = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_last_temperature+0)
MOVT	R0, #hi_addr(_last_temperature+0)
VSTR	#1, S0, [R0, #0]
;MikromediaGreenhouseProject_main.c,260 :: 		temphum6_humidity = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temphum6_humidity+0)
MOVT	R0, #hi_addr(_temphum6_humidity+0)
VSTR	#1, S0, [R0, #0]
;MikromediaGreenhouseProject_main.c,261 :: 		last_humidity = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_last_humidity+0)
MOVT	R0, #hi_addr(_last_humidity+0)
VSTR	#1, S0, [R0, #0]
;MikromediaGreenhouseProject_main.c,263 :: 		uv3_data = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uv3_data+0)
MOVT	R0, #hi_addr(_uv3_data+0)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,264 :: 		last_uv = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_last_uv+0)
MOVT	R0, #hi_addr(_last_uv+0)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,265 :: 		uv3_riskLvl = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_uv3_riskLvl+0)
MOVT	R0, #hi_addr(_uv3_riskLvl+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,266 :: 		last_riskLvl = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_last_riskLvl+0)
MOVT	R0, #hi_addr(_last_riskLvl+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,268 :: 		ProgressBar1.Position = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,269 :: 		fan_speed_button_stop.Pen_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_stop+16)
MOVT	R0, #hi_addr(_fan_speed_button_stop+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,270 :: 		fan_speed_button_stop.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_stop+36)
MOVT	R0, #hi_addr(_fan_speed_button_stop+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,271 :: 		servo_number_button_all.Pen_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_all+16)
MOVT	R0, #hi_addr(_servo_number_button_all+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,272 :: 		servo_number_button_all.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_all+36)
MOVT	R0, #hi_addr(_servo_number_button_all+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,273 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;MikromediaGreenhouseProject_main.c,274 :: 		log_last( );
BL	_log_last+0
;MikromediaGreenhouseProject_main.c,275 :: 		}
L_end_applicationInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationInit
_applicationTask:
;MikromediaGreenhouseProject_main.c,277 :: 		void applicationTask( )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MikromediaGreenhouseProject_main.c,280 :: 		g2c_process( );
BL	_g2c_process+0
;MikromediaGreenhouseProject_main.c,283 :: 		I2C_Set_Active( &I2C1_Start, &I2C1_Read, &I2C1_Write );
MOVW	R2, #lo_addr(_I2C1_Write+0)
MOVT	R2, #hi_addr(_I2C1_Write+0)
MOVW	R1, #lo_addr(_I2C1_Read+0)
MOVT	R1, #hi_addr(_I2C1_Read+0)
MOVW	R0, #lo_addr(_I2C1_Start+0)
MOVT	R0, #hi_addr(_I2C1_Start+0)
BL	_I2C_Set_Active+0
;MikromediaGreenhouseProject_main.c,284 :: 		Delay_ms(1);
MOVW	R7, #3387
MOVT	R7, #3
NOP
NOP
L_applicationTask7:
SUBS	R7, R7, #1
BNE	L_applicationTask7
NOP
NOP
;MikromediaGreenhouseProject_main.c,285 :: 		Check_TP( );
BL	_Check_TP+0
;MikromediaGreenhouseProject_main.c,286 :: 		I2C_Set_Active(&I2C2_Start, &I2C2_Read, &I2C2_Write);
MOVW	R2, #lo_addr(_I2C2_Write+0)
MOVT	R2, #hi_addr(_I2C2_Write+0)
MOVW	R1, #lo_addr(_I2C2_Read+0)
MOVT	R1, #hi_addr(_I2C2_Read+0)
MOVW	R0, #lo_addr(_I2C2_Start+0)
MOVT	R0, #hi_addr(_I2C2_Start+0)
BL	_I2C_Set_Active+0
;MikromediaGreenhouseProject_main.c,287 :: 		Delay_ms(1);
MOVW	R7, #3387
MOVT	R7, #3
NOP
NOP
L_applicationTask9:
SUBS	R7, R7, #1
BNE	L_applicationTask9
NOP
NOP
;MikromediaGreenhouseProject_main.c,290 :: 		if (message_flag == 1)
MOVW	R0, #lo_addr(_message_flag+0)
MOVT	R0, #hi_addr(_message_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_applicationTask11
;MikromediaGreenhouseProject_main.c,292 :: 		parse_data( );
BL	_parse_data+0
;MikromediaGreenhouseProject_main.c,293 :: 		message_flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_message_flag+0)
MOVT	R0, #hi_addr(_message_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,294 :: 		}
L_applicationTask11:
;MikromediaGreenhouseProject_main.c,297 :: 		if (servo_num_change_flag == 1)
MOVW	R0, #lo_addr(_servo_num_change_flag+0)
MOVT	R0, #hi_addr(_servo_num_change_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_applicationTask12
;MikromediaGreenhouseProject_main.c,299 :: 		servo_position_log( );
BL	_servo_position_log+0
;MikromediaGreenhouseProject_main.c,300 :: 		g2c_packCmd( &_AT_DSET[0], &g2c_sensorRef_5[0], "Servo number changed" );
MOVW	R0, #lo_addr(?lstr1_MikromediaGreenhouseProject_main+0)
MOVT	R0, #hi_addr(?lstr1_MikromediaGreenhouseProject_main+0)
MOV	R2, R0
MOVW	R1, #lo_addr(MikromediaGreenhouseProject_main_g2c_sensorRef_5+0)
MOVT	R1, #hi_addr(MikromediaGreenhouseProject_main_g2c_sensorRef_5+0)
MOVW	R0, #lo_addr(MikromediaGreenhouseProject_main__AT_DSET+0)
MOVT	R0, #hi_addr(MikromediaGreenhouseProject_main__AT_DSET+0)
BL	_g2c_packCmd+0
;MikromediaGreenhouseProject_main.c,301 :: 		g2c_cmdSingle( &_AT_PUB[0] );
MOVW	R0, #lo_addr(MikromediaGreenhouseProject_main__AT_PUB+0)
MOVT	R0, #hi_addr(MikromediaGreenhouseProject_main__AT_PUB+0)
BL	_g2c_cmdSingle+0
;MikromediaGreenhouseProject_main.c,302 :: 		servo_num_change_flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_num_change_flag+0)
MOVT	R0, #hi_addr(_servo_num_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,303 :: 		}
L_applicationTask12:
;MikromediaGreenhouseProject_main.c,306 :: 		if (servo_pos_change_flag == 1)
MOVW	R0, #lo_addr(_servo_pos_change_flag+0)
MOVT	R0, #hi_addr(_servo_pos_change_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_applicationTask13
;MikromediaGreenhouseProject_main.c,308 :: 		servo_position( );
BL	_servo_position+0
;MikromediaGreenhouseProject_main.c,309 :: 		servo_position_log( );
BL	_servo_position_log+0
;MikromediaGreenhouseProject_main.c,310 :: 		g2c_packCmd( &_AT_DSET[0], &g2c_sensorRef_5[0], "Servo position changed" );
MOVW	R0, #lo_addr(?lstr2_MikromediaGreenhouseProject_main+0)
MOVT	R0, #hi_addr(?lstr2_MikromediaGreenhouseProject_main+0)
MOV	R2, R0
MOVW	R1, #lo_addr(MikromediaGreenhouseProject_main_g2c_sensorRef_5+0)
MOVT	R1, #hi_addr(MikromediaGreenhouseProject_main_g2c_sensorRef_5+0)
MOVW	R0, #lo_addr(MikromediaGreenhouseProject_main__AT_DSET+0)
MOVT	R0, #hi_addr(MikromediaGreenhouseProject_main__AT_DSET+0)
BL	_g2c_packCmd+0
;MikromediaGreenhouseProject_main.c,311 :: 		g2c_cmdSingle( &_AT_PUB[0] );
MOVW	R0, #lo_addr(MikromediaGreenhouseProject_main__AT_PUB+0)
MOVT	R0, #hi_addr(MikromediaGreenhouseProject_main__AT_PUB+0)
BL	_g2c_cmdSingle+0
;MikromediaGreenhouseProject_main.c,312 :: 		servo_pos_change_flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_servo_pos_change_flag+0)
MOVT	R0, #hi_addr(_servo_pos_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,313 :: 		}
L_applicationTask13:
;MikromediaGreenhouseProject_main.c,316 :: 		if (fan_speed_change_flag == 1)
MOVW	R0, #lo_addr(_fan_speed_change_flag+0)
MOVT	R0, #hi_addr(_fan_speed_change_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_applicationTask14
;MikromediaGreenhouseProject_main.c,318 :: 		fan3_setSpeed( fan_speed );
MOVW	R0, #lo_addr(_fan_speed+0)
MOVT	R0, #hi_addr(_fan_speed+0)
LDRB	R0, [R0, #0]
BL	_fan3_setSpeed+0
;MikromediaGreenhouseProject_main.c,319 :: 		fan_speed_log( );
BL	_fan_speed_log+0
;MikromediaGreenhouseProject_main.c,320 :: 		g2c_packCmd( &_AT_DSET[0], &g2c_sensorRef_5[0], "Fan speed changed" );
MOVW	R0, #lo_addr(?lstr3_MikromediaGreenhouseProject_main+0)
MOVT	R0, #hi_addr(?lstr3_MikromediaGreenhouseProject_main+0)
MOV	R2, R0
MOVW	R1, #lo_addr(MikromediaGreenhouseProject_main_g2c_sensorRef_5+0)
MOVT	R1, #hi_addr(MikromediaGreenhouseProject_main_g2c_sensorRef_5+0)
MOVW	R0, #lo_addr(MikromediaGreenhouseProject_main__AT_DSET+0)
MOVT	R0, #hi_addr(MikromediaGreenhouseProject_main__AT_DSET+0)
BL	_g2c_packCmd+0
;MikromediaGreenhouseProject_main.c,321 :: 		g2c_cmdSingle( &_AT_PUB[0] );
MOVW	R0, #lo_addr(MikromediaGreenhouseProject_main__AT_PUB+0)
MOVT	R0, #hi_addr(MikromediaGreenhouseProject_main__AT_PUB+0)
BL	_g2c_cmdSingle+0
;MikromediaGreenhouseProject_main.c,322 :: 		fan_speed_change_flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_fan_speed_change_flag+0)
MOVT	R0, #hi_addr(_fan_speed_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,323 :: 		}
L_applicationTask14:
;MikromediaGreenhouseProject_main.c,326 :: 		if (screen_flag == 1)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_applicationTask15
;MikromediaGreenhouseProject_main.c,328 :: 		I2C_Set_Active( &I2C1_Start, &I2C1_Read, &I2C1_Write );
MOVW	R2, #lo_addr(_I2C1_Write+0)
MOVT	R2, #hi_addr(_I2C1_Write+0)
MOVW	R1, #lo_addr(_I2C1_Read+0)
MOVT	R1, #hi_addr(_I2C1_Read+0)
MOVW	R0, #lo_addr(_I2C1_Start+0)
MOVT	R0, #hi_addr(_I2C1_Start+0)
BL	_I2C_Set_Active+0
;MikromediaGreenhouseProject_main.c,329 :: 		Delay_ms(1);
MOVW	R7, #3387
MOVT	R7, #3
NOP
NOP
L_applicationTask16:
SUBS	R7, R7, #1
BNE	L_applicationTask16
NOP
NOP
;MikromediaGreenhouseProject_main.c,330 :: 		log_data( );
BL	_log_data+0
;MikromediaGreenhouseProject_main.c,331 :: 		I2C_Set_Active(&I2C2_Start, &I2C2_Read, &I2C2_Write);
MOVW	R2, #lo_addr(_I2C2_Write+0)
MOVT	R2, #hi_addr(_I2C2_Write+0)
MOVW	R1, #lo_addr(_I2C2_Read+0)
MOVT	R1, #hi_addr(_I2C2_Read+0)
MOVW	R0, #lo_addr(_I2C2_Start+0)
MOVT	R0, #hi_addr(_I2C2_Start+0)
BL	_I2C_Set_Active+0
;MikromediaGreenhouseProject_main.c,332 :: 		Delay_ms(1);
MOVW	R7, #3387
MOVT	R7, #3
NOP
NOP
L_applicationTask18:
SUBS	R7, R7, #1
BNE	L_applicationTask18
NOP
NOP
;MikromediaGreenhouseProject_main.c,333 :: 		}
L_applicationTask15:
;MikromediaGreenhouseProject_main.c,336 :: 		if (taskTime > 5000)
MOVW	R0, #lo_addr(_taskTime+0)
MOVT	R0, #hi_addr(_taskTime+0)
LDRH	R1, [R0, #0]
MOVW	R0, #5000
CMP	R1, R0
IT	LS
BLS	L_applicationTask20
;MikromediaGreenhouseProject_main.c,338 :: 		taskTime = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_taskTime+0)
MOVT	R0, #hi_addr(_taskTime+0)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,339 :: 		collect_data( );
BL	_collect_data+0
;MikromediaGreenhouseProject_main.c,340 :: 		publish_data( );
BL	_publish_data+0
;MikromediaGreenhouseProject_main.c,341 :: 		}
L_applicationTask20:
;MikromediaGreenhouseProject_main.c,342 :: 		}
L_end_applicationTask:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationTask
_main:
;MikromediaGreenhouseProject_main.c,344 :: 		void main( )
;MikromediaGreenhouseProject_main.c,346 :: 		systemInit( );
BL	_systemInit+0
;MikromediaGreenhouseProject_main.c,347 :: 		applicationInit( );
BL	_applicationInit+0
;MikromediaGreenhouseProject_main.c,349 :: 		while (1)
L_main21:
;MikromediaGreenhouseProject_main.c,351 :: 		applicationTask( );
BL	_applicationTask+0
;MikromediaGreenhouseProject_main.c,352 :: 		}
IT	AL
BAL	L_main21
;MikromediaGreenhouseProject_main.c,353 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_g2c_default_handler:
;MikromediaGreenhouseProject_main.c,357 :: 		void g2c_default_handler( uint8_t * rsp, uint8_t * evArgs )
; rsp start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
MOV	R5, R0
; rsp end address is: 0 (R0)
; rsp start address is: 20 (R5)
;MikromediaGreenhouseProject_main.c,359 :: 		char cmd_act[ 5 ] = "+ACT";
MOVS	R2, #43
STRB	R2, [SP, #4]
MOVS	R2, #65
STRB	R2, [SP, #5]
MOVS	R2, #67
STRB	R2, [SP, #6]
MOVS	R2, #84
STRB	R2, [SP, #7]
MOVS	R2, #0
STRB	R2, [SP, #8]
;MikromediaGreenhouseProject_main.c,361 :: 		if (( 0 == strncmp( &cmd_act[0], rsp + 2, 4 ) ) && ( message_flag == 0 ))
ADDS	R3, R5, #2
ADD	R2, SP, #4
MOV	R1, R3
MOV	R0, R2
MOVS	R2, #4
BL	_strncmp+0
CMP	R0, #0
IT	NE
BNE	L__g2c_default_handler231
MOVW	R2, #lo_addr(_message_flag+0)
MOVT	R2, #hi_addr(_message_flag+0)
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	NE
BNE	L__g2c_default_handler230
L__g2c_default_handler229:
;MikromediaGreenhouseProject_main.c,363 :: 		strcpy( &message_buffer[0], &rsp[0] );
MOV	R1, R5
; rsp end address is: 20 (R5)
MOVW	R0, #lo_addr(_message_buffer+0)
MOVT	R0, #hi_addr(_message_buffer+0)
BL	_strcpy+0
;MikromediaGreenhouseProject_main.c,364 :: 		message_flag = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_message_flag+0)
MOVT	R2, #hi_addr(_message_flag+0)
STRB	R3, [R2, #0]
;MikromediaGreenhouseProject_main.c,361 :: 		if (( 0 == strncmp( &cmd_act[0], rsp + 2, 4 ) ) && ( message_flag == 0 ))
L__g2c_default_handler231:
L__g2c_default_handler230:
;MikromediaGreenhouseProject_main.c,366 :: 		}
L_end_g2c_default_handler:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _g2c_default_handler
_parse_data:
;MikromediaGreenhouseProject_main.c,368 :: 		void parse_data( )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MikromediaGreenhouseProject_main.c,370 :: 		message_length = strlen( message_buffer );
MOVW	R0, #lo_addr(_message_buffer+0)
MOVT	R0, #hi_addr(_message_buffer+0)
BL	_strlen+0
MOVW	R1, #lo_addr(_message_length+0)
MOVT	R1, #hi_addr(_message_length+0)
STRB	R0, [R1, #0]
;MikromediaGreenhouseProject_main.c,372 :: 		if (0 == strncmp( g2c_actuarotRef_1, message_buffer + 9, reference1_length ))
MOVW	R0, #lo_addr(_reference1_length+0)
MOVT	R0, #hi_addr(_reference1_length+0)
LDRB	R0, [R0, #0]
UXTB	R2, R0
MOVW	R1, #lo_addr(_message_buffer+9)
MOVT	R1, #hi_addr(_message_buffer+9)
MOVW	R0, #lo_addr(MikromediaGreenhouseProject_main_g2c_actuarotRef_1+0)
MOVT	R0, #hi_addr(MikromediaGreenhouseProject_main_g2c_actuarotRef_1+0)
BL	_strncmp+0
CMP	R0, #0
IT	NE
BNE	L_parse_data26
;MikromediaGreenhouseProject_main.c,374 :: 		data_length = message_length - basic_length - reference1_length;
MOVW	R0, #lo_addr(_basic_length+0)
MOVT	R0, #hi_addr(_basic_length+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_message_length+0)
MOVT	R0, #hi_addr(_message_length+0)
LDRB	R0, [R0, #0]
SUB	R1, R0, R1
SXTH	R1, R1
MOVW	R0, #lo_addr(_reference1_length+0)
MOVT	R0, #hi_addr(_reference1_length+0)
LDRB	R0, [R0, #0]
SUB	R1, R1, R0
MOVW	R0, #lo_addr(_data_length+0)
MOVT	R0, #hi_addr(_data_length+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,376 :: 		for (i = 0; i < data_length; i ++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRB	R1, [R0, #0]
L_parse_data27:
MOVW	R0, #lo_addr(_data_length+0)
MOVT	R0, #hi_addr(_data_length+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_parse_data28
;MikromediaGreenhouseProject_main.c,378 :: 		aux_servoPos[ i ] = message_buffer[ basic_length + reference1_length + i - 3 ];
MOVW	R3, #lo_addr(_i+0)
MOVT	R3, #hi_addr(_i+0)
LDRB	R1, [R3, #0]
MOVW	R0, #lo_addr(_aux_servoPos+0)
MOVT	R0, #hi_addr(_aux_servoPos+0)
ADDS	R2, R0, R1
MOVW	R0, #lo_addr(_reference1_length+0)
MOVT	R0, #hi_addr(_reference1_length+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_basic_length+0)
MOVT	R0, #hi_addr(_basic_length+0)
LDRB	R0, [R0, #0]
ADDS	R1, R0, R1
SXTH	R1, R1
MOV	R0, R3
LDRB	R0, [R0, #0]
ADDS	R0, R1, R0
SXTH	R0, R0
SUBS	R1, R0, #3
SXTH	R1, R1
MOVW	R0, #lo_addr(_message_buffer+0)
MOVT	R0, #hi_addr(_message_buffer+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
STRB	R0, [R2, #0]
;MikromediaGreenhouseProject_main.c,376 :: 		for (i = 0; i < data_length; i ++)
MOV	R0, R3
LDRB	R0, [R0, #0]
ADDS	R0, R0, #1
STRB	R0, [R3, #0]
;MikromediaGreenhouseProject_main.c,379 :: 		}
IT	AL
BAL	L_parse_data27
L_parse_data28:
;MikromediaGreenhouseProject_main.c,380 :: 		aux_servoPos[ data_length ] = 0x00;
MOVW	R0, #lo_addr(_data_length+0)
MOVT	R0, #hi_addr(_data_length+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_aux_servoPos+0)
MOVT	R0, #hi_addr(_aux_servoPos+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;MikromediaGreenhouseProject_main.c,382 :: 		servo_pos = StrToShort( aux_servoPos );
MOVW	R0, #lo_addr(_aux_servoPos+0)
MOVT	R0, #hi_addr(_aux_servoPos+0)
BL	_StrToShort+0
MOVW	R1, #lo_addr(_servo_pos+0)
MOVT	R1, #hi_addr(_servo_pos+0)
STRB	R0, [R1, #0]
;MikromediaGreenhouseProject_main.c,384 :: 		servo_pos_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_pos_change_flag+0)
MOVT	R0, #hi_addr(_servo_pos_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,385 :: 		}
L_parse_data26:
;MikromediaGreenhouseProject_main.c,386 :: 		if (0 == strncmp( g2c_actuarotRef_2, message_buffer + 9, reference2_length ))
MOVW	R0, #lo_addr(_reference2_length+0)
MOVT	R0, #hi_addr(_reference2_length+0)
LDRB	R0, [R0, #0]
UXTB	R2, R0
MOVW	R1, #lo_addr(_message_buffer+9)
MOVT	R1, #hi_addr(_message_buffer+9)
MOVW	R0, #lo_addr(MikromediaGreenhouseProject_main_g2c_actuarotRef_2+0)
MOVT	R0, #hi_addr(MikromediaGreenhouseProject_main_g2c_actuarotRef_2+0)
BL	_strncmp+0
CMP	R0, #0
IT	NE
BNE	L_parse_data30
;MikromediaGreenhouseProject_main.c,388 :: 		data_length = message_length - basic_length - reference1_length;
MOVW	R0, #lo_addr(_basic_length+0)
MOVT	R0, #hi_addr(_basic_length+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_message_length+0)
MOVT	R0, #hi_addr(_message_length+0)
LDRB	R0, [R0, #0]
SUB	R1, R0, R1
SXTH	R1, R1
MOVW	R0, #lo_addr(_reference1_length+0)
MOVT	R0, #hi_addr(_reference1_length+0)
LDRB	R0, [R0, #0]
SUB	R1, R1, R0
MOVW	R0, #lo_addr(_data_length+0)
MOVT	R0, #hi_addr(_data_length+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,390 :: 		for (i = 0; i < data_length; i ++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRB	R1, [R0, #0]
L_parse_data31:
MOVW	R0, #lo_addr(_data_length+0)
MOVT	R0, #hi_addr(_data_length+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_parse_data32
;MikromediaGreenhouseProject_main.c,392 :: 		aux_fanSpeed[ i ] = message_buffer[ basic_length + reference1_length + i - 3 ];
MOVW	R3, #lo_addr(_i+0)
MOVT	R3, #hi_addr(_i+0)
LDRB	R1, [R3, #0]
MOVW	R0, #lo_addr(_aux_fanSpeed+0)
MOVT	R0, #hi_addr(_aux_fanSpeed+0)
ADDS	R2, R0, R1
MOVW	R0, #lo_addr(_reference1_length+0)
MOVT	R0, #hi_addr(_reference1_length+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_basic_length+0)
MOVT	R0, #hi_addr(_basic_length+0)
LDRB	R0, [R0, #0]
ADDS	R1, R0, R1
SXTH	R1, R1
MOV	R0, R3
LDRB	R0, [R0, #0]
ADDS	R0, R1, R0
SXTH	R0, R0
SUBS	R1, R0, #3
SXTH	R1, R1
MOVW	R0, #lo_addr(_message_buffer+0)
MOVT	R0, #hi_addr(_message_buffer+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
STRB	R0, [R2, #0]
;MikromediaGreenhouseProject_main.c,390 :: 		for (i = 0; i < data_length; i ++)
MOV	R0, R3
LDRB	R0, [R0, #0]
ADDS	R0, R0, #1
STRB	R0, [R3, #0]
;MikromediaGreenhouseProject_main.c,393 :: 		}
IT	AL
BAL	L_parse_data31
L_parse_data32:
;MikromediaGreenhouseProject_main.c,394 :: 		aux_fanSpeed[ data_length ] = 0x00;
MOVW	R0, #lo_addr(_data_length+0)
MOVT	R0, #hi_addr(_data_length+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_aux_fanSpeed+0)
MOVT	R0, #hi_addr(_aux_fanSpeed+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;MikromediaGreenhouseProject_main.c,396 :: 		fan_speed = StrToShort( aux_fanSpeed );
MOVW	R0, #lo_addr(_aux_fanSpeed+0)
MOVT	R0, #hi_addr(_aux_fanSpeed+0)
BL	_StrToShort+0
MOVW	R1, #lo_addr(_fan_speed+0)
MOVT	R1, #hi_addr(_fan_speed+0)
STRB	R0, [R1, #0]
;MikromediaGreenhouseProject_main.c,398 :: 		fan_speed_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_fan_speed_change_flag+0)
MOVT	R0, #hi_addr(_fan_speed_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,399 :: 		}
L_parse_data30:
;MikromediaGreenhouseProject_main.c,400 :: 		if (0 == strncmp( g2c_actuarotRef_3, message_buffer + 9, reference1_length ))
MOVW	R0, #lo_addr(_reference1_length+0)
MOVT	R0, #hi_addr(_reference1_length+0)
LDRB	R0, [R0, #0]
UXTB	R2, R0
MOVW	R1, #lo_addr(_message_buffer+9)
MOVT	R1, #hi_addr(_message_buffer+9)
MOVW	R0, #lo_addr(MikromediaGreenhouseProject_main_g2c_actuarotRef_3+0)
MOVT	R0, #hi_addr(MikromediaGreenhouseProject_main_g2c_actuarotRef_3+0)
BL	_strncmp+0
CMP	R0, #0
IT	NE
BNE	L_parse_data34
;MikromediaGreenhouseProject_main.c,402 :: 		data_length = message_length - basic_length - reference1_length;
MOVW	R0, #lo_addr(_basic_length+0)
MOVT	R0, #hi_addr(_basic_length+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_message_length+0)
MOVT	R0, #hi_addr(_message_length+0)
LDRB	R0, [R0, #0]
SUB	R1, R0, R1
SXTH	R1, R1
MOVW	R0, #lo_addr(_reference1_length+0)
MOVT	R0, #hi_addr(_reference1_length+0)
LDRB	R0, [R0, #0]
SUB	R1, R1, R0
MOVW	R0, #lo_addr(_data_length+0)
MOVT	R0, #hi_addr(_data_length+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,404 :: 		for (i = 0; i < data_length; i ++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRB	R1, [R0, #0]
L_parse_data35:
MOVW	R0, #lo_addr(_data_length+0)
MOVT	R0, #hi_addr(_data_length+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_parse_data36
;MikromediaGreenhouseProject_main.c,406 :: 		aux_servoNum[ i ] = message_buffer[ basic_length + reference1_length + i - 3 ];
MOVW	R3, #lo_addr(_i+0)
MOVT	R3, #hi_addr(_i+0)
LDRB	R1, [R3, #0]
MOVW	R0, #lo_addr(_aux_servoNum+0)
MOVT	R0, #hi_addr(_aux_servoNum+0)
ADDS	R2, R0, R1
MOVW	R0, #lo_addr(_reference1_length+0)
MOVT	R0, #hi_addr(_reference1_length+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_basic_length+0)
MOVT	R0, #hi_addr(_basic_length+0)
LDRB	R0, [R0, #0]
ADDS	R1, R0, R1
SXTH	R1, R1
MOV	R0, R3
LDRB	R0, [R0, #0]
ADDS	R0, R1, R0
SXTH	R0, R0
SUBS	R1, R0, #3
SXTH	R1, R1
MOVW	R0, #lo_addr(_message_buffer+0)
MOVT	R0, #hi_addr(_message_buffer+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
STRB	R0, [R2, #0]
;MikromediaGreenhouseProject_main.c,404 :: 		for (i = 0; i < data_length; i ++)
MOV	R0, R3
LDRB	R0, [R0, #0]
ADDS	R0, R0, #1
STRB	R0, [R3, #0]
;MikromediaGreenhouseProject_main.c,407 :: 		}
IT	AL
BAL	L_parse_data35
L_parse_data36:
;MikromediaGreenhouseProject_main.c,408 :: 		aux_servoNum[ data_length ] = 0x00;
MOVW	R0, #lo_addr(_data_length+0)
MOVT	R0, #hi_addr(_data_length+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_aux_servoNum+0)
MOVT	R0, #hi_addr(_aux_servoNum+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;MikromediaGreenhouseProject_main.c,410 :: 		servo_num = StrToShort( aux_servoNum );
MOVW	R0, #lo_addr(_aux_servoNum+0)
MOVT	R0, #hi_addr(_aux_servoNum+0)
BL	_StrToShort+0
MOVW	R1, #lo_addr(_servo_num+0)
MOVT	R1, #hi_addr(_servo_num+0)
STRB	R0, [R1, #0]
;MikromediaGreenhouseProject_main.c,412 :: 		servo_num_change_flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_servo_num_change_flag+0)
MOVT	R0, #hi_addr(_servo_num_change_flag+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,413 :: 		}
L_parse_data34:
;MikromediaGreenhouseProject_main.c,414 :: 		}
L_end_parse_data:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _parse_data
_g2c_packCmd:
;MikromediaGreenhouseProject_main.c,416 :: 		void g2c_packCmd( uint8_t * cmd, uint8_t * mid, uint8_t * _end )
; _end start address is: 8 (R2)
; mid start address is: 4 (R1)
; cmd start address is: 0 (R0)
SUB	SP, SP, #116
STR	LR, [SP, #0]
MOV	R8, R0
MOV	R6, R1
MOV	R7, R2
; _end end address is: 8 (R2)
; mid end address is: 4 (R1)
; cmd end address is: 0 (R0)
; cmd start address is: 32 (R8)
; mid start address is: 24 (R6)
; _end start address is: 28 (R7)
;MikromediaGreenhouseProject_main.c,418 :: 		char cmd_param[ 10 ] = "=\"";
ADD	R11, SP, #84
ADD	R10, R11, #30
MOVW	R12, #lo_addr(?ICSg2c_packCmd_cmd_param_L0+0)
MOVT	R12, #hi_addr(?ICSg2c_packCmd_cmd_param_L0+0)
BL	___CC2DW+0
;MikromediaGreenhouseProject_main.c,419 :: 		char mid_param[ 10 ] = "\",\"";
;MikromediaGreenhouseProject_main.c,420 :: 		char end_param[ 10 ] = "\"";
;MikromediaGreenhouseProject_main.c,423 :: 		memset( &tmpBuf[ 0 ], 0, 50 );
ADD	R3, SP, #4
MOVS	R2, #50
SXTH	R2, R2
MOVS	R1, #0
MOV	R0, R3
BL	_memset+0
;MikromediaGreenhouseProject_main.c,425 :: 		strcat ( &tmpBuf[ 0 ], cmd );
ADD	R3, SP, #4
MOV	R1, R8
; cmd end address is: 32 (R8)
MOV	R0, R3
BL	_strcat+0
;MikromediaGreenhouseProject_main.c,426 :: 		strcat ( &tmpBuf[ 0 ], &cmd_param[0] );
ADD	R4, SP, #84
ADD	R3, SP, #4
MOV	R1, R4
MOV	R0, R3
BL	_strcat+0
;MikromediaGreenhouseProject_main.c,427 :: 		strcat ( &tmpBuf[ 0 ], mid );
ADD	R3, SP, #4
MOV	R1, R6
; mid end address is: 24 (R6)
MOV	R0, R3
BL	_strcat+0
;MikromediaGreenhouseProject_main.c,428 :: 		strcat ( &tmpBuf[ 0 ], &mid_param[0] );
ADD	R4, SP, #94
ADD	R3, SP, #4
MOV	R1, R4
MOV	R0, R3
BL	_strcat+0
;MikromediaGreenhouseProject_main.c,429 :: 		strcat ( &tmpBuf[ 0 ], _end );
ADD	R3, SP, #4
MOV	R1, R7
; _end end address is: 28 (R7)
MOV	R0, R3
BL	_strcat+0
;MikromediaGreenhouseProject_main.c,430 :: 		strcat ( &tmpBuf[ 0 ], &end_param[0] );
ADD	R4, SP, #104
ADD	R3, SP, #4
MOV	R1, R4
MOV	R0, R3
BL	_strcat+0
;MikromediaGreenhouseProject_main.c,432 :: 		g2c_cmdSingle( &tmpBuf[ 0 ] );
ADD	R3, SP, #4
MOV	R0, R3
BL	_g2c_cmdSingle+0
;MikromediaGreenhouseProject_main.c,433 :: 		}
L_end_g2c_packCmd:
LDR	LR, [SP, #0]
ADD	SP, SP, #116
BX	LR
; end of _g2c_packCmd
_drivers_init:
;MikromediaGreenhouseProject_main.c,435 :: 		void drivers_init( )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MikromediaGreenhouseProject_main.c,438 :: 		g2c_uartDriverInit( (T_G2C_P)&_MIKROBUS1_GPIO, (T_G2C_P)&_MIKROBUS1_UART );
MOVW	R1, #lo_addr(__MIKROBUS1_UART+0)
MOVT	R1, #hi_addr(__MIKROBUS1_UART+0)
MOVW	R0, #lo_addr(__MIKROBUS1_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS1_GPIO+0)
BL	_g2c_uartDriverInit+0
;MikromediaGreenhouseProject_main.c,439 :: 		Delay_ms(300);
MOVW	R7, #34554
MOVT	R7, #915
NOP
NOP
L_drivers_init38:
SUBS	R7, R7, #1
BNE	L_drivers_init38
NOP
NOP
NOP
;MikromediaGreenhouseProject_main.c,441 :: 		RXNEIE_USART2_CR1_bit = 1;
MOVW	R1, #lo_addr(RXNEIE_USART2_CR1_bit+0)
MOVT	R1, #hi_addr(RXNEIE_USART2_CR1_bit+0)
_LX	[R1, ByteOffset(RXNEIE_USART2_CR1_bit+0)]
ORR	R0, R0, BitMask(RXNEIE_USART2_CR1_bit+0)
_SX	[R1, ByteOffset(RXNEIE_USART2_CR1_bit+0)]
;MikromediaGreenhouseProject_main.c,442 :: 		NVIC_IntEnable( IVT_INT_USART2 );
MOVW	R0, #54
BL	_NVIC_IntEnable+0
;MikromediaGreenhouseProject_main.c,444 :: 		g2c_configTimer( );
BL	MikromediaGreenhouseProject_main_g2c_configTimer+0
;MikromediaGreenhouseProject_main.c,445 :: 		Delay_ms(100);
MOVW	R7, #11515
MOVT	R7, #305
NOP
NOP
L_drivers_init40:
SUBS	R7, R7, #1
BNE	L_drivers_init40
NOP
NOP
;MikromediaGreenhouseProject_main.c,448 :: 		temphum6_i2cDriverInit( (T_TEMPHUM6_P)&_MIKROBUS2_GPIO, (T_TEMPHUM6_P)&_MIKROBUS2_I2C, 0x43 );
MOVS	R2, #67
MOVW	R1, #lo_addr(__MIKROBUS2_I2C+0)
MOVT	R1, #hi_addr(__MIKROBUS2_I2C+0)
MOVW	R0, #lo_addr(__MIKROBUS2_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS2_GPIO+0)
BL	_temphum6_i2cDriverInit+0
;MikromediaGreenhouseProject_main.c,449 :: 		Delay_ms(300);
MOVW	R7, #34554
MOVT	R7, #915
NOP
NOP
L_drivers_init42:
SUBS	R7, R7, #1
BNE	L_drivers_init42
NOP
NOP
NOP
;MikromediaGreenhouseProject_main.c,452 :: 		uv3_i2cDriverInit( (T_UV3_P)&_MIKROBUS3_GPIO, (T_UV3_P)&_MIKROBUS3_I2C, 0x38 );
MOVS	R2, #56
MOVW	R1, #lo_addr(__MIKROBUS3_I2C+0)
MOVT	R1, #hi_addr(__MIKROBUS3_I2C+0)
MOVW	R0, #lo_addr(__MIKROBUS3_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS3_GPIO+0)
BL	_uv3_i2cDriverInit+0
;MikromediaGreenhouseProject_main.c,453 :: 		Delay_ms(300);
MOVW	R7, #34554
MOVT	R7, #915
NOP
NOP
L_drivers_init44:
SUBS	R7, R7, #1
BNE	L_drivers_init44
NOP
NOP
NOP
;MikromediaGreenhouseProject_main.c,456 :: 		fan3_i2cDriverInit( (T_FAN3_P)&_MIKROBUS4_GPIO, (T_FAN3_P)&_MIKROBUS4_I2C, 0x20 );
MOVS	R2, #32
MOVW	R1, #lo_addr(__MIKROBUS4_I2C+0)
MOVT	R1, #hi_addr(__MIKROBUS4_I2C+0)
MOVW	R0, #lo_addr(__MIKROBUS4_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS4_GPIO+0)
BL	_fan3_i2cDriverInit+0
;MikromediaGreenhouseProject_main.c,457 :: 		Delay_ms(300);
MOVW	R7, #34554
MOVT	R7, #915
NOP
NOP
L_drivers_init46:
SUBS	R7, R7, #1
BNE	L_drivers_init46
NOP
NOP
NOP
;MikromediaGreenhouseProject_main.c,460 :: 		servo_i2cDriverInit( (T_SERVO_P)&_MIKROBUS5_GPIO, (T_SERVO_P)&_MIKROBUS5_I2C, 0x40, 0x14 );
MOVS	R3, #20
MOVS	R2, #64
MOVW	R1, #lo_addr(__MIKROBUS5_I2C+0)
MOVT	R1, #hi_addr(__MIKROBUS5_I2C+0)
MOVW	R0, #lo_addr(__MIKROBUS5_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS5_GPIO+0)
BL	_servo_i2cDriverInit+0
;MikromediaGreenhouseProject_main.c,461 :: 		Delay_ms(300);
MOVW	R7, #34554
MOVT	R7, #915
NOP
NOP
L_drivers_init48:
SUBS	R7, R7, #1
BNE	L_drivers_init48
NOP
NOP
NOP
;MikromediaGreenhouseProject_main.c,462 :: 		}
L_end_drivers_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _drivers_init
_clicks_init:
;MikromediaGreenhouseProject_main.c,464 :: 		void clicks_init( )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MikromediaGreenhouseProject_main.c,467 :: 		g2c_coreInit( g2c_default_handler, 5000 );
MOVW	R0, #lo_addr(_g2c_default_handler+0)
MOVT	R0, #hi_addr(_g2c_default_handler+0)
MOVW	R1, #5000
BL	_g2c_coreInit+0
;MikromediaGreenhouseProject_main.c,468 :: 		Delay_ms(300);
MOVW	R7, #34554
MOVT	R7, #915
NOP
NOP
L_clicks_init50:
SUBS	R7, R7, #1
BNE	L_clicks_init50
NOP
NOP
NOP
;MikromediaGreenhouseProject_main.c,469 :: 		g2c_modulePower( false );
MOVS	R0, #0
BL	_g2c_modulePower+0
;MikromediaGreenhouseProject_main.c,470 :: 		Delay_ms(300);
MOVW	R7, #34554
MOVT	R7, #915
NOP
NOP
L_clicks_init52:
SUBS	R7, R7, #1
BNE	L_clicks_init52
NOP
NOP
NOP
;MikromediaGreenhouseProject_main.c,471 :: 		g2c_modulePower( true );
MOVS	R0, #1
BL	_g2c_modulePower+0
;MikromediaGreenhouseProject_main.c,472 :: 		Delay_ms(7000);
MOVW	R7, #19963
MOVT	R7, #21362
NOP
NOP
L_clicks_init54:
SUBS	R7, R7, #1
BNE	L_clicks_init54
NOP
NOP
;MikromediaGreenhouseProject_main.c,474 :: 		g2c_cmdSingle( &_AT[0] );
MOVW	R0, #lo_addr(MikromediaGreenhouseProject_main__AT+0)
MOVT	R0, #hi_addr(MikromediaGreenhouseProject_main__AT+0)
BL	_g2c_cmdSingle+0
;MikromediaGreenhouseProject_main.c,475 :: 		g2c_cmdSingle( &_AT[0] );
MOVW	R0, #lo_addr(MikromediaGreenhouseProject_main__AT+0)
MOVT	R0, #hi_addr(MikromediaGreenhouseProject_main__AT+0)
BL	_g2c_cmdSingle+0
;MikromediaGreenhouseProject_main.c,476 :: 		g2c_cmdSingle( &_AT[0] );
MOVW	R0, #lo_addr(MikromediaGreenhouseProject_main__AT+0)
MOVT	R0, #hi_addr(MikromediaGreenhouseProject_main__AT+0)
BL	_g2c_cmdSingle+0
;MikromediaGreenhouseProject_main.c,477 :: 		g2c_cmdSingle( &_AT_CEN[0] );
MOVW	R0, #lo_addr(MikromediaGreenhouseProject_main__AT_CEN+0)
MOVT	R0, #hi_addr(MikromediaGreenhouseProject_main__AT_CEN+0)
BL	_g2c_cmdSingle+0
;MikromediaGreenhouseProject_main.c,478 :: 		g2c_packCmd  ( &_AT_NWCR[0], &g2c_networkName[0], &g2c_networkPassword[0]);
MOVW	R2, #lo_addr(MikromediaGreenhouseProject_main_g2c_networkPassword+0)
MOVT	R2, #hi_addr(MikromediaGreenhouseProject_main_g2c_networkPassword+0)
MOVW	R1, #lo_addr(MikromediaGreenhouseProject_main_g2c_networkName+0)
MOVT	R1, #hi_addr(MikromediaGreenhouseProject_main_g2c_networkName+0)
MOVW	R0, #lo_addr(MikromediaGreenhouseProject_main__AT_NWCR+0)
MOVT	R0, #hi_addr(MikromediaGreenhouseProject_main__AT_NWCR+0)
BL	_g2c_packCmd+0
;MikromediaGreenhouseProject_main.c,479 :: 		g2c_cmdSingle( &_AT_NWC[0] );
MOVW	R0, #lo_addr(MikromediaGreenhouseProject_main__AT_NWC+0)
MOVT	R0, #hi_addr(MikromediaGreenhouseProject_main__AT_NWC+0)
BL	_g2c_cmdSingle+0
;MikromediaGreenhouseProject_main.c,480 :: 		g2c_packCmd  ( &_AT_BRCR[0], &g2c_devKey[0], &g2c_devPass[0]);
MOVW	R2, #lo_addr(MikromediaGreenhouseProject_main_g2c_devPass+0)
MOVT	R2, #hi_addr(MikromediaGreenhouseProject_main_g2c_devPass+0)
MOVW	R1, #lo_addr(MikromediaGreenhouseProject_main_g2c_devKey+0)
MOVT	R1, #hi_addr(MikromediaGreenhouseProject_main_g2c_devKey+0)
MOVW	R0, #lo_addr(MikromediaGreenhouseProject_main__AT_BRCR+0)
MOVT	R0, #hi_addr(MikromediaGreenhouseProject_main__AT_BRCR+0)
BL	_g2c_packCmd+0
;MikromediaGreenhouseProject_main.c,481 :: 		g2c_cmdSingle( &_AT_BRC[0] );
MOVW	R0, #lo_addr(MikromediaGreenhouseProject_main__AT_BRC+0)
MOVT	R0, #hi_addr(MikromediaGreenhouseProject_main__AT_BRC+0)
BL	_g2c_cmdSingle+0
;MikromediaGreenhouseProject_main.c,482 :: 		Delay_ms(7000);
MOVW	R7, #19963
MOVT	R7, #21362
NOP
NOP
L_clicks_init56:
SUBS	R7, R7, #1
BNE	L_clicks_init56
NOP
NOP
;MikromediaGreenhouseProject_main.c,485 :: 		temphum6_reset( );
BL	_temphum6_reset+0
;MikromediaGreenhouseProject_main.c,486 :: 		Delay_ms(300);
MOVW	R7, #34554
MOVT	R7, #915
NOP
NOP
L_clicks_init58:
SUBS	R7, R7, #1
BNE	L_clicks_init58
NOP
NOP
NOP
;MikromediaGreenhouseProject_main.c,489 :: 		uv3_enableSensor( );
BL	_uv3_enableSensor+0
;MikromediaGreenhouseProject_main.c,490 :: 		Delay_ms(100);
MOVW	R7, #11515
MOVT	R7, #305
NOP
NOP
L_clicks_init60:
SUBS	R7, R7, #1
BNE	L_clicks_init60
NOP
NOP
;MikromediaGreenhouseProject_main.c,491 :: 		uv3_setIntegrationTime( _UV3_CMD_IT_4T );
MOVS	R0, #12
BL	_uv3_setIntegrationTime+0
;MikromediaGreenhouseProject_main.c,492 :: 		Delay_ms(100);
MOVW	R7, #11515
MOVT	R7, #305
NOP
NOP
L_clicks_init62:
SUBS	R7, R7, #1
BNE	L_clicks_init62
NOP
NOP
;MikromediaGreenhouseProject_main.c,495 :: 		fan3_setSpeed( fan_speed );
MOVW	R0, #lo_addr(_fan_speed+0)
MOVT	R0, #hi_addr(_fan_speed+0)
LDRB	R0, [R0, #0]
BL	_fan3_setSpeed+0
;MikromediaGreenhouseProject_main.c,496 :: 		Delay_ms(100);
MOVW	R7, #11515
MOVT	R7, #305
NOP
NOP
L_clicks_init64:
SUBS	R7, R7, #1
BNE	L_clicks_init64
NOP
NOP
;MikromediaGreenhouseProject_main.c,499 :: 		servo_init( 0, 180, _SERVO_DEFAULT_LOW_RESOLUTION, _SERVO_DEFAULT_HIGH_RESOLUTION );
MOVW	R3, #330
MOVW	R2, #0
MOVS	R1, #180
MOVS	R0, #0
BL	_servo_init+0
;MikromediaGreenhouseProject_main.c,500 :: 		servo_setVref( _SERVO_VREF_3300 );
MOVW	R0, #3300
BL	_servo_setVref+0
;MikromediaGreenhouseProject_main.c,501 :: 		servo_setMode( _SERVO_REG_MODE_1, _SERVO_MODE1_RESTART_ENABLE | _SERVO_MODE1_USE_ALL_CALL_ADR );
MOVS	R1, #129
MOVS	R0, #0
BL	_servo_setMode+0
;MikromediaGreenhouseProject_main.c,502 :: 		servo_sleep( );
BL	_servo_sleep+0
;MikromediaGreenhouseProject_main.c,503 :: 		servo_setFREQ( 30 );
MOVS	R0, #30
BL	_servo_setFREQ+0
;MikromediaGreenhouseProject_main.c,504 :: 		servo_setMode( _SERVO_REG_MODE_1,_SERVO_MODE1_RESTART_ENABLE| _SERVO_MODE1_AUTO_INCREMENT_ENABLE | _SERVO_MODE1_USE_ALL_CALL_ADR );
MOVS	R1, #161
MOVS	R0, #0
BL	_servo_setMode+0
;MikromediaGreenhouseProject_main.c,505 :: 		Delay_ms(100);
MOVW	R7, #11515
MOVT	R7, #305
NOP
NOP
L_clicks_init66:
SUBS	R7, R7, #1
BNE	L_clicks_init66
NOP
NOP
;MikromediaGreenhouseProject_main.c,506 :: 		servo_setPosition( _SERVO_MOTOR_1, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #6
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,507 :: 		servo_setPosition( _SERVO_MOTOR_2, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #10
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,508 :: 		servo_setPosition( _SERVO_MOTOR_3, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #14
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,509 :: 		servo_setPosition( _SERVO_MOTOR_4, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #18
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,510 :: 		servo_setPosition( _SERVO_MOTOR_5, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #22
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,511 :: 		servo_setPosition( _SERVO_MOTOR_6, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #26
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,512 :: 		servo_setPosition( _SERVO_MOTOR_7, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #30
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,513 :: 		servo_setPosition( _SERVO_MOTOR_8, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #34
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,514 :: 		servo_setPosition( _SERVO_MOTOR_9, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #38
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,515 :: 		servo_setPosition( _SERVO_MOTOR_10, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #42
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,516 :: 		servo_setPosition( _SERVO_MOTOR_11, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #46
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,517 :: 		servo_setPosition( _SERVO_MOTOR_12, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #50
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,518 :: 		servo_setPosition( _SERVO_MOTOR_13, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #54
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,519 :: 		servo_setPosition( _SERVO_MOTOR_14, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #58
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,520 :: 		servo_setPosition( _SERVO_MOTOR_15, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #62
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,521 :: 		servo_setPosition( _SERVO_MOTOR_16, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #66
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,522 :: 		}
L_end_clicks_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _clicks_init
_collect_data:
;MikromediaGreenhouseProject_main.c,524 :: 		void collect_data( )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MikromediaGreenhouseProject_main.c,527 :: 		temphum6_temperature = temphum6_readTemperature( _TEMPHUM6_TEMP_IN_CELSIUS );
MOVS	R0, #0
BL	_temphum6_readTemperature+0
MOVW	R0, #lo_addr(_temphum6_temperature+0)
MOVT	R0, #hi_addr(_temphum6_temperature+0)
VSTR	#1, S0, [R0, #0]
;MikromediaGreenhouseProject_main.c,530 :: 		temphum6_humidity = temphum6_readRelativeHuminidy( );
BL	_temphum6_readRelativeHuminidy+0
MOVW	R0, #lo_addr(_temphum6_humidity+0)
MOVT	R0, #hi_addr(_temphum6_humidity+0)
VSTR	#1, S0, [R0, #0]
;MikromediaGreenhouseProject_main.c,533 :: 		uv3_data = uv3_readMeasurements( );
BL	_uv3_readMeasurements+0
MOVW	R1, #lo_addr(_uv3_data+0)
MOVT	R1, #hi_addr(_uv3_data+0)
STRH	R0, [R1, #0]
;MikromediaGreenhouseProject_main.c,536 :: 		uv3_riskLvl = uv3_riskLevel( uv3_data );
BL	_uv3_riskLevel+0
MOVW	R1, #lo_addr(_uv3_riskLvl+0)
MOVT	R1, #hi_addr(_uv3_riskLvl+0)
STRB	R0, [R1, #0]
;MikromediaGreenhouseProject_main.c,537 :: 		}
L_end_collect_data:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _collect_data
_publish_data:
;MikromediaGreenhouseProject_main.c,539 :: 		void publish_data( )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MikromediaGreenhouseProject_main.c,542 :: 		FloatToStr( temphum6_temperature, demo_buffer );
MOVW	R0, #lo_addr(_temphum6_temperature+0)
MOVT	R0, #hi_addr(_temphum6_temperature+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_demo_buffer+0)
MOVT	R0, #hi_addr(_demo_buffer+0)
BL	_FloatToStr+0
;MikromediaGreenhouseProject_main.c,543 :: 		g2c_packCmd( &_AT_DSET[0], &g2c_sensorRef_1[0], &demo_buffer[0] );
MOVW	R2, #lo_addr(_demo_buffer+0)
MOVT	R2, #hi_addr(_demo_buffer+0)
MOVW	R1, #lo_addr(MikromediaGreenhouseProject_main_g2c_sensorRef_1+0)
MOVT	R1, #hi_addr(MikromediaGreenhouseProject_main_g2c_sensorRef_1+0)
MOVW	R0, #lo_addr(MikromediaGreenhouseProject_main__AT_DSET+0)
MOVT	R0, #hi_addr(MikromediaGreenhouseProject_main__AT_DSET+0)
BL	_g2c_packCmd+0
;MikromediaGreenhouseProject_main.c,546 :: 		FloatToStr( temphum6_humidity, demo_buffer );
MOVW	R0, #lo_addr(_temphum6_humidity+0)
MOVT	R0, #hi_addr(_temphum6_humidity+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_demo_buffer+0)
MOVT	R0, #hi_addr(_demo_buffer+0)
BL	_FloatToStr+0
;MikromediaGreenhouseProject_main.c,547 :: 		g2c_packCmd( &_AT_DSET[0], &g2c_sensorRef_2[0], &demo_buffer[0] );
MOVW	R2, #lo_addr(_demo_buffer+0)
MOVT	R2, #hi_addr(_demo_buffer+0)
MOVW	R1, #lo_addr(MikromediaGreenhouseProject_main_g2c_sensorRef_2+0)
MOVT	R1, #hi_addr(MikromediaGreenhouseProject_main_g2c_sensorRef_2+0)
MOVW	R0, #lo_addr(MikromediaGreenhouseProject_main__AT_DSET+0)
MOVT	R0, #hi_addr(MikromediaGreenhouseProject_main__AT_DSET+0)
BL	_g2c_packCmd+0
;MikromediaGreenhouseProject_main.c,550 :: 		WordToStrWithZeros( uv3_data, demo_buffer );
MOVW	R0, #lo_addr(_uv3_data+0)
MOVT	R0, #hi_addr(_uv3_data+0)
LDRH	R0, [R0, #0]
MOVW	R1, #lo_addr(_demo_buffer+0)
MOVT	R1, #hi_addr(_demo_buffer+0)
BL	_WordToStrWithZeros+0
;MikromediaGreenhouseProject_main.c,551 :: 		g2c_packCmd( &_AT_DSET[0], &g2c_sensorRef_3[0], &demo_buffer[0] );
MOVW	R2, #lo_addr(_demo_buffer+0)
MOVT	R2, #hi_addr(_demo_buffer+0)
MOVW	R1, #lo_addr(MikromediaGreenhouseProject_main_g2c_sensorRef_3+0)
MOVT	R1, #hi_addr(MikromediaGreenhouseProject_main_g2c_sensorRef_3+0)
MOVW	R0, #lo_addr(MikromediaGreenhouseProject_main__AT_DSET+0)
MOVT	R0, #hi_addr(MikromediaGreenhouseProject_main__AT_DSET+0)
BL	_g2c_packCmd+0
;MikromediaGreenhouseProject_main.c,553 :: 		memset( demo_buffer, 0, 50 );
MOVS	R2, #50
SXTH	R2, R2
MOVS	R1, #0
MOVW	R0, #lo_addr(_demo_buffer+0)
MOVT	R0, #hi_addr(_demo_buffer+0)
BL	_memset+0
;MikromediaGreenhouseProject_main.c,556 :: 		if ( uv3_riskLvl == _UV3_RAD_LOW       )  strcpy( &demo_buffer[0], "Low"       );
MOVW	R0, #lo_addr(_uv3_riskLvl+0)
MOVT	R0, #hi_addr(_uv3_riskLvl+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_publish_data68
MOVW	R0, #lo_addr(?lstr4_MikromediaGreenhouseProject_main+0)
MOVT	R0, #hi_addr(?lstr4_MikromediaGreenhouseProject_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_demo_buffer+0)
MOVT	R0, #hi_addr(_demo_buffer+0)
BL	_strcpy+0
L_publish_data68:
;MikromediaGreenhouseProject_main.c,557 :: 		if ( uv3_riskLvl == _UV3_RAD_MODERATE  )  strcpy( &demo_buffer[0], "Moderate"  );
MOVW	R0, #lo_addr(_uv3_riskLvl+0)
MOVT	R0, #hi_addr(_uv3_riskLvl+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_publish_data69
MOVW	R0, #lo_addr(?lstr5_MikromediaGreenhouseProject_main+0)
MOVT	R0, #hi_addr(?lstr5_MikromediaGreenhouseProject_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_demo_buffer+0)
MOVT	R0, #hi_addr(_demo_buffer+0)
BL	_strcpy+0
L_publish_data69:
;MikromediaGreenhouseProject_main.c,558 :: 		if ( uv3_riskLvl == _UV3_RAD_HIGH      )  strcpy( &demo_buffer[0], "High"      );
MOVW	R0, #lo_addr(_uv3_riskLvl+0)
MOVT	R0, #hi_addr(_uv3_riskLvl+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	NE
BNE	L_publish_data70
MOVW	R0, #lo_addr(?lstr6_MikromediaGreenhouseProject_main+0)
MOVT	R0, #hi_addr(?lstr6_MikromediaGreenhouseProject_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_demo_buffer+0)
MOVT	R0, #hi_addr(_demo_buffer+0)
BL	_strcpy+0
L_publish_data70:
;MikromediaGreenhouseProject_main.c,559 :: 		if ( uv3_riskLvl == _UV3_RAD_VERY_HIGH )  strcpy( &demo_buffer[0], "Very High" );
MOVW	R0, #lo_addr(_uv3_riskLvl+0)
MOVT	R0, #hi_addr(_uv3_riskLvl+0)
LDRB	R0, [R0, #0]
CMP	R0, #4
IT	NE
BNE	L_publish_data71
MOVW	R0, #lo_addr(?lstr7_MikromediaGreenhouseProject_main+0)
MOVT	R0, #hi_addr(?lstr7_MikromediaGreenhouseProject_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_demo_buffer+0)
MOVT	R0, #hi_addr(_demo_buffer+0)
BL	_strcpy+0
L_publish_data71:
;MikromediaGreenhouseProject_main.c,560 :: 		if ( uv3_riskLvl == _UV3_RAD_EXTREME   )  strcpy( &demo_buffer[0], "Extreme"   );
MOVW	R0, #lo_addr(_uv3_riskLvl+0)
MOVT	R0, #hi_addr(_uv3_riskLvl+0)
LDRB	R0, [R0, #0]
CMP	R0, #5
IT	NE
BNE	L_publish_data72
MOVW	R0, #lo_addr(?lstr8_MikromediaGreenhouseProject_main+0)
MOVT	R0, #hi_addr(?lstr8_MikromediaGreenhouseProject_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_demo_buffer+0)
MOVT	R0, #hi_addr(_demo_buffer+0)
BL	_strcpy+0
L_publish_data72:
;MikromediaGreenhouseProject_main.c,561 :: 		g2c_packCmd( &_AT_DSET[0], &g2c_sensorRef_4[0], &demo_buffer[0]);
MOVW	R2, #lo_addr(_demo_buffer+0)
MOVT	R2, #hi_addr(_demo_buffer+0)
MOVW	R1, #lo_addr(MikromediaGreenhouseProject_main_g2c_sensorRef_4+0)
MOVT	R1, #hi_addr(MikromediaGreenhouseProject_main_g2c_sensorRef_4+0)
MOVW	R0, #lo_addr(MikromediaGreenhouseProject_main__AT_DSET+0)
MOVT	R0, #hi_addr(MikromediaGreenhouseProject_main__AT_DSET+0)
BL	_g2c_packCmd+0
;MikromediaGreenhouseProject_main.c,564 :: 		g2c_cmdSingle( &_AT_PUB[0] );
MOVW	R0, #lo_addr(MikromediaGreenhouseProject_main__AT_PUB+0)
MOVT	R0, #hi_addr(MikromediaGreenhouseProject_main__AT_PUB+0)
BL	_g2c_cmdSingle+0
;MikromediaGreenhouseProject_main.c,565 :: 		}
L_end_publish_data:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _publish_data
_log_data:
;MikromediaGreenhouseProject_main.c,567 :: 		void log_data( )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MikromediaGreenhouseProject_main.c,569 :: 		if (last_temperature != temphum6_temperature)
MOVW	R0, #lo_addr(_temphum6_temperature+0)
MOVT	R0, #hi_addr(_temphum6_temperature+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_last_temperature+0)
MOVT	R0, #hi_addr(_last_temperature+0)
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	EQ
BEQ	L_log_data73
;MikromediaGreenhouseProject_main.c,572 :: 		cleanLabel(1);
MOVS	R0, #1
BL	_cleanLabel+0
;MikromediaGreenhouseProject_main.c,575 :: 		FloatToStr( temphum6_temperature, aux_buffer );
MOVW	R0, #lo_addr(_temphum6_temperature+0)
MOVT	R0, #hi_addr(_temphum6_temperature+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_FloatToStr+0
;MikromediaGreenhouseProject_main.c,576 :: 		FloatCut( aux_buffer, 50 );
MOVS	R1, #50
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_FloatCut+0
;MikromediaGreenhouseProject_main.c,577 :: 		Ltrim( aux_buffer );
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_Ltrim+0
;MikromediaGreenhouseProject_main.c,578 :: 		updateLabel( aux_buffer, 500, 20 );
MOVS	R2, #20
MOVW	R1, #500
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_updateLabel+0
;MikromediaGreenhouseProject_main.c,580 :: 		last_temperature = temphum6_temperature;
MOVW	R0, #lo_addr(_temphum6_temperature+0)
MOVT	R0, #hi_addr(_temphum6_temperature+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_last_temperature+0)
MOVT	R0, #hi_addr(_last_temperature+0)
VSTR	#1, S0, [R0, #0]
;MikromediaGreenhouseProject_main.c,581 :: 		}
L_log_data73:
;MikromediaGreenhouseProject_main.c,583 :: 		if (last_humidity != temphum6_humidity)
MOVW	R0, #lo_addr(_temphum6_humidity+0)
MOVT	R0, #hi_addr(_temphum6_humidity+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_last_humidity+0)
MOVT	R0, #hi_addr(_last_humidity+0)
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	EQ
BEQ	L_log_data74
;MikromediaGreenhouseProject_main.c,586 :: 		cleanLabel(2);
MOVS	R0, #2
BL	_cleanLabel+0
;MikromediaGreenhouseProject_main.c,589 :: 		FloatToStr( temphum6_humidity, aux_buffer );
MOVW	R0, #lo_addr(_temphum6_humidity+0)
MOVT	R0, #hi_addr(_temphum6_humidity+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_FloatToStr+0
;MikromediaGreenhouseProject_main.c,590 :: 		FloatCut( aux_buffer, 50 );
MOVS	R1, #50
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_FloatCut+0
;MikromediaGreenhouseProject_main.c,591 :: 		Ltrim( aux_buffer );
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_Ltrim+0
;MikromediaGreenhouseProject_main.c,592 :: 		updateLabel( aux_buffer, 500, 80 );
MOVS	R2, #80
MOVW	R1, #500
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_updateLabel+0
;MikromediaGreenhouseProject_main.c,594 :: 		last_humidity = temphum6_humidity;
MOVW	R0, #lo_addr(_temphum6_humidity+0)
MOVT	R0, #hi_addr(_temphum6_humidity+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_last_humidity+0)
MOVT	R0, #hi_addr(_last_humidity+0)
VSTR	#1, S0, [R0, #0]
;MikromediaGreenhouseProject_main.c,595 :: 		}
L_log_data74:
;MikromediaGreenhouseProject_main.c,597 :: 		if (last_uv != uv3_data)
MOVW	R0, #lo_addr(_uv3_data+0)
MOVT	R0, #hi_addr(_uv3_data+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_last_uv+0)
MOVT	R0, #hi_addr(_last_uv+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L_log_data75
;MikromediaGreenhouseProject_main.c,600 :: 		cleanLabel(3);
MOVS	R0, #3
BL	_cleanLabel+0
;MikromediaGreenhouseProject_main.c,603 :: 		WordToStr( uv3_data, aux_buffer );
MOVW	R0, #lo_addr(_uv3_data+0)
MOVT	R0, #hi_addr(_uv3_data+0)
LDRH	R0, [R0, #0]
MOVW	R1, #lo_addr(_aux_buffer+0)
MOVT	R1, #hi_addr(_aux_buffer+0)
BL	_WordToStr+0
;MikromediaGreenhouseProject_main.c,604 :: 		Ltrim( aux_buffer );
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_Ltrim+0
;MikromediaGreenhouseProject_main.c,605 :: 		updateLabel( aux_buffer, 500, 140 );
MOVS	R2, #140
MOVW	R1, #500
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_updateLabel+0
;MikromediaGreenhouseProject_main.c,607 :: 		last_uv = uv3_data;
MOVW	R0, #lo_addr(_uv3_data+0)
MOVT	R0, #hi_addr(_uv3_data+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_last_uv+0)
MOVT	R0, #hi_addr(_last_uv+0)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,608 :: 		}
L_log_data75:
;MikromediaGreenhouseProject_main.c,610 :: 		if (last_riskLvl != uv3_riskLvl)
MOVW	R0, #lo_addr(_uv3_riskLvl+0)
MOVT	R0, #hi_addr(_uv3_riskLvl+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_last_riskLvl+0)
MOVT	R0, #hi_addr(_last_riskLvl+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L_log_data76
;MikromediaGreenhouseProject_main.c,613 :: 		cleanLabel(4);
MOVS	R0, #4
BL	_cleanLabel+0
;MikromediaGreenhouseProject_main.c,615 :: 		memset( aux_buffer, 0, 50 );
MOVS	R2, #50
SXTH	R2, R2
MOVS	R1, #0
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_memset+0
;MikromediaGreenhouseProject_main.c,618 :: 		if ( uv3_riskLvl == _UV3_RAD_LOW       )  strcpy( &aux_buffer[0], "Low"       );
MOVW	R0, #lo_addr(_uv3_riskLvl+0)
MOVT	R0, #hi_addr(_uv3_riskLvl+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_log_data77
MOVW	R0, #lo_addr(?lstr9_MikromediaGreenhouseProject_main+0)
MOVT	R0, #hi_addr(?lstr9_MikromediaGreenhouseProject_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_strcpy+0
L_log_data77:
;MikromediaGreenhouseProject_main.c,619 :: 		if ( uv3_riskLvl == _UV3_RAD_MODERATE  )  strcpy( &aux_buffer[0], "Moderate"  );
MOVW	R0, #lo_addr(_uv3_riskLvl+0)
MOVT	R0, #hi_addr(_uv3_riskLvl+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_log_data78
MOVW	R0, #lo_addr(?lstr10_MikromediaGreenhouseProject_main+0)
MOVT	R0, #hi_addr(?lstr10_MikromediaGreenhouseProject_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_strcpy+0
L_log_data78:
;MikromediaGreenhouseProject_main.c,620 :: 		if ( uv3_riskLvl == _UV3_RAD_HIGH      )  strcpy( &aux_buffer[0], "High"      );
MOVW	R0, #lo_addr(_uv3_riskLvl+0)
MOVT	R0, #hi_addr(_uv3_riskLvl+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	NE
BNE	L_log_data79
MOVW	R0, #lo_addr(?lstr11_MikromediaGreenhouseProject_main+0)
MOVT	R0, #hi_addr(?lstr11_MikromediaGreenhouseProject_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_strcpy+0
L_log_data79:
;MikromediaGreenhouseProject_main.c,621 :: 		if ( uv3_riskLvl == _UV3_RAD_VERY_HIGH )  strcpy( &aux_buffer[0], "Very High" );
MOVW	R0, #lo_addr(_uv3_riskLvl+0)
MOVT	R0, #hi_addr(_uv3_riskLvl+0)
LDRB	R0, [R0, #0]
CMP	R0, #4
IT	NE
BNE	L_log_data80
MOVW	R0, #lo_addr(?lstr12_MikromediaGreenhouseProject_main+0)
MOVT	R0, #hi_addr(?lstr12_MikromediaGreenhouseProject_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_strcpy+0
L_log_data80:
;MikromediaGreenhouseProject_main.c,622 :: 		if ( uv3_riskLvl == _UV3_RAD_EXTREME   )  strcpy( &aux_buffer[0], "Extreme"   );
MOVW	R0, #lo_addr(_uv3_riskLvl+0)
MOVT	R0, #hi_addr(_uv3_riskLvl+0)
LDRB	R0, [R0, #0]
CMP	R0, #5
IT	NE
BNE	L_log_data81
MOVW	R0, #lo_addr(?lstr13_MikromediaGreenhouseProject_main+0)
MOVT	R0, #hi_addr(?lstr13_MikromediaGreenhouseProject_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_strcpy+0
L_log_data81:
;MikromediaGreenhouseProject_main.c,623 :: 		updateLabel( aux_buffer, 500, 200 );
MOVS	R2, #200
MOVW	R1, #500
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_updateLabel+0
;MikromediaGreenhouseProject_main.c,625 :: 		last_riskLvl = uv3_riskLvl;
MOVW	R0, #lo_addr(_uv3_riskLvl+0)
MOVT	R0, #hi_addr(_uv3_riskLvl+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_last_riskLvl+0)
MOVT	R0, #hi_addr(_last_riskLvl+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,626 :: 		}
L_log_data76:
;MikromediaGreenhouseProject_main.c,627 :: 		}
L_end_log_data:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _log_data
_log_last:
;MikromediaGreenhouseProject_main.c,629 :: 		void log_last( )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MikromediaGreenhouseProject_main.c,632 :: 		cleanLabel(1);
MOVS	R0, #1
BL	_cleanLabel+0
;MikromediaGreenhouseProject_main.c,635 :: 		cleanLabel(2);
MOVS	R0, #2
BL	_cleanLabel+0
;MikromediaGreenhouseProject_main.c,638 :: 		cleanLabel(3);
MOVS	R0, #3
BL	_cleanLabel+0
;MikromediaGreenhouseProject_main.c,641 :: 		cleanLabel(4);
MOVS	R0, #4
BL	_cleanLabel+0
;MikromediaGreenhouseProject_main.c,644 :: 		FloatToStr( temphum6_temperature, aux_buffer );
MOVW	R0, #lo_addr(_temphum6_temperature+0)
MOVT	R0, #hi_addr(_temphum6_temperature+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_FloatToStr+0
;MikromediaGreenhouseProject_main.c,645 :: 		FloatCut( aux_buffer, 50 );
MOVS	R1, #50
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_FloatCut+0
;MikromediaGreenhouseProject_main.c,646 :: 		Ltrim( aux_buffer );
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_Ltrim+0
;MikromediaGreenhouseProject_main.c,647 :: 		updateLabel( aux_buffer, 500, 20 );
MOVS	R2, #20
MOVW	R1, #500
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_updateLabel+0
;MikromediaGreenhouseProject_main.c,650 :: 		FloatToStr( temphum6_humidity, aux_buffer );
MOVW	R0, #lo_addr(_temphum6_humidity+0)
MOVT	R0, #hi_addr(_temphum6_humidity+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_FloatToStr+0
;MikromediaGreenhouseProject_main.c,651 :: 		FloatCut( aux_buffer, 50 );
MOVS	R1, #50
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_FloatCut+0
;MikromediaGreenhouseProject_main.c,652 :: 		Ltrim( aux_buffer );
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_Ltrim+0
;MikromediaGreenhouseProject_main.c,653 :: 		updateLabel( aux_buffer, 500, 80 );
MOVS	R2, #80
MOVW	R1, #500
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_updateLabel+0
;MikromediaGreenhouseProject_main.c,656 :: 		WordToStr( uv3_data, aux_buffer );
MOVW	R0, #lo_addr(_uv3_data+0)
MOVT	R0, #hi_addr(_uv3_data+0)
LDRH	R0, [R0, #0]
MOVW	R1, #lo_addr(_aux_buffer+0)
MOVT	R1, #hi_addr(_aux_buffer+0)
BL	_WordToStr+0
;MikromediaGreenhouseProject_main.c,657 :: 		Ltrim( aux_buffer );
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_Ltrim+0
;MikromediaGreenhouseProject_main.c,658 :: 		updateLabel( aux_buffer, 500, 140 );
MOVS	R2, #140
MOVW	R1, #500
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_updateLabel+0
;MikromediaGreenhouseProject_main.c,660 :: 		memset( aux_buffer, 0, 50 );
MOVS	R2, #50
SXTH	R2, R2
MOVS	R1, #0
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_memset+0
;MikromediaGreenhouseProject_main.c,663 :: 		if ( uv3_riskLvl == _UV3_RAD_LOW       )  strcpy( &aux_buffer[0], "Low"       );
MOVW	R0, #lo_addr(_uv3_riskLvl+0)
MOVT	R0, #hi_addr(_uv3_riskLvl+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_log_last82
MOVW	R0, #lo_addr(?lstr14_MikromediaGreenhouseProject_main+0)
MOVT	R0, #hi_addr(?lstr14_MikromediaGreenhouseProject_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_strcpy+0
L_log_last82:
;MikromediaGreenhouseProject_main.c,664 :: 		if ( uv3_riskLvl == _UV3_RAD_MODERATE  )  strcpy( &aux_buffer[0], "Moderate"  );
MOVW	R0, #lo_addr(_uv3_riskLvl+0)
MOVT	R0, #hi_addr(_uv3_riskLvl+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_log_last83
MOVW	R0, #lo_addr(?lstr15_MikromediaGreenhouseProject_main+0)
MOVT	R0, #hi_addr(?lstr15_MikromediaGreenhouseProject_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_strcpy+0
L_log_last83:
;MikromediaGreenhouseProject_main.c,665 :: 		if ( uv3_riskLvl == _UV3_RAD_HIGH      )  strcpy( &aux_buffer[0], "High"      );
MOVW	R0, #lo_addr(_uv3_riskLvl+0)
MOVT	R0, #hi_addr(_uv3_riskLvl+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	NE
BNE	L_log_last84
MOVW	R0, #lo_addr(?lstr16_MikromediaGreenhouseProject_main+0)
MOVT	R0, #hi_addr(?lstr16_MikromediaGreenhouseProject_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_strcpy+0
L_log_last84:
;MikromediaGreenhouseProject_main.c,666 :: 		if ( uv3_riskLvl == _UV3_RAD_VERY_HIGH )  strcpy( &aux_buffer[0], "Very High" );
MOVW	R0, #lo_addr(_uv3_riskLvl+0)
MOVT	R0, #hi_addr(_uv3_riskLvl+0)
LDRB	R0, [R0, #0]
CMP	R0, #4
IT	NE
BNE	L_log_last85
MOVW	R0, #lo_addr(?lstr17_MikromediaGreenhouseProject_main+0)
MOVT	R0, #hi_addr(?lstr17_MikromediaGreenhouseProject_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_strcpy+0
L_log_last85:
;MikromediaGreenhouseProject_main.c,667 :: 		if ( uv3_riskLvl == _UV3_RAD_EXTREME   )  strcpy( &aux_buffer[0], "Extreme"   );
MOVW	R0, #lo_addr(_uv3_riskLvl+0)
MOVT	R0, #hi_addr(_uv3_riskLvl+0)
LDRB	R0, [R0, #0]
CMP	R0, #5
IT	NE
BNE	L_log_last86
MOVW	R0, #lo_addr(?lstr18_MikromediaGreenhouseProject_main+0)
MOVT	R0, #hi_addr(?lstr18_MikromediaGreenhouseProject_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_strcpy+0
L_log_last86:
;MikromediaGreenhouseProject_main.c,668 :: 		updateLabel( aux_buffer, 500, 200 );
MOVS	R2, #200
MOVW	R1, #500
MOVW	R0, #lo_addr(_aux_buffer+0)
MOVT	R0, #hi_addr(_aux_buffer+0)
BL	_updateLabel+0
;MikromediaGreenhouseProject_main.c,669 :: 		}
L_end_log_last:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _log_last
_servo_position:
;MikromediaGreenhouseProject_main.c,671 :: 		void servo_position( )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MikromediaGreenhouseProject_main.c,673 :: 		switch (servo_num)
IT	AL
BAL	L_servo_position87
;MikromediaGreenhouseProject_main.c,675 :: 		case 0 :
L_servo_position89:
;MikromediaGreenhouseProject_main.c,677 :: 		servo_setPosition( _SERVO_MOTOR_1, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #6
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,678 :: 		servo_setPosition( _SERVO_MOTOR_2, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #10
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,679 :: 		servo_setPosition( _SERVO_MOTOR_3, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #14
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,680 :: 		servo_setPosition( _SERVO_MOTOR_4, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #18
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,681 :: 		servo_setPosition( _SERVO_MOTOR_5, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #22
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,682 :: 		servo_setPosition( _SERVO_MOTOR_6, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #26
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,683 :: 		servo_setPosition( _SERVO_MOTOR_7, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #30
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,684 :: 		servo_setPosition( _SERVO_MOTOR_8, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #34
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,685 :: 		servo_setPosition( _SERVO_MOTOR_9, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #38
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,686 :: 		servo_setPosition( _SERVO_MOTOR_10, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #42
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,687 :: 		servo_setPosition( _SERVO_MOTOR_11, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #46
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,688 :: 		servo_setPosition( _SERVO_MOTOR_12, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #50
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,689 :: 		servo_setPosition( _SERVO_MOTOR_13, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #54
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,690 :: 		servo_setPosition( _SERVO_MOTOR_14, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #58
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,691 :: 		servo_setPosition( _SERVO_MOTOR_15, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #62
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,692 :: 		servo_setPosition( _SERVO_MOTOR_16, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #66
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,693 :: 		servo_pos_1 = servo_pos;
MOVW	R2, #lo_addr(_servo_pos+0)
MOVT	R2, #hi_addr(_servo_pos+0)
LDRB	R1, [R2, #0]
MOVW	R0, #lo_addr(_servo_pos_1+0)
MOVT	R0, #hi_addr(_servo_pos_1+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,694 :: 		servo_pos_2 = servo_pos;
MOV	R0, R2
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_2+0)
MOVT	R0, #hi_addr(_servo_pos_2+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,695 :: 		servo_pos_3 = servo_pos;
MOV	R0, R2
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_3+0)
MOVT	R0, #hi_addr(_servo_pos_3+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,696 :: 		servo_pos_4 = servo_pos;
MOV	R0, R2
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_4+0)
MOVT	R0, #hi_addr(_servo_pos_4+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,697 :: 		servo_pos_5 = servo_pos;
MOV	R0, R2
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_5+0)
MOVT	R0, #hi_addr(_servo_pos_5+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,698 :: 		servo_pos_6 = servo_pos;
MOV	R0, R2
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_6+0)
MOVT	R0, #hi_addr(_servo_pos_6+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,699 :: 		servo_pos_7 = servo_pos;
MOV	R0, R2
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_7+0)
MOVT	R0, #hi_addr(_servo_pos_7+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,700 :: 		servo_pos_8 = servo_pos;
MOV	R0, R2
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_8+0)
MOVT	R0, #hi_addr(_servo_pos_8+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,701 :: 		servo_pos_9 = servo_pos;
MOV	R0, R2
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_9+0)
MOVT	R0, #hi_addr(_servo_pos_9+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,702 :: 		servo_pos_10 = servo_pos;
MOV	R0, R2
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_10+0)
MOVT	R0, #hi_addr(_servo_pos_10+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,703 :: 		servo_pos_11 = servo_pos;
MOV	R0, R2
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_11+0)
MOVT	R0, #hi_addr(_servo_pos_11+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,704 :: 		servo_pos_12 = servo_pos;
MOV	R0, R2
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_12+0)
MOVT	R0, #hi_addr(_servo_pos_12+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,705 :: 		servo_pos_13 = servo_pos;
MOV	R0, R2
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_13+0)
MOVT	R0, #hi_addr(_servo_pos_13+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,706 :: 		servo_pos_14 = servo_pos;
MOV	R0, R2
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_14+0)
MOVT	R0, #hi_addr(_servo_pos_14+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,707 :: 		servo_pos_15 = servo_pos;
MOV	R0, R2
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_15+0)
MOVT	R0, #hi_addr(_servo_pos_15+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,708 :: 		servo_pos_16 = servo_pos;
MOV	R0, R2
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_16+0)
MOVT	R0, #hi_addr(_servo_pos_16+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,709 :: 		servo_pos_all = servo_pos;
MOV	R0, R2
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_all+0)
MOVT	R0, #hi_addr(_servo_pos_all+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,710 :: 		break;
IT	AL
BAL	L_servo_position88
;MikromediaGreenhouseProject_main.c,712 :: 		case 1 :
L_servo_position90:
;MikromediaGreenhouseProject_main.c,714 :: 		servo_setPosition( _SERVO_MOTOR_1, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #6
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,715 :: 		servo_pos_1 = servo_pos;
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_1+0)
MOVT	R0, #hi_addr(_servo_pos_1+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,716 :: 		break;
IT	AL
BAL	L_servo_position88
;MikromediaGreenhouseProject_main.c,718 :: 		case 2 :
L_servo_position91:
;MikromediaGreenhouseProject_main.c,720 :: 		servo_setPosition( _SERVO_MOTOR_2, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #10
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,721 :: 		servo_pos_2 = servo_pos;
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_2+0)
MOVT	R0, #hi_addr(_servo_pos_2+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,722 :: 		break;
IT	AL
BAL	L_servo_position88
;MikromediaGreenhouseProject_main.c,724 :: 		case 3 :
L_servo_position92:
;MikromediaGreenhouseProject_main.c,726 :: 		servo_setPosition( _SERVO_MOTOR_3, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #14
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,727 :: 		servo_pos_3 = servo_pos;
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_3+0)
MOVT	R0, #hi_addr(_servo_pos_3+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,728 :: 		break;
IT	AL
BAL	L_servo_position88
;MikromediaGreenhouseProject_main.c,730 :: 		case 4 :
L_servo_position93:
;MikromediaGreenhouseProject_main.c,732 :: 		servo_setPosition( _SERVO_MOTOR_4, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #18
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,733 :: 		servo_pos_4 = servo_pos;
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_4+0)
MOVT	R0, #hi_addr(_servo_pos_4+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,734 :: 		break;
IT	AL
BAL	L_servo_position88
;MikromediaGreenhouseProject_main.c,736 :: 		case 5 :
L_servo_position94:
;MikromediaGreenhouseProject_main.c,738 :: 		servo_setPosition( _SERVO_MOTOR_5, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #22
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,739 :: 		servo_pos_5 = servo_pos;
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_5+0)
MOVT	R0, #hi_addr(_servo_pos_5+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,740 :: 		break;
IT	AL
BAL	L_servo_position88
;MikromediaGreenhouseProject_main.c,742 :: 		case 6 :
L_servo_position95:
;MikromediaGreenhouseProject_main.c,744 :: 		servo_setPosition( _SERVO_MOTOR_6, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #26
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,745 :: 		servo_pos_6 = servo_pos;
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_6+0)
MOVT	R0, #hi_addr(_servo_pos_6+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,746 :: 		break;
IT	AL
BAL	L_servo_position88
;MikromediaGreenhouseProject_main.c,748 :: 		case 7 :
L_servo_position96:
;MikromediaGreenhouseProject_main.c,750 :: 		servo_setPosition( _SERVO_MOTOR_7, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #30
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,751 :: 		servo_pos_7 = servo_pos;
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_7+0)
MOVT	R0, #hi_addr(_servo_pos_7+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,752 :: 		break;
IT	AL
BAL	L_servo_position88
;MikromediaGreenhouseProject_main.c,754 :: 		case 8 :
L_servo_position97:
;MikromediaGreenhouseProject_main.c,756 :: 		servo_setPosition( _SERVO_MOTOR_8, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #34
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,757 :: 		servo_pos_8 = servo_pos;
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_8+0)
MOVT	R0, #hi_addr(_servo_pos_8+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,758 :: 		break;
IT	AL
BAL	L_servo_position88
;MikromediaGreenhouseProject_main.c,760 :: 		case 9 :
L_servo_position98:
;MikromediaGreenhouseProject_main.c,762 :: 		servo_setPosition( _SERVO_MOTOR_9, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #38
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,763 :: 		servo_pos_9 = servo_pos;
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_9+0)
MOVT	R0, #hi_addr(_servo_pos_9+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,764 :: 		break;
IT	AL
BAL	L_servo_position88
;MikromediaGreenhouseProject_main.c,766 :: 		case 10 :
L_servo_position99:
;MikromediaGreenhouseProject_main.c,768 :: 		servo_setPosition( _SERVO_MOTOR_10, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #42
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,769 :: 		servo_pos_10 = servo_pos;
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_10+0)
MOVT	R0, #hi_addr(_servo_pos_10+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,770 :: 		break;
IT	AL
BAL	L_servo_position88
;MikromediaGreenhouseProject_main.c,772 :: 		case 11 :
L_servo_position100:
;MikromediaGreenhouseProject_main.c,774 :: 		servo_setPosition( _SERVO_MOTOR_11, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #46
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,775 :: 		servo_pos_11 = servo_pos;
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_11+0)
MOVT	R0, #hi_addr(_servo_pos_11+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,776 :: 		break;
IT	AL
BAL	L_servo_position88
;MikromediaGreenhouseProject_main.c,778 :: 		case 12 :
L_servo_position101:
;MikromediaGreenhouseProject_main.c,780 :: 		servo_setPosition( _SERVO_MOTOR_12, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #50
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,781 :: 		servo_pos_12 = servo_pos;
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_12+0)
MOVT	R0, #hi_addr(_servo_pos_12+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,782 :: 		break;
IT	AL
BAL	L_servo_position88
;MikromediaGreenhouseProject_main.c,784 :: 		case 13 :
L_servo_position102:
;MikromediaGreenhouseProject_main.c,786 :: 		servo_setPosition( _SERVO_MOTOR_13, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #54
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,787 :: 		servo_pos_13 = servo_pos;
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_13+0)
MOVT	R0, #hi_addr(_servo_pos_13+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,788 :: 		break;
IT	AL
BAL	L_servo_position88
;MikromediaGreenhouseProject_main.c,790 :: 		case 14 :
L_servo_position103:
;MikromediaGreenhouseProject_main.c,792 :: 		servo_setPosition( _SERVO_MOTOR_14, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #58
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,793 :: 		servo_pos_14 = servo_pos;
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_14+0)
MOVT	R0, #hi_addr(_servo_pos_14+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,794 :: 		break;
IT	AL
BAL	L_servo_position88
;MikromediaGreenhouseProject_main.c,796 :: 		case 15 :
L_servo_position104:
;MikromediaGreenhouseProject_main.c,798 :: 		servo_setPosition( _SERVO_MOTOR_15, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #62
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,799 :: 		servo_pos_15 = servo_pos;
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_15+0)
MOVT	R0, #hi_addr(_servo_pos_15+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,800 :: 		break;
IT	AL
BAL	L_servo_position88
;MikromediaGreenhouseProject_main.c,802 :: 		case 16 :
L_servo_position105:
;MikromediaGreenhouseProject_main.c,804 :: 		servo_setPosition( _SERVO_MOTOR_16, servo_pos );
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R0, [R0, #0]
UXTB	R1, R0
MOVS	R0, #66
BL	_servo_setPosition+0
;MikromediaGreenhouseProject_main.c,805 :: 		servo_pos_16 = servo_pos;
MOVW	R0, #lo_addr(_servo_pos+0)
MOVT	R0, #hi_addr(_servo_pos+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_servo_pos_16+0)
MOVT	R0, #hi_addr(_servo_pos_16+0)
STRB	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,806 :: 		break;
IT	AL
BAL	L_servo_position88
;MikromediaGreenhouseProject_main.c,808 :: 		default :
L_servo_position106:
;MikromediaGreenhouseProject_main.c,810 :: 		break;
IT	AL
BAL	L_servo_position88
;MikromediaGreenhouseProject_main.c,812 :: 		}
L_servo_position87:
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_servo_position89
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_servo_position90
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_servo_position91
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_servo_position92
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_servo_position93
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #5
IT	EQ
BEQ	L_servo_position94
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #6
IT	EQ
BEQ	L_servo_position95
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #7
IT	EQ
BEQ	L_servo_position96
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #8
IT	EQ
BEQ	L_servo_position97
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #9
IT	EQ
BEQ	L_servo_position98
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #10
IT	EQ
BEQ	L_servo_position99
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #11
IT	EQ
BEQ	L_servo_position100
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #12
IT	EQ
BEQ	L_servo_position101
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #13
IT	EQ
BEQ	L_servo_position102
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #14
IT	EQ
BEQ	L_servo_position103
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #15
IT	EQ
BEQ	L_servo_position104
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #16
IT	EQ
BEQ	L_servo_position105
IT	AL
BAL	L_servo_position106
L_servo_position88:
;MikromediaGreenhouseProject_main.c,813 :: 		}
L_end_servo_position:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _servo_position
_servo_position_log:
;MikromediaGreenhouseProject_main.c,815 :: 		void servo_position_log( )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MikromediaGreenhouseProject_main.c,817 :: 		switch (servo_num)
IT	AL
BAL	L_servo_position_log107
;MikromediaGreenhouseProject_main.c,819 :: 		case 0 :
L_servo_position_log109:
;MikromediaGreenhouseProject_main.c,821 :: 		if (screen_flag == 1)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_servo_position_log110
;MikromediaGreenhouseProject_main.c,823 :: 		clear_servoNumber_button_colors( );
BL	_clear_servoNumber_button_colors+0
;MikromediaGreenhouseProject_main.c,824 :: 		servo_number_button_all.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_all+36)
MOVT	R0, #hi_addr(_servo_number_button_all+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,825 :: 		servo_number_button_all.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_all+16)
MOVT	R0, #hi_addr(_servo_number_button_all+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,826 :: 		ProgressBar1.Position = servo_pos_all;
MOVW	R0, #lo_addr(_servo_pos_all+0)
MOVT	R0, #hi_addr(_servo_pos_all+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,827 :: 		}
L_servo_position_log110:
;MikromediaGreenhouseProject_main.c,828 :: 		if (screen_flag == 2)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_servo_position_log111
;MikromediaGreenhouseProject_main.c,830 :: 		clear_servoNumber_buttons( );
BL	_clear_servoNumber_buttons+0
;MikromediaGreenhouseProject_main.c,831 :: 		servo_number_button_all.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_all+36)
MOVT	R0, #hi_addr(_servo_number_button_all+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,832 :: 		servo_number_button_all.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_all+16)
MOVT	R0, #hi_addr(_servo_number_button_all+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,833 :: 		ProgressBar1.Position = servo_pos_all;
MOVW	R0, #lo_addr(_servo_pos_all+0)
MOVT	R0, #hi_addr(_servo_pos_all+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,834 :: 		DrawButton(&servo_number_button_all);
MOVW	R0, #lo_addr(_servo_number_button_all+0)
MOVT	R0, #hi_addr(_servo_number_button_all+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,835 :: 		DrawImage(&Image10);
MOVW	R0, #lo_addr(_Image10+0)
MOVT	R0, #hi_addr(_Image10+0)
BL	_DrawImage+0
;MikromediaGreenhouseProject_main.c,836 :: 		DrawProgressBar(&ProgressBar1);
MOVW	R0, #lo_addr(_ProgressBar1+0)
MOVT	R0, #hi_addr(_ProgressBar1+0)
BL	_DrawProgressBar+0
;MikromediaGreenhouseProject_main.c,837 :: 		}
L_servo_position_log111:
;MikromediaGreenhouseProject_main.c,838 :: 		break;
IT	AL
BAL	L_servo_position_log108
;MikromediaGreenhouseProject_main.c,840 :: 		case 1 :
L_servo_position_log112:
;MikromediaGreenhouseProject_main.c,842 :: 		if (screen_flag == 1)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_servo_position_log113
;MikromediaGreenhouseProject_main.c,844 :: 		clear_servoNumber_button_colors( );
BL	_clear_servoNumber_button_colors+0
;MikromediaGreenhouseProject_main.c,845 :: 		servo_number_button_1.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_1+36)
MOVT	R0, #hi_addr(_servo_number_button_1+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,846 :: 		servo_number_button_1.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_1+16)
MOVT	R0, #hi_addr(_servo_number_button_1+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,847 :: 		ProgressBar1.Position = servo_pos_1;
MOVW	R0, #lo_addr(_servo_pos_1+0)
MOVT	R0, #hi_addr(_servo_pos_1+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,848 :: 		}
L_servo_position_log113:
;MikromediaGreenhouseProject_main.c,849 :: 		if (screen_flag == 2)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_servo_position_log114
;MikromediaGreenhouseProject_main.c,851 :: 		clear_servoNumber_buttons( );
BL	_clear_servoNumber_buttons+0
;MikromediaGreenhouseProject_main.c,852 :: 		servo_number_button_1.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_1+36)
MOVT	R0, #hi_addr(_servo_number_button_1+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,853 :: 		servo_number_button_1.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_1+16)
MOVT	R0, #hi_addr(_servo_number_button_1+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,854 :: 		ProgressBar1.Position = servo_pos_1;
MOVW	R0, #lo_addr(_servo_pos_1+0)
MOVT	R0, #hi_addr(_servo_pos_1+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,855 :: 		DrawButton(&servo_number_button_1);
MOVW	R0, #lo_addr(_servo_number_button_1+0)
MOVT	R0, #hi_addr(_servo_number_button_1+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,856 :: 		DrawImage(&Image10);
MOVW	R0, #lo_addr(_Image10+0)
MOVT	R0, #hi_addr(_Image10+0)
BL	_DrawImage+0
;MikromediaGreenhouseProject_main.c,857 :: 		DrawProgressBar(&ProgressBar1);
MOVW	R0, #lo_addr(_ProgressBar1+0)
MOVT	R0, #hi_addr(_ProgressBar1+0)
BL	_DrawProgressBar+0
;MikromediaGreenhouseProject_main.c,858 :: 		}
L_servo_position_log114:
;MikromediaGreenhouseProject_main.c,859 :: 		break;
IT	AL
BAL	L_servo_position_log108
;MikromediaGreenhouseProject_main.c,861 :: 		case 2 :
L_servo_position_log115:
;MikromediaGreenhouseProject_main.c,863 :: 		if (screen_flag == 1)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_servo_position_log116
;MikromediaGreenhouseProject_main.c,865 :: 		clear_servoNumber_button_colors( );
BL	_clear_servoNumber_button_colors+0
;MikromediaGreenhouseProject_main.c,866 :: 		servo_number_button_2.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_2+36)
MOVT	R0, #hi_addr(_servo_number_button_2+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,867 :: 		servo_number_button_2.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_2+16)
MOVT	R0, #hi_addr(_servo_number_button_2+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,868 :: 		ProgressBar1.Position = servo_pos_2;
MOVW	R0, #lo_addr(_servo_pos_2+0)
MOVT	R0, #hi_addr(_servo_pos_2+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,869 :: 		}
L_servo_position_log116:
;MikromediaGreenhouseProject_main.c,870 :: 		if (screen_flag == 2)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_servo_position_log117
;MikromediaGreenhouseProject_main.c,872 :: 		clear_servoNumber_buttons( );
BL	_clear_servoNumber_buttons+0
;MikromediaGreenhouseProject_main.c,873 :: 		servo_number_button_2.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_2+36)
MOVT	R0, #hi_addr(_servo_number_button_2+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,874 :: 		servo_number_button_2.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_2+16)
MOVT	R0, #hi_addr(_servo_number_button_2+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,875 :: 		ProgressBar1.Position = servo_pos_2;
MOVW	R0, #lo_addr(_servo_pos_2+0)
MOVT	R0, #hi_addr(_servo_pos_2+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,876 :: 		DrawButton(&servo_number_button_2);
MOVW	R0, #lo_addr(_servo_number_button_2+0)
MOVT	R0, #hi_addr(_servo_number_button_2+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,877 :: 		DrawImage(&Image10);
MOVW	R0, #lo_addr(_Image10+0)
MOVT	R0, #hi_addr(_Image10+0)
BL	_DrawImage+0
;MikromediaGreenhouseProject_main.c,878 :: 		DrawProgressBar(&ProgressBar1);
MOVW	R0, #lo_addr(_ProgressBar1+0)
MOVT	R0, #hi_addr(_ProgressBar1+0)
BL	_DrawProgressBar+0
;MikromediaGreenhouseProject_main.c,879 :: 		}
L_servo_position_log117:
;MikromediaGreenhouseProject_main.c,880 :: 		break;
IT	AL
BAL	L_servo_position_log108
;MikromediaGreenhouseProject_main.c,882 :: 		case 3 :
L_servo_position_log118:
;MikromediaGreenhouseProject_main.c,884 :: 		if (screen_flag == 1)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_servo_position_log119
;MikromediaGreenhouseProject_main.c,886 :: 		clear_servoNumber_button_colors( );
BL	_clear_servoNumber_button_colors+0
;MikromediaGreenhouseProject_main.c,887 :: 		servo_number_button_3.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_3+36)
MOVT	R0, #hi_addr(_servo_number_button_3+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,888 :: 		servo_number_button_3.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_3+16)
MOVT	R0, #hi_addr(_servo_number_button_3+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,889 :: 		ProgressBar1.Position = servo_pos_3;
MOVW	R0, #lo_addr(_servo_pos_3+0)
MOVT	R0, #hi_addr(_servo_pos_3+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,890 :: 		}
L_servo_position_log119:
;MikromediaGreenhouseProject_main.c,891 :: 		if (screen_flag == 2)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_servo_position_log120
;MikromediaGreenhouseProject_main.c,893 :: 		clear_servoNumber_buttons( );
BL	_clear_servoNumber_buttons+0
;MikromediaGreenhouseProject_main.c,894 :: 		servo_number_button_3.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_3+36)
MOVT	R0, #hi_addr(_servo_number_button_3+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,895 :: 		servo_number_button_3.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_3+16)
MOVT	R0, #hi_addr(_servo_number_button_3+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,896 :: 		ProgressBar1.Position = servo_pos_3;
MOVW	R0, #lo_addr(_servo_pos_3+0)
MOVT	R0, #hi_addr(_servo_pos_3+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,897 :: 		DrawButton(&servo_number_button_3);
MOVW	R0, #lo_addr(_servo_number_button_3+0)
MOVT	R0, #hi_addr(_servo_number_button_3+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,898 :: 		DrawImage(&Image10);
MOVW	R0, #lo_addr(_Image10+0)
MOVT	R0, #hi_addr(_Image10+0)
BL	_DrawImage+0
;MikromediaGreenhouseProject_main.c,899 :: 		DrawProgressBar(&ProgressBar1);
MOVW	R0, #lo_addr(_ProgressBar1+0)
MOVT	R0, #hi_addr(_ProgressBar1+0)
BL	_DrawProgressBar+0
;MikromediaGreenhouseProject_main.c,900 :: 		}
L_servo_position_log120:
;MikromediaGreenhouseProject_main.c,901 :: 		break;
IT	AL
BAL	L_servo_position_log108
;MikromediaGreenhouseProject_main.c,903 :: 		case 4 :
L_servo_position_log121:
;MikromediaGreenhouseProject_main.c,905 :: 		if (screen_flag == 1)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_servo_position_log122
;MikromediaGreenhouseProject_main.c,907 :: 		clear_servoNumber_button_colors( );
BL	_clear_servoNumber_button_colors+0
;MikromediaGreenhouseProject_main.c,908 :: 		servo_number_button_4.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_4+36)
MOVT	R0, #hi_addr(_servo_number_button_4+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,909 :: 		servo_number_button_4.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_4+16)
MOVT	R0, #hi_addr(_servo_number_button_4+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,910 :: 		ProgressBar1.Position = servo_pos_4;
MOVW	R0, #lo_addr(_servo_pos_4+0)
MOVT	R0, #hi_addr(_servo_pos_4+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,911 :: 		}
L_servo_position_log122:
;MikromediaGreenhouseProject_main.c,912 :: 		if (screen_flag == 2)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_servo_position_log123
;MikromediaGreenhouseProject_main.c,914 :: 		clear_servoNumber_buttons( );
BL	_clear_servoNumber_buttons+0
;MikromediaGreenhouseProject_main.c,915 :: 		servo_number_button_4.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_4+36)
MOVT	R0, #hi_addr(_servo_number_button_4+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,916 :: 		servo_number_button_4.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_4+16)
MOVT	R0, #hi_addr(_servo_number_button_4+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,917 :: 		ProgressBar1.Position = servo_pos_4;
MOVW	R0, #lo_addr(_servo_pos_4+0)
MOVT	R0, #hi_addr(_servo_pos_4+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,918 :: 		DrawButton(&servo_number_button_4);
MOVW	R0, #lo_addr(_servo_number_button_4+0)
MOVT	R0, #hi_addr(_servo_number_button_4+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,919 :: 		DrawImage(&Image10);
MOVW	R0, #lo_addr(_Image10+0)
MOVT	R0, #hi_addr(_Image10+0)
BL	_DrawImage+0
;MikromediaGreenhouseProject_main.c,920 :: 		DrawProgressBar(&ProgressBar1);
MOVW	R0, #lo_addr(_ProgressBar1+0)
MOVT	R0, #hi_addr(_ProgressBar1+0)
BL	_DrawProgressBar+0
;MikromediaGreenhouseProject_main.c,921 :: 		}
L_servo_position_log123:
;MikromediaGreenhouseProject_main.c,922 :: 		break;
IT	AL
BAL	L_servo_position_log108
;MikromediaGreenhouseProject_main.c,924 :: 		case 5 :
L_servo_position_log124:
;MikromediaGreenhouseProject_main.c,926 :: 		if (screen_flag == 1)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_servo_position_log125
;MikromediaGreenhouseProject_main.c,928 :: 		clear_servoNumber_button_colors( );
BL	_clear_servoNumber_button_colors+0
;MikromediaGreenhouseProject_main.c,929 :: 		servo_number_button_5.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_5+36)
MOVT	R0, #hi_addr(_servo_number_button_5+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,930 :: 		servo_number_button_5.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_5+16)
MOVT	R0, #hi_addr(_servo_number_button_5+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,931 :: 		ProgressBar1.Position = servo_pos_5;
MOVW	R0, #lo_addr(_servo_pos_5+0)
MOVT	R0, #hi_addr(_servo_pos_5+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,932 :: 		}
L_servo_position_log125:
;MikromediaGreenhouseProject_main.c,933 :: 		if (screen_flag == 2)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_servo_position_log126
;MikromediaGreenhouseProject_main.c,935 :: 		clear_servoNumber_buttons( );
BL	_clear_servoNumber_buttons+0
;MikromediaGreenhouseProject_main.c,936 :: 		servo_number_button_5.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_5+36)
MOVT	R0, #hi_addr(_servo_number_button_5+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,937 :: 		servo_number_button_5.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_5+16)
MOVT	R0, #hi_addr(_servo_number_button_5+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,938 :: 		ProgressBar1.Position = servo_pos_5;
MOVW	R0, #lo_addr(_servo_pos_5+0)
MOVT	R0, #hi_addr(_servo_pos_5+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,939 :: 		DrawButton(&servo_number_button_5);
MOVW	R0, #lo_addr(_servo_number_button_5+0)
MOVT	R0, #hi_addr(_servo_number_button_5+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,940 :: 		DrawImage(&Image10);
MOVW	R0, #lo_addr(_Image10+0)
MOVT	R0, #hi_addr(_Image10+0)
BL	_DrawImage+0
;MikromediaGreenhouseProject_main.c,941 :: 		DrawProgressBar(&ProgressBar1);
MOVW	R0, #lo_addr(_ProgressBar1+0)
MOVT	R0, #hi_addr(_ProgressBar1+0)
BL	_DrawProgressBar+0
;MikromediaGreenhouseProject_main.c,942 :: 		}
L_servo_position_log126:
;MikromediaGreenhouseProject_main.c,943 :: 		break;
IT	AL
BAL	L_servo_position_log108
;MikromediaGreenhouseProject_main.c,945 :: 		case 6 :
L_servo_position_log127:
;MikromediaGreenhouseProject_main.c,947 :: 		if (screen_flag == 1)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_servo_position_log128
;MikromediaGreenhouseProject_main.c,949 :: 		clear_servoNumber_button_colors( );
BL	_clear_servoNumber_button_colors+0
;MikromediaGreenhouseProject_main.c,950 :: 		servo_number_button_6.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_6+36)
MOVT	R0, #hi_addr(_servo_number_button_6+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,951 :: 		servo_number_button_6.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_6+16)
MOVT	R0, #hi_addr(_servo_number_button_6+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,952 :: 		ProgressBar1.Position = servo_pos_6;
MOVW	R0, #lo_addr(_servo_pos_6+0)
MOVT	R0, #hi_addr(_servo_pos_6+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,953 :: 		}
L_servo_position_log128:
;MikromediaGreenhouseProject_main.c,954 :: 		if (screen_flag == 2)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_servo_position_log129
;MikromediaGreenhouseProject_main.c,956 :: 		clear_servoNumber_buttons( );
BL	_clear_servoNumber_buttons+0
;MikromediaGreenhouseProject_main.c,957 :: 		servo_number_button_6.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_6+36)
MOVT	R0, #hi_addr(_servo_number_button_6+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,958 :: 		servo_number_button_6.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_6+16)
MOVT	R0, #hi_addr(_servo_number_button_6+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,959 :: 		ProgressBar1.Position = servo_pos_6;
MOVW	R0, #lo_addr(_servo_pos_6+0)
MOVT	R0, #hi_addr(_servo_pos_6+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,960 :: 		DrawButton(&servo_number_button_6);
MOVW	R0, #lo_addr(_servo_number_button_6+0)
MOVT	R0, #hi_addr(_servo_number_button_6+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,961 :: 		DrawImage(&Image10);
MOVW	R0, #lo_addr(_Image10+0)
MOVT	R0, #hi_addr(_Image10+0)
BL	_DrawImage+0
;MikromediaGreenhouseProject_main.c,962 :: 		DrawProgressBar(&ProgressBar1);
MOVW	R0, #lo_addr(_ProgressBar1+0)
MOVT	R0, #hi_addr(_ProgressBar1+0)
BL	_DrawProgressBar+0
;MikromediaGreenhouseProject_main.c,963 :: 		}
L_servo_position_log129:
;MikromediaGreenhouseProject_main.c,964 :: 		break;
IT	AL
BAL	L_servo_position_log108
;MikromediaGreenhouseProject_main.c,966 :: 		case 7 :
L_servo_position_log130:
;MikromediaGreenhouseProject_main.c,968 :: 		if (screen_flag == 1)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_servo_position_log131
;MikromediaGreenhouseProject_main.c,970 :: 		clear_servoNumber_button_colors( );
BL	_clear_servoNumber_button_colors+0
;MikromediaGreenhouseProject_main.c,971 :: 		servo_number_button_7.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_7+36)
MOVT	R0, #hi_addr(_servo_number_button_7+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,972 :: 		servo_number_button_7.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_7+16)
MOVT	R0, #hi_addr(_servo_number_button_7+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,973 :: 		ProgressBar1.Position = servo_pos_7;
MOVW	R0, #lo_addr(_servo_pos_7+0)
MOVT	R0, #hi_addr(_servo_pos_7+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,974 :: 		}
L_servo_position_log131:
;MikromediaGreenhouseProject_main.c,975 :: 		if (screen_flag == 2)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_servo_position_log132
;MikromediaGreenhouseProject_main.c,977 :: 		clear_servoNumber_buttons( );
BL	_clear_servoNumber_buttons+0
;MikromediaGreenhouseProject_main.c,978 :: 		servo_number_button_7.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_7+36)
MOVT	R0, #hi_addr(_servo_number_button_7+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,979 :: 		servo_number_button_7.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_7+16)
MOVT	R0, #hi_addr(_servo_number_button_7+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,980 :: 		ProgressBar1.Position = servo_pos_7;
MOVW	R0, #lo_addr(_servo_pos_7+0)
MOVT	R0, #hi_addr(_servo_pos_7+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,981 :: 		DrawButton(&servo_number_button_7);
MOVW	R0, #lo_addr(_servo_number_button_7+0)
MOVT	R0, #hi_addr(_servo_number_button_7+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,982 :: 		DrawImage(&Image10);
MOVW	R0, #lo_addr(_Image10+0)
MOVT	R0, #hi_addr(_Image10+0)
BL	_DrawImage+0
;MikromediaGreenhouseProject_main.c,983 :: 		DrawProgressBar(&ProgressBar1);
MOVW	R0, #lo_addr(_ProgressBar1+0)
MOVT	R0, #hi_addr(_ProgressBar1+0)
BL	_DrawProgressBar+0
;MikromediaGreenhouseProject_main.c,984 :: 		}
L_servo_position_log132:
;MikromediaGreenhouseProject_main.c,985 :: 		break;
IT	AL
BAL	L_servo_position_log108
;MikromediaGreenhouseProject_main.c,987 :: 		case 8 :
L_servo_position_log133:
;MikromediaGreenhouseProject_main.c,989 :: 		if (screen_flag == 1)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_servo_position_log134
;MikromediaGreenhouseProject_main.c,991 :: 		clear_servoNumber_button_colors( );
BL	_clear_servoNumber_button_colors+0
;MikromediaGreenhouseProject_main.c,992 :: 		servo_number_button_8.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_8+36)
MOVT	R0, #hi_addr(_servo_number_button_8+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,993 :: 		servo_number_button_8.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_8+16)
MOVT	R0, #hi_addr(_servo_number_button_8+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,994 :: 		ProgressBar1.Position = servo_pos_8;
MOVW	R0, #lo_addr(_servo_pos_8+0)
MOVT	R0, #hi_addr(_servo_pos_8+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,995 :: 		}
L_servo_position_log134:
;MikromediaGreenhouseProject_main.c,996 :: 		if (screen_flag == 2)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_servo_position_log135
;MikromediaGreenhouseProject_main.c,998 :: 		clear_servoNumber_buttons( );
BL	_clear_servoNumber_buttons+0
;MikromediaGreenhouseProject_main.c,999 :: 		servo_number_button_8.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_8+36)
MOVT	R0, #hi_addr(_servo_number_button_8+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1000 :: 		servo_number_button_8.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_8+16)
MOVT	R0, #hi_addr(_servo_number_button_8+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1001 :: 		ProgressBar1.Position = servo_pos_8;
MOVW	R0, #lo_addr(_servo_pos_8+0)
MOVT	R0, #hi_addr(_servo_pos_8+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1002 :: 		DrawButton(&servo_number_button_8);
MOVW	R0, #lo_addr(_servo_number_button_8+0)
MOVT	R0, #hi_addr(_servo_number_button_8+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1003 :: 		DrawImage(&Image10);
MOVW	R0, #lo_addr(_Image10+0)
MOVT	R0, #hi_addr(_Image10+0)
BL	_DrawImage+0
;MikromediaGreenhouseProject_main.c,1004 :: 		DrawProgressBar(&ProgressBar1);
MOVW	R0, #lo_addr(_ProgressBar1+0)
MOVT	R0, #hi_addr(_ProgressBar1+0)
BL	_DrawProgressBar+0
;MikromediaGreenhouseProject_main.c,1005 :: 		}
L_servo_position_log135:
;MikromediaGreenhouseProject_main.c,1006 :: 		break;
IT	AL
BAL	L_servo_position_log108
;MikromediaGreenhouseProject_main.c,1008 :: 		case 9 :
L_servo_position_log136:
;MikromediaGreenhouseProject_main.c,1010 :: 		if (screen_flag == 1)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_servo_position_log137
;MikromediaGreenhouseProject_main.c,1012 :: 		clear_servoNumber_button_colors( );
BL	_clear_servoNumber_button_colors+0
;MikromediaGreenhouseProject_main.c,1013 :: 		servo_number_button_9.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_9+36)
MOVT	R0, #hi_addr(_servo_number_button_9+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1014 :: 		servo_number_button_9.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_9+16)
MOVT	R0, #hi_addr(_servo_number_button_9+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1015 :: 		ProgressBar1.Position = servo_pos_9;
MOVW	R0, #lo_addr(_servo_pos_9+0)
MOVT	R0, #hi_addr(_servo_pos_9+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1016 :: 		}
L_servo_position_log137:
;MikromediaGreenhouseProject_main.c,1017 :: 		if (screen_flag == 2)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_servo_position_log138
;MikromediaGreenhouseProject_main.c,1019 :: 		clear_servoNumber_buttons( );
BL	_clear_servoNumber_buttons+0
;MikromediaGreenhouseProject_main.c,1020 :: 		servo_number_button_9.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_9+36)
MOVT	R0, #hi_addr(_servo_number_button_9+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1021 :: 		servo_number_button_9.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_9+16)
MOVT	R0, #hi_addr(_servo_number_button_9+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1022 :: 		ProgressBar1.Position = servo_pos_9;
MOVW	R0, #lo_addr(_servo_pos_9+0)
MOVT	R0, #hi_addr(_servo_pos_9+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1023 :: 		DrawButton(&servo_number_button_9);
MOVW	R0, #lo_addr(_servo_number_button_9+0)
MOVT	R0, #hi_addr(_servo_number_button_9+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1024 :: 		DrawImage(&Image10);
MOVW	R0, #lo_addr(_Image10+0)
MOVT	R0, #hi_addr(_Image10+0)
BL	_DrawImage+0
;MikromediaGreenhouseProject_main.c,1025 :: 		DrawProgressBar(&ProgressBar1);
MOVW	R0, #lo_addr(_ProgressBar1+0)
MOVT	R0, #hi_addr(_ProgressBar1+0)
BL	_DrawProgressBar+0
;MikromediaGreenhouseProject_main.c,1026 :: 		}
L_servo_position_log138:
;MikromediaGreenhouseProject_main.c,1027 :: 		break;
IT	AL
BAL	L_servo_position_log108
;MikromediaGreenhouseProject_main.c,1029 :: 		case 10 :
L_servo_position_log139:
;MikromediaGreenhouseProject_main.c,1031 :: 		if (screen_flag == 1)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_servo_position_log140
;MikromediaGreenhouseProject_main.c,1033 :: 		clear_servoNumber_button_colors( );
BL	_clear_servoNumber_button_colors+0
;MikromediaGreenhouseProject_main.c,1034 :: 		servo_number_button_10.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_10+36)
MOVT	R0, #hi_addr(_servo_number_button_10+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1035 :: 		servo_number_button_10.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_10+16)
MOVT	R0, #hi_addr(_servo_number_button_10+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1036 :: 		ProgressBar1.Position = servo_pos_10;
MOVW	R0, #lo_addr(_servo_pos_10+0)
MOVT	R0, #hi_addr(_servo_pos_10+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1037 :: 		}
L_servo_position_log140:
;MikromediaGreenhouseProject_main.c,1038 :: 		if (screen_flag == 2)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_servo_position_log141
;MikromediaGreenhouseProject_main.c,1040 :: 		clear_servoNumber_buttons( );
BL	_clear_servoNumber_buttons+0
;MikromediaGreenhouseProject_main.c,1041 :: 		servo_number_button_10.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_10+36)
MOVT	R0, #hi_addr(_servo_number_button_10+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1042 :: 		servo_number_button_10.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_10+16)
MOVT	R0, #hi_addr(_servo_number_button_10+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1043 :: 		ProgressBar1.Position = servo_pos_10;
MOVW	R0, #lo_addr(_servo_pos_10+0)
MOVT	R0, #hi_addr(_servo_pos_10+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1044 :: 		DrawButton(&servo_number_button_10);
MOVW	R0, #lo_addr(_servo_number_button_10+0)
MOVT	R0, #hi_addr(_servo_number_button_10+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1045 :: 		DrawImage(&Image10);
MOVW	R0, #lo_addr(_Image10+0)
MOVT	R0, #hi_addr(_Image10+0)
BL	_DrawImage+0
;MikromediaGreenhouseProject_main.c,1046 :: 		DrawProgressBar(&ProgressBar1);
MOVW	R0, #lo_addr(_ProgressBar1+0)
MOVT	R0, #hi_addr(_ProgressBar1+0)
BL	_DrawProgressBar+0
;MikromediaGreenhouseProject_main.c,1047 :: 		}
L_servo_position_log141:
;MikromediaGreenhouseProject_main.c,1048 :: 		break;
IT	AL
BAL	L_servo_position_log108
;MikromediaGreenhouseProject_main.c,1050 :: 		case 11 :
L_servo_position_log142:
;MikromediaGreenhouseProject_main.c,1052 :: 		if (screen_flag == 1)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_servo_position_log143
;MikromediaGreenhouseProject_main.c,1054 :: 		clear_servoNumber_button_colors( );
BL	_clear_servoNumber_button_colors+0
;MikromediaGreenhouseProject_main.c,1055 :: 		servo_number_button_11.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_11+36)
MOVT	R0, #hi_addr(_servo_number_button_11+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1056 :: 		servo_number_button_11.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_11+16)
MOVT	R0, #hi_addr(_servo_number_button_11+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1057 :: 		ProgressBar1.Position = servo_pos_11;
MOVW	R0, #lo_addr(_servo_pos_11+0)
MOVT	R0, #hi_addr(_servo_pos_11+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1058 :: 		}
L_servo_position_log143:
;MikromediaGreenhouseProject_main.c,1059 :: 		if (screen_flag == 2)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_servo_position_log144
;MikromediaGreenhouseProject_main.c,1061 :: 		clear_servoNumber_buttons( );
BL	_clear_servoNumber_buttons+0
;MikromediaGreenhouseProject_main.c,1062 :: 		servo_number_button_11.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_11+36)
MOVT	R0, #hi_addr(_servo_number_button_11+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1063 :: 		servo_number_button_11.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_11+16)
MOVT	R0, #hi_addr(_servo_number_button_11+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1064 :: 		ProgressBar1.Position = servo_pos_11;
MOVW	R0, #lo_addr(_servo_pos_11+0)
MOVT	R0, #hi_addr(_servo_pos_11+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1065 :: 		DrawButton(&servo_number_button_11);
MOVW	R0, #lo_addr(_servo_number_button_11+0)
MOVT	R0, #hi_addr(_servo_number_button_11+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1066 :: 		DrawImage(&Image10);
MOVW	R0, #lo_addr(_Image10+0)
MOVT	R0, #hi_addr(_Image10+0)
BL	_DrawImage+0
;MikromediaGreenhouseProject_main.c,1067 :: 		DrawProgressBar(&ProgressBar1);
MOVW	R0, #lo_addr(_ProgressBar1+0)
MOVT	R0, #hi_addr(_ProgressBar1+0)
BL	_DrawProgressBar+0
;MikromediaGreenhouseProject_main.c,1068 :: 		}
L_servo_position_log144:
;MikromediaGreenhouseProject_main.c,1069 :: 		break;
IT	AL
BAL	L_servo_position_log108
;MikromediaGreenhouseProject_main.c,1071 :: 		case 12 :
L_servo_position_log145:
;MikromediaGreenhouseProject_main.c,1073 :: 		if (screen_flag == 1)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_servo_position_log146
;MikromediaGreenhouseProject_main.c,1075 :: 		clear_servoNumber_button_colors( );
BL	_clear_servoNumber_button_colors+0
;MikromediaGreenhouseProject_main.c,1076 :: 		servo_number_button_12.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_12+36)
MOVT	R0, #hi_addr(_servo_number_button_12+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1077 :: 		servo_number_button_12.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_12+16)
MOVT	R0, #hi_addr(_servo_number_button_12+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1078 :: 		ProgressBar1.Position = servo_pos_12;
MOVW	R0, #lo_addr(_servo_pos_12+0)
MOVT	R0, #hi_addr(_servo_pos_12+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1079 :: 		}
L_servo_position_log146:
;MikromediaGreenhouseProject_main.c,1080 :: 		if (screen_flag == 2)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_servo_position_log147
;MikromediaGreenhouseProject_main.c,1082 :: 		clear_servoNumber_buttons( );
BL	_clear_servoNumber_buttons+0
;MikromediaGreenhouseProject_main.c,1083 :: 		servo_number_button_12.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_12+36)
MOVT	R0, #hi_addr(_servo_number_button_12+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1084 :: 		servo_number_button_12.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_12+16)
MOVT	R0, #hi_addr(_servo_number_button_12+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1085 :: 		ProgressBar1.Position = servo_pos_12;
MOVW	R0, #lo_addr(_servo_pos_12+0)
MOVT	R0, #hi_addr(_servo_pos_12+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1086 :: 		DrawButton(&servo_number_button_12);
MOVW	R0, #lo_addr(_servo_number_button_12+0)
MOVT	R0, #hi_addr(_servo_number_button_12+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1087 :: 		DrawImage(&Image10);
MOVW	R0, #lo_addr(_Image10+0)
MOVT	R0, #hi_addr(_Image10+0)
BL	_DrawImage+0
;MikromediaGreenhouseProject_main.c,1088 :: 		DrawProgressBar(&ProgressBar1);
MOVW	R0, #lo_addr(_ProgressBar1+0)
MOVT	R0, #hi_addr(_ProgressBar1+0)
BL	_DrawProgressBar+0
;MikromediaGreenhouseProject_main.c,1089 :: 		}
L_servo_position_log147:
;MikromediaGreenhouseProject_main.c,1090 :: 		break;
IT	AL
BAL	L_servo_position_log108
;MikromediaGreenhouseProject_main.c,1092 :: 		case 13 :
L_servo_position_log148:
;MikromediaGreenhouseProject_main.c,1094 :: 		if (screen_flag == 1)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_servo_position_log149
;MikromediaGreenhouseProject_main.c,1096 :: 		clear_servoNumber_button_colors( );
BL	_clear_servoNumber_button_colors+0
;MikromediaGreenhouseProject_main.c,1097 :: 		servo_number_button_13.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_13+36)
MOVT	R0, #hi_addr(_servo_number_button_13+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1098 :: 		servo_number_button_13.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_13+16)
MOVT	R0, #hi_addr(_servo_number_button_13+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1099 :: 		ProgressBar1.Position = servo_pos_13;
MOVW	R0, #lo_addr(_servo_pos_13+0)
MOVT	R0, #hi_addr(_servo_pos_13+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1100 :: 		}
L_servo_position_log149:
;MikromediaGreenhouseProject_main.c,1101 :: 		if (screen_flag == 2)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_servo_position_log150
;MikromediaGreenhouseProject_main.c,1103 :: 		clear_servoNumber_buttons( );
BL	_clear_servoNumber_buttons+0
;MikromediaGreenhouseProject_main.c,1104 :: 		servo_number_button_13.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_13+36)
MOVT	R0, #hi_addr(_servo_number_button_13+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1105 :: 		servo_number_button_13.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_13+16)
MOVT	R0, #hi_addr(_servo_number_button_13+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1106 :: 		ProgressBar1.Position = servo_pos_13;
MOVW	R0, #lo_addr(_servo_pos_13+0)
MOVT	R0, #hi_addr(_servo_pos_13+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1107 :: 		DrawButton(&servo_number_button_13);
MOVW	R0, #lo_addr(_servo_number_button_13+0)
MOVT	R0, #hi_addr(_servo_number_button_13+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1108 :: 		DrawImage(&Image10);
MOVW	R0, #lo_addr(_Image10+0)
MOVT	R0, #hi_addr(_Image10+0)
BL	_DrawImage+0
;MikromediaGreenhouseProject_main.c,1109 :: 		DrawProgressBar(&ProgressBar1);
MOVW	R0, #lo_addr(_ProgressBar1+0)
MOVT	R0, #hi_addr(_ProgressBar1+0)
BL	_DrawProgressBar+0
;MikromediaGreenhouseProject_main.c,1110 :: 		}
L_servo_position_log150:
;MikromediaGreenhouseProject_main.c,1111 :: 		break;
IT	AL
BAL	L_servo_position_log108
;MikromediaGreenhouseProject_main.c,1113 :: 		case 14 :
L_servo_position_log151:
;MikromediaGreenhouseProject_main.c,1115 :: 		if (screen_flag == 1)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_servo_position_log152
;MikromediaGreenhouseProject_main.c,1117 :: 		clear_servoNumber_button_colors( );
BL	_clear_servoNumber_button_colors+0
;MikromediaGreenhouseProject_main.c,1118 :: 		servo_number_button_14.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_14+36)
MOVT	R0, #hi_addr(_servo_number_button_14+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1119 :: 		servo_number_button_14.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_14+16)
MOVT	R0, #hi_addr(_servo_number_button_14+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1120 :: 		ProgressBar1.Position = servo_pos_14;
MOVW	R0, #lo_addr(_servo_pos_14+0)
MOVT	R0, #hi_addr(_servo_pos_14+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1121 :: 		}
L_servo_position_log152:
;MikromediaGreenhouseProject_main.c,1122 :: 		if (screen_flag == 2)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_servo_position_log153
;MikromediaGreenhouseProject_main.c,1124 :: 		clear_servoNumber_buttons( );
BL	_clear_servoNumber_buttons+0
;MikromediaGreenhouseProject_main.c,1125 :: 		servo_number_button_14.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_14+36)
MOVT	R0, #hi_addr(_servo_number_button_14+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1126 :: 		servo_number_button_14.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_14+16)
MOVT	R0, #hi_addr(_servo_number_button_14+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1127 :: 		ProgressBar1.Position = servo_pos_14;
MOVW	R0, #lo_addr(_servo_pos_14+0)
MOVT	R0, #hi_addr(_servo_pos_14+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1128 :: 		DrawButton(&servo_number_button_14);
MOVW	R0, #lo_addr(_servo_number_button_14+0)
MOVT	R0, #hi_addr(_servo_number_button_14+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1129 :: 		DrawImage(&Image10);
MOVW	R0, #lo_addr(_Image10+0)
MOVT	R0, #hi_addr(_Image10+0)
BL	_DrawImage+0
;MikromediaGreenhouseProject_main.c,1130 :: 		DrawProgressBar(&ProgressBar1);
MOVW	R0, #lo_addr(_ProgressBar1+0)
MOVT	R0, #hi_addr(_ProgressBar1+0)
BL	_DrawProgressBar+0
;MikromediaGreenhouseProject_main.c,1131 :: 		}
L_servo_position_log153:
;MikromediaGreenhouseProject_main.c,1132 :: 		break;
IT	AL
BAL	L_servo_position_log108
;MikromediaGreenhouseProject_main.c,1134 :: 		case 15 :
L_servo_position_log154:
;MikromediaGreenhouseProject_main.c,1136 :: 		if (screen_flag == 1)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_servo_position_log155
;MikromediaGreenhouseProject_main.c,1138 :: 		clear_servoNumber_button_colors( );
BL	_clear_servoNumber_button_colors+0
;MikromediaGreenhouseProject_main.c,1139 :: 		servo_number_button_15.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_15+36)
MOVT	R0, #hi_addr(_servo_number_button_15+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1140 :: 		servo_number_button_15.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_15+16)
MOVT	R0, #hi_addr(_servo_number_button_15+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1141 :: 		ProgressBar1.Position = servo_pos_15;
MOVW	R0, #lo_addr(_servo_pos_15+0)
MOVT	R0, #hi_addr(_servo_pos_15+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1142 :: 		}
L_servo_position_log155:
;MikromediaGreenhouseProject_main.c,1143 :: 		if (screen_flag == 2)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_servo_position_log156
;MikromediaGreenhouseProject_main.c,1145 :: 		clear_servoNumber_buttons( );
BL	_clear_servoNumber_buttons+0
;MikromediaGreenhouseProject_main.c,1146 :: 		servo_number_button_15.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_15+36)
MOVT	R0, #hi_addr(_servo_number_button_15+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1147 :: 		servo_number_button_15.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_15+16)
MOVT	R0, #hi_addr(_servo_number_button_15+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1148 :: 		ProgressBar1.Position = servo_pos_15;
MOVW	R0, #lo_addr(_servo_pos_15+0)
MOVT	R0, #hi_addr(_servo_pos_15+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1149 :: 		DrawButton(&servo_number_button_15);
MOVW	R0, #lo_addr(_servo_number_button_15+0)
MOVT	R0, #hi_addr(_servo_number_button_15+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1150 :: 		DrawImage(&Image10);
MOVW	R0, #lo_addr(_Image10+0)
MOVT	R0, #hi_addr(_Image10+0)
BL	_DrawImage+0
;MikromediaGreenhouseProject_main.c,1151 :: 		DrawProgressBar(&ProgressBar1);
MOVW	R0, #lo_addr(_ProgressBar1+0)
MOVT	R0, #hi_addr(_ProgressBar1+0)
BL	_DrawProgressBar+0
;MikromediaGreenhouseProject_main.c,1152 :: 		}
L_servo_position_log156:
;MikromediaGreenhouseProject_main.c,1153 :: 		break;
IT	AL
BAL	L_servo_position_log108
;MikromediaGreenhouseProject_main.c,1155 :: 		case 16 :
L_servo_position_log157:
;MikromediaGreenhouseProject_main.c,1157 :: 		if (screen_flag == 1)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_servo_position_log158
;MikromediaGreenhouseProject_main.c,1159 :: 		clear_servoNumber_button_colors( );
BL	_clear_servoNumber_button_colors+0
;MikromediaGreenhouseProject_main.c,1160 :: 		servo_number_button_16.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_16+36)
MOVT	R0, #hi_addr(_servo_number_button_16+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1161 :: 		servo_number_button_16.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_16+16)
MOVT	R0, #hi_addr(_servo_number_button_16+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1162 :: 		ProgressBar1.Position = servo_pos_16;
MOVW	R0, #lo_addr(_servo_pos_16+0)
MOVT	R0, #hi_addr(_servo_pos_16+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1163 :: 		}
L_servo_position_log158:
;MikromediaGreenhouseProject_main.c,1164 :: 		if (screen_flag == 2)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_servo_position_log159
;MikromediaGreenhouseProject_main.c,1166 :: 		clear_servoNumber_buttons( );
BL	_clear_servoNumber_buttons+0
;MikromediaGreenhouseProject_main.c,1167 :: 		servo_number_button_16.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_16+36)
MOVT	R0, #hi_addr(_servo_number_button_16+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1168 :: 		servo_number_button_16.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_servo_number_button_16+16)
MOVT	R0, #hi_addr(_servo_number_button_16+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1169 :: 		ProgressBar1.Position = servo_pos_16;
MOVW	R0, #lo_addr(_servo_pos_16+0)
MOVT	R0, #hi_addr(_servo_pos_16+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ProgressBar1+44)
MOVT	R0, #hi_addr(_ProgressBar1+44)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1170 :: 		DrawButton(&servo_number_button_16);
MOVW	R0, #lo_addr(_servo_number_button_16+0)
MOVT	R0, #hi_addr(_servo_number_button_16+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1171 :: 		DrawImage(&Image10);
MOVW	R0, #lo_addr(_Image10+0)
MOVT	R0, #hi_addr(_Image10+0)
BL	_DrawImage+0
;MikromediaGreenhouseProject_main.c,1172 :: 		DrawProgressBar(&ProgressBar1);
MOVW	R0, #lo_addr(_ProgressBar1+0)
MOVT	R0, #hi_addr(_ProgressBar1+0)
BL	_DrawProgressBar+0
;MikromediaGreenhouseProject_main.c,1173 :: 		}
L_servo_position_log159:
;MikromediaGreenhouseProject_main.c,1174 :: 		break;
IT	AL
BAL	L_servo_position_log108
;MikromediaGreenhouseProject_main.c,1176 :: 		default :
L_servo_position_log160:
;MikromediaGreenhouseProject_main.c,1178 :: 		break;
IT	AL
BAL	L_servo_position_log108
;MikromediaGreenhouseProject_main.c,1180 :: 		}
L_servo_position_log107:
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_servo_position_log109
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_servo_position_log112
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_servo_position_log115
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_servo_position_log118
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_servo_position_log121
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #5
IT	EQ
BEQ	L_servo_position_log124
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #6
IT	EQ
BEQ	L_servo_position_log127
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #7
IT	EQ
BEQ	L_servo_position_log130
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #8
IT	EQ
BEQ	L_servo_position_log133
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #9
IT	EQ
BEQ	L_servo_position_log136
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #10
IT	EQ
BEQ	L_servo_position_log139
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #11
IT	EQ
BEQ	L_servo_position_log142
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #12
IT	EQ
BEQ	L_servo_position_log145
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #13
IT	EQ
BEQ	L_servo_position_log148
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #14
IT	EQ
BEQ	L_servo_position_log151
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #15
IT	EQ
BEQ	L_servo_position_log154
MOVW	R0, #lo_addr(_servo_num+0)
MOVT	R0, #hi_addr(_servo_num+0)
LDRB	R0, [R0, #0]
CMP	R0, #16
IT	EQ
BEQ	L_servo_position_log157
IT	AL
BAL	L_servo_position_log160
L_servo_position_log108:
;MikromediaGreenhouseProject_main.c,1181 :: 		}
L_end_servo_position_log:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _servo_position_log
_fan_speed_log:
;MikromediaGreenhouseProject_main.c,1183 :: 		void fan_speed_log( )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MikromediaGreenhouseProject_main.c,1185 :: 		switch (fan_speed)
IT	AL
BAL	L_fan_speed_log161
;MikromediaGreenhouseProject_main.c,1187 :: 		case 0 :
L_fan_speed_log163:
;MikromediaGreenhouseProject_main.c,1189 :: 		if (screen_flag == 1)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_fan_speed_log164
;MikromediaGreenhouseProject_main.c,1191 :: 		clear_fanSpeed_button_colors( );
BL	_clear_fanSpeed_button_colors+0
;MikromediaGreenhouseProject_main.c,1192 :: 		fan_speed_button_stop.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_stop+36)
MOVT	R0, #hi_addr(_fan_speed_button_stop+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1193 :: 		fan_speed_button_stop.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_stop+16)
MOVT	R0, #hi_addr(_fan_speed_button_stop+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1194 :: 		}
L_fan_speed_log164:
;MikromediaGreenhouseProject_main.c,1195 :: 		if (screen_flag == 2)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_fan_speed_log165
;MikromediaGreenhouseProject_main.c,1197 :: 		clear_fanSpeed_buttons( );
BL	_clear_fanSpeed_buttons+0
;MikromediaGreenhouseProject_main.c,1198 :: 		fan_speed_button_stop.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_stop+36)
MOVT	R0, #hi_addr(_fan_speed_button_stop+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1199 :: 		fan_speed_button_stop.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_stop+16)
MOVT	R0, #hi_addr(_fan_speed_button_stop+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1200 :: 		DrawButton(&fan_speed_button_stop);
MOVW	R0, #lo_addr(_fan_speed_button_stop+0)
MOVT	R0, #hi_addr(_fan_speed_button_stop+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1201 :: 		}
L_fan_speed_log165:
;MikromediaGreenhouseProject_main.c,1202 :: 		break;
IT	AL
BAL	L_fan_speed_log162
;MikromediaGreenhouseProject_main.c,1204 :: 		case 1 :
L_fan_speed_log166:
;MikromediaGreenhouseProject_main.c,1206 :: 		if (screen_flag == 1)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_fan_speed_log167
;MikromediaGreenhouseProject_main.c,1208 :: 		clear_fanSpeed_button_colors( );
BL	_clear_fanSpeed_button_colors+0
;MikromediaGreenhouseProject_main.c,1209 :: 		fan_speed_button_1.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_1+36)
MOVT	R0, #hi_addr(_fan_speed_button_1+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1210 :: 		fan_speed_button_1.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_1+16)
MOVT	R0, #hi_addr(_fan_speed_button_1+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1211 :: 		}
L_fan_speed_log167:
;MikromediaGreenhouseProject_main.c,1212 :: 		if (screen_flag == 2)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_fan_speed_log168
;MikromediaGreenhouseProject_main.c,1214 :: 		clear_fanSpeed_buttons( );
BL	_clear_fanSpeed_buttons+0
;MikromediaGreenhouseProject_main.c,1215 :: 		fan_speed_button_1.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_1+36)
MOVT	R0, #hi_addr(_fan_speed_button_1+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1216 :: 		fan_speed_button_1.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_1+16)
MOVT	R0, #hi_addr(_fan_speed_button_1+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1217 :: 		DrawButton(&fan_speed_button_1);
MOVW	R0, #lo_addr(_fan_speed_button_1+0)
MOVT	R0, #hi_addr(_fan_speed_button_1+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1218 :: 		}
L_fan_speed_log168:
;MikromediaGreenhouseProject_main.c,1219 :: 		break;
IT	AL
BAL	L_fan_speed_log162
;MikromediaGreenhouseProject_main.c,1221 :: 		case 2 :
L_fan_speed_log169:
;MikromediaGreenhouseProject_main.c,1223 :: 		if (screen_flag == 1)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_fan_speed_log170
;MikromediaGreenhouseProject_main.c,1225 :: 		clear_fanSpeed_button_colors( );
BL	_clear_fanSpeed_button_colors+0
;MikromediaGreenhouseProject_main.c,1226 :: 		fan_speed_button_2.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_2+36)
MOVT	R0, #hi_addr(_fan_speed_button_2+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1227 :: 		fan_speed_button_2.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_2+16)
MOVT	R0, #hi_addr(_fan_speed_button_2+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1228 :: 		}
L_fan_speed_log170:
;MikromediaGreenhouseProject_main.c,1229 :: 		if (screen_flag == 2)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_fan_speed_log171
;MikromediaGreenhouseProject_main.c,1231 :: 		clear_fanSpeed_buttons( );
BL	_clear_fanSpeed_buttons+0
;MikromediaGreenhouseProject_main.c,1232 :: 		fan_speed_button_2.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_2+36)
MOVT	R0, #hi_addr(_fan_speed_button_2+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1233 :: 		fan_speed_button_2.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_2+16)
MOVT	R0, #hi_addr(_fan_speed_button_2+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1234 :: 		DrawButton(&fan_speed_button_2);
MOVW	R0, #lo_addr(_fan_speed_button_2+0)
MOVT	R0, #hi_addr(_fan_speed_button_2+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1235 :: 		}
L_fan_speed_log171:
;MikromediaGreenhouseProject_main.c,1236 :: 		break;
IT	AL
BAL	L_fan_speed_log162
;MikromediaGreenhouseProject_main.c,1238 :: 		case 3 :
L_fan_speed_log172:
;MikromediaGreenhouseProject_main.c,1240 :: 		if (screen_flag == 1)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_fan_speed_log173
;MikromediaGreenhouseProject_main.c,1242 :: 		clear_fanSpeed_button_colors( );
BL	_clear_fanSpeed_button_colors+0
;MikromediaGreenhouseProject_main.c,1243 :: 		fan_speed_button_3.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_3+36)
MOVT	R0, #hi_addr(_fan_speed_button_3+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1244 :: 		fan_speed_button_3.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_3+16)
MOVT	R0, #hi_addr(_fan_speed_button_3+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1245 :: 		}
L_fan_speed_log173:
;MikromediaGreenhouseProject_main.c,1246 :: 		if (screen_flag == 2)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_fan_speed_log174
;MikromediaGreenhouseProject_main.c,1248 :: 		clear_fanSpeed_buttons( );
BL	_clear_fanSpeed_buttons+0
;MikromediaGreenhouseProject_main.c,1249 :: 		fan_speed_button_3.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_3+36)
MOVT	R0, #hi_addr(_fan_speed_button_3+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1250 :: 		fan_speed_button_3.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_3+16)
MOVT	R0, #hi_addr(_fan_speed_button_3+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1251 :: 		DrawButton(&fan_speed_button_3);
MOVW	R0, #lo_addr(_fan_speed_button_3+0)
MOVT	R0, #hi_addr(_fan_speed_button_3+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1252 :: 		}
L_fan_speed_log174:
;MikromediaGreenhouseProject_main.c,1253 :: 		break;
IT	AL
BAL	L_fan_speed_log162
;MikromediaGreenhouseProject_main.c,1255 :: 		case 4 :
L_fan_speed_log175:
;MikromediaGreenhouseProject_main.c,1257 :: 		if (screen_flag == 1)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_fan_speed_log176
;MikromediaGreenhouseProject_main.c,1259 :: 		clear_fanSpeed_button_colors( );
BL	_clear_fanSpeed_button_colors+0
;MikromediaGreenhouseProject_main.c,1260 :: 		fan_speed_button_4.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_4+36)
MOVT	R0, #hi_addr(_fan_speed_button_4+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1261 :: 		fan_speed_button_4.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_4+16)
MOVT	R0, #hi_addr(_fan_speed_button_4+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1262 :: 		}
L_fan_speed_log176:
;MikromediaGreenhouseProject_main.c,1263 :: 		if (screen_flag == 2)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_fan_speed_log177
;MikromediaGreenhouseProject_main.c,1265 :: 		clear_fanSpeed_buttons( );
BL	_clear_fanSpeed_buttons+0
;MikromediaGreenhouseProject_main.c,1266 :: 		fan_speed_button_4.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_4+36)
MOVT	R0, #hi_addr(_fan_speed_button_4+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1267 :: 		fan_speed_button_4.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_4+16)
MOVT	R0, #hi_addr(_fan_speed_button_4+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1268 :: 		DrawButton(&fan_speed_button_4);
MOVW	R0, #lo_addr(_fan_speed_button_4+0)
MOVT	R0, #hi_addr(_fan_speed_button_4+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1269 :: 		}
L_fan_speed_log177:
;MikromediaGreenhouseProject_main.c,1270 :: 		break;
IT	AL
BAL	L_fan_speed_log162
;MikromediaGreenhouseProject_main.c,1272 :: 		case 5 :
L_fan_speed_log178:
;MikromediaGreenhouseProject_main.c,1274 :: 		if (screen_flag == 1)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_fan_speed_log179
;MikromediaGreenhouseProject_main.c,1276 :: 		clear_fanSpeed_button_colors( );
BL	_clear_fanSpeed_button_colors+0
;MikromediaGreenhouseProject_main.c,1277 :: 		fan_speed_button_5.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_5+36)
MOVT	R0, #hi_addr(_fan_speed_button_5+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1278 :: 		fan_speed_button_5.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_5+16)
MOVT	R0, #hi_addr(_fan_speed_button_5+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1279 :: 		}
L_fan_speed_log179:
;MikromediaGreenhouseProject_main.c,1280 :: 		if (screen_flag == 2)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_fan_speed_log180
;MikromediaGreenhouseProject_main.c,1282 :: 		clear_fanSpeed_buttons( );
BL	_clear_fanSpeed_buttons+0
;MikromediaGreenhouseProject_main.c,1283 :: 		fan_speed_button_5.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_5+36)
MOVT	R0, #hi_addr(_fan_speed_button_5+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1284 :: 		fan_speed_button_5.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_5+16)
MOVT	R0, #hi_addr(_fan_speed_button_5+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1285 :: 		DrawButton(&fan_speed_button_5);
MOVW	R0, #lo_addr(_fan_speed_button_5+0)
MOVT	R0, #hi_addr(_fan_speed_button_5+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1286 :: 		}
L_fan_speed_log180:
;MikromediaGreenhouseProject_main.c,1287 :: 		break;
IT	AL
BAL	L_fan_speed_log162
;MikromediaGreenhouseProject_main.c,1289 :: 		case 6 :
L_fan_speed_log181:
;MikromediaGreenhouseProject_main.c,1291 :: 		if (screen_flag == 1)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_fan_speed_log182
;MikromediaGreenhouseProject_main.c,1293 :: 		clear_fanSpeed_button_colors( );
BL	_clear_fanSpeed_button_colors+0
;MikromediaGreenhouseProject_main.c,1294 :: 		fan_speed_button_6.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_6+36)
MOVT	R0, #hi_addr(_fan_speed_button_6+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1295 :: 		fan_speed_button_6.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_6+16)
MOVT	R0, #hi_addr(_fan_speed_button_6+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1296 :: 		}
L_fan_speed_log182:
;MikromediaGreenhouseProject_main.c,1297 :: 		if (screen_flag == 2)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_fan_speed_log183
;MikromediaGreenhouseProject_main.c,1299 :: 		clear_fanSpeed_buttons( );
BL	_clear_fanSpeed_buttons+0
;MikromediaGreenhouseProject_main.c,1300 :: 		fan_speed_button_6.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_6+36)
MOVT	R0, #hi_addr(_fan_speed_button_6+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1301 :: 		fan_speed_button_6.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_6+16)
MOVT	R0, #hi_addr(_fan_speed_button_6+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1302 :: 		DrawButton(&fan_speed_button_6);
MOVW	R0, #lo_addr(_fan_speed_button_6+0)
MOVT	R0, #hi_addr(_fan_speed_button_6+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1303 :: 		}
L_fan_speed_log183:
;MikromediaGreenhouseProject_main.c,1304 :: 		break;
IT	AL
BAL	L_fan_speed_log162
;MikromediaGreenhouseProject_main.c,1306 :: 		case 7 :
L_fan_speed_log184:
;MikromediaGreenhouseProject_main.c,1308 :: 		if (screen_flag == 1)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_fan_speed_log185
;MikromediaGreenhouseProject_main.c,1310 :: 		clear_fanSpeed_button_colors( );
BL	_clear_fanSpeed_button_colors+0
;MikromediaGreenhouseProject_main.c,1311 :: 		fan_speed_button_7.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_7+36)
MOVT	R0, #hi_addr(_fan_speed_button_7+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1312 :: 		fan_speed_button_7.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_7+16)
MOVT	R0, #hi_addr(_fan_speed_button_7+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1313 :: 		}
L_fan_speed_log185:
;MikromediaGreenhouseProject_main.c,1314 :: 		if (screen_flag == 2)
MOVW	R0, #lo_addr(_screen_flag+0)
MOVT	R0, #hi_addr(_screen_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_fan_speed_log186
;MikromediaGreenhouseProject_main.c,1316 :: 		clear_fanSpeed_buttons( );
BL	_clear_fanSpeed_buttons+0
;MikromediaGreenhouseProject_main.c,1317 :: 		fan_speed_button_7.Font_Color = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_7+36)
MOVT	R0, #hi_addr(_fan_speed_button_7+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1318 :: 		fan_speed_button_7.Pen_Color  = CL_AQUA;
MOVW	R1, #4095
MOVW	R0, #lo_addr(_fan_speed_button_7+16)
MOVT	R0, #hi_addr(_fan_speed_button_7+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1319 :: 		DrawButton(&fan_speed_button_7);
MOVW	R0, #lo_addr(_fan_speed_button_7+0)
MOVT	R0, #hi_addr(_fan_speed_button_7+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1320 :: 		}
L_fan_speed_log186:
;MikromediaGreenhouseProject_main.c,1321 :: 		break;
IT	AL
BAL	L_fan_speed_log162
;MikromediaGreenhouseProject_main.c,1323 :: 		default :
L_fan_speed_log187:
;MikromediaGreenhouseProject_main.c,1325 :: 		break;
IT	AL
BAL	L_fan_speed_log162
;MikromediaGreenhouseProject_main.c,1327 :: 		}
L_fan_speed_log161:
MOVW	R0, #lo_addr(_fan_speed+0)
MOVT	R0, #hi_addr(_fan_speed+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_fan_speed_log163
MOVW	R0, #lo_addr(_fan_speed+0)
MOVT	R0, #hi_addr(_fan_speed+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_fan_speed_log166
MOVW	R0, #lo_addr(_fan_speed+0)
MOVT	R0, #hi_addr(_fan_speed+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_fan_speed_log169
MOVW	R0, #lo_addr(_fan_speed+0)
MOVT	R0, #hi_addr(_fan_speed+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_fan_speed_log172
MOVW	R0, #lo_addr(_fan_speed+0)
MOVT	R0, #hi_addr(_fan_speed+0)
LDRB	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_fan_speed_log175
MOVW	R0, #lo_addr(_fan_speed+0)
MOVT	R0, #hi_addr(_fan_speed+0)
LDRB	R0, [R0, #0]
CMP	R0, #5
IT	EQ
BEQ	L_fan_speed_log178
MOVW	R0, #lo_addr(_fan_speed+0)
MOVT	R0, #hi_addr(_fan_speed+0)
LDRB	R0, [R0, #0]
CMP	R0, #6
IT	EQ
BEQ	L_fan_speed_log181
MOVW	R0, #lo_addr(_fan_speed+0)
MOVT	R0, #hi_addr(_fan_speed+0)
LDRB	R0, [R0, #0]
CMP	R0, #7
IT	EQ
BEQ	L_fan_speed_log184
IT	AL
BAL	L_fan_speed_log187
L_fan_speed_log162:
;MikromediaGreenhouseProject_main.c,1328 :: 		}
L_end_fan_speed_log:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _fan_speed_log
_FloatCut:
;MikromediaGreenhouseProject_main.c,1330 :: 		void FloatCut( char * buffer, uint8_t buffer_size )
; buffer_size start address is: 4 (R1)
; buffer start address is: 0 (R0)
SUB	SP, SP, #4
; buffer_size end address is: 4 (R1)
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
; buffer_size start address is: 4 (R1)
;MikromediaGreenhouseProject_main.c,1333 :: 		uint8_t conCnt = 0;
; conCnt start address is: 20 (R5)
MOVS	R5, #0
;MikromediaGreenhouseProject_main.c,1334 :: 		uint8_t conVar = 0;
; conVar start address is: 24 (R6)
MOVS	R6, #0
;MikromediaGreenhouseProject_main.c,1336 :: 		for (count = 0; count < buffer_size; count++)
; count start address is: 16 (R4)
MOVS	R4, #0
; buffer end address is: 0 (R0)
; buffer_size end address is: 4 (R1)
; conCnt end address is: 20 (R5)
; conVar end address is: 24 (R6)
; count end address is: 16 (R4)
STRB	R1, [SP, #0]
MOV	R1, R0
LDRB	R0, [SP, #0]
L_FloatCut188:
; count start address is: 16 (R4)
; buffer start address is: 4 (R1)
; conVar start address is: 24 (R6)
; conCnt start address is: 20 (R5)
; buffer_size start address is: 0 (R0)
; buffer start address is: 4 (R1)
; buffer end address is: 4 (R1)
CMP	R4, R0
IT	CS
BCS	L_FloatCut189
; buffer end address is: 4 (R1)
;MikromediaGreenhouseProject_main.c,1338 :: 		if (buffer[ count ] == '.')
; buffer start address is: 4 (R1)
ADDS	R2, R1, R4
LDRB	R2, [R2, #0]
CMP	R2, #46
IT	NE
BNE	L__FloatCut226
;MikromediaGreenhouseProject_main.c,1340 :: 		conVar = 1;
MOVS	R6, #1
; conVar end address is: 24 (R6)
;MikromediaGreenhouseProject_main.c,1341 :: 		}
IT	AL
BAL	L_FloatCut191
L__FloatCut226:
;MikromediaGreenhouseProject_main.c,1338 :: 		if (buffer[ count ] == '.')
;MikromediaGreenhouseProject_main.c,1341 :: 		}
L_FloatCut191:
;MikromediaGreenhouseProject_main.c,1342 :: 		if (conVar == 1)
; conVar start address is: 24 (R6)
CMP	R6, #1
IT	NE
BNE	L__FloatCut227
;MikromediaGreenhouseProject_main.c,1344 :: 		conCnt++;
ADDS	R5, R5, #1
UXTB	R5, R5
; conCnt end address is: 20 (R5)
;MikromediaGreenhouseProject_main.c,1345 :: 		}
IT	AL
BAL	L_FloatCut192
L__FloatCut227:
;MikromediaGreenhouseProject_main.c,1342 :: 		if (conVar == 1)
;MikromediaGreenhouseProject_main.c,1345 :: 		}
L_FloatCut192:
;MikromediaGreenhouseProject_main.c,1346 :: 		if (conCnt > 3)
; conCnt start address is: 20 (R5)
CMP	R5, #3
IT	LS
BLS	L__FloatCut228
;MikromediaGreenhouseProject_main.c,1348 :: 		if ((buffer[ count ] == 'e') || (conVar == 2))
ADDS	R2, R1, R4
LDRB	R2, [R2, #0]
CMP	R2, #101
IT	EQ
BEQ	L__FloatCut225
CMP	R6, #2
IT	EQ
BEQ	L__FloatCut224
IT	AL
BAL	L_FloatCut196
; conVar end address is: 24 (R6)
L__FloatCut225:
L__FloatCut224:
;MikromediaGreenhouseProject_main.c,1350 :: 		buffer[ count - (conCnt - 4) ] = buffer[ count ];
SUBS	R2, R5, #4
SXTH	R2, R2
SUB	R2, R4, R2
SXTH	R2, R2
ADDS	R3, R1, R2
ADDS	R2, R1, R4
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;MikromediaGreenhouseProject_main.c,1351 :: 		buffer[ count ] = 0;
ADDS	R3, R1, R4
MOVS	R2, #0
STRB	R2, [R3, #0]
;MikromediaGreenhouseProject_main.c,1352 :: 		conVar = 2;
; conVar start address is: 8 (R2)
MOVS	R2, #2
;MikromediaGreenhouseProject_main.c,1353 :: 		}
UXTB	R6, R2
; conVar end address is: 8 (R2)
IT	AL
BAL	L_FloatCut197
L_FloatCut196:
;MikromediaGreenhouseProject_main.c,1356 :: 		buffer[ count ] = 0;
; conVar start address is: 24 (R6)
ADDS	R3, R1, R4
MOVS	R2, #0
STRB	R2, [R3, #0]
; conVar end address is: 24 (R6)
;MikromediaGreenhouseProject_main.c,1357 :: 		}
L_FloatCut197:
;MikromediaGreenhouseProject_main.c,1358 :: 		}
; conVar start address is: 24 (R6)
; conVar end address is: 24 (R6)
IT	AL
BAL	L_FloatCut193
L__FloatCut228:
;MikromediaGreenhouseProject_main.c,1346 :: 		if (conCnt > 3)
;MikromediaGreenhouseProject_main.c,1358 :: 		}
L_FloatCut193:
;MikromediaGreenhouseProject_main.c,1336 :: 		for (count = 0; count < buffer_size; count++)
; conVar start address is: 24 (R6)
ADDS	R4, R4, #1
UXTB	R4, R4
;MikromediaGreenhouseProject_main.c,1359 :: 		}
; buffer_size end address is: 0 (R0)
; buffer end address is: 4 (R1)
; conCnt end address is: 20 (R5)
; conVar end address is: 24 (R6)
; count end address is: 16 (R4)
IT	AL
BAL	L_FloatCut188
L_FloatCut189:
;MikromediaGreenhouseProject_main.c,1360 :: 		}
L_end_FloatCut:
ADD	SP, SP, #4
BX	LR
; end of _FloatCut
_clear_servoNumber_button_colors:
;MikromediaGreenhouseProject_main.c,1362 :: 		void clear_servoNumber_button_colors( )
;MikromediaGreenhouseProject_main.c,1364 :: 		servo_number_button_1.Pen_Color    = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_1+16)
MOVT	R0, #hi_addr(_servo_number_button_1+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1365 :: 		servo_number_button_1.Font_Color   = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_1+36)
MOVT	R0, #hi_addr(_servo_number_button_1+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1366 :: 		servo_number_button_2.Pen_Color    = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_2+16)
MOVT	R0, #hi_addr(_servo_number_button_2+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1367 :: 		servo_number_button_2.Font_Color   = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_2+36)
MOVT	R0, #hi_addr(_servo_number_button_2+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1368 :: 		servo_number_button_3.Pen_Color    = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_3+16)
MOVT	R0, #hi_addr(_servo_number_button_3+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1369 :: 		servo_number_button_3.Font_Color   = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_3+36)
MOVT	R0, #hi_addr(_servo_number_button_3+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1370 :: 		servo_number_button_4.Pen_Color    = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_4+16)
MOVT	R0, #hi_addr(_servo_number_button_4+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1371 :: 		servo_number_button_4.Font_Color   = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_4+36)
MOVT	R0, #hi_addr(_servo_number_button_4+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1372 :: 		servo_number_button_5.Pen_Color    = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_5+16)
MOVT	R0, #hi_addr(_servo_number_button_5+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1373 :: 		servo_number_button_5.Font_Color   = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_5+36)
MOVT	R0, #hi_addr(_servo_number_button_5+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1374 :: 		servo_number_button_6.Pen_Color    = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_6+16)
MOVT	R0, #hi_addr(_servo_number_button_6+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1375 :: 		servo_number_button_6.Font_Color   = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_6+36)
MOVT	R0, #hi_addr(_servo_number_button_6+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1376 :: 		servo_number_button_7.Pen_Color    = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_7+16)
MOVT	R0, #hi_addr(_servo_number_button_7+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1377 :: 		servo_number_button_7.Font_Color   = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_7+36)
MOVT	R0, #hi_addr(_servo_number_button_7+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1378 :: 		servo_number_button_8.Pen_Color    = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_8+16)
MOVT	R0, #hi_addr(_servo_number_button_8+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1379 :: 		servo_number_button_8.Font_Color   = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_8+36)
MOVT	R0, #hi_addr(_servo_number_button_8+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1380 :: 		servo_number_button_9.Pen_Color    = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_9+16)
MOVT	R0, #hi_addr(_servo_number_button_9+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1381 :: 		servo_number_button_9.Font_Color   = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_9+36)
MOVT	R0, #hi_addr(_servo_number_button_9+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1382 :: 		servo_number_button_10.Pen_Color   = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_10+16)
MOVT	R0, #hi_addr(_servo_number_button_10+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1383 :: 		servo_number_button_10.Font_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_10+36)
MOVT	R0, #hi_addr(_servo_number_button_10+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1384 :: 		servo_number_button_11.Pen_Color   = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_11+16)
MOVT	R0, #hi_addr(_servo_number_button_11+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1385 :: 		servo_number_button_11.Font_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_11+36)
MOVT	R0, #hi_addr(_servo_number_button_11+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1386 :: 		servo_number_button_12.Pen_Color   = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_12+16)
MOVT	R0, #hi_addr(_servo_number_button_12+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1387 :: 		servo_number_button_12.Font_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_12+36)
MOVT	R0, #hi_addr(_servo_number_button_12+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1388 :: 		servo_number_button_13.Pen_Color   = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_13+16)
MOVT	R0, #hi_addr(_servo_number_button_13+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1389 :: 		servo_number_button_13.Font_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_13+36)
MOVT	R0, #hi_addr(_servo_number_button_13+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1390 :: 		servo_number_button_14.Pen_Color   = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_14+16)
MOVT	R0, #hi_addr(_servo_number_button_14+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1391 :: 		servo_number_button_14.Font_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_14+36)
MOVT	R0, #hi_addr(_servo_number_button_14+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1392 :: 		servo_number_button_15.Pen_Color   = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_15+16)
MOVT	R0, #hi_addr(_servo_number_button_15+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1393 :: 		servo_number_button_15.Font_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_15+36)
MOVT	R0, #hi_addr(_servo_number_button_15+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1394 :: 		servo_number_button_16.Pen_Color   = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_16+16)
MOVT	R0, #hi_addr(_servo_number_button_16+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1395 :: 		servo_number_button_16.Font_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_16+36)
MOVT	R0, #hi_addr(_servo_number_button_16+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1396 :: 		servo_number_button_all.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_all+16)
MOVT	R0, #hi_addr(_servo_number_button_all+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1397 :: 		servo_number_button_all.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_all+36)
MOVT	R0, #hi_addr(_servo_number_button_all+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1398 :: 		}
L_end_clear_servoNumber_button_colors:
BX	LR
; end of _clear_servoNumber_button_colors
_clear_servoNumber_buttons:
;MikromediaGreenhouseProject_main.c,1400 :: 		void clear_servoNumber_buttons( )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MikromediaGreenhouseProject_main.c,1402 :: 		if (servo_number_button_1.Pen_Color != CL_LIME)
MOVW	R0, #lo_addr(_servo_number_button_1+16)
MOVT	R0, #hi_addr(_servo_number_button_1+16)
LDRH	R0, [R0, #0]
CMP	R0, #2016
IT	EQ
BEQ	L_clear_servoNumber_buttons198
;MikromediaGreenhouseProject_main.c,1404 :: 		servo_number_button_1.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_1+16)
MOVT	R0, #hi_addr(_servo_number_button_1+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1405 :: 		servo_number_button_1.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_1+36)
MOVT	R0, #hi_addr(_servo_number_button_1+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1406 :: 		DrawButton(&servo_number_button_1);
MOVW	R0, #lo_addr(_servo_number_button_1+0)
MOVT	R0, #hi_addr(_servo_number_button_1+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1407 :: 		}
L_clear_servoNumber_buttons198:
;MikromediaGreenhouseProject_main.c,1408 :: 		if (servo_number_button_2.Pen_Color != CL_LIME)
MOVW	R0, #lo_addr(_servo_number_button_2+16)
MOVT	R0, #hi_addr(_servo_number_button_2+16)
LDRH	R0, [R0, #0]
CMP	R0, #2016
IT	EQ
BEQ	L_clear_servoNumber_buttons199
;MikromediaGreenhouseProject_main.c,1410 :: 		servo_number_button_2.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_2+16)
MOVT	R0, #hi_addr(_servo_number_button_2+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1411 :: 		servo_number_button_2.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_2+36)
MOVT	R0, #hi_addr(_servo_number_button_2+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1412 :: 		DrawButton(&servo_number_button_2);
MOVW	R0, #lo_addr(_servo_number_button_2+0)
MOVT	R0, #hi_addr(_servo_number_button_2+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1413 :: 		}
L_clear_servoNumber_buttons199:
;MikromediaGreenhouseProject_main.c,1414 :: 		if (servo_number_button_3.Pen_Color != CL_LIME)
MOVW	R0, #lo_addr(_servo_number_button_3+16)
MOVT	R0, #hi_addr(_servo_number_button_3+16)
LDRH	R0, [R0, #0]
CMP	R0, #2016
IT	EQ
BEQ	L_clear_servoNumber_buttons200
;MikromediaGreenhouseProject_main.c,1416 :: 		servo_number_button_3.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_3+16)
MOVT	R0, #hi_addr(_servo_number_button_3+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1417 :: 		servo_number_button_3.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_3+36)
MOVT	R0, #hi_addr(_servo_number_button_3+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1418 :: 		DrawButton(&servo_number_button_3);
MOVW	R0, #lo_addr(_servo_number_button_3+0)
MOVT	R0, #hi_addr(_servo_number_button_3+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1419 :: 		}
L_clear_servoNumber_buttons200:
;MikromediaGreenhouseProject_main.c,1420 :: 		if (servo_number_button_4.Pen_Color != CL_LIME)
MOVW	R0, #lo_addr(_servo_number_button_4+16)
MOVT	R0, #hi_addr(_servo_number_button_4+16)
LDRH	R0, [R0, #0]
CMP	R0, #2016
IT	EQ
BEQ	L_clear_servoNumber_buttons201
;MikromediaGreenhouseProject_main.c,1422 :: 		servo_number_button_4.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_4+16)
MOVT	R0, #hi_addr(_servo_number_button_4+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1423 :: 		servo_number_button_4.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_4+36)
MOVT	R0, #hi_addr(_servo_number_button_4+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1424 :: 		DrawButton(&servo_number_button_4);
MOVW	R0, #lo_addr(_servo_number_button_4+0)
MOVT	R0, #hi_addr(_servo_number_button_4+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1425 :: 		}
L_clear_servoNumber_buttons201:
;MikromediaGreenhouseProject_main.c,1426 :: 		if (servo_number_button_5.Pen_Color != CL_LIME)
MOVW	R0, #lo_addr(_servo_number_button_5+16)
MOVT	R0, #hi_addr(_servo_number_button_5+16)
LDRH	R0, [R0, #0]
CMP	R0, #2016
IT	EQ
BEQ	L_clear_servoNumber_buttons202
;MikromediaGreenhouseProject_main.c,1428 :: 		servo_number_button_5.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_5+16)
MOVT	R0, #hi_addr(_servo_number_button_5+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1429 :: 		servo_number_button_5.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_5+36)
MOVT	R0, #hi_addr(_servo_number_button_5+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1430 :: 		DrawButton(&servo_number_button_5);
MOVW	R0, #lo_addr(_servo_number_button_5+0)
MOVT	R0, #hi_addr(_servo_number_button_5+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1431 :: 		}
L_clear_servoNumber_buttons202:
;MikromediaGreenhouseProject_main.c,1432 :: 		if (servo_number_button_6.Pen_Color != CL_LIME)
MOVW	R0, #lo_addr(_servo_number_button_6+16)
MOVT	R0, #hi_addr(_servo_number_button_6+16)
LDRH	R0, [R0, #0]
CMP	R0, #2016
IT	EQ
BEQ	L_clear_servoNumber_buttons203
;MikromediaGreenhouseProject_main.c,1434 :: 		servo_number_button_6.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_6+16)
MOVT	R0, #hi_addr(_servo_number_button_6+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1435 :: 		servo_number_button_6.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_6+36)
MOVT	R0, #hi_addr(_servo_number_button_6+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1436 :: 		DrawButton(&servo_number_button_6);
MOVW	R0, #lo_addr(_servo_number_button_6+0)
MOVT	R0, #hi_addr(_servo_number_button_6+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1437 :: 		}
L_clear_servoNumber_buttons203:
;MikromediaGreenhouseProject_main.c,1438 :: 		if (servo_number_button_7.Pen_Color != CL_LIME)
MOVW	R0, #lo_addr(_servo_number_button_7+16)
MOVT	R0, #hi_addr(_servo_number_button_7+16)
LDRH	R0, [R0, #0]
CMP	R0, #2016
IT	EQ
BEQ	L_clear_servoNumber_buttons204
;MikromediaGreenhouseProject_main.c,1440 :: 		servo_number_button_7.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_7+16)
MOVT	R0, #hi_addr(_servo_number_button_7+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1441 :: 		servo_number_button_7.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_7+36)
MOVT	R0, #hi_addr(_servo_number_button_7+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1442 :: 		DrawButton(&servo_number_button_7);
MOVW	R0, #lo_addr(_servo_number_button_7+0)
MOVT	R0, #hi_addr(_servo_number_button_7+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1443 :: 		}
L_clear_servoNumber_buttons204:
;MikromediaGreenhouseProject_main.c,1444 :: 		if (servo_number_button_8.Pen_Color != CL_LIME)
MOVW	R0, #lo_addr(_servo_number_button_8+16)
MOVT	R0, #hi_addr(_servo_number_button_8+16)
LDRH	R0, [R0, #0]
CMP	R0, #2016
IT	EQ
BEQ	L_clear_servoNumber_buttons205
;MikromediaGreenhouseProject_main.c,1446 :: 		servo_number_button_8.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_8+16)
MOVT	R0, #hi_addr(_servo_number_button_8+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1447 :: 		servo_number_button_8.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_8+36)
MOVT	R0, #hi_addr(_servo_number_button_8+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1448 :: 		DrawButton(&servo_number_button_8);
MOVW	R0, #lo_addr(_servo_number_button_8+0)
MOVT	R0, #hi_addr(_servo_number_button_8+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1449 :: 		}
L_clear_servoNumber_buttons205:
;MikromediaGreenhouseProject_main.c,1450 :: 		if (servo_number_button_9.Pen_Color != CL_LIME)
MOVW	R0, #lo_addr(_servo_number_button_9+16)
MOVT	R0, #hi_addr(_servo_number_button_9+16)
LDRH	R0, [R0, #0]
CMP	R0, #2016
IT	EQ
BEQ	L_clear_servoNumber_buttons206
;MikromediaGreenhouseProject_main.c,1452 :: 		servo_number_button_9.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_9+16)
MOVT	R0, #hi_addr(_servo_number_button_9+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1453 :: 		servo_number_button_9.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_9+36)
MOVT	R0, #hi_addr(_servo_number_button_9+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1454 :: 		DrawButton(&servo_number_button_9);
MOVW	R0, #lo_addr(_servo_number_button_9+0)
MOVT	R0, #hi_addr(_servo_number_button_9+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1455 :: 		}
L_clear_servoNumber_buttons206:
;MikromediaGreenhouseProject_main.c,1456 :: 		if (servo_number_button_10.Pen_Color != CL_LIME)
MOVW	R0, #lo_addr(_servo_number_button_10+16)
MOVT	R0, #hi_addr(_servo_number_button_10+16)
LDRH	R0, [R0, #0]
CMP	R0, #2016
IT	EQ
BEQ	L_clear_servoNumber_buttons207
;MikromediaGreenhouseProject_main.c,1458 :: 		servo_number_button_10.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_10+16)
MOVT	R0, #hi_addr(_servo_number_button_10+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1459 :: 		servo_number_button_10.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_10+36)
MOVT	R0, #hi_addr(_servo_number_button_10+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1460 :: 		DrawButton(&servo_number_button_10);
MOVW	R0, #lo_addr(_servo_number_button_10+0)
MOVT	R0, #hi_addr(_servo_number_button_10+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1461 :: 		}
L_clear_servoNumber_buttons207:
;MikromediaGreenhouseProject_main.c,1462 :: 		if (servo_number_button_11.Pen_Color != CL_LIME)
MOVW	R0, #lo_addr(_servo_number_button_11+16)
MOVT	R0, #hi_addr(_servo_number_button_11+16)
LDRH	R0, [R0, #0]
CMP	R0, #2016
IT	EQ
BEQ	L_clear_servoNumber_buttons208
;MikromediaGreenhouseProject_main.c,1464 :: 		servo_number_button_11.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_11+16)
MOVT	R0, #hi_addr(_servo_number_button_11+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1465 :: 		servo_number_button_11.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_11+36)
MOVT	R0, #hi_addr(_servo_number_button_11+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1466 :: 		DrawButton(&servo_number_button_11);
MOVW	R0, #lo_addr(_servo_number_button_11+0)
MOVT	R0, #hi_addr(_servo_number_button_11+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1467 :: 		}
L_clear_servoNumber_buttons208:
;MikromediaGreenhouseProject_main.c,1468 :: 		if (servo_number_button_12.Pen_Color != CL_LIME)
MOVW	R0, #lo_addr(_servo_number_button_12+16)
MOVT	R0, #hi_addr(_servo_number_button_12+16)
LDRH	R0, [R0, #0]
CMP	R0, #2016
IT	EQ
BEQ	L_clear_servoNumber_buttons209
;MikromediaGreenhouseProject_main.c,1470 :: 		servo_number_button_12.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_12+16)
MOVT	R0, #hi_addr(_servo_number_button_12+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1471 :: 		servo_number_button_12.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_12+36)
MOVT	R0, #hi_addr(_servo_number_button_12+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1472 :: 		DrawButton(&servo_number_button_12);
MOVW	R0, #lo_addr(_servo_number_button_12+0)
MOVT	R0, #hi_addr(_servo_number_button_12+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1473 :: 		}
L_clear_servoNumber_buttons209:
;MikromediaGreenhouseProject_main.c,1474 :: 		if (servo_number_button_13.Pen_Color != CL_LIME)
MOVW	R0, #lo_addr(_servo_number_button_13+16)
MOVT	R0, #hi_addr(_servo_number_button_13+16)
LDRH	R0, [R0, #0]
CMP	R0, #2016
IT	EQ
BEQ	L_clear_servoNumber_buttons210
;MikromediaGreenhouseProject_main.c,1476 :: 		servo_number_button_13.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_13+16)
MOVT	R0, #hi_addr(_servo_number_button_13+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1477 :: 		servo_number_button_13.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_13+36)
MOVT	R0, #hi_addr(_servo_number_button_13+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1478 :: 		DrawButton(&servo_number_button_13);
MOVW	R0, #lo_addr(_servo_number_button_13+0)
MOVT	R0, #hi_addr(_servo_number_button_13+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1479 :: 		}
L_clear_servoNumber_buttons210:
;MikromediaGreenhouseProject_main.c,1480 :: 		if (servo_number_button_14.Pen_Color != CL_LIME)
MOVW	R0, #lo_addr(_servo_number_button_14+16)
MOVT	R0, #hi_addr(_servo_number_button_14+16)
LDRH	R0, [R0, #0]
CMP	R0, #2016
IT	EQ
BEQ	L_clear_servoNumber_buttons211
;MikromediaGreenhouseProject_main.c,1482 :: 		servo_number_button_14.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_14+16)
MOVT	R0, #hi_addr(_servo_number_button_14+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1483 :: 		servo_number_button_14.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_14+36)
MOVT	R0, #hi_addr(_servo_number_button_14+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1484 :: 		DrawButton(&servo_number_button_14);
MOVW	R0, #lo_addr(_servo_number_button_14+0)
MOVT	R0, #hi_addr(_servo_number_button_14+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1485 :: 		}
L_clear_servoNumber_buttons211:
;MikromediaGreenhouseProject_main.c,1486 :: 		if (servo_number_button_15.Pen_Color != CL_LIME)
MOVW	R0, #lo_addr(_servo_number_button_15+16)
MOVT	R0, #hi_addr(_servo_number_button_15+16)
LDRH	R0, [R0, #0]
CMP	R0, #2016
IT	EQ
BEQ	L_clear_servoNumber_buttons212
;MikromediaGreenhouseProject_main.c,1488 :: 		servo_number_button_15.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_15+16)
MOVT	R0, #hi_addr(_servo_number_button_15+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1489 :: 		servo_number_button_15.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_15+36)
MOVT	R0, #hi_addr(_servo_number_button_15+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1490 :: 		DrawButton(&servo_number_button_15);
MOVW	R0, #lo_addr(_servo_number_button_15+0)
MOVT	R0, #hi_addr(_servo_number_button_15+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1491 :: 		}
L_clear_servoNumber_buttons212:
;MikromediaGreenhouseProject_main.c,1492 :: 		if (servo_number_button_16.Pen_Color != CL_LIME)
MOVW	R0, #lo_addr(_servo_number_button_16+16)
MOVT	R0, #hi_addr(_servo_number_button_16+16)
LDRH	R0, [R0, #0]
CMP	R0, #2016
IT	EQ
BEQ	L_clear_servoNumber_buttons213
;MikromediaGreenhouseProject_main.c,1494 :: 		servo_number_button_16.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_16+16)
MOVT	R0, #hi_addr(_servo_number_button_16+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1495 :: 		servo_number_button_16.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_16+36)
MOVT	R0, #hi_addr(_servo_number_button_16+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1496 :: 		DrawButton(&servo_number_button_16);
MOVW	R0, #lo_addr(_servo_number_button_16+0)
MOVT	R0, #hi_addr(_servo_number_button_16+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1497 :: 		}
L_clear_servoNumber_buttons213:
;MikromediaGreenhouseProject_main.c,1498 :: 		if (servo_number_button_all.Pen_Color != CL_LIME)
MOVW	R0, #lo_addr(_servo_number_button_all+16)
MOVT	R0, #hi_addr(_servo_number_button_all+16)
LDRH	R0, [R0, #0]
CMP	R0, #2016
IT	EQ
BEQ	L_clear_servoNumber_buttons214
;MikromediaGreenhouseProject_main.c,1500 :: 		servo_number_button_all.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_all+16)
MOVT	R0, #hi_addr(_servo_number_button_all+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1501 :: 		servo_number_button_all.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_servo_number_button_all+36)
MOVT	R0, #hi_addr(_servo_number_button_all+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1502 :: 		DrawButton(&servo_number_button_all);
MOVW	R0, #lo_addr(_servo_number_button_all+0)
MOVT	R0, #hi_addr(_servo_number_button_all+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1503 :: 		}
L_clear_servoNumber_buttons214:
;MikromediaGreenhouseProject_main.c,1504 :: 		}
L_end_clear_servoNumber_buttons:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _clear_servoNumber_buttons
_clear_fanSpeed_button_colors:
;MikromediaGreenhouseProject_main.c,1506 :: 		void clear_fanSpeed_button_colors( )
;MikromediaGreenhouseProject_main.c,1508 :: 		fan_speed_button_1.Pen_Color     = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_1+16)
MOVT	R0, #hi_addr(_fan_speed_button_1+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1509 :: 		fan_speed_button_1.Font_Color    = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_1+36)
MOVT	R0, #hi_addr(_fan_speed_button_1+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1510 :: 		fan_speed_button_2.Pen_Color     = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_2+16)
MOVT	R0, #hi_addr(_fan_speed_button_2+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1511 :: 		fan_speed_button_2.Font_Color    = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_2+36)
MOVT	R0, #hi_addr(_fan_speed_button_2+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1512 :: 		fan_speed_button_3.Pen_Color     = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_3+16)
MOVT	R0, #hi_addr(_fan_speed_button_3+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1513 :: 		fan_speed_button_3.Font_Color    = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_3+36)
MOVT	R0, #hi_addr(_fan_speed_button_3+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1514 :: 		fan_speed_button_4.Pen_Color     = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_4+16)
MOVT	R0, #hi_addr(_fan_speed_button_4+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1515 :: 		fan_speed_button_4.Font_Color    = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_4+36)
MOVT	R0, #hi_addr(_fan_speed_button_4+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1516 :: 		fan_speed_button_5.Pen_Color     = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_5+16)
MOVT	R0, #hi_addr(_fan_speed_button_5+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1517 :: 		fan_speed_button_5.Font_Color    = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_5+36)
MOVT	R0, #hi_addr(_fan_speed_button_5+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1518 :: 		fan_speed_button_6.Pen_Color     = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_6+16)
MOVT	R0, #hi_addr(_fan_speed_button_6+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1519 :: 		fan_speed_button_6.Font_Color    = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_6+36)
MOVT	R0, #hi_addr(_fan_speed_button_6+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1520 :: 		fan_speed_button_7.Pen_Color     = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_7+16)
MOVT	R0, #hi_addr(_fan_speed_button_7+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1521 :: 		fan_speed_button_7.Font_Color    = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_7+36)
MOVT	R0, #hi_addr(_fan_speed_button_7+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1522 :: 		fan_speed_button_stop.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_stop+16)
MOVT	R0, #hi_addr(_fan_speed_button_stop+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1523 :: 		fan_speed_button_stop.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_stop+36)
MOVT	R0, #hi_addr(_fan_speed_button_stop+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1524 :: 		}
L_end_clear_fanSpeed_button_colors:
BX	LR
; end of _clear_fanSpeed_button_colors
_clear_fanSpeed_buttons:
;MikromediaGreenhouseProject_main.c,1526 :: 		void clear_fanSpeed_buttons( )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MikromediaGreenhouseProject_main.c,1528 :: 		if (fan_speed_button_1.Pen_Color != CL_LIME)
MOVW	R0, #lo_addr(_fan_speed_button_1+16)
MOVT	R0, #hi_addr(_fan_speed_button_1+16)
LDRH	R0, [R0, #0]
CMP	R0, #2016
IT	EQ
BEQ	L_clear_fanSpeed_buttons215
;MikromediaGreenhouseProject_main.c,1530 :: 		fan_speed_button_1.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_1+16)
MOVT	R0, #hi_addr(_fan_speed_button_1+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1531 :: 		fan_speed_button_1.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_1+36)
MOVT	R0, #hi_addr(_fan_speed_button_1+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1532 :: 		DrawButton(&fan_speed_button_1);
MOVW	R0, #lo_addr(_fan_speed_button_1+0)
MOVT	R0, #hi_addr(_fan_speed_button_1+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1533 :: 		}
L_clear_fanSpeed_buttons215:
;MikromediaGreenhouseProject_main.c,1534 :: 		if (fan_speed_button_2.Pen_Color != CL_LIME)
MOVW	R0, #lo_addr(_fan_speed_button_2+16)
MOVT	R0, #hi_addr(_fan_speed_button_2+16)
LDRH	R0, [R0, #0]
CMP	R0, #2016
IT	EQ
BEQ	L_clear_fanSpeed_buttons216
;MikromediaGreenhouseProject_main.c,1536 :: 		fan_speed_button_2.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_2+16)
MOVT	R0, #hi_addr(_fan_speed_button_2+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1537 :: 		fan_speed_button_2.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_2+36)
MOVT	R0, #hi_addr(_fan_speed_button_2+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1538 :: 		DrawButton(&fan_speed_button_2);
MOVW	R0, #lo_addr(_fan_speed_button_2+0)
MOVT	R0, #hi_addr(_fan_speed_button_2+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1539 :: 		}
L_clear_fanSpeed_buttons216:
;MikromediaGreenhouseProject_main.c,1540 :: 		if (fan_speed_button_3.Pen_Color != CL_LIME)
MOVW	R0, #lo_addr(_fan_speed_button_3+16)
MOVT	R0, #hi_addr(_fan_speed_button_3+16)
LDRH	R0, [R0, #0]
CMP	R0, #2016
IT	EQ
BEQ	L_clear_fanSpeed_buttons217
;MikromediaGreenhouseProject_main.c,1542 :: 		fan_speed_button_3.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_3+16)
MOVT	R0, #hi_addr(_fan_speed_button_3+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1543 :: 		fan_speed_button_3.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_3+36)
MOVT	R0, #hi_addr(_fan_speed_button_3+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1544 :: 		DrawButton(&fan_speed_button_3);
MOVW	R0, #lo_addr(_fan_speed_button_3+0)
MOVT	R0, #hi_addr(_fan_speed_button_3+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1545 :: 		}
L_clear_fanSpeed_buttons217:
;MikromediaGreenhouseProject_main.c,1546 :: 		if (fan_speed_button_4.Pen_Color != CL_LIME)
MOVW	R0, #lo_addr(_fan_speed_button_4+16)
MOVT	R0, #hi_addr(_fan_speed_button_4+16)
LDRH	R0, [R0, #0]
CMP	R0, #2016
IT	EQ
BEQ	L_clear_fanSpeed_buttons218
;MikromediaGreenhouseProject_main.c,1548 :: 		fan_speed_button_4.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_4+16)
MOVT	R0, #hi_addr(_fan_speed_button_4+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1549 :: 		fan_speed_button_4.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_4+36)
MOVT	R0, #hi_addr(_fan_speed_button_4+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1550 :: 		DrawButton(&fan_speed_button_4);
MOVW	R0, #lo_addr(_fan_speed_button_4+0)
MOVT	R0, #hi_addr(_fan_speed_button_4+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1551 :: 		}
L_clear_fanSpeed_buttons218:
;MikromediaGreenhouseProject_main.c,1552 :: 		if (fan_speed_button_5.Pen_Color != CL_LIME)
MOVW	R0, #lo_addr(_fan_speed_button_5+16)
MOVT	R0, #hi_addr(_fan_speed_button_5+16)
LDRH	R0, [R0, #0]
CMP	R0, #2016
IT	EQ
BEQ	L_clear_fanSpeed_buttons219
;MikromediaGreenhouseProject_main.c,1554 :: 		fan_speed_button_5.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_5+16)
MOVT	R0, #hi_addr(_fan_speed_button_5+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1555 :: 		fan_speed_button_5.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_5+36)
MOVT	R0, #hi_addr(_fan_speed_button_5+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1556 :: 		DrawButton(&fan_speed_button_5);
MOVW	R0, #lo_addr(_fan_speed_button_5+0)
MOVT	R0, #hi_addr(_fan_speed_button_5+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1557 :: 		}
L_clear_fanSpeed_buttons219:
;MikromediaGreenhouseProject_main.c,1558 :: 		if (fan_speed_button_6.Pen_Color != CL_LIME)
MOVW	R0, #lo_addr(_fan_speed_button_6+16)
MOVT	R0, #hi_addr(_fan_speed_button_6+16)
LDRH	R0, [R0, #0]
CMP	R0, #2016
IT	EQ
BEQ	L_clear_fanSpeed_buttons220
;MikromediaGreenhouseProject_main.c,1560 :: 		fan_speed_button_6.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_6+16)
MOVT	R0, #hi_addr(_fan_speed_button_6+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1561 :: 		fan_speed_button_6.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_6+36)
MOVT	R0, #hi_addr(_fan_speed_button_6+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1562 :: 		DrawButton(&fan_speed_button_6);
MOVW	R0, #lo_addr(_fan_speed_button_6+0)
MOVT	R0, #hi_addr(_fan_speed_button_6+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1563 :: 		}
L_clear_fanSpeed_buttons220:
;MikromediaGreenhouseProject_main.c,1564 :: 		if (fan_speed_button_7.Pen_Color != CL_LIME)
MOVW	R0, #lo_addr(_fan_speed_button_7+16)
MOVT	R0, #hi_addr(_fan_speed_button_7+16)
LDRH	R0, [R0, #0]
CMP	R0, #2016
IT	EQ
BEQ	L_clear_fanSpeed_buttons221
;MikromediaGreenhouseProject_main.c,1566 :: 		fan_speed_button_7.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_7+16)
MOVT	R0, #hi_addr(_fan_speed_button_7+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1567 :: 		fan_speed_button_7.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_7+36)
MOVT	R0, #hi_addr(_fan_speed_button_7+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1568 :: 		DrawButton(&fan_speed_button_7);
MOVW	R0, #lo_addr(_fan_speed_button_7+0)
MOVT	R0, #hi_addr(_fan_speed_button_7+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1569 :: 		}
L_clear_fanSpeed_buttons221:
;MikromediaGreenhouseProject_main.c,1570 :: 		if (fan_speed_button_stop.Pen_Color != CL_LIME)
MOVW	R0, #lo_addr(_fan_speed_button_stop+16)
MOVT	R0, #hi_addr(_fan_speed_button_stop+16)
LDRH	R0, [R0, #0]
CMP	R0, #2016
IT	EQ
BEQ	L_clear_fanSpeed_buttons222
;MikromediaGreenhouseProject_main.c,1572 :: 		fan_speed_button_stop.Pen_Color  = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_stop+16)
MOVT	R0, #hi_addr(_fan_speed_button_stop+16)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1573 :: 		fan_speed_button_stop.Font_Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_fan_speed_button_stop+36)
MOVT	R0, #hi_addr(_fan_speed_button_stop+36)
STRH	R1, [R0, #0]
;MikromediaGreenhouseProject_main.c,1574 :: 		DrawButton(&fan_speed_button_stop);
MOVW	R0, #lo_addr(_fan_speed_button_stop+0)
MOVT	R0, #hi_addr(_fan_speed_button_stop+0)
BL	_DrawButton+0
;MikromediaGreenhouseProject_main.c,1575 :: 		}
L_clear_fanSpeed_buttons222:
;MikromediaGreenhouseProject_main.c,1576 :: 		}
L_end_clear_fanSpeed_buttons:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _clear_fanSpeed_buttons
