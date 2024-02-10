################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/GIT/STM32U599J-DK/Sandbox/Test/Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_bus.c \
D:/GIT/STM32U599J-DK/Sandbox/Test/Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_hspi.c \
D:/GIT/STM32U599J-DK/Sandbox/Test/Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_ospi.c \
D:/GIT/STM32U599J-DK/Sandbox/Test/Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_ts.c 

C_DEPS += \
./Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_bus.d \
./Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_hspi.d \
./Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_ospi.d \
./Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_ts.d 

OBJS += \
./Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_bus.o \
./Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_hspi.o \
./Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_ospi.o \
./Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_ts.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_bus.o: D:/GIT/STM32U599J-DK/Sandbox/Test/Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_bus.c Drivers/BSP/STM32U5x9J-DK/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DTX_INCLUDE_USER_DEFINE_FILE -DTX_SINGLE_MODE_NON_SECURE=1 -DUSE_HAL_DRIVER -DSTM32U599xx -DTX_LOW_POWER -c -I../../TouchGFX/App -I../../TouchGFX/Target/generated -I../../TouchGFX/Target -I../../Core/Inc -I../../AZURE_RTOS/App -I../../Drivers/STM32U5xx_HAL_Driver/Inc -I../../Drivers/STM32U5xx_HAL_Driver/Inc/Legacy -I../../Middlewares/ST/threadx/common/inc -I../../Drivers/CMSIS/Device/ST/STM32U5xx/Include -I../../Middlewares/ST/threadx/ports/cortex_m33/gnu/inc -I../../Drivers/CMSIS/Include -I../../Drivers/BSP/STM32U5x9J-DK -I../../Middlewares/ST/touchgfx/framework/include -I../../TouchGFX/generated/fonts/include -I../../TouchGFX/generated/gui_generated/include -I../../TouchGFX/generated/images/include -I../../TouchGFX/generated/texts/include -I../../TouchGFX/generated/videos/include -I../../TouchGFX/gui/include -I../../Middlewares/ST/touchgfx_components/gpu2d/NemaGFX/include -I../../Middlewares/ST/touchgfx_components/gpu2d/TouchGFXNema/include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_hspi.o: D:/GIT/STM32U599J-DK/Sandbox/Test/Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_hspi.c Drivers/BSP/STM32U5x9J-DK/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DTX_INCLUDE_USER_DEFINE_FILE -DTX_SINGLE_MODE_NON_SECURE=1 -DUSE_HAL_DRIVER -DSTM32U599xx -DTX_LOW_POWER -c -I../../TouchGFX/App -I../../TouchGFX/Target/generated -I../../TouchGFX/Target -I../../Core/Inc -I../../AZURE_RTOS/App -I../../Drivers/STM32U5xx_HAL_Driver/Inc -I../../Drivers/STM32U5xx_HAL_Driver/Inc/Legacy -I../../Middlewares/ST/threadx/common/inc -I../../Drivers/CMSIS/Device/ST/STM32U5xx/Include -I../../Middlewares/ST/threadx/ports/cortex_m33/gnu/inc -I../../Drivers/CMSIS/Include -I../../Drivers/BSP/STM32U5x9J-DK -I../../Middlewares/ST/touchgfx/framework/include -I../../TouchGFX/generated/fonts/include -I../../TouchGFX/generated/gui_generated/include -I../../TouchGFX/generated/images/include -I../../TouchGFX/generated/texts/include -I../../TouchGFX/generated/videos/include -I../../TouchGFX/gui/include -I../../Middlewares/ST/touchgfx_components/gpu2d/NemaGFX/include -I../../Middlewares/ST/touchgfx_components/gpu2d/TouchGFXNema/include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_ospi.o: D:/GIT/STM32U599J-DK/Sandbox/Test/Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_ospi.c Drivers/BSP/STM32U5x9J-DK/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DTX_INCLUDE_USER_DEFINE_FILE -DTX_SINGLE_MODE_NON_SECURE=1 -DUSE_HAL_DRIVER -DSTM32U599xx -DTX_LOW_POWER -c -I../../TouchGFX/App -I../../TouchGFX/Target/generated -I../../TouchGFX/Target -I../../Core/Inc -I../../AZURE_RTOS/App -I../../Drivers/STM32U5xx_HAL_Driver/Inc -I../../Drivers/STM32U5xx_HAL_Driver/Inc/Legacy -I../../Middlewares/ST/threadx/common/inc -I../../Drivers/CMSIS/Device/ST/STM32U5xx/Include -I../../Middlewares/ST/threadx/ports/cortex_m33/gnu/inc -I../../Drivers/CMSIS/Include -I../../Drivers/BSP/STM32U5x9J-DK -I../../Middlewares/ST/touchgfx/framework/include -I../../TouchGFX/generated/fonts/include -I../../TouchGFX/generated/gui_generated/include -I../../TouchGFX/generated/images/include -I../../TouchGFX/generated/texts/include -I../../TouchGFX/generated/videos/include -I../../TouchGFX/gui/include -I../../Middlewares/ST/touchgfx_components/gpu2d/NemaGFX/include -I../../Middlewares/ST/touchgfx_components/gpu2d/TouchGFXNema/include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_ts.o: D:/GIT/STM32U599J-DK/Sandbox/Test/Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_ts.c Drivers/BSP/STM32U5x9J-DK/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DTX_INCLUDE_USER_DEFINE_FILE -DTX_SINGLE_MODE_NON_SECURE=1 -DUSE_HAL_DRIVER -DSTM32U599xx -DTX_LOW_POWER -c -I../../TouchGFX/App -I../../TouchGFX/Target/generated -I../../TouchGFX/Target -I../../Core/Inc -I../../AZURE_RTOS/App -I../../Drivers/STM32U5xx_HAL_Driver/Inc -I../../Drivers/STM32U5xx_HAL_Driver/Inc/Legacy -I../../Middlewares/ST/threadx/common/inc -I../../Drivers/CMSIS/Device/ST/STM32U5xx/Include -I../../Middlewares/ST/threadx/ports/cortex_m33/gnu/inc -I../../Drivers/CMSIS/Include -I../../Drivers/BSP/STM32U5x9J-DK -I../../Middlewares/ST/touchgfx/framework/include -I../../TouchGFX/generated/fonts/include -I../../TouchGFX/generated/gui_generated/include -I../../TouchGFX/generated/images/include -I../../TouchGFX/generated/texts/include -I../../TouchGFX/generated/videos/include -I../../TouchGFX/gui/include -I../../Middlewares/ST/touchgfx_components/gpu2d/NemaGFX/include -I../../Middlewares/ST/touchgfx_components/gpu2d/TouchGFXNema/include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-STM32U5x9J-2d-DK

clean-Drivers-2f-BSP-2f-STM32U5x9J-2d-DK:
	-$(RM) ./Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_bus.cyclo ./Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_bus.d ./Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_bus.o ./Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_bus.su ./Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_hspi.cyclo ./Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_hspi.d ./Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_hspi.o ./Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_hspi.su ./Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_ospi.cyclo ./Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_ospi.d ./Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_ospi.o ./Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_ospi.su ./Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_ts.cyclo ./Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_ts.d ./Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_ts.o ./Drivers/BSP/STM32U5x9J-DK/stm32u5x9j_discovery_ts.su

.PHONY: clean-Drivers-2f-BSP-2f-STM32U5x9J-2d-DK

