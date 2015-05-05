class Flock
{
  ArrayList<Bee> bees;
 
  Flock()
  {
    bees = new ArrayList<Bee>();
  }
  
  void run(PVector target)
  {
    for(Bee b : bees)
    {
      b.run(bees, target); 
    }
  }
  
  void flowrun()
  {
    for(Bee b : bees)
    {
      b.run(bees, GridInstance.Instance.lookUpDesiredVector(b.location));
    } 
  }
  
  void seperateFromFlock(ArrayList<Bee> flockTarget)
  {
    for(Bee b : bees)
    {
      PVector sep = b.separate(flockTarget);
      b.applyForce(new PVector(sep.x * 20, sep.y * 20));
    }
  }
  
  void addBees(Bee b)
  {
    bees.add(b); 
  }
}
