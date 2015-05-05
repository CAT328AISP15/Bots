class flock
{
  ArrayList<fish> fishs;
  
  flock()
  {
    fishs = new ArrayList<fish>();
  }
  void swim(PVector target,PVector target1)
  {
    for (fish e : fishs)
    {
      e.swim(fishs, target,target1);
    }
  }
  void addfish(fish e)
  {
    fishs.add(e);
  }
}
