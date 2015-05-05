//Dylan Conley
//CAT328AISP15/Final Project
//4/21/15
/* The spaceship will dodge incoming asteroids automatically but
the player can move and fire the cannon on the right of the screen
to destroy the asteroids before they reach the ship.

The cannon will be moved with the arrow keys and fired with the 
left arrow or enter key.

When the asteroids are destroyed they will break into smaller pieces 
and flock off the screen  until they disapear.

/* @pjs preload="data/space-background1.png"; */
PImage bg;
SpaceShip S;
Asteroid A;
Cannon C;
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
  
  //creates cannon
  C = new Cannon();
  //draw space ship
  C.render();
  
  //Creates asteroid 
  A = new Asteroid();
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
   
   //runs the movement and firing of cannon
   C.run(A.getLocation());
   //draws the cannon
   C.render();
   
  //runs the asteroid class
   A.run();
}

