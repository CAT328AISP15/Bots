//Some credit goes to http://openprocessing.org/sketch/793

public class Grid
{
  Cell[][] Cells;
  PVector[][] FlowField;
  
  Arrow[] arrows;
  
  int GridWidth;
  int GridHeight;
  int CellSize; 
  
  public Grid(int gWidth, int gHeight, int cSize)
  {
    GridWidth = gWidth;
    GridHeight = gHeight;
    CellSize = cSize;
    
    Cells = new Cell[GridWidth][GridHeight];
    FlowField = new PVector[GridWidth][GridHeight];
    
    arrows = new Arrow[GridWidth * GridHeight];
    
    CreateGrid();
  }
  
  void CreateGrid()
  {
    for(int x = 0; x < GridWidth; x++)
    {
      for(int y = 0; y < GridHeight; y++)
      {
        Cell cell = new Cell(x * CellSize, y * CellSize, CellSize);
        
        //These are walls
        if(x == 3 && y == 2 ||
            x == 3 && y == 3 ||
            x == 7 && y == 2 ||
            x == 7 && y == 3 ||
            x == 3 && y == 7 ||
            x == 4 && y == 7 ||
            x == 5 && y == 7 ||
            x == 6 && y == 7 ||
            x == 7 && y == 7)
          cell.IsWall = true;
        else
          cell.IsGrass = true;
          
        Cells[x][y] = cell;
        FlowField[x][y] = PVector.random2D();
        
        float dir = atan2(FlowField[x][y].y, FlowField[x][y].x);
        
        float xOffset = (width/GridWidth) / 2;
        float yOffset = (height/GridHeight) / 2;
        
        arrows[x + (y * GridWidth)] = new Arrow (x * (width/GridWidth) + xOffset, y * (height/GridHeight) + yOffset, dir);
      }
    }
  }
  
  Cell GetNearestCell(int worldX, int worldY)
  {
    worldX /= CellSize;
    worldY /= CellSize;
   
    int xCell = (int)round(worldX);
    int yCell = (int)round(worldY);
   
    return GetCell(xCell, yCell); 
  }
  
  //This is not cell at world coordinate but cell at matrix 
  Cell GetCell(int x, int y)
  {
    if(x < 0 || y < 0 || x > GridWidth || y > GridHeight) return null;
   
    return Cells[x][y]; 
  }
  
  PVector lookUpDesiredVector(PVector lookUp)
  {
    int column = int(constrain(lookUp.x / CellSize, 0, GridWidth - 1));
    int row = int(constrain(lookUp.y / CellSize, 0, GridHeight - 1));
   
    return FlowField[column][row].get();
    /*
    int wX = (int)lookUp.x;
    int wY = (int)lookUp.y;
    
    wX /= CellSize;
    wY /= CellSize;
    
    int fX = (int)round(wX);
    int fY = (int)round(wY);
    
    if(fX < 0 || fY < 0 || fX > GridWidth || fY > GridHeight) return null;
    
    return FlowField[fX][fY].get();
    */
  }
  
  void render()
  {
    for(int x = 0; x < GridWidth; x++)
    {
      for(int y = 0; y < GridHeight; y++)
      {
        Cells[x][y].render();
        
        arrows[x + (y * GridWidth)].render();
      }
    } 
  }
}
