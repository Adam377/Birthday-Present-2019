//balloon superclass
public abstract class balloon
{
  //members
  protected int x, y, dy;
  private int distance;
  private int yOrig; //stores original value of 'y'
  
  //constructor
  private balloon(int x, int y, int dy)
  {
    this.x = x;
    this.y = y;
    this.dy = dy;
    
    if(this.y == 0) //if 'y' is 0, then balloon moves down the screen
    {
      yOrig = 0;
    }
    else //if 'y' is 1, balloon moves up the screen
    {
      yOrig = 1;
      this.y = height;
    }
  }
  
  //methods
  public void balloonMovement()
  {
    if(yOrig == 0)
    {
      y = y + dy;
    }
    else
    {
      y = y - dy;
    }
  }
  
  //Get/Set Y
  public int getBalloonY()
  {
    return y;
  }
  public void setBalloonY(int y)
  {
    this.y = y;
  }
  
  //Gets overridden in all balloon subclasses
  protected void balloonRender()
  {
  }
  
  private void balloonCollision() //doesn't work
  {
    for(int i=0; i<balloonArray.size(); i++)
    {
      distance = balloonArray.get(i).x - x;
      if(distance <= 30)
      {
        balloonArray.get(i).x += 15;
      }
    }
  }
}
