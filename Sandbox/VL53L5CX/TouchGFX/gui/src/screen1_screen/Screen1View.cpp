#include <gui/screen1_screen/Screen1View.hpp>
#include <touchgfx/Color.hpp>
#include <stdlib.h>
#include <stdint.h>

#define COLS 8
#define ROWS 8

int  grid[ROWS][COLS];


Screen1View::Screen1View()
{
	//Initialize grid with random values
	for(uint8_t r = 0; r < ROWS; r ++ ){
		for(uint8_t c = 0; c < COLS; c ++ ){
			grid[c][r] = 140+rand()%20;
		}
	}

	//Create cells
	uint16_t index = 0;
	for(uint8_t r = 0; r < ROWS; r ++ ){
		for(uint8_t c = 0; c < COLS; c ++ ){
			box[index].setPosition(80+c*40, 80+r*40, 39, 39);
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

	//Calculate grid
	for(uint8_t r = 0; r < ROWS; r ++ ){
		for(uint8_t c = 0; c < COLS; c ++ ){
			if( grid[c][r] > 0 ){
				if( rand()%20 != 0 ){
					grid[c][r]--;
				}
			}else{
				grid[c][r] = 160;
			}
		}
	}

	//Draw cells
	uint16_t index = 0;
	for(uint8_t r = 0; r < ROWS; r ++ ){
		for(uint8_t c = 0; c < COLS; c ++ ){
			//box[index].setColor(touchgfx::Color::getColorFromRGB(0, 119, 178));
			box[index].setColor(touchgfx::Color::getColorFromHSV(grid[c][r], 255, 255));
			box[index].invalidate();
			index++;
		}
	}
}




