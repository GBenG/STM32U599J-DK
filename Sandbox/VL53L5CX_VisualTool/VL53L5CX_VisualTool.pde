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
  //for (int x = 0; x < width; x++) {
  //  for (int y = 0; y < height; y++) {
  //    // Map the pixel position to the corresponding position in the 8x8 array
  //    float arrayX = map(x, 0, width, 0, 3);
  //    float arrayY = map(y, 0, height, 0, 3);

  //    // Calculate the integer indices for the 4 surrounding values
  //    int x0 = floor(arrayX);
  //    int x1 = ceil(arrayX);
  //    int y0 = floor(arrayY);
  //    int y1 = ceil(arrayY);

  //    // Bilinear interpolation
  //    float value = lerp(
  //      lerp(values[x0][y0], values[x1][y0], arrayX - x0),
  //      lerp(values[x0][y1], values[x1][y1], arrayX - x0),
  //      arrayY - y0
  //    );

  //    // Map the value to a color
  //    //color c = color(map(value, 0, 1000, 0, 255), 0, map(value, 0, 1000, 255, 0));
  //    float hue = map(value, 0, 1000, 240, 0); // Map the value to HUE (0 to 240)
  //    stroke(hue, 100, 100);
  //    point(x, y);
  //  }
  //}
//--------------------------------------------------------
}
