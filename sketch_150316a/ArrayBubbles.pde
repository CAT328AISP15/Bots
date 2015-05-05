class ArrayBubbles
{
  ArrayList<Bubbles> bubbles;
  
  ArrayBubbles()
  {
    bubbles = new ArrayList<Bubbles>();
  }
  void air()
  {
    for (Bubbles e : bubbles)
    {
      e.air(bubbles);
    }
  }
  void addbubble(Bubbles e)
  {
    bubbles.add(e);
  }
}
