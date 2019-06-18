#line 1 "C:/Users/aleksandar.paunovic/Desktop/Mikromedia Greenhouse Project/MikromediaGreenhouseProject_main.c"
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
#line 1 "c:/users/aleksandar.paunovic/desktop/mikromedia greenhouse project/mikromediagreenhouseproject_types.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdbool.h"



 typedef char _Bool;
#line 1 "c:/users/aleksandar.paunovic/desktop/mikromedia greenhouse project/mikromediagreenhouseproject_config.h"
#line 1 "c:/users/aleksandar.paunovic/desktop/mikromedia greenhouse project/mikromediagreenhouseproject_types.h"
#line 3 "c:/users/aleksandar.paunovic/desktop/mikromedia greenhouse project/mikromediagreenhouseproject_config.h"
const uint32_t _G2C_TIMER_LIMIT = 5;
const uint16_t _G2C_BUF_WARNING = 192;
const uint8_t _G2C_POLL_ENABLE = 0;
const uint8_t _G2C_CALLBACK_ENABLE = 0;
const uint8_t _G2C_BOOTLOADER = 0;

const uint32_t _G2C_UART_CFG[ 4 ] =
{
 57600,
 _UART_8_BIT_DATA,
 _UART_NOPARITY,
 _UART_ONE_STOPBIT
};

const uint32_t _TEMPHUM6_I2C_CFG[ 1 ] =
{
 400000
};

const uint32_t _UV3_I2C_CFG[ 1 ] =
{
 400000
};

const uint32_t _FAN3_I2C_CFG[ 1 ] =
{
 400000
};

const uint32_t _SERVO_I2C_CFG[ 1 ] =
{
 400000
};
#line 1 "c:/users/aleksandar.paunovic/desktop/mikromedia greenhouse project/mikromediagreenhouseproject_timer.h"
#line 1 "c:/users/aleksandar.paunovic/desktop/mikromedia greenhouse project/mikromediagreenhouseproject_types.h"
#line 12 "c:/users/aleksandar.paunovic/desktop/mikromedia greenhouse project/mikromediagreenhouseproject_timer.h"
uint16_t taskTime;

static void g2c_configTimer( )
{
 RCC_APB1ENR.TIM3EN = 1;
 TIM3_CR1.CEN = 0;
 TIM3_PSC = 1;
 TIM3_ARR = 49999;
 NVIC_IntEnable( IVT_INT_TIM3 );
 TIM3_DIER.UIE = 1;
 TIM3_CR1.CEN = 1;
}

void Timer_interrupt( ) iv IVT_INT_TIM3
{
 g2c_tick( );
 taskTime++;
 TIM3_SR.UIF = 0;
}
#line 57 "C:/Users/aleksandar.paunovic/Desktop/Mikromedia Greenhouse Project/MikromediaGreenhouseProject_main.c"
static char g2c_actuarotRef_1[ 30 ] = "SERVO_POS";
static char g2c_actuarotRef_2[ 30 ] = "FAN_SPEED";
static char g2c_actuarotRef_3[ 30 ] = "SERVO_NUM";


static char g2c_sensorRef_1[ 30 ] = "TEMPHUM6_T";
static char g2c_sensorRef_2[ 30 ] = "TEMPHUM6_H";
static char g2c_sensorRef_3[ 30 ] = "UV3_UV";
static char g2c_sensorRef_4[ 30 ] = "UV3_UVI";
static char g2c_sensorRef_5[ 30 ] = "MIKROMEDIA";


static char g2c_networkName [ 20 ] = "Network_Name";
static char g2c_networkPassword [ 20 ] = "Network_Password";
static char g2c_devKey [ 50 ] = "Device_Key";
static char g2c_devPass [ 100 ] = "Device_Password";


static char _ATE [ 5 ] = "ATE1";
static char _AT [ 3 ] = "AT";
static char _AT_CEN [ 9 ] = "AT+CEN=1";
static char _AT_NWCR[ 8 ] = "AT+NWCR";
static char _AT_NWC [ 9 ] = "AT+NWC=1";
static char _AT_BRCR[ 8 ] = "AT+BRCR";
static char _AT_BRC [ 9 ] = "AT+BRC=1";
static char _AT_DSET[ 8 ] = "AT+DSET";
static char _AT_PUB [ 7 ] = "AT+PUB";


uint8_t servo_pos;
uint8_t servo_pos_1;
uint8_t servo_pos_2;
uint8_t servo_pos_3;
uint8_t servo_pos_4;
uint8_t servo_pos_5;
uint8_t servo_pos_6;
uint8_t servo_pos_7;
uint8_t servo_pos_8;
uint8_t servo_pos_9;
uint8_t servo_pos_10;
uint8_t servo_pos_11;
uint8_t servo_pos_12;
uint8_t servo_pos_13;
uint8_t servo_pos_14;
uint8_t servo_pos_15;
uint8_t servo_pos_16;
uint8_t servo_pos_all;
uint8_t servo_pos_change_flag;
uint8_t servo_num;
uint8_t servo_num_change_flag;
uint8_t fan_speed;
uint8_t fan_speed_change_flag;

uint8_t basic_length;
uint8_t reference1_length;
uint8_t reference2_length;
uint8_t message_length;
uint8_t data_length;
uint8_t message_flag;

uint8_t screen_flag;

char demo_buffer[50];
char aux_buffer[50];
char message_buffer[50];
uint8_t aux_fanSpeed[5];
uint8_t aux_servoPos[5];
uint8_t aux_servoNum[5];
uint8_t i;




float temphum6_temperature;
float last_temperature;
float temphum6_humidity;
float last_humidity;


uint16_t uv3_data;
uint16_t last_uv;
uint8_t uv3_riskLvl;
uint8_t last_riskLvl;




uint16_t servo_current;


void g2c_default_handler( uint8_t * rsp, uint8_t * evArgs );
void parse_data( );
void g2c_packCmd( uint8_t * cmd, uint8_t * mid, uint8_t * _end );
void drivers_init( );
void clicks_init( );
void collect_data( );
void publish_data( );
void log_data( );
void log_last( );
void servo_position( );
void servo_position_log( );
void fan_speed_log( );
void FloatCut( char * buffer, uint8_t buffer_size );
void clear_servoNumber_button_colors( );
void clear_servoNumber_buttons( );
void clear_fanSpeed_button_colors( );
void clear_fanSpeed_buttons( );


void G2C_Int_Proc( ) iv IVT_INT_USART2 ics ICS_AUTO
{
 if( RXNE_USART2_ISR_bit )
 {
 g2c_putc( UART2_Read( ) );
 }
}

void systemInit( )
{

 mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_INPUT );
 mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_RST_PIN, _GPIO_OUTPUT );
 mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );




 mikrobus_gpioInit( _MIKROBUS3, _MIKROBUS_INT_PIN, _GPIO_INPUT );




 mikrobus_gpioInit( _MIKROBUS5, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );


 mikrobus_uartInit( _MIKROBUS1, &_G2C_UART_CFG[0] );
 Delay_ms(300);


 mikrobus_i2cInit( _MIKROBUS2, &_TEMPHUM6_I2C_CFG[0] );
 Delay_ms(500);
#line 214 "C:/Users/aleksandar.paunovic/Desktop/Mikromedia Greenhouse Project/MikromediaGreenhouseProject_main.c"
}

void applicationInit( )
{

 Start_TP( );
 Delay_ms(500);

 drivers_init( );
 clicks_init( );

 taskTime = 0;

 servo_pos = 10;
 servo_pos_1 = 10;
 servo_pos_2 = 10;
 servo_pos_3 = 10;
 servo_pos_4 = 10;
 servo_pos_5 = 10;
 servo_pos_6 = 10;
 servo_pos_7 = 10;
 servo_pos_8 = 10;
 servo_pos_9 = 10;
 servo_pos_10 = 10;
 servo_pos_11 = 10;
 servo_pos_12 = 10;
 servo_pos_13 = 10;
 servo_pos_14 = 10;
 servo_pos_15 = 10;
 servo_pos_16 = 10;
 servo_pos_all = 10;
 servo_pos_change_flag = 0;
 servo_num = 0;
 servo_num_change_flag = 0;
 fan_speed = 0;
 fan_speed_change_flag = 0;

 basic_length = 15;
 reference1_length = strlen( g2c_actuarotRef_1 );
 reference2_length = strlen( g2c_actuarotRef_2 );
 message_flag = 0;

 screen_flag = 1;

 temphum6_temperature = 0;
 last_temperature = 0;
 temphum6_humidity = 0;
 last_humidity = 0;

 uv3_data = 0;
 last_uv = 0;
 uv3_riskLvl = 1;
 last_riskLvl = 1;

 ProgressBar1.Position = 10;
 fan_speed_button_stop.Pen_Color = CL_AQUA;
 fan_speed_button_stop.Font_Color = CL_AQUA;
 servo_number_button_all.Pen_Color = CL_AQUA;
 servo_number_button_all.Font_Color = CL_AQUA;
 DrawScreen(&Screen1);
 log_last( );
}

void applicationTask( )
{

 g2c_process( );


 I2C_Set_Active( &I2C1_Start, &I2C1_Read, &I2C1_Write );
 Delay_ms(1);
 Check_TP( );
 I2C_Set_Active(&I2C2_Start, &I2C2_Read, &I2C2_Write);
 Delay_ms(1);


 if (message_flag == 1)
 {
 parse_data( );
 message_flag = 0;
 }


 if (servo_num_change_flag == 1)
 {
 servo_position_log( );
 g2c_packCmd( &_AT_DSET[0], &g2c_sensorRef_5[0], "Servo number changed" );
 g2c_cmdSingle( &_AT_PUB[0] );
 servo_num_change_flag = 0;
 }


 if (servo_pos_change_flag == 1)
 {
 servo_position( );
 servo_position_log( );
 g2c_packCmd( &_AT_DSET[0], &g2c_sensorRef_5[0], "Servo position changed" );
 g2c_cmdSingle( &_AT_PUB[0] );
 servo_pos_change_flag = 0;
 }


 if (fan_speed_change_flag == 1)
 {
 fan3_setSpeed( fan_speed );
 fan_speed_log( );
 g2c_packCmd( &_AT_DSET[0], &g2c_sensorRef_5[0], "Fan speed changed" );
 g2c_cmdSingle( &_AT_PUB[0] );
 fan_speed_change_flag = 0;
 }


 if (screen_flag == 1)
 {
 I2C_Set_Active( &I2C1_Start, &I2C1_Read, &I2C1_Write );
 Delay_ms(1);
 log_data( );
 I2C_Set_Active(&I2C2_Start, &I2C2_Read, &I2C2_Write);
 Delay_ms(1);
 }


 if (taskTime > 5000)
 {
 taskTime = 0;
 collect_data( );
 publish_data( );
 }
}

void main( )
{
 systemInit( );
 applicationInit( );

 while (1)
 {
 applicationTask( );
 }
}



void g2c_default_handler( uint8_t * rsp, uint8_t * evArgs )
{
 char cmd_act[ 5 ] = "+ACT";

 if (( 0 == strncmp( &cmd_act[0], rsp + 2, 4 ) ) && ( message_flag == 0 ))
 {
 strcpy( &message_buffer[0], &rsp[0] );
 message_flag = 1;
 }
}

void parse_data( )
{
 message_length = strlen( message_buffer );

 if (0 == strncmp( g2c_actuarotRef_1, message_buffer + 9, reference1_length ))
 {
 data_length = message_length - basic_length - reference1_length;

 for (i = 0; i < data_length; i ++)
 {
 aux_servoPos[ i ] = message_buffer[ basic_length + reference1_length + i - 3 ];
 }
 aux_servoPos[ data_length ] = 0x00;

 servo_pos = StrToShort( aux_servoPos );

 servo_pos_change_flag = 1;
 }
 if (0 == strncmp( g2c_actuarotRef_2, message_buffer + 9, reference2_length ))
 {
 data_length = message_length - basic_length - reference1_length;

 for (i = 0; i < data_length; i ++)
 {
 aux_fanSpeed[ i ] = message_buffer[ basic_length + reference1_length + i - 3 ];
 }
 aux_fanSpeed[ data_length ] = 0x00;

 fan_speed = StrToShort( aux_fanSpeed );

 fan_speed_change_flag = 1;
 }
 if (0 == strncmp( g2c_actuarotRef_3, message_buffer + 9, reference1_length ))
 {
 data_length = message_length - basic_length - reference1_length;

 for (i = 0; i < data_length; i ++)
 {
 aux_servoNum[ i ] = message_buffer[ basic_length + reference1_length + i - 3 ];
 }
 aux_servoNum[ data_length ] = 0x00;

 servo_num = StrToShort( aux_servoNum );

 servo_num_change_flag = 1;
 }
}

void g2c_packCmd( uint8_t * cmd, uint8_t * mid, uint8_t * _end )
{
 char cmd_param[ 10 ] = "=\"";
 char mid_param[ 10 ] = "\",\"";
 char end_param[ 10 ] = "\"";

 uint8_t tmpBuf[ 80 ];
 memset( &tmpBuf[ 0 ], 0, 50 );

 strcat ( &tmpBuf[ 0 ], cmd );
 strcat ( &tmpBuf[ 0 ], &cmd_param[0] );
 strcat ( &tmpBuf[ 0 ], mid );
 strcat ( &tmpBuf[ 0 ], &mid_param[0] );
 strcat ( &tmpBuf[ 0 ], _end );
 strcat ( &tmpBuf[ 0 ], &end_param[0] );

 g2c_cmdSingle( &tmpBuf[ 0 ] );
}

void drivers_init( )
{

 g2c_uartDriverInit( ( const uint8_t* )&_MIKROBUS1_GPIO, ( const uint8_t* )&_MIKROBUS1_UART );
 Delay_ms(300);

 RXNEIE_USART2_CR1_bit = 1;
 NVIC_IntEnable( IVT_INT_USART2 );

 g2c_configTimer( );
 Delay_ms(100);


 temphum6_i2cDriverInit( ( const uint8_t* )&_MIKROBUS2_GPIO, ( const uint8_t* )&_MIKROBUS2_I2C, 0x43 );
 Delay_ms(300);


 uv3_i2cDriverInit( ( const uint8_t* )&_MIKROBUS3_GPIO, ( const uint8_t* )&_MIKROBUS3_I2C, 0x38 );
 Delay_ms(300);


 fan3_i2cDriverInit( ( const uint8_t* )&_MIKROBUS4_GPIO, ( const uint8_t* )&_MIKROBUS4_I2C, 0x20 );
 Delay_ms(300);


 servo_i2cDriverInit( ( const uint8_t* )&_MIKROBUS5_GPIO, ( const uint8_t* )&_MIKROBUS5_I2C, 0x40, 0x14 );
 Delay_ms(300);
}

void clicks_init( )
{

 g2c_coreInit( g2c_default_handler, 5000 );
 Delay_ms(300);
 g2c_modulePower(  0  );
 Delay_ms(300);
 g2c_modulePower(  1  );
 Delay_ms(7000);

 g2c_cmdSingle( &_AT[0] );
 g2c_cmdSingle( &_AT[0] );
 g2c_cmdSingle( &_AT[0] );
 g2c_cmdSingle( &_AT_CEN[0] );
 g2c_packCmd ( &_AT_NWCR[0], &g2c_networkName[0], &g2c_networkPassword[0]);
 g2c_cmdSingle( &_AT_NWC[0] );
 g2c_packCmd ( &_AT_BRCR[0], &g2c_devKey[0], &g2c_devPass[0]);
 g2c_cmdSingle( &_AT_BRC[0] );
 Delay_ms(7000);


 temphum6_reset( );
 Delay_ms(300);


 uv3_enableSensor( );
 Delay_ms(100);
 uv3_setIntegrationTime( _UV3_CMD_IT_4T );
 Delay_ms(100);


 fan3_setSpeed( fan_speed );
 Delay_ms(100);


 servo_init( 0, 180, _SERVO_DEFAULT_LOW_RESOLUTION, _SERVO_DEFAULT_HIGH_RESOLUTION );
 servo_setVref( _SERVO_VREF_3300 );
 servo_setMode( _SERVO_REG_MODE_1, _SERVO_MODE1_RESTART_ENABLE | _SERVO_MODE1_USE_ALL_CALL_ADR );
 servo_sleep( );
 servo_setFREQ( 30 );
 servo_setMode( _SERVO_REG_MODE_1,_SERVO_MODE1_RESTART_ENABLE| _SERVO_MODE1_AUTO_INCREMENT_ENABLE | _SERVO_MODE1_USE_ALL_CALL_ADR );
 Delay_ms(100);
 servo_setPosition( _SERVO_MOTOR_1, servo_pos );
 servo_setPosition( _SERVO_MOTOR_2, servo_pos );
 servo_setPosition( _SERVO_MOTOR_3, servo_pos );
 servo_setPosition( _SERVO_MOTOR_4, servo_pos );
 servo_setPosition( _SERVO_MOTOR_5, servo_pos );
 servo_setPosition( _SERVO_MOTOR_6, servo_pos );
 servo_setPosition( _SERVO_MOTOR_7, servo_pos );
 servo_setPosition( _SERVO_MOTOR_8, servo_pos );
 servo_setPosition( _SERVO_MOTOR_9, servo_pos );
 servo_setPosition( _SERVO_MOTOR_10, servo_pos );
 servo_setPosition( _SERVO_MOTOR_11, servo_pos );
 servo_setPosition( _SERVO_MOTOR_12, servo_pos );
 servo_setPosition( _SERVO_MOTOR_13, servo_pos );
 servo_setPosition( _SERVO_MOTOR_14, servo_pos );
 servo_setPosition( _SERVO_MOTOR_15, servo_pos );
 servo_setPosition( _SERVO_MOTOR_16, servo_pos );
}

void collect_data( )
{

 temphum6_temperature = temphum6_readTemperature( _TEMPHUM6_TEMP_IN_CELSIUS );


 temphum6_humidity = temphum6_readRelativeHuminidy( );


 uv3_data = uv3_readMeasurements( );


 uv3_riskLvl = uv3_riskLevel( uv3_data );
}

void publish_data( )
{

 FloatToStr( temphum6_temperature, demo_buffer );
 g2c_packCmd( &_AT_DSET[0], &g2c_sensorRef_1[0], &demo_buffer[0] );


 FloatToStr( temphum6_humidity, demo_buffer );
 g2c_packCmd( &_AT_DSET[0], &g2c_sensorRef_2[0], &demo_buffer[0] );


 WordToStrWithZeros( uv3_data, demo_buffer );
 g2c_packCmd( &_AT_DSET[0], &g2c_sensorRef_3[0], &demo_buffer[0] );

 memset( demo_buffer, 0, 50 );


 if ( uv3_riskLvl == _UV3_RAD_LOW ) strcpy( &demo_buffer[0], "Low" );
 if ( uv3_riskLvl == _UV3_RAD_MODERATE ) strcpy( &demo_buffer[0], "Moderate" );
 if ( uv3_riskLvl == _UV3_RAD_HIGH ) strcpy( &demo_buffer[0], "High" );
 if ( uv3_riskLvl == _UV3_RAD_VERY_HIGH ) strcpy( &demo_buffer[0], "Very High" );
 if ( uv3_riskLvl == _UV3_RAD_EXTREME ) strcpy( &demo_buffer[0], "Extreme" );
 g2c_packCmd( &_AT_DSET[0], &g2c_sensorRef_4[0], &demo_buffer[0]);


 g2c_cmdSingle( &_AT_PUB[0] );
}

void log_data( )
{
 if (last_temperature != temphum6_temperature)
 {

 cleanLabel(1);


 FloatToStr( temphum6_temperature, aux_buffer );
 FloatCut( aux_buffer, 50 );
 Ltrim( aux_buffer );
 updateLabel( aux_buffer, 500, 20 );

 last_temperature = temphum6_temperature;
 }

 if (last_humidity != temphum6_humidity)
 {

 cleanLabel(2);


 FloatToStr( temphum6_humidity, aux_buffer );
 FloatCut( aux_buffer, 50 );
 Ltrim( aux_buffer );
 updateLabel( aux_buffer, 500, 80 );

 last_humidity = temphum6_humidity;
 }

 if (last_uv != uv3_data)
 {

 cleanLabel(3);


 WordToStr( uv3_data, aux_buffer );
 Ltrim( aux_buffer );
 updateLabel( aux_buffer, 500, 140 );

 last_uv = uv3_data;
 }

 if (last_riskLvl != uv3_riskLvl)
 {

 cleanLabel(4);

 memset( aux_buffer, 0, 50 );


 if ( uv3_riskLvl == _UV3_RAD_LOW ) strcpy( &aux_buffer[0], "Low" );
 if ( uv3_riskLvl == _UV3_RAD_MODERATE ) strcpy( &aux_buffer[0], "Moderate" );
 if ( uv3_riskLvl == _UV3_RAD_HIGH ) strcpy( &aux_buffer[0], "High" );
 if ( uv3_riskLvl == _UV3_RAD_VERY_HIGH ) strcpy( &aux_buffer[0], "Very High" );
 if ( uv3_riskLvl == _UV3_RAD_EXTREME ) strcpy( &aux_buffer[0], "Extreme" );
 updateLabel( aux_buffer, 500, 200 );

 last_riskLvl = uv3_riskLvl;
 }
}

void log_last( )
{

 cleanLabel(1);


 cleanLabel(2);


 cleanLabel(3);


 cleanLabel(4);


 FloatToStr( temphum6_temperature, aux_buffer );
 FloatCut( aux_buffer, 50 );
 Ltrim( aux_buffer );
 updateLabel( aux_buffer, 500, 20 );


 FloatToStr( temphum6_humidity, aux_buffer );
 FloatCut( aux_buffer, 50 );
 Ltrim( aux_buffer );
 updateLabel( aux_buffer, 500, 80 );


 WordToStr( uv3_data, aux_buffer );
 Ltrim( aux_buffer );
 updateLabel( aux_buffer, 500, 140 );

 memset( aux_buffer, 0, 50 );


 if ( uv3_riskLvl == _UV3_RAD_LOW ) strcpy( &aux_buffer[0], "Low" );
 if ( uv3_riskLvl == _UV3_RAD_MODERATE ) strcpy( &aux_buffer[0], "Moderate" );
 if ( uv3_riskLvl == _UV3_RAD_HIGH ) strcpy( &aux_buffer[0], "High" );
 if ( uv3_riskLvl == _UV3_RAD_VERY_HIGH ) strcpy( &aux_buffer[0], "Very High" );
 if ( uv3_riskLvl == _UV3_RAD_EXTREME ) strcpy( &aux_buffer[0], "Extreme" );
 updateLabel( aux_buffer, 500, 200 );
}

void servo_position( )
{
 switch (servo_num)
 {
 case 0 :
 {
 servo_setPosition( _SERVO_MOTOR_1, servo_pos );
 servo_setPosition( _SERVO_MOTOR_2, servo_pos );
 servo_setPosition( _SERVO_MOTOR_3, servo_pos );
 servo_setPosition( _SERVO_MOTOR_4, servo_pos );
 servo_setPosition( _SERVO_MOTOR_5, servo_pos );
 servo_setPosition( _SERVO_MOTOR_6, servo_pos );
 servo_setPosition( _SERVO_MOTOR_7, servo_pos );
 servo_setPosition( _SERVO_MOTOR_8, servo_pos );
 servo_setPosition( _SERVO_MOTOR_9, servo_pos );
 servo_setPosition( _SERVO_MOTOR_10, servo_pos );
 servo_setPosition( _SERVO_MOTOR_11, servo_pos );
 servo_setPosition( _SERVO_MOTOR_12, servo_pos );
 servo_setPosition( _SERVO_MOTOR_13, servo_pos );
 servo_setPosition( _SERVO_MOTOR_14, servo_pos );
 servo_setPosition( _SERVO_MOTOR_15, servo_pos );
 servo_setPosition( _SERVO_MOTOR_16, servo_pos );
 servo_pos_1 = servo_pos;
 servo_pos_2 = servo_pos;
 servo_pos_3 = servo_pos;
 servo_pos_4 = servo_pos;
 servo_pos_5 = servo_pos;
 servo_pos_6 = servo_pos;
 servo_pos_7 = servo_pos;
 servo_pos_8 = servo_pos;
 servo_pos_9 = servo_pos;
 servo_pos_10 = servo_pos;
 servo_pos_11 = servo_pos;
 servo_pos_12 = servo_pos;
 servo_pos_13 = servo_pos;
 servo_pos_14 = servo_pos;
 servo_pos_15 = servo_pos;
 servo_pos_16 = servo_pos;
 servo_pos_all = servo_pos;
 break;
 }
 case 1 :
 {
 servo_setPosition( _SERVO_MOTOR_1, servo_pos );
 servo_pos_1 = servo_pos;
 break;
 }
 case 2 :
 {
 servo_setPosition( _SERVO_MOTOR_2, servo_pos );
 servo_pos_2 = servo_pos;
 break;
 }
 case 3 :
 {
 servo_setPosition( _SERVO_MOTOR_3, servo_pos );
 servo_pos_3 = servo_pos;
 break;
 }
 case 4 :
 {
 servo_setPosition( _SERVO_MOTOR_4, servo_pos );
 servo_pos_4 = servo_pos;
 break;
 }
 case 5 :
 {
 servo_setPosition( _SERVO_MOTOR_5, servo_pos );
 servo_pos_5 = servo_pos;
 break;
 }
 case 6 :
 {
 servo_setPosition( _SERVO_MOTOR_6, servo_pos );
 servo_pos_6 = servo_pos;
 break;
 }
 case 7 :
 {
 servo_setPosition( _SERVO_MOTOR_7, servo_pos );
 servo_pos_7 = servo_pos;
 break;
 }
 case 8 :
 {
 servo_setPosition( _SERVO_MOTOR_8, servo_pos );
 servo_pos_8 = servo_pos;
 break;
 }
 case 9 :
 {
 servo_setPosition( _SERVO_MOTOR_9, servo_pos );
 servo_pos_9 = servo_pos;
 break;
 }
 case 10 :
 {
 servo_setPosition( _SERVO_MOTOR_10, servo_pos );
 servo_pos_10 = servo_pos;
 break;
 }
 case 11 :
 {
 servo_setPosition( _SERVO_MOTOR_11, servo_pos );
 servo_pos_11 = servo_pos;
 break;
 }
 case 12 :
 {
 servo_setPosition( _SERVO_MOTOR_12, servo_pos );
 servo_pos_12 = servo_pos;
 break;
 }
 case 13 :
 {
 servo_setPosition( _SERVO_MOTOR_13, servo_pos );
 servo_pos_13 = servo_pos;
 break;
 }
 case 14 :
 {
 servo_setPosition( _SERVO_MOTOR_14, servo_pos );
 servo_pos_14 = servo_pos;
 break;
 }
 case 15 :
 {
 servo_setPosition( _SERVO_MOTOR_15, servo_pos );
 servo_pos_15 = servo_pos;
 break;
 }
 case 16 :
 {
 servo_setPosition( _SERVO_MOTOR_16, servo_pos );
 servo_pos_16 = servo_pos;
 break;
 }
 default :
 {
 break;
 }
 }
}

void servo_position_log( )
{
 switch (servo_num)
 {
 case 0 :
 {
 if (screen_flag == 1)
 {
 clear_servoNumber_button_colors( );
 servo_number_button_all.Font_Color = CL_AQUA;
 servo_number_button_all.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_all;
 }
 if (screen_flag == 2)
 {
 clear_servoNumber_buttons( );
 servo_number_button_all.Font_Color = CL_AQUA;
 servo_number_button_all.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_all;
 DrawButton(&servo_number_button_all);
 DrawImage(&Image10);
 DrawProgressBar(&ProgressBar1);
 }
 break;
 }
 case 1 :
 {
 if (screen_flag == 1)
 {
 clear_servoNumber_button_colors( );
 servo_number_button_1.Font_Color = CL_AQUA;
 servo_number_button_1.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_1;
 }
 if (screen_flag == 2)
 {
 clear_servoNumber_buttons( );
 servo_number_button_1.Font_Color = CL_AQUA;
 servo_number_button_1.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_1;
 DrawButton(&servo_number_button_1);
 DrawImage(&Image10);
 DrawProgressBar(&ProgressBar1);
 }
 break;
 }
 case 2 :
 {
 if (screen_flag == 1)
 {
 clear_servoNumber_button_colors( );
 servo_number_button_2.Font_Color = CL_AQUA;
 servo_number_button_2.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_2;
 }
 if (screen_flag == 2)
 {
 clear_servoNumber_buttons( );
 servo_number_button_2.Font_Color = CL_AQUA;
 servo_number_button_2.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_2;
 DrawButton(&servo_number_button_2);
 DrawImage(&Image10);
 DrawProgressBar(&ProgressBar1);
 }
 break;
 }
 case 3 :
 {
 if (screen_flag == 1)
 {
 clear_servoNumber_button_colors( );
 servo_number_button_3.Font_Color = CL_AQUA;
 servo_number_button_3.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_3;
 }
 if (screen_flag == 2)
 {
 clear_servoNumber_buttons( );
 servo_number_button_3.Font_Color = CL_AQUA;
 servo_number_button_3.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_3;
 DrawButton(&servo_number_button_3);
 DrawImage(&Image10);
 DrawProgressBar(&ProgressBar1);
 }
 break;
 }
 case 4 :
 {
 if (screen_flag == 1)
 {
 clear_servoNumber_button_colors( );
 servo_number_button_4.Font_Color = CL_AQUA;
 servo_number_button_4.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_4;
 }
 if (screen_flag == 2)
 {
 clear_servoNumber_buttons( );
 servo_number_button_4.Font_Color = CL_AQUA;
 servo_number_button_4.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_4;
 DrawButton(&servo_number_button_4);
 DrawImage(&Image10);
 DrawProgressBar(&ProgressBar1);
 }
 break;
 }
 case 5 :
 {
 if (screen_flag == 1)
 {
 clear_servoNumber_button_colors( );
 servo_number_button_5.Font_Color = CL_AQUA;
 servo_number_button_5.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_5;
 }
 if (screen_flag == 2)
 {
 clear_servoNumber_buttons( );
 servo_number_button_5.Font_Color = CL_AQUA;
 servo_number_button_5.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_5;
 DrawButton(&servo_number_button_5);
 DrawImage(&Image10);
 DrawProgressBar(&ProgressBar1);
 }
 break;
 }
 case 6 :
 {
 if (screen_flag == 1)
 {
 clear_servoNumber_button_colors( );
 servo_number_button_6.Font_Color = CL_AQUA;
 servo_number_button_6.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_6;
 }
 if (screen_flag == 2)
 {
 clear_servoNumber_buttons( );
 servo_number_button_6.Font_Color = CL_AQUA;
 servo_number_button_6.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_6;
 DrawButton(&servo_number_button_6);
 DrawImage(&Image10);
 DrawProgressBar(&ProgressBar1);
 }
 break;
 }
 case 7 :
 {
 if (screen_flag == 1)
 {
 clear_servoNumber_button_colors( );
 servo_number_button_7.Font_Color = CL_AQUA;
 servo_number_button_7.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_7;
 }
 if (screen_flag == 2)
 {
 clear_servoNumber_buttons( );
 servo_number_button_7.Font_Color = CL_AQUA;
 servo_number_button_7.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_7;
 DrawButton(&servo_number_button_7);
 DrawImage(&Image10);
 DrawProgressBar(&ProgressBar1);
 }
 break;
 }
 case 8 :
 {
 if (screen_flag == 1)
 {
 clear_servoNumber_button_colors( );
 servo_number_button_8.Font_Color = CL_AQUA;
 servo_number_button_8.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_8;
 }
 if (screen_flag == 2)
 {
 clear_servoNumber_buttons( );
 servo_number_button_8.Font_Color = CL_AQUA;
 servo_number_button_8.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_8;
 DrawButton(&servo_number_button_8);
 DrawImage(&Image10);
 DrawProgressBar(&ProgressBar1);
 }
 break;
 }
 case 9 :
 {
 if (screen_flag == 1)
 {
 clear_servoNumber_button_colors( );
 servo_number_button_9.Font_Color = CL_AQUA;
 servo_number_button_9.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_9;
 }
 if (screen_flag == 2)
 {
 clear_servoNumber_buttons( );
 servo_number_button_9.Font_Color = CL_AQUA;
 servo_number_button_9.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_9;
 DrawButton(&servo_number_button_9);
 DrawImage(&Image10);
 DrawProgressBar(&ProgressBar1);
 }
 break;
 }
 case 10 :
 {
 if (screen_flag == 1)
 {
 clear_servoNumber_button_colors( );
 servo_number_button_10.Font_Color = CL_AQUA;
 servo_number_button_10.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_10;
 }
 if (screen_flag == 2)
 {
 clear_servoNumber_buttons( );
 servo_number_button_10.Font_Color = CL_AQUA;
 servo_number_button_10.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_10;
 DrawButton(&servo_number_button_10);
 DrawImage(&Image10);
 DrawProgressBar(&ProgressBar1);
 }
 break;
 }
 case 11 :
 {
 if (screen_flag == 1)
 {
 clear_servoNumber_button_colors( );
 servo_number_button_11.Font_Color = CL_AQUA;
 servo_number_button_11.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_11;
 }
 if (screen_flag == 2)
 {
 clear_servoNumber_buttons( );
 servo_number_button_11.Font_Color = CL_AQUA;
 servo_number_button_11.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_11;
 DrawButton(&servo_number_button_11);
 DrawImage(&Image10);
 DrawProgressBar(&ProgressBar1);
 }
 break;
 }
 case 12 :
 {
 if (screen_flag == 1)
 {
 clear_servoNumber_button_colors( );
 servo_number_button_12.Font_Color = CL_AQUA;
 servo_number_button_12.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_12;
 }
 if (screen_flag == 2)
 {
 clear_servoNumber_buttons( );
 servo_number_button_12.Font_Color = CL_AQUA;
 servo_number_button_12.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_12;
 DrawButton(&servo_number_button_12);
 DrawImage(&Image10);
 DrawProgressBar(&ProgressBar1);
 }
 break;
 }
 case 13 :
 {
 if (screen_flag == 1)
 {
 clear_servoNumber_button_colors( );
 servo_number_button_13.Font_Color = CL_AQUA;
 servo_number_button_13.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_13;
 }
 if (screen_flag == 2)
 {
 clear_servoNumber_buttons( );
 servo_number_button_13.Font_Color = CL_AQUA;
 servo_number_button_13.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_13;
 DrawButton(&servo_number_button_13);
 DrawImage(&Image10);
 DrawProgressBar(&ProgressBar1);
 }
 break;
 }
 case 14 :
 {
 if (screen_flag == 1)
 {
 clear_servoNumber_button_colors( );
 servo_number_button_14.Font_Color = CL_AQUA;
 servo_number_button_14.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_14;
 }
 if (screen_flag == 2)
 {
 clear_servoNumber_buttons( );
 servo_number_button_14.Font_Color = CL_AQUA;
 servo_number_button_14.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_14;
 DrawButton(&servo_number_button_14);
 DrawImage(&Image10);
 DrawProgressBar(&ProgressBar1);
 }
 break;
 }
 case 15 :
 {
 if (screen_flag == 1)
 {
 clear_servoNumber_button_colors( );
 servo_number_button_15.Font_Color = CL_AQUA;
 servo_number_button_15.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_15;
 }
 if (screen_flag == 2)
 {
 clear_servoNumber_buttons( );
 servo_number_button_15.Font_Color = CL_AQUA;
 servo_number_button_15.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_15;
 DrawButton(&servo_number_button_15);
 DrawImage(&Image10);
 DrawProgressBar(&ProgressBar1);
 }
 break;
 }
 case 16 :
 {
 if (screen_flag == 1)
 {
 clear_servoNumber_button_colors( );
 servo_number_button_16.Font_Color = CL_AQUA;
 servo_number_button_16.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_16;
 }
 if (screen_flag == 2)
 {
 clear_servoNumber_buttons( );
 servo_number_button_16.Font_Color = CL_AQUA;
 servo_number_button_16.Pen_Color = CL_AQUA;
 ProgressBar1.Position = servo_pos_16;
 DrawButton(&servo_number_button_16);
 DrawImage(&Image10);
 DrawProgressBar(&ProgressBar1);
 }
 break;
 }
 default :
 {
 break;
 }
 }
}

void fan_speed_log( )
{
 switch (fan_speed)
 {
 case 0 :
 {
 if (screen_flag == 1)
 {
 clear_fanSpeed_button_colors( );
 fan_speed_button_stop.Font_Color = CL_AQUA;
 fan_speed_button_stop.Pen_Color = CL_AQUA;
 }
 if (screen_flag == 2)
 {
 clear_fanSpeed_buttons( );
 fan_speed_button_stop.Font_Color = CL_AQUA;
 fan_speed_button_stop.Pen_Color = CL_AQUA;
 DrawButton(&fan_speed_button_stop);
 }
 break;
 }
 case 1 :
 {
 if (screen_flag == 1)
 {
 clear_fanSpeed_button_colors( );
 fan_speed_button_1.Font_Color = CL_AQUA;
 fan_speed_button_1.Pen_Color = CL_AQUA;
 }
 if (screen_flag == 2)
 {
 clear_fanSpeed_buttons( );
 fan_speed_button_1.Font_Color = CL_AQUA;
 fan_speed_button_1.Pen_Color = CL_AQUA;
 DrawButton(&fan_speed_button_1);
 }
 break;
 }
 case 2 :
 {
 if (screen_flag == 1)
 {
 clear_fanSpeed_button_colors( );
 fan_speed_button_2.Font_Color = CL_AQUA;
 fan_speed_button_2.Pen_Color = CL_AQUA;
 }
 if (screen_flag == 2)
 {
 clear_fanSpeed_buttons( );
 fan_speed_button_2.Font_Color = CL_AQUA;
 fan_speed_button_2.Pen_Color = CL_AQUA;
 DrawButton(&fan_speed_button_2);
 }
 break;
 }
 case 3 :
 {
 if (screen_flag == 1)
 {
 clear_fanSpeed_button_colors( );
 fan_speed_button_3.Font_Color = CL_AQUA;
 fan_speed_button_3.Pen_Color = CL_AQUA;
 }
 if (screen_flag == 2)
 {
 clear_fanSpeed_buttons( );
 fan_speed_button_3.Font_Color = CL_AQUA;
 fan_speed_button_3.Pen_Color = CL_AQUA;
 DrawButton(&fan_speed_button_3);
 }
 break;
 }
 case 4 :
 {
 if (screen_flag == 1)
 {
 clear_fanSpeed_button_colors( );
 fan_speed_button_4.Font_Color = CL_AQUA;
 fan_speed_button_4.Pen_Color = CL_AQUA;
 }
 if (screen_flag == 2)
 {
 clear_fanSpeed_buttons( );
 fan_speed_button_4.Font_Color = CL_AQUA;
 fan_speed_button_4.Pen_Color = CL_AQUA;
 DrawButton(&fan_speed_button_4);
 }
 break;
 }
 case 5 :
 {
 if (screen_flag == 1)
 {
 clear_fanSpeed_button_colors( );
 fan_speed_button_5.Font_Color = CL_AQUA;
 fan_speed_button_5.Pen_Color = CL_AQUA;
 }
 if (screen_flag == 2)
 {
 clear_fanSpeed_buttons( );
 fan_speed_button_5.Font_Color = CL_AQUA;
 fan_speed_button_5.Pen_Color = CL_AQUA;
 DrawButton(&fan_speed_button_5);
 }
 break;
 }
 case 6 :
 {
 if (screen_flag == 1)
 {
 clear_fanSpeed_button_colors( );
 fan_speed_button_6.Font_Color = CL_AQUA;
 fan_speed_button_6.Pen_Color = CL_AQUA;
 }
 if (screen_flag == 2)
 {
 clear_fanSpeed_buttons( );
 fan_speed_button_6.Font_Color = CL_AQUA;
 fan_speed_button_6.Pen_Color = CL_AQUA;
 DrawButton(&fan_speed_button_6);
 }
 break;
 }
 case 7 :
 {
 if (screen_flag == 1)
 {
 clear_fanSpeed_button_colors( );
 fan_speed_button_7.Font_Color = CL_AQUA;
 fan_speed_button_7.Pen_Color = CL_AQUA;
 }
 if (screen_flag == 2)
 {
 clear_fanSpeed_buttons( );
 fan_speed_button_7.Font_Color = CL_AQUA;
 fan_speed_button_7.Pen_Color = CL_AQUA;
 DrawButton(&fan_speed_button_7);
 }
 break;
 }
 default :
 {
 break;
 }
 }
}

void FloatCut( char * buffer, uint8_t buffer_size )
{
 uint8_t count;
 uint8_t conCnt = 0;
 uint8_t conVar = 0;

 for (count = 0; count < buffer_size; count++)
 {
 if (buffer[ count ] == '.')
 {
 conVar = 1;
 }
 if (conVar == 1)
 {
 conCnt++;
 }
 if (conCnt > 3)
 {
 if ((buffer[ count ] == 'e') || (conVar == 2))
 {
 buffer[ count - (conCnt - 4) ] = buffer[ count ];
 buffer[ count ] = 0;
 conVar = 2;
 }
 else
 {
 buffer[ count ] = 0;
 }
 }
 }
}

void clear_servoNumber_button_colors( )
{
 servo_number_button_1.Pen_Color = CL_LIME;
 servo_number_button_1.Font_Color = CL_LIME;
 servo_number_button_2.Pen_Color = CL_LIME;
 servo_number_button_2.Font_Color = CL_LIME;
 servo_number_button_3.Pen_Color = CL_LIME;
 servo_number_button_3.Font_Color = CL_LIME;
 servo_number_button_4.Pen_Color = CL_LIME;
 servo_number_button_4.Font_Color = CL_LIME;
 servo_number_button_5.Pen_Color = CL_LIME;
 servo_number_button_5.Font_Color = CL_LIME;
 servo_number_button_6.Pen_Color = CL_LIME;
 servo_number_button_6.Font_Color = CL_LIME;
 servo_number_button_7.Pen_Color = CL_LIME;
 servo_number_button_7.Font_Color = CL_LIME;
 servo_number_button_8.Pen_Color = CL_LIME;
 servo_number_button_8.Font_Color = CL_LIME;
 servo_number_button_9.Pen_Color = CL_LIME;
 servo_number_button_9.Font_Color = CL_LIME;
 servo_number_button_10.Pen_Color = CL_LIME;
 servo_number_button_10.Font_Color = CL_LIME;
 servo_number_button_11.Pen_Color = CL_LIME;
 servo_number_button_11.Font_Color = CL_LIME;
 servo_number_button_12.Pen_Color = CL_LIME;
 servo_number_button_12.Font_Color = CL_LIME;
 servo_number_button_13.Pen_Color = CL_LIME;
 servo_number_button_13.Font_Color = CL_LIME;
 servo_number_button_14.Pen_Color = CL_LIME;
 servo_number_button_14.Font_Color = CL_LIME;
 servo_number_button_15.Pen_Color = CL_LIME;
 servo_number_button_15.Font_Color = CL_LIME;
 servo_number_button_16.Pen_Color = CL_LIME;
 servo_number_button_16.Font_Color = CL_LIME;
 servo_number_button_all.Pen_Color = CL_LIME;
 servo_number_button_all.Font_Color = CL_LIME;
}

void clear_servoNumber_buttons( )
{
 if (servo_number_button_1.Pen_Color != CL_LIME)
 {
 servo_number_button_1.Pen_Color = CL_LIME;
 servo_number_button_1.Font_Color = CL_LIME;
 DrawButton(&servo_number_button_1);
 }
 if (servo_number_button_2.Pen_Color != CL_LIME)
 {
 servo_number_button_2.Pen_Color = CL_LIME;
 servo_number_button_2.Font_Color = CL_LIME;
 DrawButton(&servo_number_button_2);
 }
 if (servo_number_button_3.Pen_Color != CL_LIME)
 {
 servo_number_button_3.Pen_Color = CL_LIME;
 servo_number_button_3.Font_Color = CL_LIME;
 DrawButton(&servo_number_button_3);
 }
 if (servo_number_button_4.Pen_Color != CL_LIME)
 {
 servo_number_button_4.Pen_Color = CL_LIME;
 servo_number_button_4.Font_Color = CL_LIME;
 DrawButton(&servo_number_button_4);
 }
 if (servo_number_button_5.Pen_Color != CL_LIME)
 {
 servo_number_button_5.Pen_Color = CL_LIME;
 servo_number_button_5.Font_Color = CL_LIME;
 DrawButton(&servo_number_button_5);
 }
 if (servo_number_button_6.Pen_Color != CL_LIME)
 {
 servo_number_button_6.Pen_Color = CL_LIME;
 servo_number_button_6.Font_Color = CL_LIME;
 DrawButton(&servo_number_button_6);
 }
 if (servo_number_button_7.Pen_Color != CL_LIME)
 {
 servo_number_button_7.Pen_Color = CL_LIME;
 servo_number_button_7.Font_Color = CL_LIME;
 DrawButton(&servo_number_button_7);
 }
 if (servo_number_button_8.Pen_Color != CL_LIME)
 {
 servo_number_button_8.Pen_Color = CL_LIME;
 servo_number_button_8.Font_Color = CL_LIME;
 DrawButton(&servo_number_button_8);
 }
 if (servo_number_button_9.Pen_Color != CL_LIME)
 {
 servo_number_button_9.Pen_Color = CL_LIME;
 servo_number_button_9.Font_Color = CL_LIME;
 DrawButton(&servo_number_button_9);
 }
 if (servo_number_button_10.Pen_Color != CL_LIME)
 {
 servo_number_button_10.Pen_Color = CL_LIME;
 servo_number_button_10.Font_Color = CL_LIME;
 DrawButton(&servo_number_button_10);
 }
 if (servo_number_button_11.Pen_Color != CL_LIME)
 {
 servo_number_button_11.Pen_Color = CL_LIME;
 servo_number_button_11.Font_Color = CL_LIME;
 DrawButton(&servo_number_button_11);
 }
 if (servo_number_button_12.Pen_Color != CL_LIME)
 {
 servo_number_button_12.Pen_Color = CL_LIME;
 servo_number_button_12.Font_Color = CL_LIME;
 DrawButton(&servo_number_button_12);
 }
 if (servo_number_button_13.Pen_Color != CL_LIME)
 {
 servo_number_button_13.Pen_Color = CL_LIME;
 servo_number_button_13.Font_Color = CL_LIME;
 DrawButton(&servo_number_button_13);
 }
 if (servo_number_button_14.Pen_Color != CL_LIME)
 {
 servo_number_button_14.Pen_Color = CL_LIME;
 servo_number_button_14.Font_Color = CL_LIME;
 DrawButton(&servo_number_button_14);
 }
 if (servo_number_button_15.Pen_Color != CL_LIME)
 {
 servo_number_button_15.Pen_Color = CL_LIME;
 servo_number_button_15.Font_Color = CL_LIME;
 DrawButton(&servo_number_button_15);
 }
 if (servo_number_button_16.Pen_Color != CL_LIME)
 {
 servo_number_button_16.Pen_Color = CL_LIME;
 servo_number_button_16.Font_Color = CL_LIME;
 DrawButton(&servo_number_button_16);
 }
 if (servo_number_button_all.Pen_Color != CL_LIME)
 {
 servo_number_button_all.Pen_Color = CL_LIME;
 servo_number_button_all.Font_Color = CL_LIME;
 DrawButton(&servo_number_button_all);
 }
}

void clear_fanSpeed_button_colors( )
{
 fan_speed_button_1.Pen_Color = CL_LIME;
 fan_speed_button_1.Font_Color = CL_LIME;
 fan_speed_button_2.Pen_Color = CL_LIME;
 fan_speed_button_2.Font_Color = CL_LIME;
 fan_speed_button_3.Pen_Color = CL_LIME;
 fan_speed_button_3.Font_Color = CL_LIME;
 fan_speed_button_4.Pen_Color = CL_LIME;
 fan_speed_button_4.Font_Color = CL_LIME;
 fan_speed_button_5.Pen_Color = CL_LIME;
 fan_speed_button_5.Font_Color = CL_LIME;
 fan_speed_button_6.Pen_Color = CL_LIME;
 fan_speed_button_6.Font_Color = CL_LIME;
 fan_speed_button_7.Pen_Color = CL_LIME;
 fan_speed_button_7.Font_Color = CL_LIME;
 fan_speed_button_stop.Pen_Color = CL_LIME;
 fan_speed_button_stop.Font_Color = CL_LIME;
}

void clear_fanSpeed_buttons( )
{
 if (fan_speed_button_1.Pen_Color != CL_LIME)
 {
 fan_speed_button_1.Pen_Color = CL_LIME;
 fan_speed_button_1.Font_Color = CL_LIME;
 DrawButton(&fan_speed_button_1);
 }
 if (fan_speed_button_2.Pen_Color != CL_LIME)
 {
 fan_speed_button_2.Pen_Color = CL_LIME;
 fan_speed_button_2.Font_Color = CL_LIME;
 DrawButton(&fan_speed_button_2);
 }
 if (fan_speed_button_3.Pen_Color != CL_LIME)
 {
 fan_speed_button_3.Pen_Color = CL_LIME;
 fan_speed_button_3.Font_Color = CL_LIME;
 DrawButton(&fan_speed_button_3);
 }
 if (fan_speed_button_4.Pen_Color != CL_LIME)
 {
 fan_speed_button_4.Pen_Color = CL_LIME;
 fan_speed_button_4.Font_Color = CL_LIME;
 DrawButton(&fan_speed_button_4);
 }
 if (fan_speed_button_5.Pen_Color != CL_LIME)
 {
 fan_speed_button_5.Pen_Color = CL_LIME;
 fan_speed_button_5.Font_Color = CL_LIME;
 DrawButton(&fan_speed_button_5);
 }
 if (fan_speed_button_6.Pen_Color != CL_LIME)
 {
 fan_speed_button_6.Pen_Color = CL_LIME;
 fan_speed_button_6.Font_Color = CL_LIME;
 DrawButton(&fan_speed_button_6);
 }
 if (fan_speed_button_7.Pen_Color != CL_LIME)
 {
 fan_speed_button_7.Pen_Color = CL_LIME;
 fan_speed_button_7.Font_Color = CL_LIME;
 DrawButton(&fan_speed_button_7);
 }
 if (fan_speed_button_stop.Pen_Color != CL_LIME)
 {
 fan_speed_button_stop.Pen_Color = CL_LIME;
 fan_speed_button_stop.Font_Color = CL_LIME;
 DrawButton(&fan_speed_button_stop);
 }
}
