//draws the initial spaceship
class SpaceShip
{
  float x, y;
  
  SpaceShip()
  {
   x = 330; 
   y = 440;
  }
  
  void render(float x, float y)
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
  
}
