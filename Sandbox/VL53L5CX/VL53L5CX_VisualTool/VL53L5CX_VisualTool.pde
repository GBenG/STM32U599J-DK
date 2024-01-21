//Includes
import     java.io.BufferedWriter;
import     java.io.FileWriter;
import     processing.serial.*;

//Objects
Serial_port serial_left = new Serial_port();
//Serial_port serial_rght = new Serial_port();

//Scan area
int cols = 100/2;   //50
int rows = 70/2;   //35
int layers = 30/2; //15

int X_shift = -30;
int Y_shift = -80;
int Z_shift = 85;

int X_pos = 0;
int Y_pos = 0;
int Z_pos = 0;
Boolean X_sw = false;
Boolean Y_sw = false;


Boolean scan = false;
Boolean wait = false;

int k_send_try = 0;

int[][] values = {
  {1000, 1000, 1000, 1000},
  {1000, 1000, 1000, 1000},
  {1000, 1000, 1000, 1000},
  {1000, 1000, 1000, 1000}
};

int rectSize = 180;

//----------------------------------------------------------------------------------------------------------------------
void setup() 
{
  size( 1200, 850);
  
  serial_left.update();
}


//----------------------------------------------------------------------------------------------------------------------
void draw() 
{
  background(bgcolor);
//-------------------------------------------------------- 
  control_watermark();
  control_group("LEFT", 0, height);
//--------------------------------------------------------  
  translate(width / 2 - rectSize * 4 / 2, height / 2 - rectSize * 4 / 2);

  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      int value = values[i][j];
      float hue = map(value, 0, 1000, 240, 0); // Map the value to HUE (0 to 240)
      fill(hue, 100, 100); // HSB color mode
      rect(j * rectSize, i * rectSize, rectSize, rectSize);
    }
  }
//--------------------------------------------------------
 
}
