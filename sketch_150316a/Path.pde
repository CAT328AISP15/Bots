class Path
{
  PVector start;
  PVector end;
  
  float radius;
  
  Path()
  {
    radius = 15;
    start = new PVector(0, height/4);
    end = new PVector(width,3*height/4);
  }
}
