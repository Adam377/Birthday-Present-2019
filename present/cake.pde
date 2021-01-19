//cake is a lie
class cake
{
  //members
  private int x, y, fireFrame=0;
  private PImage fireFlame1, fireFlame2, fireFlame3, fireFlame4, fireFlame5, fireFlame6, fireFlame7, fireFlame8;
  
  //constructor
  public cake(int x, int y)
  {
    this.x = x;
    this.y = y;
    
    fireFlame1 = loadImage("flame1.png");
    fireFlame2 = loadImage("flame2.png");
    fireFlame3 = loadImage("flame3.png");
    fireFlame4 = loadImage("flame4.png");
    fireFlame5 = loadImage("flame5.png");
    fireFlame6 = loadImage("flame6.png");
    fireFlame7 = loadImage("flame7.png");
    fireFlame8 = loadImage("flame8.png");
  }
  
  //methods
  public void cakeRender()
  {    
    rectMode(CORNER);
    rect(x,y,100,50); //cake base - add colour later
    rect(x*2,y-30,5,30); //candle
    
    fireFrame++;
    switch(fireFrame) //flame animation
    {
      case 0:
        image(fireFlame1,x+35,y-55,30,30);
        break;
        
      case 1:
        image(fireFlame2,x+35,y-55,30,30);
        break;
        
      case 2:
        image(fireFlame3,x+35,y-55,30,30);
        break;
        
      case 3:
        image(fireFlame4,x+35,y-55,30,30);
        break;
        
      case 4:
        image(fireFlame5,x+35,y-55,30,30);
        break;
        
      case 5:
        image(fireFlame6,x+35,y-55,30,30);
        break;
        
      case 6:
        image(fireFlame7,x+35,y-55,30,30);
        break;
        
      case 7:
        image(fireFlame8,x+35,y-55,30,30);
        fireFrame=0;
        break;
        
      default:
        break;
    }
  }
}
