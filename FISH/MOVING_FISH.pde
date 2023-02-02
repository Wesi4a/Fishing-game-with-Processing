class Fish {

  float x, y;
  PImage Goldfish;
  int deltaX = 2;
  int deltaY = 1;


  Fish(float FishX, float FishY) {
    x = FishX;
    y = FishY;
  }

  void display() {
    for (int i=0; i<5; i=i+3)
    {
      Goldfish = loadImage("GOLDFISH.png");
      image(Goldfish, x, y, 40, 60);
      x=x+deltaX;
      y=y-deltaY;


      if (x>565)
        deltaX = -deltaX;
      else if (x<= -10)
        deltaX = -deltaX;

      if (y<= 210)
        deltaY = -deltaY;
      else if (y >= 730)
        deltaY = -deltaY;
    }
  }
}
