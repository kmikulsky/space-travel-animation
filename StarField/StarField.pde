// Help with Starfield stars from Daniel Shiffman
// http://codingtra.in

float shipX = 10;
float shipY = 10;
float shipWidth = 200;
float shipHeight = 150;
float shipSpeedX = 4;
float shipSpeedY = 5;
float speed;

int xPos=200;
int xDir=1;
int boundaryX = 200; 
int boundaryY = 200;

Star[] stars = new Star[800];
PImage img;

void setup() {
  size(680, 480);
  img = loadImage("arwing0.png");
  frameRate(24);
  
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
   
}

void draw() {
  speed = (20);
  
  if(frameCount < frameRate * 10) {
     
  background(0);
  
  translate(width/2, height/2);
  for (int i = 0; i < stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }
       
  //bounce off left and right boundaries
  if(shipX < -100|| shipX + 100 > 200){
    shipSpeedX *= -1;
  }
 
  //bounce off top and bottom boundaries
  else if(shipY < -100 || shipY + 100 > 200){
    shipSpeedY *= -1;
  }
  
  shipX += shipSpeedX;
  shipY += shipSpeedY;

  //draw the bouncing rectangle
  image(img, shipX, shipY); 
  }
  else {
     noLoop(); 
  }
}
