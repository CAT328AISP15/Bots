 //renders and moves the lazorzzz
  class fireMahLazorz
  { 
    Asteroid A;
    Flock flock;
    boolean collision = false;
    PVector location;
    PVector newAsteroid;
    int flockCount = 0;
    int time; //time the mills timer is at when flock is created
    int wait = 1000; //time in milliseconds wait to destroy flock
     //constructor
     fireMahLazorz(PVector locationStart)
    {
      //Creates asteroid 
      A = new Asteroid();
      flock = new Flock();
      location = new PVector(locationStart.x, locationStart.y);
    }
    
    //will run the class and do all the calls from one place
    void run(PVector asteroid)
    {
      render();
      moveLazers();
      collision = checkCollision(asteroid); //will return if collision on object
      //or with wall
      if( collision == true)
      {
        //moves the lazer off screen so it can be used again.
       location.x = -100; 
       //moves asteroid high up enough to delay it while small pieces flock
       newAsteroid = new PVector(random(10,790),-1000);
       A.setLocation(newAsteroid);
       //creates new flock of small asteroids
       for (int i = 0; i < 20; i++)
        {
        flock.addAsteroid(new small_Asteroids(width/2,height/2));
        } 
        time = millis();//store the current time
        flockCount +=20;
      }
      flock.run();
      if(millis() - time >= wait)
      {
        for (int i = 0; i < flockCount/2; i++)
        {
        flock.remove(i);
        } 
        flockCount = 0;
      }
    }
    
    //adds a new lazor to the array if there is room
    void addLazer()
    {
      
    }
    
    //draws all the lazers
    void render()
    {
      //Draws the main body of the cannon
      fill(14,241,249); //a cyan type of color
      beginShape();
      vertex(location.x-2, location.y-32);
      vertex(location.x+20, location.y-32);
      vertex(location.x+20, location.y-36);
      vertex(location.x-2, location.y-36);
      endShape();
    }
    
    //moves all the lazers on their current path
    void moveLazers()
    {
      location.x -= 3;
    }
    
    //checks to see if the lazers hit a asteroid or hit the edge of the screen
    boolean checkCollision(PVector asteroid)
    {
      //check x locations
      if(location.x > asteroid.x-20 && location.x < asteroid.x+20)
      {
        //check x locations
        if(location.y > asteroid.y-20 && location.y < asteroid.y+20)
        {
          return true;
        }
        else
          return false;
      }
     else
       return false;
    }
    
    //returns the x value of where the lazer is
    float getX()
    {
      return location.x;
    }
    
    void setLocation(PVector locationStart)
    {
      location.x = locationStart.x;
       location.y = locationStart.y;
    }
  }
