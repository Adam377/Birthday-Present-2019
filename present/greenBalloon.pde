class greenBalloon extends balloon
{
  //members
  private PImage greenBalloonGraphic; 
  
  //constructor
  public greenBalloon(int x, int y, int dy)
  {
    super(x,y,dy);
    
    greenBalloonGraphic = loadImage("balloon_green.png");
  }
  
  //methods
  @Override
  public void balloonRender()
  {
    image(greenBalloonGraphic, x, y);
  }
}
