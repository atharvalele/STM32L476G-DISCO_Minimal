/*
 * GCC + Makefile based build system for STM32L476-DISCOVERY Board
 * Based on configuration generated using STM32CubeMX
 * Supports HAL + LL Libraries
 * Copyright (C) 2020 Atharva Lele
 * 
 * Simple main.c that only initializes clocks
 */

#include "stm32l4xx_ll_conf.h"

void SystemClock_Config(void)
{
    LL_UTILS_PLLInitTypeDef sUTILS_PLLInitStruct = {
        .PLLM = LL_RCC_PLLM_DIV_2, 
        .PLLN = 20,
        .PLLR = LL_RCC_PLLR_DIV_2
    };

    LL_UTILS_ClkInitTypeDef sUTILS_ClkInitStruct = {
        LL_RCC_SYSCLK_DIV_1, 
        LL_RCC_APB1_DIV_1, 
        LL_RCC_APB2_DIV_1
    };

    LL_PLL_ConfigSystemClock_HSI(&sUTILS_PLLInitStruct, &sUTILS_ClkInitStruct);
    LL_Init1msTick(SystemCoreClock);
}

int main(void)
{
    SystemClock_Config();

    while (1) {
        asm("nop");
    }

    return 0;
}