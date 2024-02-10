#include <gui/screen1_screen/Screen1View.hpp>
#include <touchgfx/Color.hpp>
#include <stdlib.h>
#include <stdint.h>
#include "vl53l5cx_api.h"
#include "FreeRTOS.h"
#include "cmsis_os2.h"

extern osMessageQueueId_t vlQueueHandle;

#define COLS 8
#define ROWS 8

int  grid[ROWS][COLS];

//Color mapping
long map(long x, long in_min, long in_max, long out_min, long out_max) {
  return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}


Screen1View::Screen1View()
{
	//Initialize grid with random values
	for(uint8_t r = 0; r < ROWS; r ++ ){
		for(uint8_t c = 0; c < COLS; c ++ ){
			//grid[c][r] = 140+rand()%20;
			grid[c][r] = 140;
		}
	}

	//Create cells
	uint16_t index = 0;
	for(uint8_t r = 0; r < ROWS; r ++ ){
		for(uint8_t c = 0; c < COLS; c ++ ){
			//box[index].setPosition(80+c*40, 80+r*40, 39, 39);
			box[index].setPosition(40+(ROWS-r)*40, 40+(COLS-c)*40, 39, 39);			//Some rotation for my setup
			box[index].setColor(touchgfx::Color::getColorFromRGB(0, 119, 178));
			add(box[index]);
			index++;
		}
	}
}

void Screen1View::setupScreen()
{
    Screen1ViewBase::setupScreen();
}

void Screen1View::tearDownScreen()
{
    Screen1ViewBase::tearDownScreen();
}

void Screen1View::tick_func(){

	static VL53L5CX_ResultsData Results;

	if (osMessageQueueGet( vlQueueHandle, &Results, 0U, 0) == osOK) {

		//Draw cells
		uint16_t index = 0;
		for(uint8_t r = ROWS; r > 0 ; r -- ){
			for(uint8_t c = 0; c < COLS; c++ ){

				int16_t cell_value;

				//Errors exceptions
			    if( ( Results.target_status[VL53L5CX_NB_TARGET_PER_ZONE * index] == 5 )||
			    	( Results.target_status[VL53L5CX_NB_TARGET_PER_ZONE * index] == 9 ) )
			    {
			    	cell_value = Results.distance_mm[VL53L5CX_NB_TARGET_PER_ZONE * index];
			    }else{
			    	cell_value = 600;
			    }

			    //Noise exception
			    if( cell_value > 600) cell_value = 600;
			    //Hue mapping
			    cell_value = (int16_t)map(cell_value, 0, 600, 0, 160);

			    //Filling
				box[index].setColor(touchgfx::Color::getColorFromHSV(cell_value, 255, 255));//NoizeMC
				box[index].invalidate();
				index++;
			}
		}
	}
}




