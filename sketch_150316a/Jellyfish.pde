class Jellyfish
{
   PVector location;
  PVector velocity;
  PVector acceleration;
  float maxforce;    
  float maxspeed;    
  
  Jellyfish( PVector l, float ms, float mf)
  {
    location = l.get();
    
    maxspeed = ms;
    maxforce = mf;
    acceleration = new PVector(0, 0);
    velocity = new PVector(maxspeed, 0);
  }
  void run() {
    //update();
    display();
  }
  
  void follow(Path p)
  {
     
    PVector predict = velocity.get();
    predict.normalize();
    predict.mult(50);
    PVector predictLoc = PVector.add(location, predict);

   
    PVector a = p.start;
    PVector b = p.end;

    PVector normalPoint = getNormalPoint(predictLoc, a, b);

    PVector dir = PVector.sub(b, a);
    dir.normalize();
    dir.mult(velocity.x);  
    PVector target = PVector.add(normalPoint, dir);

    
    float distance = PVector.dist(predictLoc, normalPoint);
    if (distance > p.radius) 
    {
      seek(target);
    }
  }
  PVector getNormalPoint(PVector p, PVector a, PVector b) 
  {
    
    PVector ap = PVector.sub(p, a);
    PVector ab = PVector.sub(b, a);
    ab.normalize();
    ab.mult(ap.dot(ab));
    PVector normalPoint = PVector.add(a, ab);
    return normalPoint;
  }


  
 

  void applyForce(PVector force) {
    
    acceleration.add(force);
  }


  
  void seek(PVector target) 
  {
    PVector desired = PVector.sub(target, location); 
   
    if (desired.mag() == 0) return;

    
    desired.normalize();
    desired.mult(maxspeed);
    
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  
      applyForce(steer);
  }

  void display() {
    fill(255,39,147);
    ellipse(location.x,location.y,24,24);
    
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
    
    if (location.x > width)
    {
      location.x = 0;
    }
   
  }

  
  void borders(Path p) 
  {
    if (location.x > p.end.x + 4) 
    {
      location.x = p.start.x - 4;
      location.y = p.start.y + (location.y-p.end.y);
    }
  }
}
