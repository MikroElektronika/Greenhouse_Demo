/*

Use mikroE Timer Calculator to generate proper timer configuration
and timer ISR.

https://www.mikroe.com/timer-calculator

*/
#include "MikromediaGreenhouseProject_types.h"

#define __G2C_TIMER__
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