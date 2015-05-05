class Bee
{
  float direction;
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float r;
  float maxforce;
  float maxspeed;
 
  Bee(float xPos, float yPos, float dir)
  {
    direction = dir;
    
    location = new PVector(xPos, yPos);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    
    maxspeed = 4;
    maxforce = 0.1;
  }
  
  void update()
  {
    followFollowField();
    
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0); 
  }
  
  void applyForce(PVector force)
  {
    acceleration.add(force); 
  }
  
  void followFollowField()
  {
    PVector desired = GridInstance.Instance.lookUpDesiredVector(location);
    desired.mult(maxspeed);
    
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    applyForce(steer);
  }
  
  void render()
  {
    pushMatrix();
    translate(location.x, location.y);
    //rotate(direction);
    
    stroke(#FFFF00);
    strokeWeight(2);
    fill(#FFFF00);
    ellipse(0, 0, 20, 10);
    
    stroke(0);
    strokeWeight(2);
    line(-5, 2.5, -5, -2.5);
    line(5, 2.5, 5, -2.5);
    popMatrix();
  }
}
