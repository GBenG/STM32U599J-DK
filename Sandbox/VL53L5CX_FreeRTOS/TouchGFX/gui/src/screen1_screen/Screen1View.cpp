#include <gui/screen1_screen/Screen1View.hpp>
#include <touchgfx/Color.hpp>
#include <stdlib.h>
#include <stdint.h>
#include "vl53l5cx_api.h"
#include "FreeRTOS.h"
#include "cmsis_os2.h"

extern osMessageQueueId_t vlQueueHandle;

#define COLS 15
#define ROWS 15

int  	grid[ROWS+1][COLS+1];
int16_t cell_value[VL53L5CX_RESOLUTION_8X8];

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
			grid[c][r] = (int16_t)map(600, 0, 600, 0, 160);
		}
	}

	//Create cells
	uint16_t index = 0;
	for(uint8_t r = 0; r < ROWS; r ++ ){
		for(uint8_t c = 0; c < COLS; c ++ ){
			//box[index].setPosition(80+c*40, 80+r*40, 39, 39);
			//box[index].setPosition(40+(ROWS-r)*40, 40+(COLS-c)*40, 39, 39);			//Some rotation for my setup
			box[index].setPosition(60+(ROWS-r)*20, 60+(COLS-c)*20, 19, 19);				//Bigger field
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

		//Process queue
		for(uint8_t i = 0; i < VL53L5CX_RESOLUTION_8X8 ; i++ ){

			//Errors exceptions
			if( ( Results.target_status[VL53L5CX_NB_TARGET_PER_ZONE * i] == 5 )||
				( Results.target_status[VL53L5CX_NB_TARGET_PER_ZONE * i] == 9 ) )
			{
				cell_value[i] = Results.distance_mm[VL53L5CX_NB_TARGET_PER_ZONE * i];
			}else{
				cell_value[i] = 600;
			}

			//Noise exception
			if( cell_value[i] > 600) cell_value[i] = 600;
			//Hue mapping
			cell_value[i] = (int16_t)map(cell_value[i], 0, 600, 0, 160);
		}

		//dirty move TODO: should be better way)
		int inx = 0;
		for (int i = 0; i < ROWS; i+=2) {
			for (int j = 0; j < COLS; j+=2) {
				grid[i][j] = cell_value[inx++];
			}
		}

		//Smth looks like bilinear interpolation [DRAFT]
		for (int i = 0; i < 15; i++) {
			for (int j = 0; j < 15; j++) {
				if( i % 2 == 0 ){
					if( i < 14 ) grid[i+1][j] = (grid[i][j]+grid[i+2][j])/2;
				}
			}
		}
		for (int i = 0; i < 15; i++) {
			for (int j = 0; j < 15; j++) {
				if( j % 2 == 0 ){
					if( j < 14 ) grid[i][j+1] = (grid[i][j]+grid[i][j+2])/2;
				}
			}
		}

		//Draw cells
		uint16_t index = 0;
		for(uint8_t r = 0; r < ROWS ; r ++ ){
			for(uint8_t c = 0; c < COLS; c++ ){

			    //Filling
				box[index].setColor(touchgfx::Color::getColorFromHSV(grid[r][c], 255, 255));//NoizeMC
				box[index].invalidate();
				index++;
			}
		}
	}
}




