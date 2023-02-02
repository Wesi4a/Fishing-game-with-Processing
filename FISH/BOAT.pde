class BOAT 
{
  boolean boatPointingLeft = true; 
  int x = 240; 
  int y = 120; 
  PImage Boat; 
  

 void render() 
  {
    if ( boatPointingLeft == true ) { 
      Boat = loadImage("BOAT.png");  
    }
    else { 
      Boat =  loadImage("BOAT_RIGHT.png"); 
    }
    image(Boat,x,y); 
  }
}
