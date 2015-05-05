//ALL CODE FROM SHIFFMAN THE NATURE OF CODE
Jellyfish j;
Path p;
Bubbles b;
FlowField l;

ArrayBubbles ab;


Obstacles o;
fish f;
shark s;

flock t;

PVector top = new PVector(0,0);
float w = 400;
float d = 400;
float c = 500;
float v = 500;

float a= 60;

float ap = 0;

 boolean state0high = true ; 
 boolean state1med = false ;
 boolean state2low = false;
float oc = 0;

float ms = 4;

void setup() {
  size(800,800);
  
  b = new Bubbles(random(width),height);
  l = new FlowField();
  ab = new ArrayBubbles();
  
  j = new Jellyfish(top,3,.01);
  p = new Path();
  
  o = new Obstacles();
  f = new fish(w,d,ms);
  t = new flock();
  
  

    
  s = new shark(c,v);
  
  
  
}
void draw()
{
  if (state0high == true )
  {
    background(59,59,255);
  }
  if (state1med == true )
  {
    background(170,255,105);
  }
  if (state2low == true )
  {
    background(255,105,102);
  }
  
  b.bubbles();
  b.follow(l);
  ab.air();
  PVector mouseL = new PVector (mouseX,mouseY);
 // o.obstacle();
  
  j.follow(p);
  j.run();

  
  t.swim(mouseL,s.location);

  
  
  s.seek(f.location);
  s.avoid(o.location);
  
  s.update();
  s.hammerhead();
  f.seek(mouseL);
  f.flee(s.location);
  f.update();
  f.salmon();
   
   if (a  > 0)
   {
     a-=1;
     if (oc >4)
     {
       state0high = true ;
       state1med = false ;
       state2low = false;
     }
     if (oc >8)
     {
       state0high = false ;
       state1med = true ;
       state2low = false;
     }
     if (oc >12)
     {
       state0high = false ;
       state1med = false ;
       state2low = true;
     }
     
   }
   else if (a == 0 && oc <16)
   {
     
     t.addfish(new fish(mouseX,mouseY,ms));
     ab.addbubble(new Bubbles(random(width),height));
     a = 60;
     oc += 2;
   }
   

}
void keyPressed()
{
  if (key == CODED)
  {
    if(keyCode == UP)
    {
      oc = -4;
    }
  }
  
}
//ALL CODE FROM SHIFFMAN THE NATURE OF CODE
