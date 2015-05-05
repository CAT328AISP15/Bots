//Some credit goes to http://openprocessing.org/sketch/793


class Arrow
{
  float x;
  float y;
  float direction;
 
  Arrow(float xPos, float yPos, float dir)
  {
    x = xPos;
    y = yPos;
    direction = dir;
  }
  
  void render()
  {
    stroke(255);
    strokeWeight(1);
    
    pushMatrix();
    translate(x, y);
    scale(1.5);
    rotate(direction);
    line(-5,0,5,0);
    line(5,0,3,-3);
    line(5,0,3,3);
    popMatrix();
  }
  
}
