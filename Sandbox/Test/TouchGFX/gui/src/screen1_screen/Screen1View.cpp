#include <gui/screen1_screen/Screen1View.hpp>
#include <touchgfx/Color.hpp>
#include <stdlib.h>

#define COLS 24
#define ROWS 24

int  grid[ROWS][COLS];

//Updater
void updateGrid(int grid[ROWS][COLS]) {
    int newGrid[ROWS][COLS];

    for (int i = 0; i < ROWS; i++) {
        for (int j = 0; j < COLS; j++) {
            // Count the number of live neighbors
            int liveNeighbors = 0;
            for (int ni = -1; ni <= 1; ni++) {
                for (int nj = -1; nj <= 1; nj++) {
                    if (ni == 0 && nj == 0) continue; // Skip the center cell
                    int newI = (i + ni + ROWS) % ROWS;
                    int newJ = (j + nj + COLS) % COLS;
                    liveNeighbors += grid[newI][newJ];
                }
            }

            // Apply the rules of the Game of Life
            if (grid[i][j] == 1) {
                newGrid[i][j] = (liveNeighbors == 2 || liveNeighbors == 3) ? 1 : 0;
            } else {
                newGrid[i][j] = (liveNeighbors == 3) ? 1 : 0;
            }
        }
    }

    // Copy the new state back to the original array
    for (int i = 0; i < ROWS; i++) {
        for (int j = 0; j < COLS; j++) {
            grid[i][j] = newGrid[i][j];
        }
    }
}


Screen1View::Screen1View()
{
	//Initialize grid with random values
	for(int r = 0; r < ROWS; r ++ ){
		for(int c = 0; c < COLS; c ++ ){
			grid[c][r] = rand()%2;
		}
	}

	//Create cells
	int index = 0;
	for(int r = 0; r < ROWS; r ++ ){
		for(int c = 0; c < COLS; c ++ ){
			box[index].setPosition(0+c*20, 0+r*20, 20, 20);
			if(grid[c][r] != 0){
				box[index].setColor(touchgfx::Color::getColorFromRGB(0, 119, 178));
			}else{
				box[index].setColor(touchgfx::Color::getColorFromRGB(0, 0, 0));
			}
			add(box[index]);
			index++;
		}
	}
}

void Screen1View::tick_func(){

	//Draw cells
	int index = 0;
	for(int r = 0; r < ROWS; r ++ ){
		for(int c = 0; c < COLS; c ++ ){
			if(grid[c][r] != 0){
				box[index].setColor(touchgfx::Color::getColorFromRGB(0, 119, 178));
			}else{
				box[index].setColor(touchgfx::Color::getColorFromRGB(0, 0, 0));
			}
			box[index].invalidate();
			index++;
		}
	}

	//Life calculation
	updateGrid(grid);

	//Recover(endless) mode
	int sum = 0;
	for(int r = 0; r < ROWS; r ++ ){
		for(int c = 0; c < COLS; c ++ ){
			sum += grid[c][r];
		}
	}
	if( sum == 0 ){
		//Initialize grid with random values
		for(int r = 0; r < ROWS; r ++ ){
			for(int c = 0; c < COLS; c ++ ){
				grid[c][r] = rand()%2;
			}
		}
	}

	//Seed mode
	grid[rand()%ROWS][rand()%COLS] = 1;
}

void Screen1View::setupScreen()
{
    Screen1ViewBase::setupScreen();
}

void Screen1View::tearDownScreen()
{
    Screen1ViewBase::tearDownScreen();
}


