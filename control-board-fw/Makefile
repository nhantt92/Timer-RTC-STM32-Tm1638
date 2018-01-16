THISDIR:=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))

BUILD_BASE  = build
FW_BASE = firmware
MCU_FAMILY    ?= STM32F1


ifeq ($(OS),Windows_NT)
	OPENOCD_DIR ?= "D:\Projects\2016\tools\OpenOCD-0.9.0-Win32"
	OPENCM3_DIR ?= "D:\Projects\2016\tools\libopencm3"
	CC_PATH ?= "/tools/stm32/gcc/bin"
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Darwin)
		OPENOCD_DIR ?= "/Applications/GNU ARM Eclipse/OpenOCD/0.10.0-201610281609-dev"
		OPENCM3_DIR ?= /tools/stm32/libopencm3
		CC_PATH ?= /tools/stm32/gcc/bin
	endif
endif

#Check openocd install global
ISOCD_EXIST := $(shell command -v openocd 2> /dev/null)
ifndef ISOCD_EXIST
	OPENOCD    = $(OPENOCD_DIR)/bin/openocd
else
	OPENOCD    = openocd
endif

OPENCM3_EXIST = 0
ifneq ("$(wildcard $(OPENCM3_DIR))","")
	OPENCM3_EXIST = 1
endif

ifneq ("$(wildcard vendor/libopencm3)","")
	OPENCM3_EXIST = 1
	OPENCM3_DIR = $(THISDIR)/vendor/libopencm3
endif


FP_FLAGS  ?= -msoft-float
ARCH_FLAGS  = -mthumb -mcpu=cortex-m3 $(FP_FLAGS) -mfix-cortex-m3-ldrd


TARGET = timer-rtc-fw

DATETIME := `/bin/date "+%Y-%m-%d_%H:%M:%S"`

#############################################################
# OPENCM3 define
#


OPENCM3_LIBS = lib
OPENCM3_INC  = include
OPENCM3_LD   = lib

LDDIR = $(THISDIR)/ld
LD_FILE = $(LDDIR)/app.ld


LD_SCRIPT = -T $(LD_FILE)
FLAVOR ?= release


MODULES   = src
EXTRA_INCDIR    = include


# libraries used in this project
LIBS    = opencm3_stm32f1 c gcc nosys

#CCFLAGS += -O0 -ffunction-sections -fno-jump-tables

ISCC_EXIST := $(shell command -v arm-none-eabi-gcc 2> /dev/null)
ifndef ISCC_EXIST
	PREFIX    = $(CC_PATH)/arm-none-eabi
else
	PREFIX    = arm-none-eabi
endif

CC    := $(PREFIX)-gcc
CXX   := $(PREFIX)-g++
LD    := $(PREFIX)-gcc
AR    := $(PREFIX)-ar
AS    := $(PREFIX)-as
SZ    := $(PREFIX)-size
OBJCOPY   := $(PREFIX)-objcopy
OBJDUMP   := $(PREFIX)-objdump
GDB   := $(PREFIX)-gdb

###############################################################################
# C flags

CFLAGS    += -O0 -g
CFLAGS    += -Wextra -Wshadow -Wimplicit-function-declaration
CFLAGS    += -Wredundant-decls -Wmissing-prototypes -Wstrict-prototypes
CFLAGS    += -fno-common -ffunction-sections -fdata-sections
CFLAGS    += -D$(MCU_FAMILY)
# C++ flags

CXXFLAGS  += -Os -g
CXXFLAGS  += -Wextra -Wshadow -Wredundant-decls  -Weffc++
CXXFLAGS  += -fno-common -ffunction-sections -fdata-sections

###############################################################################
# C & C++ preprocessor common flags

CPPFLAGS  += -MD
CPPFLAGS  += -Wall -Wundef
CPPFLAGS  += -I$(INCLUDE_DIR) $(DEFS)

###############################################################################
# Linker flags

LDFLAGS   += --static -nostartfiles
LDFLAGS   += -L$(LIB_DIR)
LDFLAGS   += -T$(LDSCRIPT)
LDFLAGS   += -Wl,-Map=$(*).map
LDFLAGS   += -Wl,--gc-sections
ifeq ($(V),99)
LDFLAGS   += -Wl,--print-gc-sections
endif

LOCAL_CONFIG_FILE:= $(wildcard include/config.local.h)
ifneq ("$(LOCAL_CONFIG_FILE)","")
	CFLAGS += -DLOCAL_CONFIG
endif


SRC_DIR   := $(MODULES)
BUILD_DIR := $(addprefix $(BUILD_BASE)/,$(MODULES))

OPENCM3_LIBDIR  := $(addprefix $(OPENCM3_DIR)/,$(OPENCM3_LIBS))
OPENCM3_INCDIR  := $(addprefix -I$(OPENCM3_DIR)/,$(OPENCM3_INC))
OPENCM3_LDDIR   := $(addprefix -L$(OPENCM3_DIR)/,$(OPENCM3_LD))
SRC   := $(foreach sdir,$(SRC_DIR),$(wildcard $(sdir)/*.c))
OBJ   := $(patsubst %.c,$(BUILD_BASE)/%.o,$(SRC))
LIBS    := $(addprefix -l,$(LIBS))
HEX_OUT   := $(addprefix $(FW_BASE)/,$(TARGET).hex)
TARGET_OUT  := $(addprefix $(BUILD_BASE)/,$(TARGET).elf)


INCDIR  := $(addprefix -I,$(SRC_DIR))
EXTRA_INCDIR  := $(addprefix -I,$(EXTRA_INCDIR))
MODULE_INCDIR := $(addsuffix /include,$(INCDIR))

V ?= $(VERBOSE)
ifeq ("$(V)","1")
Q :=
vecho := @true
else
Q := @
vecho := @echo
endif

vpath %.c $(SRC_DIR)

define compile-objects
$1/%.o: %.c
	$(vecho) "CC $$< "
	$(Q) $(CC) $(INCDIR) $(MODULE_INCDIR) $(EXTRA_INCDIR) $(OPENCM3_INCDIR) $(CFLAGS) $(ARCH_FLAGS)  -c $$< -o $$@
endef

.PHONY: all checkdirs clean

all: checkdirs $(HEX_OUT)

flash-stlink:
	$(OPENOCD) 	-s $(OPENOCD_DIR)\
			   	-f interface/stlink-v2.cfg\
				-f target/stm32f1x_stlink.cfg\
		        -c init -c targets -c "reset halt" \
		        -c "flash write_image erase $(HEX_OUT)" \
		        -c "verify_image $(HEX_OUT)" \
		        -c "reset run" -c shutdown

flash-jlink:
	$(OPENOCD) -s $(OPENOCD_DIR)/scripts \
	-c "adapter_khz 1000" \
	-f interface/jlink.cfg \
	-c "transport select swd" \
	-f target/stm32f1x.cfg \
	-c "program $(HEX_OUT) verify reset exit"

debug:
	$(OPENOCD) -s $(OPENOCD_DIR)/scripts \
	-c "adapter_khz 1000" \
	-f interface/jlink.cfg \
	-c "transport select swd" \
	-f target/stm32f1x.cfg

$(HEX_OUT): $(TARGET_OUT)
	$(vecho) "OBJCOPY $@"
	$(Q) $(OBJCOPY) -Oihex $(TARGET_OUT) $@
	$(Q) $(SZ) $(TARGET_OUT)

$(TARGET_OUT): $(OBJ)
	$(vecho) "LD $@"
	$(Q) $(LD) $(OPENCM3_LDDIR) $(LD_SCRIPT) $(LDFLAGS) $(ARCH_FLAGS) $(OBJ) -Wl,--start-group $(LIBS) -Wl,--end-group -o $@

checkdirs: $(BUILD_DIR) $(FW_BASE) checkcm3

$(BUILD_DIR):
	$(Q) mkdir -p $@
$(FW_BASE):
	$(Q) mkdir -p $@

checkcm3:
ifeq ($(OPENCM3_EXIST), 0)
	@git clone https://github.com/libopencm3/libopencm3.git vendor/libopencm3\
	&& cd vendor/libopencm3 && make && cd ../../
endif

fast: clean all flash-jlink

rebuild: clean all
clean:
	$(Q) rm -rf $(BUILD_DIR)
	$(Q) rm -rf $(BUILD_BASE)
	$(Q) rm -rf $(FW_BASE)


$(foreach bdir,$(BUILD_DIR),$(eval $(call compile-objects,$(bdir))))
