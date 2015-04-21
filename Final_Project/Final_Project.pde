//Dylan Conley
//CAT328AISP15/Final Project
//2/21/15
//spaceship will dodge incoming asteroids

/* @pjs preload="data/space-background1.png"; */
PImage bg;
SpaceShip S;
float x, y;
static int windowX, windowY;
//asteroid x and y locations
float ax, ay;

void setup()
{
  //Window size
  windowX = 800;
  windowY = 420;
  //Defualt ship location
  x = 400; 
  y = 400;
  
  //loads background image
  bg = loadImage("data/space-background1.png");
  //draw background
  size(windowX,windowY);
  background(bg);
  
  //create space ship class
  S = new SpaceShip();
  //drw space ship
  S.render(x,y);
  
  
}
