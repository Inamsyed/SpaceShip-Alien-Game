class Bomb {
  
  int x ; 
  int y ; 
  PImage BombImage ; 
  
  Bomb(int x , int y  , PImage BombImg)
  {
    this.x = x ;
    this.y = y ;
    this.BombImage = BombImg ;
  }
  
  void move()
  {
    y = y + 3 ;
  }
  
  void draw()
  {
    image(BombImage, x , y);
    BombImage.resize(0,35);
  }
  
  boolean offScreen()
  {
    if(y > SCREENY)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  boolean collide(Player thePlayer)
  {
    if (x + BombImage.width >= thePlayer.x && x <= thePlayer.x + PADDLEWIDTH
    && y + BombImage.height  >= thePlayer.y + PADDLEHEIGHT && y <= thePlayer.y+PADDLEHEIGHT )
    {
      return true ;
    }
    else
    {
      return false ;
    }
  }
  
}
