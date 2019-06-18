#include "MikromediaGreenhouseProject_objects.h"
#include "MikromediaGreenhouseProject_resources.h"

//--------------------- User code ---------------------//

extern uint8_t fan_speed;
extern uint8_t servo_pos;
extern uint8_t servo_pos_1;
extern uint8_t servo_pos_2;
extern uint8_t servo_pos_3;
extern uint8_t servo_pos_4;
extern uint8_t servo_pos_5;
extern uint8_t servo_pos_6;
extern uint8_t servo_pos_7;
extern uint8_t servo_pos_8;
extern uint8_t servo_pos_9;
extern uint8_t servo_pos_10;
extern uint8_t servo_pos_11;
extern uint8_t servo_pos_12;
extern uint8_t servo_pos_13;
extern uint8_t servo_pos_14;
extern uint8_t servo_pos_15;
extern uint8_t servo_pos_16;
extern uint8_t servo_pos_all;
extern uint8_t servo_num;
extern uint8_t servo_num_change_flag;
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
    Delay_ms(1);
    ButtonRound1.Pen_Color  = CL_AQUA;
    ButtonRound1.Font_Color = CL_AQUA;
    DrawImage(&Image4);
    DrawRoundButton(&ButtonRound1);
    ButtonRound1.Pen_Color  = CL_LIME;
    ButtonRound1.Font_Color = CL_LIME;
    Delay_ms(100);
    DrawScreen(&Screen2);
    I2C_Set_Active( &I2C2_Start, &I2C2_Read, &I2C2_Write );
}
void ButtonRound2OnClick() {
    screen_flag = 1;
    I2C_Set_Active( &I2C1_Start, &I2C1_Read, &I2C1_Write );
    Delay_ms(1);
    ButtonRound2.Pen_Color  = CL_AQUA;
    ButtonRound2.Font_Color = CL_AQUA;
    DrawImage(&Image5);
    DrawRoundButton(&ButtonRound2);
    ButtonRound2.Pen_Color  = CL_LIME;
    ButtonRound2.Font_Color = CL_LIME;
    Delay_ms(100);
    DrawScreen(&Screen1);
    log_last( );
    I2C_Set_Active( &I2C2_Start, &I2C2_Read, &I2C2_Write );
}
void servo_number_button_1OnClick() {
    servo_num = 1;
    servo_num_change_flag = 1;
}
void servo_number_button_2OnClick() {
    servo_num = 2;
    servo_num_change_flag = 1;
}
void servo_number_button_3OnClick() {
    servo_num = 3;
    servo_num_change_flag = 1;
}
void servo_number_button_4OnClick() {
    servo_num = 4;
    servo_num_change_flag = 1;
}
void servo_number_button_5OnClick() {
    servo_num = 5;
    servo_num_change_flag = 1;
}
void servo_number_button_6OnClick() {
    servo_num = 6;
    servo_num_change_flag = 1;
}
void servo_number_button_7OnClick() {
    servo_num = 7;
    servo_num_change_flag = 1;
}
void servo_number_button_8OnClick() {
    servo_num = 8;
    servo_num_change_flag = 1;
}
void servo_number_button_9OnClick() {
    servo_num = 9;
    servo_num_change_flag = 1;
}
void servo_number_button_10OnClick() {
    servo_num = 10;
    servo_num_change_flag = 1;
}
void servo_number_button_11OnClick() {
    servo_num = 11;
    servo_num_change_flag = 1;
}
void servo_number_button_12OnClick() {
    servo_num = 12;
    servo_num_change_flag = 1;
}
void servo_number_button_13OnClick() {
    servo_num = 13;
    servo_num_change_flag = 1;
}
void servo_number_button_14OnClick() {
    servo_num = 14;
    servo_num_change_flag = 1;
}
void servo_number_button_15OnClick() {
    servo_num = 15;
    servo_num_change_flag = 1;
}
void servo_number_button_16OnClick() {
    servo_num = 16;
    servo_num_change_flag = 1;
}
void servo_number_button_allOnClick() {
    servo_num = 0;
    servo_num_change_flag = 1;
}
void servo_position_button_1OnClick() {
    servo_pos = 10;
    servo_pos_change_flag = 1;
}
void servo_position_button_2OnClick() {
    servo_pos = 30;
    servo_pos_change_flag = 1;
}
void servo_position_button_3OnClick() {
    servo_pos = 50;
    servo_pos_change_flag = 1;
}
void servo_position_button_4OnClick() {
    servo_pos = 70;
    servo_pos_change_flag = 1;
}
void servo_position_button_5OnClick() {
    servo_pos = 90;
    servo_pos_change_flag = 1;
}
void servo_position_button_6OnClick() {
    servo_pos = 110;
    servo_pos_change_flag = 1;
}
void servo_position_button_7OnClick() {
    servo_pos = 130;
    servo_pos_change_flag = 1;
}
void servo_position_button_8OnClick() {
    servo_pos = 150;
    servo_pos_change_flag = 1;
}
void servo_position_button_9OnClick() {
    servo_pos = 170;
    servo_pos_change_flag = 1;
}
void fan_speed_button_1OnClick() {
    fan_speed = 1;
    fan_speed_change_flag = 1;
}
void fan_speed_button_2OnClick() {
    fan_speed = 2;
    fan_speed_change_flag = 1;
}
void fan_speed_button_3OnClick() {
    fan_speed = 3;
    fan_speed_change_flag = 1;
}
void fan_speed_button_4OnClick() {
    fan_speed = 4;
    fan_speed_change_flag = 1;
}
void fan_speed_button_5OnClick() {
    fan_speed = 5;
    fan_speed_change_flag = 1;
}
void fan_speed_button_6OnClick() {
    fan_speed = 6;
    fan_speed_change_flag = 1;
}
void fan_speed_button_7OnClick() {
    fan_speed = 7;
    fan_speed_change_flag = 1;
}
void fan_speed_button_stopOnClick() {
    fan_speed = 0;
    fan_speed_change_flag = 1;
}