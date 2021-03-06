# Copyright 2015 Larry Littlefield (https://developer.mbed.org/users/svkatielee/)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Vendor/device for which the library should be built.
MBED_DEVICE        := NUCLEO_F401RE
MBED_TARGET        := STM_NUCLEO_F401RE
MBED_CLEAN         := $(MBED_DEVICE)-MBED-clean

# Compiler flags which are specifc to this device.
TARGETS_FOR_DEVICE := TARGET_NUCLEO_F401RE TARGET_M4 TARGET_CORTEX_M TARGET_STM TARGET_STM32F4 TARGET_STM32F401RE
TARGETS_FOR_DEVICE += TARGET_FF_ARDUINO TARGET_FF_MORPHO
GCC_DEFINES := $(patsubst %,-D%,$(TARGETS_FOR_DEVICE))
GCC_DEFINES += -D__CORTEX_M4 -DARM_MATH_CM4 -D__FPU_PRESENT=1

C_FLAGS   := -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -mthumb-interwork
ASM_FLAGS := -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp
LD_FLAGS  := -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp


# Extra platform specific object files to link into file binary.
DEVICE_OBJECTS :=


# Version of MRI library to use for this device.
DEVICE_MRI_LIB :=


# Linker script to be used.  Indicates what code should be placed where in memory.
LSCRIPT=$(GCC4MBED_DIR)/deps/mbed/libraries/mbed/targets/cmsis/TARGET_STM/TARGET_STM32F4/TARGET_NUCLEO_F401RE/TOOLCHAIN_GCC_ARM/STM32F401XE.ld


include $(GCC4MBED_DIR)/oldmake/device-common.mk
