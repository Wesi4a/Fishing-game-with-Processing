class HOOK
{
  int x = 240;
  int y;
  PImage Hook;

  HOOK(int x, int y)
  {
    this.x = x;
    this.y = y;
  }

  void render()
  {
    Hook = loadImage("Hook.png");
    image(Hook, x, y, 30, 30);
    y=y+1;
  }

  boolean crash()
  {
    color findColour;
    for (int i = y; i < y +20; i++)
    {
      findColour = get (x, i);
      if (findColour == color(255, 127, 0))
      {
        return true;
      }
    }
    return false;
  }
}
