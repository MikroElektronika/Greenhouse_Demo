#include "MikromediaGreenhouseProject_types.h"

const uint32_t _G2C_TIMER_LIMIT      = 5;        // 5 ticks
const uint16_t _G2C_BUF_WARNING      = 192;      // 192 bytes activate warning
const uint8_t  _G2C_POLL_ENABLE      = 0;        // poll enabled
const uint8_t  _G2C_CALLBACK_ENABLE  = 0;        // calback disabled
const uint8_t  _G2C_BOOTLOADER       = 0;        // wait bootloader sequence - 5 sec

const uint32_t _G2C_UART_CFG[ 4 ]   = 
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