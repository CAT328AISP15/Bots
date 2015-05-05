//When the asteroids are shot by the cannon, they will break into
//pieces and flock until they disapear.
// The Flock (a list of Boid objects)
//This class is a copy of the flocking example from nature of code by Daniel Shiffman
//Class has just been changed to handle asteroid shapes to add to the space environment of project.
class Flock 
{
  ArrayList<small_Asteroids> Asteroids; // An ArrayList for all the boids

  Flock() 
  {
    Asteroids = new ArrayList<small_Asteroids>(); // Initialize the ArrayList
  }

  void run() 
  {
    for (small_Asteroids A : Asteroids) 
    {
      A.run(Asteroids);  // Passing the entire list of boids to each boid individually
    }
  }

  void addAsteroid(small_Asteroids A)
  {
    Asteroids.add(A);
  }

  void remove(int i)
  {
   Asteroids.remove(i); 
  }
}
