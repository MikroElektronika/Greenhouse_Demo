/*
Example for Charger_9 Click

    Date          : Mar 2019.
    Author        : Aleksandar Paunovic

Test configuration STM32 :

    MCU              : STM32F746ZG
    Dev. Board       : Mikromedia_7_for_STM32F7_ARM
    Oscillator:      : 200000000 Hz
    SW:              : MikroC PRO for ARM
    ARM Compiler ver : v6.1.0.0

---

Description :

The application is composed of three sections :

- System Initialization - Initializes GIPO and communication modules for all click boards
- Application Initialization - Starts Mikromedia Touch Panel, initializes all click board drivers, initializes all click boards and variables, 
                               draws Screen 1 and logs initial data values to Mikromedia
- Application Task - Runs G2C core state machine, checks Mikromedia touch panel, checks if servo number, servo position or fan speed changed, 
                     logs latest data to Mikromedia, collects data from sensors and publishes data to cloud

Additional Functions :

- void g2c_default_handler( ) - g2c default handler
- void parse_data( ) - parses packet received from cloud
- void g2c_packCmd( ) - packs and sendds data
- void drivers_init( ) - initializes all click drivers
- void clicks_init( ) - initializes all clicks
- void collect_data( ) - collects data from all sensors
- void publish_data( ) - sends collected data to cloud
- void log_data( ) - logs data to mikromedia
- void log_last( ) - logs last data to mikromedia
- void servo_position( ) - sets servo position
- void servo_position_log( ) - logs servo position to mikromedia
- void fan_speed_log( ) - logs fan speed to mikromedia
- void FloatCut(  ) - rounds float values to 2 decimals
- void clear_servoNumber_button_colors( ) - resets servo number colors
- void clear_servoNumber_buttons( ) - resets servo number buttons
- void clear_fanSpeed_button_colors( ) - resets fan speed button colors
- void clear_fanSpeed_buttons( ) - resets fan speed buttons

*/


#include "MikromediaGreenhouseProject_objects.h"

#include "MikromediaGreenhouseProject_types.h"
#include "MikromediaGreenhouseProject_config.h"
#include "MikromediaGreenhouseProject_timer.h"

/** ACTUATOR REFERENCES */
static char g2c_actuarotRef_1[ 30 ] = "SERVO_POS";
static char g2c_actuarotRef_2[ 30 ] = "FAN_SPEED";
static char g2c_actuarotRef_3[ 30 ] = "SERVO_NUM";

/** SENSOR REFERENCES */
static char g2c_sensorRef_1[ 30 ] = "TEMPHUM6_T";
static char g2c_sensorRef_2[ 30 ] = "TEMPHUM6_H";
static char g2c_sensorRef_3[ 30 ] = "UV3_UV";
static char g2c_sensorRef_4[ 30 ] = "UV3_UVI";
static char g2c_sensorRef_5[ 30 ] = "MIKROMEDIA";

/** NETWORK AND CLOUD */
static char g2c_networkName     [ 20 ]  = "Network_Name";
static char g2c_networkPassword [ 20 ]  = "Network_Password";
static char g2c_devKey          [ 50 ]  = "Device_Key";
static char g2c_devPass         [ 100 ] = "Device_Password";

/** G2C COMMANDS */
static char _ATE    [ 5 ] = "ATE1";
static char _AT     [ 3 ] = "AT";
static char _AT_CEN [ 9 ] = "AT+CEN=1";
static char _AT_NWCR[ 8 ] = "AT+NWCR";
static char _AT_NWC [ 9 ] = "AT+NWC=1";
static char _AT_BRCR[ 8 ] = "AT+BRCR";
static char _AT_BRC [ 9 ] = "AT+BRC=1";
static char _AT_DSET[ 8 ] = "AT+DSET";
static char _AT_PUB [ 7 ] = "AT+PUB";

/** GLOBAL VARIABLES */
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

/** G2C VARIABLES */

/** TEMPHUM6 VARIABLES */
float temphum6_temperature;
float last_temperature;
float temphum6_humidity;
float last_humidity;

/** UV3 VARIABLES */
uint16_t uv3_data;
uint16_t last_uv;
uint8_t uv3_riskLvl;
uint8_t last_riskLvl;

/** FAN3 VARIABLES */

/** SERVO VARIABLES */
uint16_t servo_current;

/** FUNCTION DECLARATIONS */
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

/** UART INTERRUPT ROUTINE */
void G2C_Int_Proc( ) iv IVT_INT_USART2 ics ICS_AUTO
{
    if( RXNE_USART2_ISR_bit )
    {
        g2c_putc( UART2_Read( ) );
    }
}

void systemInit( )
{
/** G2C GPIO INIT */
    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_INPUT  );
    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_RST_PIN, _GPIO_OUTPUT );
    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN,  _GPIO_OUTPUT );

/** TEMPHUM6 GPIO INIT */

/** UV3 GPIO INIT */
    mikrobus_gpioInit( _MIKROBUS3, _MIKROBUS_INT_PIN, _GPIO_INPUT );

/** FAN3 GPIO INIT */

/** SERVO GPIO INIT */
    mikrobus_gpioInit( _MIKROBUS5, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );

/** G2C UART INIT */
    mikrobus_uartInit( _MIKROBUS1, &_G2C_UART_CFG[0] );
    Delay_ms(300);

/** TEMPHUM6 I2C INIT */
    mikrobus_i2cInit( _MIKROBUS2, &_TEMPHUM6_I2C_CFG[0] );
    Delay_ms(500);

/** UV3 I2C INIT */
/** mikrobus_i2cInit( _MIKROBUS3, &_UV3_I2C_CFG[0] ); */
/** Delay_ms(500); */

/** FAN3 I2C INIT */
/** mikrobus_i2cInit( _MIKROBUS4, &_FAN3_I2C_CFG[0] ); */
/** Delay_ms(500); */

/** SERVO I2C INIT */
/** mikrobus_i2cInit( _MIKROBUS5, &_SERVO_I2C_CFG[0] ); */
/** Delay_ms(500); */

/** DEBUG LOG INIT */
/** mikrobus_logInit( _LOG_USBUART, 57600 ); */
/** Delay_ms(500); */
}

void applicationInit( )
{
/** MIKROMEDIA START TOUCH PANEL */
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
/** RUN G2C CORE STATE MACHINE */
    g2c_process( );

/** CHECK MIKROMEDIA TOUCH */
    I2C_Set_Active( &I2C1_Start, &I2C1_Read, &I2C1_Write );
    Delay_ms(1);
    Check_TP( );
    I2C_Set_Active(&I2C2_Start, &I2C2_Read, &I2C2_Write);
    Delay_ms(1);

/** PARSE RECEIVED MESSAGE FROM CLOUD */
    if (message_flag == 1)
    {
        parse_data( );
        message_flag = 0;
    }

/** SET NEW SERVO NUMBER */
    if (servo_num_change_flag == 1)
    {
        servo_position_log( );
        g2c_packCmd( &_AT_DSET[0], &g2c_sensorRef_5[0], "Servo number changed" );
        g2c_cmdSingle( &_AT_PUB[0] );
        servo_num_change_flag = 0;
    }

/** SET NEW SERVO POSITION */
    if (servo_pos_change_flag == 1)
    {
        servo_position( );
        servo_position_log( );
        g2c_packCmd( &_AT_DSET[0], &g2c_sensorRef_5[0], "Servo position changed" );
        g2c_cmdSingle( &_AT_PUB[0] );
        servo_pos_change_flag = 0;
    }

/** SET NEW FAN SPEED */
    if (fan_speed_change_flag == 1)
    {
        fan3_setSpeed( fan_speed );
        fan_speed_log( );
        g2c_packCmd( &_AT_DSET[0], &g2c_sensorRef_5[0], "Fan speed changed" );
        g2c_cmdSingle( &_AT_PUB[0] );
        fan_speed_change_flag = 0;
    }

/** LOG DATA TO MIKROMEDIA */
    if (screen_flag == 1)
    {
        I2C_Set_Active( &I2C1_Start, &I2C1_Read, &I2C1_Write );
        Delay_ms(1);
        log_data( );
        I2C_Set_Active(&I2C2_Start, &I2C2_Read, &I2C2_Write);
        Delay_ms(1);
    }

/** COLLECT AND PUBLISH SENSOR DATA */
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

/** FUNCTION DEFINITIONS */

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
/** G2C UART DRIVER INIT */
    g2c_uartDriverInit( (T_G2C_P)&_MIKROBUS1_GPIO, (T_G2C_P)&_MIKROBUS1_UART );
    Delay_ms(300);
/** G2C UART INTERRUPT ENABLE */
    RXNEIE_USART2_CR1_bit = 1;
    NVIC_IntEnable( IVT_INT_USART2 );
/** G2C TIMER INITIALIZE */
    g2c_configTimer( );
    Delay_ms(100);

/** TEMPHUM6 I2C DRIVER INIT */
    temphum6_i2cDriverInit( (T_TEMPHUM6_P)&_MIKROBUS2_GPIO, (T_TEMPHUM6_P)&_MIKROBUS2_I2C, 0x43 );
    Delay_ms(300);

/** UV3 I2C DRIVER INIT */
    uv3_i2cDriverInit( (T_UV3_P)&_MIKROBUS3_GPIO, (T_UV3_P)&_MIKROBUS3_I2C, 0x38 );
    Delay_ms(300);

/** FAN3 I2C DRIVER INIT */
    fan3_i2cDriverInit( (T_FAN3_P)&_MIKROBUS4_GPIO, (T_FAN3_P)&_MIKROBUS4_I2C, 0x20 );
    Delay_ms(300);

/** SERVO I2C DRIVER INIT */
    servo_i2cDriverInit( (T_SERVO_P)&_MIKROBUS5_GPIO, (T_SERVO_P)&_MIKROBUS5_I2C, 0x40, 0x14 );
    Delay_ms(300);
}

void clicks_init( )
{
/** G2C CLICK INIT */
    g2c_coreInit( g2c_default_handler, 5000 );
    Delay_ms(300);
    g2c_modulePower( false );
    Delay_ms(300);
    g2c_modulePower( true );
    Delay_ms(7000);
/** g2c_cmdSingle( &_ATE[0] ); */
    g2c_cmdSingle( &_AT[0] );
    g2c_cmdSingle( &_AT[0] );
    g2c_cmdSingle( &_AT[0] );
    g2c_cmdSingle( &_AT_CEN[0] );
    g2c_packCmd  ( &_AT_NWCR[0], &g2c_networkName[0], &g2c_networkPassword[0]);
    g2c_cmdSingle( &_AT_NWC[0] );
    g2c_packCmd  ( &_AT_BRCR[0], &g2c_devKey[0], &g2c_devPass[0]);
    g2c_cmdSingle( &_AT_BRC[0] );
    Delay_ms(7000);

/** TEMPHUM6 CLICK INIT */
    temphum6_reset( );
    Delay_ms(300);

/** UV3 CLICK INIT */
    uv3_enableSensor( );
    Delay_ms(100);
    uv3_setIntegrationTime( _UV3_CMD_IT_4T );
    Delay_ms(100);

/** FAN3 CLICK INIT */
    fan3_setSpeed( fan_speed );
    Delay_ms(100);

/** SERVO CLICK INIT */
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
/** TEMPHUM6 TEMPERATURE */
    temphum6_temperature = temphum6_readTemperature( _TEMPHUM6_TEMP_IN_CELSIUS );

/** TEMPHUM6 HUMIDITY */
    temphum6_humidity = temphum6_readRelativeHuminidy( );

/** UV3 UV LIGHT DATA */
    uv3_data = uv3_readMeasurements( );

/** UV3 UV INDEX */
    uv3_riskLvl = uv3_riskLevel( uv3_data );
}

void publish_data( )
{
/** TEMPHUM6 TEMPERATURE */
    FloatToStr( temphum6_temperature, demo_buffer );
    g2c_packCmd( &_AT_DSET[0], &g2c_sensorRef_1[0], &demo_buffer[0] );

/** TEMPHUM6 HUMIDITY */
    FloatToStr( temphum6_humidity, demo_buffer );
    g2c_packCmd( &_AT_DSET[0], &g2c_sensorRef_2[0], &demo_buffer[0] );

/** UV3 UV LIGHT DATA */
    WordToStrWithZeros( uv3_data, demo_buffer );
    g2c_packCmd( &_AT_DSET[0], &g2c_sensorRef_3[0], &demo_buffer[0] );

    memset( demo_buffer, 0, 50 );

/** UV3 UV INDEX */
    if ( uv3_riskLvl == _UV3_RAD_LOW       )  strcpy( &demo_buffer[0], "Low"       );
    if ( uv3_riskLvl == _UV3_RAD_MODERATE  )  strcpy( &demo_buffer[0], "Moderate"  );
    if ( uv3_riskLvl == _UV3_RAD_HIGH      )  strcpy( &demo_buffer[0], "High"      );
    if ( uv3_riskLvl == _UV3_RAD_VERY_HIGH )  strcpy( &demo_buffer[0], "Very High" );
    if ( uv3_riskLvl == _UV3_RAD_EXTREME   )  strcpy( &demo_buffer[0], "Extreme"   );
    g2c_packCmd( &_AT_DSET[0], &g2c_sensorRef_4[0], &demo_buffer[0]);

/** PUBLISH DATA */
    g2c_cmdSingle( &_AT_PUB[0] );
}

void log_data( )
{
    if (last_temperature != temphum6_temperature)
    {
/**     TEMPHUM6 TEMPERATURE CLEAN */
        cleanLabel(1);

/**     TEMPHUM6 TEMPERATURE LOG/UPDATE */
        FloatToStr( temphum6_temperature, aux_buffer );
        FloatCut( aux_buffer, 50 );
        Ltrim( aux_buffer );
        updateLabel( aux_buffer, 500, 20 );

        last_temperature = temphum6_temperature;
    }

    if (last_humidity != temphum6_humidity)
    {
/**     TEMPHUM6 HUMIDITY CLEAN */
        cleanLabel(2);

/**     TEMPHUM6 HUMIDITY LOG/UPDATE */
        FloatToStr( temphum6_humidity, aux_buffer );
        FloatCut( aux_buffer, 50 );
        Ltrim( aux_buffer );
        updateLabel( aux_buffer, 500, 80 );

        last_humidity = temphum6_humidity;
    }

    if (last_uv != uv3_data)
    {
/**     UV3 UV LIGHT DATA CLEAN */
        cleanLabel(3);

/**     UV3 UV LIGHT DATA LOG/UPDATE */
        WordToStr( uv3_data, aux_buffer );
        Ltrim( aux_buffer );
        updateLabel( aux_buffer, 500, 140 );

        last_uv = uv3_data;
    }

    if (last_riskLvl != uv3_riskLvl)
    {
/**     UV3 UV INDEX CLEAN */
        cleanLabel(4);

        memset( aux_buffer, 0, 50 );

/**     UV3 UV INDEX LOG/UPDATE */
        if ( uv3_riskLvl == _UV3_RAD_LOW       )  strcpy( &aux_buffer[0], "Low"       );
        if ( uv3_riskLvl == _UV3_RAD_MODERATE  )  strcpy( &aux_buffer[0], "Moderate"  );
        if ( uv3_riskLvl == _UV3_RAD_HIGH      )  strcpy( &aux_buffer[0], "High"      );
        if ( uv3_riskLvl == _UV3_RAD_VERY_HIGH )  strcpy( &aux_buffer[0], "Very High" );
        if ( uv3_riskLvl == _UV3_RAD_EXTREME   )  strcpy( &aux_buffer[0], "Extreme"   );
        updateLabel( aux_buffer, 500, 200 );

        last_riskLvl = uv3_riskLvl;
    }
}

void log_last( )
{
/** TEMPHUM6 TEMPERATURE CLEAN */
    cleanLabel(1);

/** TEMPHUM6 HUMIDITY CLEAN */
    cleanLabel(2);

/** UV3 UV LIGHT DATA CLEAN */
    cleanLabel(3);

/** UV3 UV INDEX CLEAN */
    cleanLabel(4);

/** TEMPHUM6 TEMPERATURE LOG/UPDATE */
    FloatToStr( temphum6_temperature, aux_buffer );
    FloatCut( aux_buffer, 50 );
    Ltrim( aux_buffer );
    updateLabel( aux_buffer, 500, 20 );

/** TEMPHUM6 HUMIDITY LOG/UPDATE */
    FloatToStr( temphum6_humidity, aux_buffer );
    FloatCut( aux_buffer, 50 );
    Ltrim( aux_buffer );
    updateLabel( aux_buffer, 500, 80 );

/** UV3 UV LIGHT DATA LOG/UPDATE */
    WordToStr( uv3_data, aux_buffer );
    Ltrim( aux_buffer );
    updateLabel( aux_buffer, 500, 140 );

    memset( aux_buffer, 0, 50 );

/**  UV3 UV INDEX LOG/UPDATE */
    if ( uv3_riskLvl == _UV3_RAD_LOW       )  strcpy( &aux_buffer[0], "Low"       );
    if ( uv3_riskLvl == _UV3_RAD_MODERATE  )  strcpy( &aux_buffer[0], "Moderate"  );
    if ( uv3_riskLvl == _UV3_RAD_HIGH      )  strcpy( &aux_buffer[0], "High"      );
    if ( uv3_riskLvl == _UV3_RAD_VERY_HIGH )  strcpy( &aux_buffer[0], "Very High" );
    if ( uv3_riskLvl == _UV3_RAD_EXTREME   )  strcpy( &aux_buffer[0], "Extreme"   );
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
                servo_number_button_all.Pen_Color  = CL_AQUA;
                ProgressBar1.Position = servo_pos_all;
            }
            if (screen_flag == 2)
            {
                clear_servoNumber_buttons( );
                servo_number_button_all.Font_Color = CL_AQUA;
                servo_number_button_all.Pen_Color  = CL_AQUA;
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
                servo_number_button_1.Pen_Color  = CL_AQUA;
                ProgressBar1.Position = servo_pos_1;
            }
            if (screen_flag == 2)
            {
                clear_servoNumber_buttons( );
                servo_number_button_1.Font_Color = CL_AQUA;
                servo_number_button_1.Pen_Color  = CL_AQUA;
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
                servo_number_button_2.Pen_Color  = CL_AQUA;
                ProgressBar1.Position = servo_pos_2;
            }
            if (screen_flag == 2)
            {
                clear_servoNumber_buttons( );
                servo_number_button_2.Font_Color = CL_AQUA;
                servo_number_button_2.Pen_Color  = CL_AQUA;
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
                servo_number_button_3.Pen_Color  = CL_AQUA;
                ProgressBar1.Position = servo_pos_3;
            }
            if (screen_flag == 2)
            {
                clear_servoNumber_buttons( );
                servo_number_button_3.Font_Color = CL_AQUA;
                servo_number_button_3.Pen_Color  = CL_AQUA;
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
                servo_number_button_4.Pen_Color  = CL_AQUA;
                ProgressBar1.Position = servo_pos_4;
            }
            if (screen_flag == 2)
            {
                clear_servoNumber_buttons( );
                servo_number_button_4.Font_Color = CL_AQUA;
                servo_number_button_4.Pen_Color  = CL_AQUA;
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
                servo_number_button_5.Pen_Color  = CL_AQUA;
                ProgressBar1.Position = servo_pos_5;
            }
            if (screen_flag == 2)
            {
                clear_servoNumber_buttons( );
                servo_number_button_5.Font_Color = CL_AQUA;
                servo_number_button_5.Pen_Color  = CL_AQUA;
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
                servo_number_button_6.Pen_Color  = CL_AQUA;
                ProgressBar1.Position = servo_pos_6;
            }
            if (screen_flag == 2)
            {
                clear_servoNumber_buttons( );
                servo_number_button_6.Font_Color = CL_AQUA;
                servo_number_button_6.Pen_Color  = CL_AQUA;
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
                servo_number_button_7.Pen_Color  = CL_AQUA;
                ProgressBar1.Position = servo_pos_7;
            }
            if (screen_flag == 2)
            {
                clear_servoNumber_buttons( );
                servo_number_button_7.Font_Color = CL_AQUA;
                servo_number_button_7.Pen_Color  = CL_AQUA;
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
                servo_number_button_8.Pen_Color  = CL_AQUA;
                ProgressBar1.Position = servo_pos_8;
            }
            if (screen_flag == 2)
            {
                clear_servoNumber_buttons( );
                servo_number_button_8.Font_Color = CL_AQUA;
                servo_number_button_8.Pen_Color  = CL_AQUA;
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
                servo_number_button_9.Pen_Color  = CL_AQUA;
                ProgressBar1.Position = servo_pos_9;
            }
            if (screen_flag == 2)
            {
                clear_servoNumber_buttons( );
                servo_number_button_9.Font_Color = CL_AQUA;
                servo_number_button_9.Pen_Color  = CL_AQUA;
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
                servo_number_button_10.Pen_Color  = CL_AQUA;
                ProgressBar1.Position = servo_pos_10;
            }
            if (screen_flag == 2)
            {
                clear_servoNumber_buttons( );
                servo_number_button_10.Font_Color = CL_AQUA;
                servo_number_button_10.Pen_Color  = CL_AQUA;
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
                servo_number_button_11.Pen_Color  = CL_AQUA;
                ProgressBar1.Position = servo_pos_11;
            }
            if (screen_flag == 2)
            {
                clear_servoNumber_buttons( );
                servo_number_button_11.Font_Color = CL_AQUA;
                servo_number_button_11.Pen_Color  = CL_AQUA;
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
                servo_number_button_12.Pen_Color  = CL_AQUA;
                ProgressBar1.Position = servo_pos_12;
            }
            if (screen_flag == 2)
            {
                clear_servoNumber_buttons( );
                servo_number_button_12.Font_Color = CL_AQUA;
                servo_number_button_12.Pen_Color  = CL_AQUA;
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
                servo_number_button_13.Pen_Color  = CL_AQUA;
                ProgressBar1.Position = servo_pos_13;
            }
            if (screen_flag == 2)
            {
                clear_servoNumber_buttons( );
                servo_number_button_13.Font_Color = CL_AQUA;
                servo_number_button_13.Pen_Color  = CL_AQUA;
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
                servo_number_button_14.Pen_Color  = CL_AQUA;
                ProgressBar1.Position = servo_pos_14;
            }
            if (screen_flag == 2)
            {
                clear_servoNumber_buttons( );
                servo_number_button_14.Font_Color = CL_AQUA;
                servo_number_button_14.Pen_Color  = CL_AQUA;
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
                servo_number_button_15.Pen_Color  = CL_AQUA;
                ProgressBar1.Position = servo_pos_15;
            }
            if (screen_flag == 2)
            {
                clear_servoNumber_buttons( );
                servo_number_button_15.Font_Color = CL_AQUA;
                servo_number_button_15.Pen_Color  = CL_AQUA;
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
                servo_number_button_16.Pen_Color  = CL_AQUA;
                ProgressBar1.Position = servo_pos_16;
            }
            if (screen_flag == 2)
            {
                clear_servoNumber_buttons( );
                servo_number_button_16.Font_Color = CL_AQUA;
                servo_number_button_16.Pen_Color  = CL_AQUA;
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
                fan_speed_button_stop.Pen_Color  = CL_AQUA;
            }
            if (screen_flag == 2)
            {
                clear_fanSpeed_buttons( );
                fan_speed_button_stop.Font_Color = CL_AQUA;
                fan_speed_button_stop.Pen_Color  = CL_AQUA;
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
                fan_speed_button_1.Pen_Color  = CL_AQUA;
            }
            if (screen_flag == 2)
            {
                clear_fanSpeed_buttons( );
                fan_speed_button_1.Font_Color = CL_AQUA;
                fan_speed_button_1.Pen_Color  = CL_AQUA;
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
                fan_speed_button_2.Pen_Color  = CL_AQUA;
            }
            if (screen_flag == 2)
            {
                clear_fanSpeed_buttons( );
                fan_speed_button_2.Font_Color = CL_AQUA;
                fan_speed_button_2.Pen_Color  = CL_AQUA;
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
                fan_speed_button_3.Pen_Color  = CL_AQUA;
            }
            if (screen_flag == 2)
            {
                clear_fanSpeed_buttons( );
                fan_speed_button_3.Font_Color = CL_AQUA;
                fan_speed_button_3.Pen_Color  = CL_AQUA;
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
                fan_speed_button_4.Pen_Color  = CL_AQUA;
            }
            if (screen_flag == 2)
            {
                clear_fanSpeed_buttons( );
                fan_speed_button_4.Font_Color = CL_AQUA;
                fan_speed_button_4.Pen_Color  = CL_AQUA;
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
                fan_speed_button_5.Pen_Color  = CL_AQUA;
            }
            if (screen_flag == 2)
            {
                clear_fanSpeed_buttons( );
                fan_speed_button_5.Font_Color = CL_AQUA;
                fan_speed_button_5.Pen_Color  = CL_AQUA;
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
                fan_speed_button_6.Pen_Color  = CL_AQUA;
            }
            if (screen_flag == 2)
            {
                clear_fanSpeed_buttons( );
                fan_speed_button_6.Font_Color = CL_AQUA;
                fan_speed_button_6.Pen_Color  = CL_AQUA;
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
                fan_speed_button_7.Pen_Color  = CL_AQUA;
            }
            if (screen_flag == 2)
            {
                clear_fanSpeed_buttons( );
                fan_speed_button_7.Font_Color = CL_AQUA;
                fan_speed_button_7.Pen_Color  = CL_AQUA;
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
    servo_number_button_1.Pen_Color    = CL_LIME;
    servo_number_button_1.Font_Color   = CL_LIME;
    servo_number_button_2.Pen_Color    = CL_LIME;
    servo_number_button_2.Font_Color   = CL_LIME;
    servo_number_button_3.Pen_Color    = CL_LIME;
    servo_number_button_3.Font_Color   = CL_LIME;
    servo_number_button_4.Pen_Color    = CL_LIME;
    servo_number_button_4.Font_Color   = CL_LIME;
    servo_number_button_5.Pen_Color    = CL_LIME;
    servo_number_button_5.Font_Color   = CL_LIME;
    servo_number_button_6.Pen_Color    = CL_LIME;
    servo_number_button_6.Font_Color   = CL_LIME;
    servo_number_button_7.Pen_Color    = CL_LIME;
    servo_number_button_7.Font_Color   = CL_LIME;
    servo_number_button_8.Pen_Color    = CL_LIME;
    servo_number_button_8.Font_Color   = CL_LIME;
    servo_number_button_9.Pen_Color    = CL_LIME;
    servo_number_button_9.Font_Color   = CL_LIME;
    servo_number_button_10.Pen_Color   = CL_LIME;
    servo_number_button_10.Font_Color  = CL_LIME;
    servo_number_button_11.Pen_Color   = CL_LIME;
    servo_number_button_11.Font_Color  = CL_LIME;
    servo_number_button_12.Pen_Color   = CL_LIME;
    servo_number_button_12.Font_Color  = CL_LIME;
    servo_number_button_13.Pen_Color   = CL_LIME;
    servo_number_button_13.Font_Color  = CL_LIME;
    servo_number_button_14.Pen_Color   = CL_LIME;
    servo_number_button_14.Font_Color  = CL_LIME;
    servo_number_button_15.Pen_Color   = CL_LIME;
    servo_number_button_15.Font_Color  = CL_LIME;
    servo_number_button_16.Pen_Color   = CL_LIME;
    servo_number_button_16.Font_Color  = CL_LIME;
    servo_number_button_all.Pen_Color  = CL_LIME;
    servo_number_button_all.Font_Color = CL_LIME;
}

void clear_servoNumber_buttons( )
{
    if (servo_number_button_1.Pen_Color != CL_LIME)
    {
        servo_number_button_1.Pen_Color  = CL_LIME;
        servo_number_button_1.Font_Color = CL_LIME;
        DrawButton(&servo_number_button_1);
    }
    if (servo_number_button_2.Pen_Color != CL_LIME)
    {
        servo_number_button_2.Pen_Color  = CL_LIME;
        servo_number_button_2.Font_Color = CL_LIME;
        DrawButton(&servo_number_button_2);
    }
    if (servo_number_button_3.Pen_Color != CL_LIME)
    {
        servo_number_button_3.Pen_Color  = CL_LIME;
        servo_number_button_3.Font_Color = CL_LIME;
        DrawButton(&servo_number_button_3);
    }
    if (servo_number_button_4.Pen_Color != CL_LIME)
    {
        servo_number_button_4.Pen_Color  = CL_LIME;
        servo_number_button_4.Font_Color = CL_LIME;
        DrawButton(&servo_number_button_4);
    }
    if (servo_number_button_5.Pen_Color != CL_LIME)
    {
        servo_number_button_5.Pen_Color  = CL_LIME;
        servo_number_button_5.Font_Color = CL_LIME;
        DrawButton(&servo_number_button_5);
    }
    if (servo_number_button_6.Pen_Color != CL_LIME)
    {
        servo_number_button_6.Pen_Color  = CL_LIME;
        servo_number_button_6.Font_Color = CL_LIME;
        DrawButton(&servo_number_button_6);
    }
    if (servo_number_button_7.Pen_Color != CL_LIME)
    {
        servo_number_button_7.Pen_Color  = CL_LIME;
        servo_number_button_7.Font_Color = CL_LIME;
        DrawButton(&servo_number_button_7);
    }
    if (servo_number_button_8.Pen_Color != CL_LIME)
    {
        servo_number_button_8.Pen_Color  = CL_LIME;
        servo_number_button_8.Font_Color = CL_LIME;
        DrawButton(&servo_number_button_8);
    }
    if (servo_number_button_9.Pen_Color != CL_LIME)
    {
        servo_number_button_9.Pen_Color  = CL_LIME;
        servo_number_button_9.Font_Color = CL_LIME;
        DrawButton(&servo_number_button_9);
    }
    if (servo_number_button_10.Pen_Color != CL_LIME)
    {
        servo_number_button_10.Pen_Color  = CL_LIME;
        servo_number_button_10.Font_Color = CL_LIME;
        DrawButton(&servo_number_button_10);
    }
    if (servo_number_button_11.Pen_Color != CL_LIME)
    {
        servo_number_button_11.Pen_Color  = CL_LIME;
        servo_number_button_11.Font_Color = CL_LIME;
        DrawButton(&servo_number_button_11);
    }
    if (servo_number_button_12.Pen_Color != CL_LIME)
    {
        servo_number_button_12.Pen_Color  = CL_LIME;
        servo_number_button_12.Font_Color = CL_LIME;
        DrawButton(&servo_number_button_12);
    }
    if (servo_number_button_13.Pen_Color != CL_LIME)
    {
        servo_number_button_13.Pen_Color  = CL_LIME;
        servo_number_button_13.Font_Color = CL_LIME;
        DrawButton(&servo_number_button_13);
    }
    if (servo_number_button_14.Pen_Color != CL_LIME)
    {
        servo_number_button_14.Pen_Color  = CL_LIME;
        servo_number_button_14.Font_Color = CL_LIME;
        DrawButton(&servo_number_button_14);
    }
    if (servo_number_button_15.Pen_Color != CL_LIME)
    {
        servo_number_button_15.Pen_Color  = CL_LIME;
        servo_number_button_15.Font_Color = CL_LIME;
        DrawButton(&servo_number_button_15);
    }
    if (servo_number_button_16.Pen_Color != CL_LIME)
    {
        servo_number_button_16.Pen_Color  = CL_LIME;
        servo_number_button_16.Font_Color = CL_LIME;
        DrawButton(&servo_number_button_16);
    }
    if (servo_number_button_all.Pen_Color != CL_LIME)
    {
        servo_number_button_all.Pen_Color  = CL_LIME;
        servo_number_button_all.Font_Color = CL_LIME;
        DrawButton(&servo_number_button_all);
    }
}

void clear_fanSpeed_button_colors( )
{
    fan_speed_button_1.Pen_Color     = CL_LIME;
    fan_speed_button_1.Font_Color    = CL_LIME;
    fan_speed_button_2.Pen_Color     = CL_LIME;
    fan_speed_button_2.Font_Color    = CL_LIME;
    fan_speed_button_3.Pen_Color     = CL_LIME;
    fan_speed_button_3.Font_Color    = CL_LIME;
    fan_speed_button_4.Pen_Color     = CL_LIME;
    fan_speed_button_4.Font_Color    = CL_LIME;
    fan_speed_button_5.Pen_Color     = CL_LIME;
    fan_speed_button_5.Font_Color    = CL_LIME;
    fan_speed_button_6.Pen_Color     = CL_LIME;
    fan_speed_button_6.Font_Color    = CL_LIME;
    fan_speed_button_7.Pen_Color     = CL_LIME;
    fan_speed_button_7.Font_Color    = CL_LIME;
    fan_speed_button_stop.Pen_Color  = CL_LIME;
    fan_speed_button_stop.Font_Color = CL_LIME;
}

void clear_fanSpeed_buttons( )
{
    if (fan_speed_button_1.Pen_Color != CL_LIME)
    {
        fan_speed_button_1.Pen_Color  = CL_LIME;
        fan_speed_button_1.Font_Color = CL_LIME;
        DrawButton(&fan_speed_button_1);
    }
    if (fan_speed_button_2.Pen_Color != CL_LIME)
    {
        fan_speed_button_2.Pen_Color  = CL_LIME;
        fan_speed_button_2.Font_Color = CL_LIME;
        DrawButton(&fan_speed_button_2);
    }
    if (fan_speed_button_3.Pen_Color != CL_LIME)
    {
        fan_speed_button_3.Pen_Color  = CL_LIME;
        fan_speed_button_3.Font_Color = CL_LIME;
        DrawButton(&fan_speed_button_3);
    }
    if (fan_speed_button_4.Pen_Color != CL_LIME)
    {
        fan_speed_button_4.Pen_Color  = CL_LIME;
        fan_speed_button_4.Font_Color = CL_LIME;
        DrawButton(&fan_speed_button_4);
    }
    if (fan_speed_button_5.Pen_Color != CL_LIME)
    {
        fan_speed_button_5.Pen_Color  = CL_LIME;
        fan_speed_button_5.Font_Color = CL_LIME;
        DrawButton(&fan_speed_button_5);
    }
    if (fan_speed_button_6.Pen_Color != CL_LIME)
    {
        fan_speed_button_6.Pen_Color  = CL_LIME;
        fan_speed_button_6.Font_Color = CL_LIME;
        DrawButton(&fan_speed_button_6);
    }
    if (fan_speed_button_7.Pen_Color != CL_LIME)
    {
        fan_speed_button_7.Pen_Color  = CL_LIME;
        fan_speed_button_7.Font_Color = CL_LIME;
        DrawButton(&fan_speed_button_7);
    }
    if (fan_speed_button_stop.Pen_Color != CL_LIME)
    {
        fan_speed_button_stop.Pen_Color  = CL_LIME;
        fan_speed_button_stop.Font_Color = CL_LIME;
        DrawButton(&fan_speed_button_stop);
    }
}