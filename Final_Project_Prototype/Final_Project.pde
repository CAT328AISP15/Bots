//Dylan Conley
//CAT328AISP15/Final Project
//2/21/15
//spaceship will dodge incoming asteroids

/* @pjs preload="data/space-background1.png"; */
PImage bg;
SpaceShip S;
Asteroid A;
float x, y;
static int windowX, windowY;
//asteroid x and y locations
float ax, ay;

void setup()
{
  //Window size
  windowX = 800;
  windowY = 420;
  
  //loads background image
  bg = loadImage("data/space-background1.png");
  //draw background
  size(windowX,windowY);
  //loads the image into the background
  background(bg);
  
  //creates space ship
  S = new SpaceShip();
  //draw space ship
  S.render();
  
  //Creats asteroid 
  A = new Asteroid();
  //runs the asteroid class
  A.run();
}

void draw()
{
  //loads the image into the background
   background(bg);
  //draw space ship
   S.render(); 
   S.setAsteroid(A.getLocation());
   //dodge the incoming asteroids
   S.dodge();
   
  //runs the asteroid class
  A.run();
}

