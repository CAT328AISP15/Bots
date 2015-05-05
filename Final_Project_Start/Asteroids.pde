//draws asteroids that will come afly towards the bottom of the screen forcing
//the space ship to dodge them.

class Asteroid
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  void run(int x, int y)
  {
   
  }
  
  //used to move the asteroid
   void applyForce(PVector force) 
   {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }
}
