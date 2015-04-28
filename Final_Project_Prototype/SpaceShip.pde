//draws the initial spaceship
class SpaceShip
{
  float x, y;
  PVector asteroid;
  
  SpaceShip()
  {
    //Default ship location
    x = 400; 
    y = 400;
    
    asteroid = new PVector(0,0);
  }
  
  void render()
  {
    //draws left wing
    fill(255);
    beginShape();
    vertex(x-30, y);
    vertex(x-20, y);
    vertex(x-20, y-20);
    vertex(x-30, y-20);
    endShape();
    
    fill(255);
    beginShape();
    vertex(x-20, y-10);
    vertex(x-5, y-10);
    vertex(x-5, y-15);
    vertex(x-20, y-15);
    endShape();
    
    //draws right wing
    fill(255);
    beginShape();
    vertex(x+20, y);
    vertex(x+30, y);
    vertex(x+30, y-20);
    vertex(x+20, y-20);
    endShape();
    
    fill(255);
    beginShape();
    vertex(x+20, y-10);
    vertex(x+5, y-10);
    vertex(x+5, y-15);
    vertex(x+20, y-15);
    endShape();
    
    //Draws the center circle of the ship
    fill(255);
    beginShape();
    ellipse(x, y-15, 25, 25);
    endShape();
    
    fill(255,0,0);
    beginShape();
    vertex(x-2, y-27);
    vertex(x+4, y-27);
    vertex(x+4, y-40);
    vertex(x-2, y-40);
    endShape();
  }
  
  //used to dodge the incoming asteroids
  void dodge()
  {
    //checks x range to asteroid
    if(asteroid.x < x+50 && asteroid.x > x-50)
    {
       //checks y range to asteroid
      if(asteroid.y < y+100 && asteroid.y > y-100)
      {
          //method to check if asteroid is to right or left
          //bigger then 0 means asteroid is to right
         if(asteroid.x - x > 0)  
          {
            moveLeft();
          }   
         //smaller then 0 means asteroid is to left
         else if(asteroid.x - x < 0)  
          {
            moveRight();
          }   
      }
    }
  }
  
  //moves the ship to the right to avoid the asteroid
  void moveRight()
  {
    x += 30;
  }
  
  //moves the ship to the left to avoid the asteroid
  void moveLeft()
  {
    x -= 30;
  }
  
  //used to get the location of the ship in x and y values
  PVector getLocation()
  {
    PVector location = new PVector(x,y);
    return location;
  }
  
  //used to set the location of the ship from x and y values
  void setLocation(int x2, int y2)
  {
    x = x2;
    y = y2;
  }
  
  //used to set asteroid from main to make it simplier
  void setAsteroid(PVector temp)
  {
    asteroid = temp;
  }
  
}
