class Bullet {
  
  int xPosition ;
  int yPosition ; 
  int Bheight ; 
  int Bwidth ; 
  
  Bullet(int x , int y)
  {
    xPosition = x ;
    yPosition = y ;
    Bheight = BULLET_HEIGHT ;
    Bwidth = BULLET_WIDTH ;
  }
  
  void move()
  { 
    if (yPosition > 0)
    {
    yPosition = yPosition - 7 ; 
    }
   
      
    else if(yPosition <= 0)
    {
    yPosition = yPosition - 5;
    if (mousePressed){
    xPosition = thePlayer.x();
    yPosition = thePlayer.y();
    }
    }
 
    
  }
  
  void draw()
  {
    fill (255,215,0);
    circle(xPosition , yPosition , 10);
  }
  
  void collide(Alien theAliens[])
  {
    for (int i = 0 ; i < theAliens.length ; i++)
    {
    if(xPosition + BULLET_WIDTH >= theAliens[i].xpos  &&   xPosition <= theAliens[i].xpos + theAliens[i].Myimage.width
    && yPosition <= theAliens[i].ypos + theAliens[i].Myimage.height && yPosition + BULLET_HEIGHT >= theAliens[i].ypos)
    {
      theAliens[i].die();
    }
    }
  }
  
int x(){
return xPosition ;
}
int y(){
return yPosition ;
}



}
