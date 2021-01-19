class redBalloon extends balloon
{
  //members
  private PImage redBalloonGraphic; 
  
  //constructor
  public redBalloon(int x, int y, int dy)
  {
    super(x,y,dy);
    
    redBalloonGraphic = loadImage("balloon_red.png");
  }
  
  //methods
  @Override
  public void balloonRender()
  {
    image(redBalloonGraphic, x, y);
  }
}
