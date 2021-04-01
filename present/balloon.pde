//balloon superclass
public abstract class balloon
{
  //members
  protected int x, y, dy;
  private int distance;
  private int startPos; //stores original value of 'y'
  
  //constructor
  private balloon(int x, int y, int dy)
  {
    this.x = x;
    this.y = y;
    this.dy = dy;
    
    if(this.y == 0)
    {
      //If the randomly generated value for y is 0, then that balloon will
      //start from the bottom of the screen and move up
      startPos = 0;
    }
    else
    {
      //If the randomly generated value for y is 1, then that balloon will
      //start from the top of the screen and move down
      startPos = 1;
      this.y = height;
    }
  }
  
  //methods
  public void balloonMovement()
  {
    if(startPos == 0)
    {
      //Balloon will start from the bottom of the screen and move up
      //it by increasing its y co-ordinate
      y = y + dy;
    }
    else
    {
      //Balloon will start at top of the screen and move down
      //by decreasing its y co-ordinate
      y = y - dy;
    }
  }
  
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
