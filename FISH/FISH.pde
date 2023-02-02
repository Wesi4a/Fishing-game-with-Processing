PImage background;
int x = 0;
int game = 0;
int Running = 0;
int over = 1;
int deltaX = 0;
int points = 0;
int currentTime;
int countdownTime;
int maxTime;
String s;
Fish[][] grid;

int cols = 5;
int rows = 5;
BOAT Boat;
HOOK Hook;
Timer timer;

void setup()
{
  size(600, 800);
  background = loadImage("seaBackground.jpg");
  background.resize(width, height);
  Boat = new BOAT();
  Hook = null;
  timer  = new Timer(500);
  currentTime = 0;
  maxTime = 100;
  countdownTime = maxTime;

  grid = new Fish[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {

      grid[i][j] = new Fish(i * 55 + 250, j * 65 + 400);
    }
  }
}

void draw()
{
  if (game == Running)
  {
    drawBackground();
    Boat.render();

    textSize(30);
    fill(0, 0, 0);
    text("Points: " + points, 20, 60);

    textSize(30);
    fill(0, 0, 0);
    text("Time: " + countdownTime, 20, 30);

    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        if (grid[i][j] != null) {

          grid[i][j].display();
        }

        if (Hook != null) {
          Hook.render();
          if (Hook.crash()) {
            Hook = null;
            grid[i][j] = null;
            {
              points = points + 1;
            }
          }
        }
      }
      if (timer.complete() == true) {
        if (countdownTime > 0) {
          currentTime++;
          countdownTime --;
          timer.start();
        } else {
          background(77, 166, 255);
          textSize(70);
          fill(0, 0, 0);
          text("Game Finished", 80, 350);
          textSize(30);
          text("YOU LOST ", 220, 450);
          game = over;
        }
      }
    }
  }

  if (points == 25) {

    background(77, 166, 255);
    textSize(70);
    fill(0, 0, 0);
    text("Game Finished", 40, 350);
    textSize(30);
    text("YOU CAUGHT ALL THE FISH!", 90, 450);

    game = over;
  }
}

void drawBackground()
{
  image(background, x, 0);
}


void keyPressed()
{

  if (key == ' ') {
    Hook = new HOOK(Boat.x, Boat.y);
  }

  if (key == CODED) {

    if (keyCode == LEFT)
    {
      if (Boat.x > -7) {
        Boat.boatPointingLeft = true;
        Boat.x = Boat.x - 8;
      }
    }

    if (keyCode == RIGHT)
    {
      if (Boat.x < 496) {
        Boat.boatPointingLeft = false;
        Boat.x = Boat.x + 8;
      }
    }
  }
}
