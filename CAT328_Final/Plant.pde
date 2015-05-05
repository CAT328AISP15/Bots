public class Plant extends Entity
{
  public void init(PVector startPos, 
                            PVector startRot, 
                            PVector startVel,
                            int startLife,
                            float maxVel,
                            float[] mults)
  {
    m_position = startPos.get();
    m_colliderType = CollisionType.CIRCLE;
    m_width = 10;
    m_life = startLife;
  }
                            
  public void reset()
  {
    m_life = 1;
  }
   void update()
  {
  }
  
  void render()
  {
    if (!isDead())
    {
      //push matrix
      pushMatrix();
      
      //translate and rotate
      translate(m_position.x, m_position.y);
      
      //draw
      fill(m_fillColor);
      rect(0, 0, m_width, m_width);
      
      //pop matrix
      popMatrix();
    }
  }
  
  public void lookAround(ArrayList<Entity> entityList, EntityType eType)
  {
  }
  
  public void collidedWith(Entity e)
  {
//    println("Collided with: " + e.getType());
    if (e.getType() == EntityType.HERBIVORE)
    {
//      println("Plant eaten");
      m_life = 0;
    }
  }
}
