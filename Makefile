# /***********************************************************************#
# * @file    Makefile                                                     #
# * @brief   mk file                                                      #
# * @history                                                              #
# * Date       Version Author    description                              #
# * ========== ======= ========= =========================================#
# * 2018-07-06 V1.0    weihui.jia   Create                                #
# *                                                                       #
# * @Copyright (C)  2018  dixin.Co.Ltd all right reserved                 #
#************************************************************************/#
# /*@{*/

#CROSS_COMPILE = 
ARCH = i386
AS 	= $(CROSS_COMPILE)as
LD 	= $(CROSS_COMPILE)ld
CC 	= $(CROSS_COMPILE)g++
CPP = $(CC) -E
AR 	= $(CROSS_COMPILE)ar
NM 	= $(CROSS_COMPILE)nm

STRIP 	= $(CROSS_COMPILE)strip
OBJCOPY = $(CROSS_COMPILE)objcopy
OBJDUMP = $(CROSS_COMPILE)objdump

BUILD_DIR = bin

export AS LD CC CPP AR NM
export STRIP OBJCOPY OBJDUMP


CFLAGS := -Wall -O2 -g 

ifeq (i386,$(ARCH))
	CFLAGS += -I $(shell pwd)/3rds/i386/include/bsl -I $(shell pwd)/3rds/i386/include/mysql
	LDFLAGS := -lm -L $(shell pwd)/3rds/i386/lib/bsl -lbsl  -lrt -ldl -lpthread -lstdc++ 
endif

ifeq (hisiv3536,$(ARCH))
	CFLAGS += -I $(shell pwd)/3rds/i386/  -I $(shell pwd)/3rds/hisi3536/bsl/include/
	LDFLAGS := -L $(shell pwd)/3rds/hisi3536/bsl/lib/
	LIB += -lm -lbsl -lrt -lpthread
endif

ifeq (hisiv3531,$(ARCH))
	CFLAGS += -I $(shell pwd)/src/include -I $(shell pwd)/3rds/hisi3531/bsl/include/
	LDFLAGS := -L $(shell pwd)/3rds/hisi3531/bsl/lib/
	LIB += -lm -lbsl -lrt -lpthread
endif

export CFLAGS LDFLAGS LIB

TOPDIR := $(shell pwd)
export TOPDIR

TARGET := test 


obj-y += main/

all: 
	$(shell [ -d ${BUILD_DIR} ] || mkdir -p $(BUILD_DIR))
	make -C ./  -f $(TOPDIR)/Makefile.build
	$(CC) $(LDFLAGS) -o $(shell pwd)/$(BUILD_DIR)/$(TARGET) built-in.o  $(LDFLAGS) $(LIB) 
	@echo "$(TARGET) run in $(ARCH) platform  compiled success."

clean:
	rm -f $(rm shell find -name "*.o")
	rm -f $(shell pwd)/bin/$(TARGET)

distclean:
	rm -f $(shell find -name "*.o")
	rm -f $(shell find -name "*.d")
	rm -f $(shell pwd)/bin/$(TARGET)
	rm -f $(shell pwd)/bin/all
	rm -rf $(shell pwd)/bin
				
