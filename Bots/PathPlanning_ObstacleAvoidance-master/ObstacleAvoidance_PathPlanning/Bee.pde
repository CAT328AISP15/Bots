class Bee
{
  float direction;
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float r;
  float maxforce;
  float maxspeed;
  
  float desiredSeparation;
 
  Bee(float xPos, float yPos, float dir)
  {
    direction = dir;
    
    location = new PVector(xPos, yPos);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    
    maxspeed = 4;
    maxforce = 0.1;
    
    r = 10;
    
    desiredSeparation = r * 2;
  }
  
  void run(ArrayList<Bee> bees, PVector target)
  {
    flock(bees);
    //applyForce(seek(target));
    update();
    render(); 
  }
  
  void flock(ArrayList<Bee> bees)
  {
    PVector sep = separate(bees);
    PVector ali = align(bees);
    PVector coh = cohesion(bees);
   
    sep.mult(1.5);
    ali.mult(1.0);
    coh.mult(1.0);
   
    applyForce(sep);
    applyForce(ali);
    applyForce(coh); 
  }
  
  void update()
  {
    if(location.x > width)
      location.x = 0;
    if(location.x < 0)
      location.x = width;
    if(location.y > height)
      location.y = 0;
    if(location.y < 0)
      location.y = height;
    
    followFollowField();
    
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0); 
  }
  
  PVector seek(PVector target)
  {
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    
    return steer;
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
  
  PVector separate(ArrayList<Bee> bees)
  {
    PVector sum = new PVector();
    int count = 0;
   
    for(Bee other : bees)
    {
      float d = PVector.dist(location, other.location);
      
      if( (d > 0) && (d < desiredSeparation))
      {
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();
        diff.div(d);
        sum.add(diff);
        count++; 
      }
    }
   
    if(count > 0)
    {
      sum.div(count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxforce);
      
      return steer;
    }
    else
    {
      return new PVector(0,0); 
    }
  }
  
  PVector cohesion(ArrayList<Bee> bees)
  {
    float neighborBees = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
   
    for(Bee other : bees)
    {
      float d = PVector .dist(location, other.location);
      
      if((d > 0) && (d < neighborBees))
      {
        sum.add(other.location);
        count++; 
      }
    }
   
    if(count > 0)
    {
      sum.div(count);
      return seek(sum);
    }
    else
    {
      return new PVector(0, 0); 
    }
  }
  
  PVector align(ArrayList<Bee> bees)
  {
    float neighborBees = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
   
    for(Bee other : bees)
    {
      float d = PVector.dist(location, other.location);
      
      if((d > 0) && (d < neighborBees))
      {
        sum.add(other.velocity);
      }
    }
    
    if(count > 0)
    {
      sum.div(count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxforce);
     
      return steer; 
    }
    else
    {
      return new PVector(0, 0); 
    }
  }
  
  void render()
  {
    float theta = velocity.heading();
    
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    
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
