#################################################################
# GCC + Makefile based build system for STM32L476-DISCOVERY Board
# Based on configuration generated using STM32CubeMX
# Supports HAL + LL Libraries
# Copyright (C) 2020 Atharva Lele
#################################################################

#######################################
# makefile includes
#######################################
include sources.mk

# target
TARGET = project_name

# debug? default yes
DEBUG = 1

# Build in a separate directory to keep cleanup easy
BUILD_DIR = build

# gcc binaries
PREFIX = arm-none-eabi-
CC = $(PREFIX)gcc
AS = $(PREFIX)gcc -x assembler-with-cpp
CP = $(PREFIX)objcopy
SZ = $(PREFIX)size
HEX = $(CP) -O ihex
BIN = $(CP) -O binary -S

#######################################
# Microcontroller options
#######################################
CPU = -mcpu=cortex-m4
FPU = -mfpu=fpv4-sp-d16
FLOAT_ABI = -mfloat-abi=hard
# overall config therefore is
MCU = $(CPU) -mthumb $(FPU) $(FLOAT-ABI)

#######################################
# GCC Setup
#######################################
# Assembly defines
AS_DEFS = 

# C Defines
C_DEFS = -DSTM32L476xx \
		 -DUSE_FULL_LL_DRIVER

# compile GCC flags
ASFLAGS = $(MCU) $(AS_DEFS) $(AS_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections
CFLAGS = $(MCU) $(C_DEFS) $(C_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections

# Debug and optimization
ifeq ($(DEBUG), 1)
# enable debug, optimize for debugging
CFLAGS += -g -gdwarf-2 -Og
else
# optimize for code size
CFLAGS += -Os
endif

#######################################
# Linker Setup
#######################################
LDSCRIPT = STM32L476VGTx_FLASH.ld

# libraries
LIBS = -lc -lm -lnosys 
LIBDIR = 
LDFLAGS = $(MCU) -specs=nano.specs -T$(LDSCRIPT) $(LIBDIR) $(LIBS) \
		  -Wl,-Map=$(BUILD_DIR)/$(TARGET).map,--cref -Wl,--gc-sections

#######################################
# Build
#######################################
# list of objects
OBJECTS = $(addprefix $(BUILD_DIR)/,$(notdir $(C_SOURCES:.c=.o)))
vpath %.c $(sort $(dir $(C_SOURCES)))
# list of ASM program objects
OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(ASM_SOURCES:.s=.o)))
vpath %.s $(sort $(dir $(ASM_SOURCES)))

$(BUILD_DIR)/%.o: %.c Makefile | $(BUILD_DIR) 
	$(CC) -c $(CFLAGS) -Wa,-a,-ad,-alms=$(BUILD_DIR)/$(notdir $(<:.c=.lst)) $< -o $@

$(BUILD_DIR)/%.o: %.s Makefile | $(BUILD_DIR)
	$(AS) -c $(CFLAGS) $< -o $@

$(BUILD_DIR)/$(TARGET).elf: $(OBJECTS) Makefile
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@
	$(SZ) $@

$(BUILD_DIR)/%.hex: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(HEX) $< $@
	
$(BUILD_DIR)/%.bin: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(BIN) $< $@	
	
$(BUILD_DIR):
	mkdir $@

# default action: build all
all: $(BUILD_DIR)/$(TARGET).elf $(BUILD_DIR)/$(TARGET).hex $(BUILD_DIR)/$(TARGET).bin

#######################################
# Dependencies
#######################################
-include $(wildcard $(BUILD_DIR)/*.d)

#######################################
# Cleanup
#######################################
clean:
	-rm -rf $(BUILD_DIR)