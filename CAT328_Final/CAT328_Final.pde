/*
  three types of entities: Herbivores, Carnivores, and Plants.
  plants are green, herbs blue, carns red
  all herbs and carns die eventually
  herbs eat plants, carns eat herbs.
  eating increases an entities lifespan by 1 second.
  eating takes .5 seconds to do, pausing the entity in place
  
  every entity has multiply variables for Seek, Flee, Align, Separate, and Cohese for each entity type
  entities who live longer are more likely to pass on their multipliers
  slight mutation rate of 5%, found in EntityManager, for each multiplier.
  
  for balance, multipliers stay between -1 and 1
  for balance, carns move slightly faster than herbs, in case all herbs learn to evade carns at max speed, they can still eat.
  
  Left Click: add an herbivore to the pool
  Right Click: add a carnivore to the pool
  Any Other Mouse Click (middle mouse, etc): add a plant to the pool
*/

public static final int PLANT_COUNT = 30;
public static final int HERB_COUNT = 20;
public static final int CARN_COUNT = 4;
public static final int BG_COLOR = 0xFFFFFFFF;
public static final PVector SCREEN_SIZE = new PVector(800, 800);

public static final int PLANT_COLOR = 0xFF00FF00; //green
public static final int HERB_COLOR = 0xFF0000FF; //blue
public static final int CARN_COLOR = 0xFFFF0000; //red

int lastMilli;

void setup()
{
  //setup screen
  size((int)SCREEN_SIZE.x, (int)SCREEN_SIZE.y);
  
  //create starting entities
  //Plants:
  EntityManager.addType(EntityType.PLANT);
  for(int i = 0; i < PLANT_COUNT; i++)
  {
    Plant p = new Plant();
    p.init(new PVector(random(0, width), random(0, height)), null, null, 1, 0, null);
    p.m_fillColor = PLANT_COLOR;
    p.m_entityType = EntityType.PLANT;
    EntityManager.addEntity(EntityType.PLANT, p);
  }
  
  //Herbivores
  EntityManager.addType(EntityType.HERBIVORE);
  for(int i = 0; i < HERB_COUNT; i++)
  {
    Creature herb = new Creature();
    float[] mults = new float[15];
    for (int j = 0; j < mults.length; j++)
    {
      mults[j] = random(-1, 1);
    }
    herb.init(new PVector(0, width/2), //start position
              new PVector(0, 0), //start rotation
              new PVector(random(-1, 1), random(-1, 1)), //start velocity
              2500, //start life
              5.0f, //max velocity
              mults); //start multipliers
    herb.m_fillColor = HERB_COLOR;
    herb.m_entityType = EntityType.HERBIVORE;
    EntityManager.addEntity(EntityType.HERBIVORE, herb);
  }
  
  //Carnivores
  EntityManager.addType(EntityType.CARNIVORE);
  for(int i = 0; i < CARN_COUNT; i++)
  {
    Creature carn = new Creature();
    float[] mults = new float[15];
    for (int j = 0; j < mults.length; j++)
    {
      mults[j] = random(-1, 1);
    }
    carn.init(new PVector(height/2, 0), //start position
              new PVector(0, 0), //start rotation
              new PVector(random(-1, 1), random(-1, 1)), //start velocity
              2500, //start life
              5.5f, //max velocity, slightly faster than herbs
              mults); //start multipliers
    carn.m_fillColor = CARN_COLOR;
    carn.m_entityType = EntityType.CARNIVORE;
    EntityManager.addEntity(EntityType.CARNIVORE, carn);
  }
}

void draw()
{
  //clear BG
  background(BG_COLOR);
  
  //reset bool to hold if anyone is alive
  EntityManager.anyAlive = false;
  //update entities
  int thisMilli = millis();
//  println(thisMilli - lastMilli);
  EntityManager.updateDT(thisMilli - lastMilli);
  lastMilli = thisMilli;
  
  EntityManager.allLook();
  EntityManager.updateAll();
  EntityManager.checkCollisions();
  EntityManager.renderAll();
  
  if (!EntityManager.anyAlive)
  {
    EntityManager.createNewPopulation();
    println("New Population Created");
  }
}

void mouseClicked()
{
  println("Mouse Clicked");
  if (mouseButton == LEFT) // create a new herbivore
  {
    println("left Clicked");
    Creature herb = new Creature();
    float[] mults = new float[15];
    for (int j = 0; j < mults.length; j++)
    {
      mults[j] = random(-1, 1);
    }
    herb.init(new PVector(mouseX, mouseY), //start position
              new PVector(0, 0), //start rotation
              new PVector(random(-1, 1), random(-1, 1)), //start velocity
              2500, //start life
              5.0f, //max velocity
              mults); //start multipliers
    herb.m_fillColor = HERB_COLOR;
    herb.m_entityType = EntityType.HERBIVORE;
    EntityManager.addEntity(EntityType.HERBIVORE, herb);
  }
  else if (mouseButton == RIGHT) // create carnivore
  {
    println("right Clicked");
    Creature carn = new Creature();
    float[] mults = new float[15];
    for (int j = 0; j < mults.length; j++)
    {
      mults[j] = random(-1, 1);
    }
    carn.init(new PVector(mouseX, mouseY), //start position
              new PVector(0, 0), //start rotation
              new PVector(random(-1, 1), random(-1, 1)), //start velocity
              2500, //start life
              5.5f, //max velocity, slightly faster than herbs
              mults); //start multipliers
    carn.m_fillColor = CARN_COLOR;
    carn.m_entityType = EntityType.CARNIVORE;
    EntityManager.addEntity(EntityType.CARNIVORE, carn);
  }
  else //create plant
  {
    println("other Clicked");
    Plant p = new Plant();
    p.init(new PVector(mouseX, mouseY), null, null, 1, 0, null);
    p.m_fillColor = PLANT_COLOR;
    p.m_entityType = EntityType.PLANT;
    EntityManager.addEntity(EntityType.PLANT, p);
  }
}

