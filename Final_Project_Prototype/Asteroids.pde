//draws asteroids that will come afly towards the bottom of the screen forcing
//the space ship to dodge them.

class Asteroid
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector force;
  //radius of asteroid
  float r;
  float maxspeed;    // Maximum speed
  boolean edge;     //edge of screen?
   
  //constructor
  Asteroid()
  {
    //declare variables
     location = new PVector(x, y);
     acceleration = new PVector(0, 0);
     velocity = new PVector(0, 0);
     force = new PVector(0,0);
     
     //force for moving asteroid
     force.x = 0;
     force.y = .5;
     
     //locations of asteroid
     location.x = random(10,790); //gives random value from 0 to edge of screen.
     location.y = 15;
    
     maxspeed = 4;
     edge = false;
 }
  
  void run()
  {
    //draws the asteroid based off location's x and y value.
    render();
    
    //checks to see if asteroid hit the bottom of the screen
    edge = edgeCheck();
    
    if(edge == true)
    {
      //resets asteroid back on top of screen and random x value.
     reset();
    }
    
    //moves the asteroids down the screen at the space ship
    applyForce(force);
    
     // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    //add the veocity to the object to move it
    location.add(velocity);
    // Reset accelertion to 0 each cycle
    acceleration.mult(0);
    //draws the asteroid based off location's x and y value.
  }
  
  //used to move the asteroid
   void applyForce(PVector force) 
   {
    acceleration.add(force);
   }
  
  void render() 
  {
    fill(51, 3,3);
    stroke(255);
    ellipse(location.x, location.y, 20, 20);
  }
  
  //Checks to see if asteroid hit the edge of the screen
  boolean edgeCheck()
  {
    //checks for bottom of the screen
    if (location.y > 400)
    {
      return true;
    }
    else
    {
    return false;
    }
  }
  
  //will get the x and y values of where the asteroid is
  PVector getLocation()
  {
    return location;
  }
  
  //sets the location of the asteroid.
  void setLocation(PVector xandy)
  {
    location = xandy;
  }
  
  //restarts the asteroid back on top
  void reset()
  {
     //reset the location of the asteroid on top
     location.x = random(10,790); //gives random value from 0 to edge of screen.
     location.y = 15;
     //no longer on edge of screen so reset
     edge = false;
  }
}
