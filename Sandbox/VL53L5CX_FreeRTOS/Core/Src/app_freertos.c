/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * File Name          : app_freertos.c
  * Description        : Code for freertos applications
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2023 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "FreeRTOS.h"
#include "task.h"
#include "main.h"
#include "cmsis_os2.h"
#include <stdio.h>
/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "vl53l5cx_api.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
typedef StaticQueue_t osStaticMessageQDef_t;
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
/* USER CODE BEGIN Variables */
int status;
volatile int IntCount;
uint8_t p_data_ready;
VL53L5CX_Configuration 	Dev;
VL53L5CX_ResultsData 	Results;
uint8_t resolution, isAlive;
uint16_t idx;
/* USER CODE END Variables */
/* Definitions for defaultTask */
osThreadId_t defaultTaskHandle;
const osThreadAttr_t defaultTask_attributes = {
  .name = "defaultTask",
  .priority = (osPriority_t) osPriorityNormal,
  .stack_size = 128 * 4
};
/* Definitions for GUI_Task */
osThreadId_t GUI_TaskHandle;
const osThreadAttr_t GUI_Task_attributes = {
  .name = "GUI_Task",
  .priority = (osPriority_t) osPriorityNormal,
  .stack_size = 8192 * 4
};
/* Definitions for vlQueue */
osMessageQueueId_t vlQueueHandle;
uint8_t vlQueueBuffer[ 64 * sizeof( VL53L5CX_ResultsData ) ];
osStaticMessageQDef_t vlQueueControlBlock;
const osMessageQueueAttr_t vlQueue_attributes = {
  .name = "vlQueue",
  .cb_mem = &vlQueueControlBlock,
  .cb_size = sizeof(vlQueueControlBlock),
  .mq_mem = &vlQueueBuffer,
  .mq_size = sizeof(vlQueueBuffer)
};

/* Private function prototypes -----------------------------------------------*/
/* USER CODE BEGIN FunctionPrototypes */
extern portBASE_TYPE IdleTaskHook(void* p);
void get_data_by_polling(VL53L5CX_Configuration *p_dev);
/* USER CODE END FunctionPrototypes */

void StartDefaultTask(void *argument);
extern void TouchGFX_Task(void *argument);

void MX_FREERTOS_Init(void); /* (MISRA C 2004 rule 8.1) */

/* Hook prototypes */
void vApplicationIdleHook(void);

/* USER CODE BEGIN 2 */
void vApplicationIdleHook( void )
{
   /* vApplicationIdleHook() will only be called if configUSE_IDLE_HOOK is set
   to 1 in FreeRTOSConfig.h. It will be called on each iteration of the idle
   task. It is essential that code added to this hook function never attempts
   to block in any way (for example, call xQueueReceive() with a block time
   specified, or call vTaskDelay()). If the application makes use of the
   vTaskDelete() API function (as this demo application does) then it is also
   important that vApplicationIdleHook() is permitted to return to its calling
   function, because it is the responsibility of the idle task to clean up
   memory allocated by the kernel to any task that has since been deleted. */
  
   vTaskSetApplicationTaskTag(NULL, IdleTaskHook);
}
/* USER CODE END 2 */

/**
  * @brief  FreeRTOS initialization
  * @param  None
  * @retval None
  */
void MX_FREERTOS_Init(void) {
  /* USER CODE BEGIN Init */
  //~~~ VL53L5CX ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Dev.platform.address = VL53L5CX_DEFAULT_I2C_ADDRESS;

  // Reset ToF Sensor (Section 4.2 in UM2884)
  HAL_GPIO_WritePin(VL_LPn_GPIO_Port, VL_LPn_Pin, GPIO_PIN_RESET);
  HAL_Delay(10);
  HAL_GPIO_WritePin(VL_LPn_GPIO_Port, VL_LPn_Pin, GPIO_PIN_SET);


  status = vl53l5cx_is_alive(&Dev, &isAlive);
  if( !isAlive ){
	  printf("VL53L5CXV0 not detected at requested address (0x%x)\n", Dev.platform.address);
  }
  printf("Sensor OK\n");
  printf("Sensor initializing, please wait few seconds\n");
  status = vl53l5cx_init(&Dev);
  status = vl53l5cx_set_resolution(&Dev, VL53L5CX_RESOLUTION_8X8);             //Set resolution
  status = vl53l5cx_set_ranging_frequency_hz(&Dev, 30);				           // Set 2Hz ranging frequency
  status = vl53l5cx_set_ranging_mode(&Dev, VL53L5CX_RANGING_MODE_CONTINUOUS);  // Set mode continuous

  printf("Ranging starts\n");
  status = vl53l5cx_start_ranging(&Dev);
  printf("status: %u\n", status);
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  /* USER CODE END Init */

  /* USER CODE BEGIN RTOS_MUTEX */
  /* add mutexes, ... */
  /* USER CODE END RTOS_MUTEX */

  /* USER CODE BEGIN RTOS_SEMAPHORES */
  /* add semaphores, ... */
  /* USER CODE END RTOS_SEMAPHORES */

  /* USER CODE BEGIN RTOS_TIMERS */
  /* start timers, add new ones, ... */
  /* USER CODE END RTOS_TIMERS */
  /* creation of vlQueue */
  vlQueueHandle = osMessageQueueNew (64, sizeof(VL53L5CX_ResultsData), &vlQueue_attributes);

  /* USER CODE BEGIN RTOS_QUEUES */
  /* add queues, ... */
  /* USER CODE END RTOS_QUEUES */
  /* creation of defaultTask */
  defaultTaskHandle = osThreadNew(StartDefaultTask, NULL, &defaultTask_attributes);

  /* creation of GUI_Task */
  GUI_TaskHandle = osThreadNew(TouchGFX_Task, NULL, &GUI_Task_attributes);

  /* USER CODE BEGIN RTOS_THREADS */
  /* add threads, ... */
  /* USER CODE END RTOS_THREADS */

  /* USER CODE BEGIN RTOS_EVENTS */
  /* add events, ... */
  /* USER CODE END RTOS_EVENTS */

}
/* USER CODE BEGIN Header_StartDefaultTask */
/**
* @brief Function implementing the defaultTask thread.
* @param argument: Not used
* @retval None
*/
/* USER CODE END Header_StartDefaultTask */
void StartDefaultTask(void *argument)
{
  /* USER CODE BEGIN defaultTask */
  /* Infinite loop */
  for(;;)
  {
	get_data_by_polling(&Dev);
    osDelay(1);
  }
  /* USER CODE END defaultTask */
}

/* Private application code --------------------------------------------------*/
/* USER CODE BEGIN Application */
void get_data_by_polling(VL53L5CX_Configuration *p_dev){
	status = vl53l5cx_check_data_ready(&Dev, &p_data_ready);
	//printf("check_data_ready.status: %u | p_data_ready: %u\n", status, p_data_ready );

	if(p_data_ready){
		status = vl53l5cx_get_resolution(p_dev, &resolution);
		status = vl53l5cx_get_ranging_data(p_dev, &Results);

		for(int i = 0; i < resolution;i++){
			printf("%d\t%d\t%d\n",i,
					Results.target_status[VL53L5CX_NB_TARGET_PER_ZONE * i],
					Results.distance_mm[VL53L5CX_NB_TARGET_PER_ZONE * i]);
		}
		osMessageQueuePut( vlQueueHandle, &Results, 0U, 0 );
	}else{
		HAL_Delay(5);
	}
}
/* USER CODE END Application */

