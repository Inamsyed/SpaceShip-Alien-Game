class Alien {
  
  int xpos ;
  int ypos ; 
  boolean MoveBack ;
  PImage Myimage ;
  PImage explodeImage ;
  int status ; 
  

  
  Alien(int xpos , int ypos , PImage okImage , PImage exImage)
  {
    this.xpos = xpos ; 
    this.ypos = ypos ; 
    MoveBack = false ;
    Myimage = okImage ; 
    explodeImage = exImage;
    status = ALIEN_ALIVE ;
  }
  
  void draw ()
  {
    if (status == ALIEN_ALIVE)
    {
   image(Myimage , xpos , ypos ) ;
    }
   else if (status != ALIEN_DEAD)
   {
     image(explodeImage , xpos , ypos);
     status ++ ;
   }
   
  }
  
  void die(){
    if(status==ALIEN_ALIVE)
     status++;
  }
    
  
  void move()
  {
    if (xpos + Myimage.width >= SCREENX)
    {
      ypos = ypos + Myimage.height ;
      MoveBack = true ; 
    }
    
    else if (xpos < 0)
    {
      ypos = ypos + Myimage.height ;
      MoveBack = false ;
    }
    
    if (MoveBack == true)
    {
      xpos = xpos - 2 ;
    }
    else if (MoveBack == false )
    {
      xpos = xpos + 2 ;
    }
    
  }
  
  
  

}
