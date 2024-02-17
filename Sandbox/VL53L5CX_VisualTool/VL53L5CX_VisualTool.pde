//Includes
import     java.io.BufferedWriter;
import     java.io.FileWriter;
import     processing.serial.*;

//Objects
Serial_port serial_left = new Serial_port();

int[][] values = new int[8][8]; // Create
int[][] exvals = new int[16][16]; // Create

int rectSize = 90;

//----------------------------------------------------------------------------------------------------------------------
void setup() 
{
//-------------------------------------------------------- 
//2D
//-------------------------------------------------------- 
  //size( 1200, 850 );
//-------------------------------------------------------- 
//3D
//-------------------------------------------------------- 
  size(1200, 850, P3D);
//--------------------------------------------------------

  serial_left.update();
  colorMode(HSB, 255);
  
  //Init array
  for (int i = 0; i < 16; i++) {
    for (int j = 0; j < 16; j++) {
      exvals[i][j] = 600;
    }
  }
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      values[i][j] = int(random(500,550));
      exvals[i*2][j*2] = values[i][j];
    }
  }
}


//----------------------------------------------------------------------------------------------------------------------
void draw() 
{
  background(bgcolor);  
//-------------------------------------------------------- 
  control_watermark();
  control_group("LEFT", 0, height);
//-------------------------------------------------------- 
//2D
//-------------------------------------------------------- 
//  translate(width / 2 - rectSize * 8 / 2, height / 2 - rectSize * 8 / 2);

//  for (int i = 0; i < 8; i++) {
//    for (int j = 0; j < 8; j++) {
//      int value = values[i][j];
//      if( value > 600 ) value = 600;//Clear noise
//      float hue = map(value, 0, 600, 0, 160); // Map the value to HUE (0 to 240)
//      fill(hue, 200, 100); // HSB color mode
//      rect(j * rectSize, i * rectSize, rectSize, rectSize);
//      fill(0);
//      text(value,j*rectSize+rectSize/2,i*rectSize+rectSize/2);
//    }
//  }
//-------------------------------------------------------- 
//3D
//-------------------------------------------------------- 
  translate(width/2+100, height/2, -100);
  rotateX(PI / 4);
  rotateZ(PI / 1);
  
  //Draft interpolation
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      exvals[i*2][j*2] = values[i][j];
    }
  }
  for (int i = 0; i < 15; i++) {
    for (int j = 0; j < 15; j++) {
      if( i % 2 == 0 ){
        if( i < 14 ) exvals[i+1][j] = (exvals[i][j]+exvals[i+2][j])/2;
      }
    }
  }
  for (int i = 0; i < 15; i++) {
    for (int j = 0; j < 15; j++) {
      if( j % 2 == 0 ){
        if( j < 14 ) exvals[i][j+1] = (exvals[i][j]+exvals[i][j+2])/2;
      }
    }
  }
  
  float boxSize = 40;

  for (int i = 0; i < 15; i++) {
    for (int j = 0; j < 15; j++) {
      float x = i * boxSize - 3.5 * boxSize;
      float y = j * boxSize - 3.5 * boxSize;
      float z = 600-exvals[i][j];

      // Map the value to a color
      if( z < 0 ) z = 0;//Clear noise
      float hue = map(z, 0, 600, 160, 0);
      fill(hue, 255, 255);
      stroke(0);

      pushMatrix();
      translate(x, y, (z/4) / 3);
      box(boxSize, boxSize, z/4);
      popMatrix();
    }
  }
//-------------------------------------------------------- 
}
