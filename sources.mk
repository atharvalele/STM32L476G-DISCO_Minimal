#################################################################
# GCC + Makefile based build system for STM32L476-DISCOVERY Board
# Based on configuration generated using STM32CubeMX
# Supports HAL + LL Libraries
# Copyright (C) 2020 Atharva Lele
#################################################################

# Put your sources and includes in this file

# C includes
C_INCLUDES = -IInc \
			 -IDrivers/STM32L4xx_HAL_Driver/Inc \
			 -IDrivers/STM32L4xx_HAL_Driver/Inc/Legacy \
			 -IDrivers/CMSIS/Device/ST/STM32L4xx/Include \
			 -IDrivers/CMSIS/Include

# ASM Sources
ASM_SOURCES = startup_stm32l476xx.s

# C Sources
C_SOURCES = Src/main.c \
			Src/system_stm32l4xx.c \
			Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_adc.c \
			Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_comp.c \
			Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_crc.c \
			Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_crs.c \
			Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_dac.c \
			Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_dma2d.c \
			Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_dma.c \
			Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_exti.c \
			Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_fmc.c \
			Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_gpio.c \
			Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_i2c.c \
			Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_lptim.c \
			Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_lpuart.c \
			Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_opamp.c \
			Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_pka.c \
			Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_pwr.c \
			Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_rcc.c \
			Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_rng.c \
			Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_rtc.c \
			Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_sdmmc.c \
			Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_spi.c \
			Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_swpmi.c \
			Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_tim.c \
			Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_usart.c \
			Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_usb.c \
			Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_utils.c
			 