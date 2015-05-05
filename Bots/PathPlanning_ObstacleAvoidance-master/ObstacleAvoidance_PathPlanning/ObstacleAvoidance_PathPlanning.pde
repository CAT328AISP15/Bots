Grid grid;
ArrayList<Cell> path;

Bee testBee;

void setup()
{
   size(1280, 768);
   smooth();
   
   grid = new Grid(20, 12, 64);
   GridInstance.Instance = grid;
   
   Cell startingCell = GridInstance.Instance.GetCell(5, 5);
   Cell targetCell = GridInstance.Instance.GetCell(5, 9);
   
   path = Pathfinder.GetPath(startingCell, targetCell);
   
   
   for(int x = 0; x < path.size(); x++)
   {
     path.get(x).IsPathUnWalked = true;
   }
   
   testBee = new Bee(100, 100, 0);
}

void draw()
{
   grid.render();
   testBee.update();
   testBee.render();
}
