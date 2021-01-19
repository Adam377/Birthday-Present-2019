class blueBalloon extends balloon
{
  //members
  private PImage blueBalloonGraphic; 
  
  //constructor
  public blueBalloon(int x, int y, int dy)
  {
    super(x,y,dy);
    
    blueBalloonGraphic = loadImage("balloon_blue.png");
  }
  
  //methods
  @Override
  public void balloonRender()
  {
    image(blueBalloonGraphic, x, y);
  }
}
