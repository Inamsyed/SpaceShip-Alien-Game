
Player thePlayer ;
Alien  theAliens[] ; 
Bullet theBullet ; 
Bomb   theBomb ; 

PImage blast ;
PImage x ; 

void settings()
{
  size (SCREENX , SCREENY);
}

void setup()
{ 
  PImage normalImg ;
  PImage explodeImg ; 
  PImage bombImage ; 
  
  blast = loadImage("BombBlast.png");
  normalImg = loadImage("invader.GIF");
  explodeImg = loadImage("exploding.GIF");
  bombImage = loadImage("Bomb.png");
  x = loadImage("pngwing.com (1).png");
  x.resize(650 , 450);

  
  theAliens = new Alien[10]; // setting up new array of Aliens
  thePlayer = new Player(SCREENY - 62);
  theBullet = new Bullet((thePlayer.x() + (PADDLEWIDTH/2)) , thePlayer.y());
  theBomb = new Bomb(10 , 10, bombImage);
  
  PFont myFont = loadFont("VerdanaPro-CondBlack-48.vlw");
  textFont(myFont);
  
  init_aliens(theAliens , normalImg , explodeImg);
  
}

void init_aliens(Alien theAlienArrayPassedIn[] , PImage okImg , PImage ExImg)
{
  for (int i = 0 ; i < theAlienArrayPassedIn.length ; i++)
  {
    theAlienArrayPassedIn[i] = new Alien(i*(okImg.width + GAP ), 10 , okImg , ExImg);
  }
}


void draw()
{
  background (x);
  //image(x , 650 , 450);
  
  thePlayer.move(mouseX);
  thePlayer.draw();
  
 
  theBullet.draw();
  theBullet.move();
  theBullet.collide(theAliens);
  
  theBomb.draw();
  theBomb.move();
  theBomb.offScreen();
  theBomb.collide(thePlayer);
  
  if (theBomb.collide(thePlayer) == true )
  {
    fill (255, 255 , 255);
    text("GAME OVER" , 200, 200);
    text("ALIEN WINS " ,200, 250);
    image( blast , theBomb.x , theBomb.y , 40 , 40);
    noLoop();
  }
  
  for (int i = 0 ; i < theAliens.length ; i++)
  {
  theAliens[i].draw(); 
  theAliens[i].move();
  }
  
  if (theBomb.offScreen() == true)
  {
    int i = int(random(0, theAliens.length));
    if(theAliens[i].status == ALIEN_ALIVE)
    {
    theBomb.x = theAliens[i].xpos ;
    theBomb.y = theAliens[i].ypos ;
    }
   
  }
  
  int count = 0 ; 
  for (int z = 0 ; z < theAliens.length ; z++)
  {
    if (theAliens[z].status == ALIEN_ALIVE)
    {
      count ++ ;
    } //<>// //<>//
  }
  
  if (count == 0)
  {
    fill (255 , 255 , 255);
    text("GAME OVER" , 200, 200);
    text("YOU WIN " , 200, 250);
    noLoop();
  }
  image(x , 650 , 450);
 
  
}
