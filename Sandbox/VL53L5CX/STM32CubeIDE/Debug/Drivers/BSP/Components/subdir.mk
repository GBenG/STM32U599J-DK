################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/GIT/STM32U599J-DK/Sandbox/VL53L5CX/Drivers/BSP/Components/aps512xx/aps512xx.c \
D:/GIT/STM32U599J-DK/Sandbox/VL53L5CX/Drivers/BSP/Components/mx25um51245g/mx25um51245g.c \
D:/GIT/STM32U599J-DK/Sandbox/VL53L5CX/Drivers/BSP/Components/sitronix/sitronix.c \
D:/GIT/STM32U599J-DK/Sandbox/VL53L5CX/Drivers/BSP/Components/sitronix/sitronix_reg.c 

C_DEPS += \
./Drivers/BSP/Components/aps512xx.d \
./Drivers/BSP/Components/mx25um51245g.d \
./Drivers/BSP/Components/sitronix.d \
./Drivers/BSP/Components/sitronix_reg.d 

OBJS += \
./Drivers/BSP/Components/aps512xx.o \
./Drivers/BSP/Components/mx25um51245g.o \
./Drivers/BSP/Components/sitronix.o \
./Drivers/BSP/Components/sitronix_reg.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/Components/aps512xx.o: D:/GIT/STM32U599J-DK/Sandbox/VL53L5CX/Drivers/BSP/Components/aps512xx/aps512xx.c Drivers/BSP/Components/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DTX_INCLUDE_USER_DEFINE_FILE -DTX_SINGLE_MODE_NON_SECURE=1 -DUSE_HAL_DRIVER -DSTM32U599xx -DTX_LOW_POWER -c -I../../TouchGFX/App -I../../TouchGFX/Target/generated -I../../TouchGFX/Target -I../../Core/Inc -I../../AZURE_RTOS/App -I../../Drivers/STM32U5xx_HAL_Driver/Inc -I../../Drivers/STM32U5xx_HAL_Driver/Inc/Legacy -I../../Middlewares/ST/threadx/common/inc -I../../Drivers/CMSIS/Device/ST/STM32U5xx/Include -I../../Middlewares/ST/threadx/ports/cortex_m33/gnu/inc -I../../Drivers/CMSIS/Include -I../../Drivers/BSP/STM32U5x9J-DK -I../../Middlewares/ST/touchgfx/framework/include -I../../TouchGFX/generated/fonts/include -I../../TouchGFX/generated/gui_generated/include -I../../TouchGFX/generated/images/include -I../../TouchGFX/generated/texts/include -I../../TouchGFX/generated/videos/include -I../../TouchGFX/gui/include -I../../Middlewares/ST/touchgfx_components/gpu2d/NemaGFX/include -I../../Middlewares/ST/touchgfx_components/gpu2d/TouchGFXNema/include -I"D:/GIT/STM32U599J-DK/Sandbox/VL53L5CX/STM32CubeIDE/Drivers/BSP/Components/VL53L5CX_ULD_API/inc" -I"D:/GIT/STM32U599J-DK/Sandbox/VL53L5CX/STM32CubeIDE/Application/User/Core" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/BSP/Components/mx25um51245g.o: D:/GIT/STM32U599J-DK/Sandbox/VL53L5CX/Drivers/BSP/Components/mx25um51245g/mx25um51245g.c Drivers/BSP/Components/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DTX_INCLUDE_USER_DEFINE_FILE -DTX_SINGLE_MODE_NON_SECURE=1 -DUSE_HAL_DRIVER -DSTM32U599xx -DTX_LOW_POWER -c -I../../TouchGFX/App -I../../TouchGFX/Target/generated -I../../TouchGFX/Target -I../../Core/Inc -I../../AZURE_RTOS/App -I../../Drivers/STM32U5xx_HAL_Driver/Inc -I../../Drivers/STM32U5xx_HAL_Driver/Inc/Legacy -I../../Middlewares/ST/threadx/common/inc -I../../Drivers/CMSIS/Device/ST/STM32U5xx/Include -I../../Middlewares/ST/threadx/ports/cortex_m33/gnu/inc -I../../Drivers/CMSIS/Include -I../../Drivers/BSP/STM32U5x9J-DK -I../../Middlewares/ST/touchgfx/framework/include -I../../TouchGFX/generated/fonts/include -I../../TouchGFX/generated/gui_generated/include -I../../TouchGFX/generated/images/include -I../../TouchGFX/generated/texts/include -I../../TouchGFX/generated/videos/include -I../../TouchGFX/gui/include -I../../Middlewares/ST/touchgfx_components/gpu2d/NemaGFX/include -I../../Middlewares/ST/touchgfx_components/gpu2d/TouchGFXNema/include -I"D:/GIT/STM32U599J-DK/Sandbox/VL53L5CX/STM32CubeIDE/Drivers/BSP/Components/VL53L5CX_ULD_API/inc" -I"D:/GIT/STM32U599J-DK/Sandbox/VL53L5CX/STM32CubeIDE/Application/User/Core" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/BSP/Components/sitronix.o: D:/GIT/STM32U599J-DK/Sandbox/VL53L5CX/Drivers/BSP/Components/sitronix/sitronix.c Drivers/BSP/Components/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DTX_INCLUDE_USER_DEFINE_FILE -DTX_SINGLE_MODE_NON_SECURE=1 -DUSE_HAL_DRIVER -DSTM32U599xx -DTX_LOW_POWER -c -I../../TouchGFX/App -I../../TouchGFX/Target/generated -I../../TouchGFX/Target -I../../Core/Inc -I../../AZURE_RTOS/App -I../../Drivers/STM32U5xx_HAL_Driver/Inc -I../../Drivers/STM32U5xx_HAL_Driver/Inc/Legacy -I../../Middlewares/ST/threadx/common/inc -I../../Drivers/CMSIS/Device/ST/STM32U5xx/Include -I../../Middlewares/ST/threadx/ports/cortex_m33/gnu/inc -I../../Drivers/CMSIS/Include -I../../Drivers/BSP/STM32U5x9J-DK -I../../Middlewares/ST/touchgfx/framework/include -I../../TouchGFX/generated/fonts/include -I../../TouchGFX/generated/gui_generated/include -I../../TouchGFX/generated/images/include -I../../TouchGFX/generated/texts/include -I../../TouchGFX/generated/videos/include -I../../TouchGFX/gui/include -I../../Middlewares/ST/touchgfx_components/gpu2d/NemaGFX/include -I../../Middlewares/ST/touchgfx_components/gpu2d/TouchGFXNema/include -I"D:/GIT/STM32U599J-DK/Sandbox/VL53L5CX/STM32CubeIDE/Drivers/BSP/Components/VL53L5CX_ULD_API/inc" -I"D:/GIT/STM32U599J-DK/Sandbox/VL53L5CX/STM32CubeIDE/Application/User/Core" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/BSP/Components/sitronix_reg.o: D:/GIT/STM32U599J-DK/Sandbox/VL53L5CX/Drivers/BSP/Components/sitronix/sitronix_reg.c Drivers/BSP/Components/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DTX_INCLUDE_USER_DEFINE_FILE -DTX_SINGLE_MODE_NON_SECURE=1 -DUSE_HAL_DRIVER -DSTM32U599xx -DTX_LOW_POWER -c -I../../TouchGFX/App -I../../TouchGFX/Target/generated -I../../TouchGFX/Target -I../../Core/Inc -I../../AZURE_RTOS/App -I../../Drivers/STM32U5xx_HAL_Driver/Inc -I../../Drivers/STM32U5xx_HAL_Driver/Inc/Legacy -I../../Middlewares/ST/threadx/common/inc -I../../Drivers/CMSIS/Device/ST/STM32U5xx/Include -I../../Middlewares/ST/threadx/ports/cortex_m33/gnu/inc -I../../Drivers/CMSIS/Include -I../../Drivers/BSP/STM32U5x9J-DK -I../../Middlewares/ST/touchgfx/framework/include -I../../TouchGFX/generated/fonts/include -I../../TouchGFX/generated/gui_generated/include -I../../TouchGFX/generated/images/include -I../../TouchGFX/generated/texts/include -I../../TouchGFX/generated/videos/include -I../../TouchGFX/gui/include -I../../Middlewares/ST/touchgfx_components/gpu2d/NemaGFX/include -I../../Middlewares/ST/touchgfx_components/gpu2d/TouchGFXNema/include -I"D:/GIT/STM32U599J-DK/Sandbox/VL53L5CX/STM32CubeIDE/Drivers/BSP/Components/VL53L5CX_ULD_API/inc" -I"D:/GIT/STM32U599J-DK/Sandbox/VL53L5CX/STM32CubeIDE/Application/User/Core" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-Components

clean-Drivers-2f-BSP-2f-Components:
	-$(RM) ./Drivers/BSP/Components/aps512xx.cyclo ./Drivers/BSP/Components/aps512xx.d ./Drivers/BSP/Components/aps512xx.o ./Drivers/BSP/Components/aps512xx.su ./Drivers/BSP/Components/mx25um51245g.cyclo ./Drivers/BSP/Components/mx25um51245g.d ./Drivers/BSP/Components/mx25um51245g.o ./Drivers/BSP/Components/mx25um51245g.su ./Drivers/BSP/Components/sitronix.cyclo ./Drivers/BSP/Components/sitronix.d ./Drivers/BSP/Components/sitronix.o ./Drivers/BSP/Components/sitronix.su ./Drivers/BSP/Components/sitronix_reg.cyclo ./Drivers/BSP/Components/sitronix_reg.d ./Drivers/BSP/Components/sitronix_reg.o ./Drivers/BSP/Components/sitronix_reg.su

.PHONY: clean-Drivers-2f-BSP-2f-Components

