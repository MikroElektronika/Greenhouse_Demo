#include "MikromediaGreenhouseProject_objects.h"
#include "MikromediaGreenhouseProject_resources.h"

//--------------------- User code ---------------------//

extern uint8_t fan_speed;
extern uint8_t servo_pos;
extern uint8_t servo_num;
extern uint8_t servo_pos_change_flag;
extern uint8_t fan_speed_change_flag;
extern uint8_t screen_flag;

extern void log_last( );
extern void clear_servoNumber_buttons( );
extern void clear_fanSpeed_buttons( );

//----------------- End of User code ------------------//

// Event Handlers
void ButtonRound1OnClick() {
    screen_flag = 2;
    I2C_Set_Active( &I2C1_Start, &I2C1_Read, &I2C1_Write );
    Delay_ms(10);
    DrawImage(&Image4);
    Delay_ms(500);
    DrawScreen(&Screen2);
    I2C_Set_Active( &I2C2_Start, &I2C2_Read, &I2C2_Write );
}
void ButtonRound2OnClick() {
    screen_flag = 1;
    I2C_Set_Active( &I2C1_Start, &I2C1_Read, &I2C1_Write );
    Delay_ms(10);
    DrawImage(&Image5);
    Delay_ms(500);
    DrawScreen(&Screen1);
    log_last( );
    I2C_Set_Active( &I2C2_Start, &I2C2_Read, &I2C2_Write );
}
void servo_number_button_1OnClick() {
    servo_num = 1;
    clear_servoNumber_buttons( );
    servo_number_button_1.Font_Color = CL_AQUA;
    servo_number_button_1.Pen_Color = CL_AQUA;
    DrawButton(&servo_number_button_1);
}
void servo_number_button_2OnClick() {
    servo_num = 2;
    clear_servoNumber_buttons( );
    servo_number_button_2.Font_Color = CL_AQUA;
    servo_number_button_2.Pen_Color = CL_AQUA;
    DrawButton(&servo_number_button_2);
}
void servo_number_button_3OnClick() {
    servo_num = 3;
    clear_servoNumber_buttons( );
    servo_number_button_3.Font_Color = CL_AQUA;
    servo_number_button_3.Pen_Color = CL_AQUA;
    DrawButton(&servo_number_button_3);
}
void servo_number_button_4OnClick() {
    servo_num = 4;
    clear_servoNumber_buttons( );
    servo_number_button_4.Font_Color = CL_AQUA;
    servo_number_button_4.Pen_Color = CL_AQUA;
    DrawButton(&servo_number_button_4);
}
void servo_number_button_5OnClick() {
    servo_num = 5;
    clear_servoNumber_buttons( );
    servo_number_button_5.Font_Color = CL_AQUA;
    servo_number_button_5.Pen_Color = CL_AQUA;
    DrawButton(&servo_number_button_5);
}
void servo_number_button_6OnClick() {
    servo_num = 6;
    clear_servoNumber_buttons( );
    servo_number_button_6.Font_Color = CL_AQUA;
    servo_number_button_6.Pen_Color = CL_AQUA;
    DrawButton(&servo_number_button_6);
}
void servo_number_button_7OnClick() {
    servo_num = 7;
    clear_servoNumber_buttons( );
    servo_number_button_7.Font_Color = CL_AQUA;
    servo_number_button_7.Pen_Color = CL_AQUA;
    DrawButton(&servo_number_button_7);
}
void servo_number_button_8OnClick() {
    servo_num = 8;
    clear_servoNumber_buttons( );
    servo_number_button_8.Font_Color = CL_AQUA;
    servo_number_button_8.Pen_Color = CL_AQUA;
    DrawButton(&servo_number_button_8);
}
void servo_number_button_9OnClick() {
    servo_num = 9;
    clear_servoNumber_buttons( );
    servo_number_button_9.Font_Color = CL_AQUA;
    servo_number_button_9.Pen_Color = CL_AQUA;
    DrawButton(&servo_number_button_9);
}
void servo_number_button_10OnClick() {
    servo_num = 10;
    clear_servoNumber_buttons( );
    servo_number_button_10.Font_Color = CL_AQUA;
    servo_number_button_10.Pen_Color = CL_AQUA;
    DrawButton(&servo_number_button_10);
}
void servo_number_button_11OnClick() {
    servo_num = 11;
    clear_servoNumber_buttons( );
    servo_number_button_11.Font_Color = CL_AQUA;
    servo_number_button_11.Pen_Color = CL_AQUA;
    DrawButton(&servo_number_button_11);
}
void servo_number_button_12OnClick() {
    servo_num = 12;
    clear_servoNumber_buttons( );
    servo_number_button_12.Font_Color = CL_AQUA;
    servo_number_button_12.Pen_Color = CL_AQUA;
    DrawButton(&servo_number_button_12);
}
void servo_number_button_13OnClick() {
    servo_num = 13;
    clear_servoNumber_buttons( );
    servo_number_button_13.Font_Color = CL_AQUA;
    servo_number_button_13.Pen_Color = CL_AQUA;
    DrawButton(&servo_number_button_13);
}
void servo_number_button_14OnClick() {
    servo_num = 14;
    clear_servoNumber_buttons( );
    servo_number_button_14.Font_Color = CL_AQUA;
    servo_number_button_14.Pen_Color = CL_AQUA;
    DrawButton(&servo_number_button_14);
}
void servo_number_button_15OnClick() {
    servo_num = 15;
    clear_servoNumber_buttons( );
    servo_number_button_15.Font_Color = CL_AQUA;
    servo_number_button_15.Pen_Color = CL_AQUA;
    DrawButton(&servo_number_button_15);
}
void servo_number_button_16OnClick() {
    servo_num = 16;
    clear_servoNumber_buttons( );
    servo_number_button_16.Font_Color = CL_AQUA;
    servo_number_button_16.Pen_Color = CL_AQUA;
    DrawButton(&servo_number_button_16);
}
void servo_number_button_allOnClick() {
    servo_num = 0;
    clear_servoNumber_buttons( );
    servo_number_button_all.Font_Color = CL_AQUA;
    servo_number_button_all.Pen_Color = CL_AQUA;
    DrawButton(&servo_number_button_all);
}
void servo_position_button_1OnClick() {
    servo_pos = 10;
    servo_pos_change_flag = 1;
}
void servo_position_button_2OnClick() {
    servo_pos = 15;
    servo_pos_change_flag = 1;
}
void servo_position_button_3OnClick() {
    servo_pos = 40;
    servo_pos_change_flag = 1;
}
void servo_position_button_4OnClick() {
    servo_pos = 65;
    servo_pos_change_flag = 1;
}
void servo_position_button_5OnClick() {
    servo_pos = 90;
    servo_pos_change_flag = 1;
}
void servo_position_button_6OnClick() {
    servo_pos = 115;
    servo_pos_change_flag = 1;
}
void servo_position_button_7OnClick() {
    servo_pos = 140;
    servo_pos_change_flag = 1;
}
void servo_position_button_8OnClick() {
    servo_pos = 165;
    servo_pos_change_flag = 1;
}
void servo_position_button_9OnClick() {
    servo_pos = 170;
    servo_pos_change_flag = 1;
}
void fan_speed_button_1OnClick() {
    fan_speed = _FAN3_SPEED1;
    fan_speed_change_flag = 1;
    clear_fanSpeed_buttons( );
    fan_speed_button_1.Font_Color = CL_AQUA;
    fan_speed_button_1.Pen_Color = CL_AQUA;
    DrawButton(&fan_speed_button_1);
}
void fan_speed_button_2OnClick() {
    fan_speed = _FAN3_SPEED2;
    fan_speed_change_flag = 1;
    clear_fanSpeed_buttons( );
    fan_speed_button_2.Font_Color = CL_AQUA;
    fan_speed_button_2.Pen_Color = CL_AQUA;
    DrawButton(&fan_speed_button_2);
}
void fan_speed_button_3OnClick() {
    fan_speed = _FAN3_SPEED3;
    fan_speed_change_flag = 1;
    clear_fanSpeed_buttons( );
    fan_speed_button_3.Font_Color = CL_AQUA;
    fan_speed_button_3.Pen_Color = CL_AQUA;
    DrawButton(&fan_speed_button_3);
}
void fan_speed_button_4OnClick() {
    fan_speed = _FAN3_SPEED4;
    fan_speed_change_flag = 1;
    clear_fanSpeed_buttons( );
    fan_speed_button_4.Font_Color = CL_AQUA;
    fan_speed_button_4.Pen_Color = CL_AQUA;
    DrawButton(&fan_speed_button_4);
}
void fan_speed_button_5OnClick() {
    fan_speed = _FAN3_SPEED5;
    fan_speed_change_flag = 1;
    clear_fanSpeed_buttons( );
    fan_speed_button_5.Font_Color = CL_AQUA;
    fan_speed_button_5.Pen_Color = CL_AQUA;
    DrawButton(&fan_speed_button_5);
}
void fan_speed_button_6OnClick() {
    fan_speed = _FAN3_SPEED6;
    fan_speed_change_flag = 1;
    clear_fanSpeed_buttons( );
    fan_speed_button_6.Font_Color = CL_AQUA;
    fan_speed_button_6.Pen_Color = CL_AQUA;
    DrawButton(&fan_speed_button_6);
}
void fan_speed_button_7OnClick() {
    fan_speed = _FAN3_SPEED7;
    fan_speed_change_flag = 1;
    clear_fanSpeed_buttons( );
    fan_speed_button_7.Font_Color = CL_AQUA;
    fan_speed_button_7.Pen_Color = CL_AQUA;
    DrawButton(&fan_speed_button_7);
}
void fan_speed_button_stopOnClick() {
    fan_speed = _FAN3_STOPPED;
    fan_speed_change_flag = 1;
    clear_fanSpeed_buttons( );
    fan_speed_button_stop.Font_Color = CL_AQUA;
    fan_speed_button_stop.Pen_Color = CL_AQUA;
    DrawButton(&fan_speed_button_stop);
}