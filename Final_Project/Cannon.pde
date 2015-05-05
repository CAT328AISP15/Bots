//This will run the cannon on the right of the screen that is 
//controlled by the player to move and shoot laser at the asteroids.

class Cannon
{
   fireMahLazorz[] Lazers = new fireMahLazorz[5]; // An ArrayList for all the lazers
   PVector location;  //curent location(x and y coordinates)
   PVector velocity;  //curent speed
   int numOfLazers; //will keep track of how many lazers there are
   int maxLazers; //ammount of lazers there can be going at once
   PVector acceleration; //increasing rate of speed
   PVector start;
   PVector force;     //the force to be added to object to move it
   float maxspeed;    // Maximum speed
   boolean edge;     //edge of screen?
   int temp;
   
  Cannon()
  {
    //declare variables
     location = new PVector(780, 210);
     start = new PVector(-100, 200);
     acceleration = new PVector(0, 0);
     velocity = new PVector(0, 0);
     force = new PVector(0,0);
     maxLazers = 5;
     numOfLazers = 0;
     //initalize all the lazer arrays values
     for (int i = 0; i < maxLazers; i++)
       {
       Lazers[i] = new fireMahLazorz(start);
       }
  }
  
  //draws the actual cannon using location pvector
  void render()
  {
    //Draws the main body of the cannon
    fill(192,192,192);
    beginShape();
    vertex(location.x-2, location.y-27);
    vertex(location.x+20, location.y-27);
    vertex(location.x+20, location.y-40);
    vertex(location.x-2, location.y-40);
    endShape();
  }
  
  //runs all the player controlled movement and shooting of the cannon
  void run(PVector asteroid)
  {
      //moves the cannon down
      if(keyCode == DOWN)
      {
        location.y+=8;
      }
      //moves the cannon up
      else if(keyCode == UP)
      {
        location.y-=8;
      }
      
      //fires the lazer from thr cannon
      if(keyCode == ENTER || keyCode == LEFT)
      {
        addLazer(); 
      }
      
      //this is just to stop keyCode from staying up or down
      keyCode = RIGHT;
       
       for (int i = 0; i < maxLazers; i++)
         {
         Lazers[i].run(asteroid);
         }
  }   
  
  
  //checks to see if the cannon is at edge of screen
  int edgeOfScreen()
  {
    //hitting the bottom of the screen
   if(location.y > 780 && location.y < 800)
    {
      return 2;
    } 
    //hitting the top of the screen
    else if(location.y > 20 && location.y < 0)
    {
      return 1;
    }
    //not hitting either edge
    else
    {
     return 0; 
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
  
  //will add the new lazer to array
  void addLazer()
  {
    //dosen't let there be more then maxLazer's amount of lazers
    if(numOfLazers < maxLazers)
      {
        //loops through full array checking for offscreen lazers
        for (int i = 0; i < maxLazers; i++)
           {
            //checks the returned x location value of lazer   
           if(Lazers[i].getX() < 0)
             {
              //moves the lazer back by ship
             Lazers[i].setLocation(location);
             //this is just to break to loop from firing all bullets up
             temp = numOfLazers;
             numOfLazers = maxLazers+1;
             i = maxLazers+1;
             }
           }
      }
      //reset number of lazers
      numOfLazers = temp;
  }
}
