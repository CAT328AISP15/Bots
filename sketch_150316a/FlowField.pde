class FlowField
{
  PVector[][] field;
  int cols, rows;
  int resolution;
  
  FlowField()
  {
    resolution = 10;
    cols = width/ resolution;
    rows = height / resolution;
    field = new PVector[cols][rows];
    
    init();
  }
  void init()
  {
    for (int i = 0; i < cols; i++)
    {
      for ( int j = 0; j < rows; j++)
      {
        field[i][j] = new PVector(random(-1,1),random(-1,-2));
      }
    }
  }
  PVector lookup(PVector lookup)
  {
    int column = int(constrain(lookup.x/resolution,0,cols-1));
    int row = int(constrain(lookup.y/resolution,0,rows-1));
    return field[column][row].get();
  }
}
