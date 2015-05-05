public class Creature extends Entity
{
  public float plantSeekMult, plantFleeMult, plantAlignMult, plantSeperateMult, plantCoheseMult; 
  public float herbSeekMult, herbFleeMult, herbAlignMult, herbSeperateMult, herbCoheseMult;
  public float carnSeekMult, carnFleeMult, carnAlignMult, carnSeperateMult, carnCoheseMult;
  
  PVector m_startPos, m_startRot, m_startVel;
  int m_startLife;
  
  boolean m_isEating = false;
  public float m_eatTime = 500.0f;
  float m_curEatTime = 0.0f;
  
  Creature()
  {
    m_maxLookDistance = 50;
    m_fillColor = 0xffffffff;
    m_width = 20;
  }
  
  public void init(PVector startPos, 
                   PVector startRot, 
                   PVector startVel,
                   int startLife,
                   float maxVel,
                   float[] mults)
  {
    plantSeekMult = mults[0];
    plantFleeMult = mults[1];
    plantAlignMult = mults[2];
    plantSeperateMult = mults[3];
    plantCoheseMult = mults[4];
    herbSeekMult = mults[5];
    herbFleeMult = mults[6];
    herbAlignMult = mults[7];
    herbSeperateMult = mults[8];
    herbCoheseMult = mults[9];
    carnSeekMult = mults[10];
    carnFleeMult = mults[11];
    carnAlignMult = mults[12];
    carnSeperateMult = mults[13];
    carnCoheseMult = mults[14];
    
    m_startPos = startPos;
    m_startRot = startRot; 
    m_startVel = startVel;
    m_startLife = startLife;
    m_maxSpeed = maxVel;
    m_colliderType = CollisionType.CIRCLE;
    
    reset();
  }
  
  public void reset()
  {
    m_position = m_startPos;
    m_velocity = m_startVel;
    m_life = m_startLife;
    m_lifespan = 0;
    m_fitness = 0.0f;
  }
  
  void update()
  {
    m_isEating = m_curEatTime > 0.0f;
    if (!m_isEating)
    {
      m_curEatTime = 0.0f;
      updatePosition();
      wrapAround();
    }
    else
    {
//      println("eating" + m_curEatTime + " dt: " + m_dt);
      m_curEatTime -= m_dt;
    }
  }
  
  void render()
  {
    if(!isDead())
    {
      EntityManager.anyAlive = true;
      //push matrix
      pushMatrix();
      
      //translate and rotate
      translate(m_position.x, m_position.y);
      
      //draw
      fill(m_fillColor);
      ellipse(0, 0, m_width, m_width);
      
      //pop matrix
      popMatrix();
    }
  }
  
  void lookAround(ArrayList<Entity> entityList, EntityType eType)
  {
    PVector sepForce = separate(entityList);
    PVector alignForce = align(entityList);
    PVector coheseForce = cohesion(entityList);
    PVector fleeForce = cohesion(entityList);
    PVector seekForce = cohesion(entityList);
    
    switch (eType)
    {
      case HERBIVORE:
        sepForce.mult(herbSeperateMult);
        alignForce.mult(herbAlignMult);
        coheseForce.mult(herbCoheseMult);
        fleeForce.mult(herbFleeMult);
        seekForce.mult(herbSeekMult);
        break;
        
      case CARNIVORE:
        sepForce.mult(carnSeperateMult);
        alignForce.mult(carnAlignMult);
        coheseForce.mult(carnCoheseMult);
        fleeForce.mult(carnFleeMult);
        seekForce.mult(carnSeekMult);
        break;
        
      default: //plant
        sepForce.mult(plantSeperateMult);
        alignForce.mult(plantAlignMult);
        coheseForce.mult(plantCoheseMult);
        fleeForce.mult(plantFleeMult);
        seekForce.mult(plantSeekMult);
    }
    
    applyForce(sepForce);
    applyForce(alignForce);
    applyForce(coheseForce);
    applyForce(fleeForce);
    applyForce(seekForce);
  }
  
  public void collidedWith(Entity e)
  {
    if (getType() == EntityType.HERBIVORE) // this creature is an herbivore
    {
      if (e.getType() == EntityType.PLANT)
      {
//        println("Eating a plant");
        m_curEatTime = m_eatTime;
        m_life += 1000;
      }
      else if (e.getType() == EntityType.CARNIVORE)
      {
        m_life = 0;
      }
    }
    else if (getType() == EntityType.CARNIVORE) // this creature is a carnivore
    {
      if (e.getType() == EntityType.HERBIVORE)
      {
        m_curEatTime = m_eatTime;
        m_life += 1000;
      }
    }
  }
}







