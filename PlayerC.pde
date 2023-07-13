
class Player{
  
  int x ; 
  int y ; 
  color playerColor = color(250, 100, 0);
  
  PImage spaceshipImage = loadImage("spaceship.PNG");
  
  Player(int y ) // constructor , How player would look like initially
  { 
    
    this.x = SCREENX/2; // this objects initial x position .
    this.y = y ; // this objects initial y position 
  }

void move (int x) // how the player will move and the limits to its movement
{
  
  if (x >= SCREENX - PADDLEWIDTH ) 
  {
    this.x = SCREENX - PADDLEWIDTH ; 
  }
  
  else
  {
    this.x = x ; 
  }
  
  
}

void draw()
{
  image(spaceshipImage, this.x, this.y, 75, 75);
  
}

int x(){
return x;
}
int y(){
return y;
}

  
}
