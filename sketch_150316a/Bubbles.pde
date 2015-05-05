class Bubbles
{
  float c;
  PVector location;
  float maxspeed;
  float maxforce;
  PVector velocity;
  PVector acceleration;
  
  Bubbles(float x,float y)
  {
    c = random(100,500);
    location = new PVector(x,y);
    maxspeed = 2;
    maxforce = 0.1;
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  void follow(FlowField flow)
  {
   PVector desired = flow.lookup(location);
   desired.mult(maxspeed);
    
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    applyForce(steer);
  }

  void applyForce(PVector force)
  {
    acceleration.add(force);
  }
  
  void bubbles()
  {
    fill(158,237,255);
    ellipse(location.x,location.y,16,16);
    
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
    
    if (location.y<0)
    {
      location.y = height;
    }
  }
  void ArrayBubbles(ArrayList<Bubbles> bubbles)
  {
  }
   void air(ArrayList<Bubbles> bubbles)
  {
    bubbles();
    //ArrayBubbles();
  } 
}
