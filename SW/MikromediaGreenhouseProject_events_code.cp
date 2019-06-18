#line 1 "C:/Users/aleksandar.paunovic/Desktop/Mikromedia Greenhouse Project/MikromediaGreenhouseProject_events_code.c"
#line 1 "c:/users/aleksandar.paunovic/desktop/mikromedia greenhouse project/mikromediagreenhouseproject_objects.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"





typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 3 "c:/users/aleksandar.paunovic/desktop/mikromedia greenhouse project/mikromediagreenhouseproject_objects.h"
typedef enum {_pbsClearSector, _pbsFillSector} TProgressBarSector;

typedef enum {_taLeft, _taCenter, _taRight} TTextAlign;
typedef enum {_tavTop, _tavMiddle, _tavBottom} TTextAlignVertical;

typedef struct Screen TScreen;

typedef struct {
 unsigned int X_Min;
 unsigned int X_Max;
 unsigned int Y_Min;
 unsigned int Y_Max;
 char Rotate;
} TTPConstants;

typedef struct Button {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char *Caption;
 TTextAlign TextAlign;
 TTextAlignVertical TextAlignVertical;
 const char *FontName;
 unsigned int Font_Color;
 char VerticalText;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TButton;

typedef struct Button_Round {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char *Caption;
 TTextAlign TextAlign;
 TTextAlignVertical TextAlignVertical;
 const char *FontName;
 unsigned int Font_Color;
 char VerticalText;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char Corner_Radius;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TButton_Round;

typedef struct Label {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char *Caption;
 const char *FontName;
 unsigned int Font_Color;
 char VerticalText;
 char Visible;
 char Active;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TLabel;

typedef struct Image {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 const char *Picture_Name;
 char Visible;
 char Active;
 char Picture_Type;
 char Picture_Ratio;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TImage;

typedef struct Circle {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Radius;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TCircle;

typedef struct ProgressBar {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Transparent;
 char *Caption;
 const char *FontName;
 unsigned int Font_Color;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 unsigned int Background_Color;
 unsigned int Min;
 unsigned int Max;
 unsigned int Position;
 unsigned int Prev_Position;
 char Show_Position;
 char Show_Percentage;
 char Smooth;
 char Rounded;
 char Corner_Radius;
} TProgressBar;

struct Screen {
 unsigned int Color;
 unsigned int Width;
 unsigned int Height;
 unsigned int ObjectsCount;
 unsigned int ButtonsCount;
 TButton * const code *Buttons;
 unsigned int Buttons_RoundCount;
 TButton_Round * const code *Buttons_Round;
 unsigned int LabelsCount;
 TLabel * const code *Labels;
 unsigned int ImagesCount;
 TImage * const code *Images;
 unsigned int CirclesCount;
 TCircle * const code *Circles;
 unsigned int ProgressBarsCount;
 TProgressBar * const code *ProgressBars;
};

extern TScreen Screen1;
extern TImage Image2;
extern TImage Image4;
extern TLabel temperature_label;
extern TLabel Label1;
extern TLabel Label2;
extern TLabel humidity_label;
extern TLabel Label3;
extern TLabel uv_label;
extern TLabel Label4;
extern TLabel Label5;
extern TLabel Label6;
extern TLabel Label10;
extern TCircle Circle1;
extern TButton_Round ButtonRound1;
extern TImage Image6;
extern TImage Image7;
extern TImage Image8;
extern TImage Image9;
extern TButton_Round * const code Screen1_Buttons_Round[1];
extern TLabel * const code Screen1_Labels[10];
extern TImage * const code Screen1_Images[6];
extern TCircle * const code Screen1_Circles[1];

extern TScreen Screen2;
extern TImage Image10;
extern TImage Image3;
extern TProgressBar ProgressBar1;
extern TButton servo_position_button_2;
extern TButton servo_position_button_1;
extern TImage Image5;
extern TButton servo_number_button_1;
extern TButton servo_number_button_2;
extern TButton servo_number_button_4;
extern TButton servo_number_button_6;
extern TButton servo_number_button_5;
extern TButton servo_number_button_7;
extern TButton servo_number_button_8;
extern TButton servo_number_button_9;
extern TButton servo_number_button_10;
extern TButton servo_number_button_11;
extern TButton servo_number_button_12;
extern TButton servo_number_button_13;
extern TButton servo_number_button_14;
extern TButton servo_number_button_15;
extern TButton servo_number_button_16;
extern TButton servo_number_button_3;
extern TButton servo_number_button_all;
extern TButton servo_position_button_3;
extern TButton servo_position_button_4;
extern TButton servo_position_button_5;
extern TButton servo_position_button_6;
extern TButton servo_position_button_7;
extern TButton servo_position_button_8;
extern TButton servo_position_button_9;
extern TButton fan_speed_button_1;
extern TButton fan_speed_button_3;
extern TButton fan_speed_button_5;
extern TButton fan_speed_button_stop;
extern TLabel Label7;
extern TLabel Label8;
extern TLabel Label9;
extern TButton fan_speed_button_7;
extern TButton_Round ButtonRound2;
extern TButton fan_speed_button_2;
extern TButton fan_speed_button_4;
extern TButton fan_speed_button_6;
extern TButton * const code Screen2_Buttons[34];
extern TButton_Round * const code Screen2_Buttons_Round[1];
extern TLabel * const code Screen2_Labels[3];
extern TImage * const code Screen2_Images[3];
extern TProgressBar * const code Screen2_ProgressBars[1];

extern TScreen Screen3;
extern TImage Image1;
extern TImage * const code Screen3_Images[1];




void ButtonRound1OnClick();
void ButtonRound2OnClick();
void fan_speed_button_1OnClick();
void fan_speed_button_2OnClick();
void fan_speed_button_3OnClick();
void fan_speed_button_4OnClick();
void fan_speed_button_5OnClick();
void fan_speed_button_6OnClick();
void fan_speed_button_7OnClick();
void fan_speed_button_stopOnClick();
void servo_number_button_10OnClick();
void servo_number_button_11OnClick();
void servo_number_button_12OnClick();
void servo_number_button_13OnClick();
void servo_number_button_14OnClick();
void servo_number_button_15OnClick();
void servo_number_button_16OnClick();
void servo_number_button_1OnClick();
void servo_number_button_2OnClick();
void servo_number_button_3OnClick();
void servo_number_button_4OnClick();
void servo_number_button_5OnClick();
void servo_number_button_6OnClick();
void servo_number_button_7OnClick();
void servo_number_button_8OnClick();
void servo_number_button_9OnClick();
void servo_number_button_allOnClick();
void servo_position_button_1OnClick();
void servo_position_button_2OnClick();
void servo_position_button_3OnClick();
void servo_position_button_4OnClick();
void servo_position_button_5OnClick();
void servo_position_button_6OnClick();
void servo_position_button_7OnClick();
void servo_position_button_8OnClick();
void servo_position_button_9OnClick();




extern char Image2_Caption[];
extern char Image4_Caption[];
extern char temperature_label_Caption[];
extern char Label1_Caption[];
extern char Label2_Caption[];
extern char humidity_label_Caption[];
extern char Label3_Caption[];
extern char uv_label_Caption[];
extern char Label4_Caption[];
extern char Label5_Caption[];
extern char Label6_Caption[];
extern char Label10_Caption[];
extern char Circle1_Caption[];
extern char ButtonRound1_Caption[];
extern char Image6_Caption[];
extern char Image7_Caption[];
extern char Image8_Caption[];
extern char Image9_Caption[];
extern char Image10_Caption[];
extern char Image3_Caption[];
extern char ProgressBar1_Caption[];
extern char servo_position_button_2_Caption[];
extern char servo_position_button_1_Caption[];
extern char Image5_Caption[];
extern char servo_number_button_1_Caption[];
extern char servo_number_button_2_Caption[];
extern char servo_number_button_4_Caption[];
extern char servo_number_button_6_Caption[];
extern char servo_number_button_5_Caption[];
extern char servo_number_button_7_Caption[];
extern char servo_number_button_8_Caption[];
extern char servo_number_button_9_Caption[];
extern char servo_number_button_10_Caption[];
extern char servo_number_button_11_Caption[];
extern char servo_number_button_12_Caption[];
extern char servo_number_button_13_Caption[];
extern char servo_number_button_14_Caption[];
extern char servo_number_button_15_Caption[];
extern char servo_number_button_16_Caption[];
extern char servo_number_button_3_Caption[];
extern char servo_number_button_all_Caption[];
extern char servo_position_button_3_Caption[];
extern char servo_position_button_4_Caption[];
extern char servo_position_button_5_Caption[];
extern char servo_position_button_6_Caption[];
extern char servo_position_button_7_Caption[];
extern char servo_position_button_8_Caption[];
extern char servo_position_button_9_Caption[];
extern char fan_speed_button_1_Caption[];
extern char fan_speed_button_3_Caption[];
extern char fan_speed_button_5_Caption[];
extern char fan_speed_button_stop_Caption[];
extern char Label7_Caption[];
extern char Label8_Caption[];
extern char Label9_Caption[];
extern char fan_speed_button_7_Caption[];
extern char ButtonRound2_Caption[];
extern char fan_speed_button_2_Caption[];
extern char fan_speed_button_4_Caption[];
extern char fan_speed_button_6_Caption[];
extern char Image1_Caption[];


void DrawScreen(TScreen *aScreen);
void DrawButton(TButton *aButton);
void DrawRoundButton(TButton_Round *Around_button);
void DrawLabel(TLabel *ALabel);
void DrawImage(TImage *AImage);
void DrawCircle(TCircle *ACircle);
void DrawProgressBar(TProgressBar *AProgressBar);
void UpdatePBPosition(TProgressBar *AProgressBar);
void Check_TP();
void Start_TP();
void Process_TP_Press(unsigned int X, unsigned int Y);
void Process_TP_Up(unsigned int X, unsigned int Y);
void Process_TP_Down(unsigned int X, unsigned int Y);
void updateLabel( uint8_t * tftLabel, uint16_t x, uint16_t y );
void cleanLabel( uint8_t label_no );
#line 1 "c:/users/aleksandar.paunovic/desktop/mikromedia greenhouse project/mikromediagreenhouseproject_resources.h"
#line 6 "C:/Users/aleksandar.paunovic/Desktop/Mikromedia Greenhouse Project/MikromediaGreenhouseProject_events_code.c"
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




void ButtonRound1OnClick() {
 screen_flag = 2;
 I2C_Set_Active( &I2C1_Start, &I2C1_Read, &I2C1_Write );
 Delay_ms(1);
 ButtonRound1.Pen_Color = CL_AQUA;
 ButtonRound1.Font_Color = CL_AQUA;
 DrawImage(&Image4);
 DrawRoundButton(&ButtonRound1);
 ButtonRound1.Pen_Color = CL_LIME;
 ButtonRound1.Font_Color = CL_LIME;
 Delay_ms(100);
 DrawScreen(&Screen2);
 I2C_Set_Active( &I2C2_Start, &I2C2_Read, &I2C2_Write );
}
void ButtonRound2OnClick() {
 screen_flag = 1;
 I2C_Set_Active( &I2C1_Start, &I2C1_Read, &I2C1_Write );
 Delay_ms(1);
 ButtonRound2.Pen_Color = CL_AQUA;
 ButtonRound2.Font_Color = CL_AQUA;
 DrawImage(&Image5);
 DrawRoundButton(&ButtonRound2);
 ButtonRound2.Pen_Color = CL_LIME;
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
