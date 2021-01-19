//Give to Aneesa 06/10/2019

import java.util.ArrayList;

final int totalBalloons = 30; //MAKE SURE TOTALBALLOONS IS A MULTIPLE OF 3
int balloonCount = totalBalloons;
int frame = 0; //text animation frame count initialisation
ArrayList<balloon> balloonArray = new ArrayList<balloon>();
int popCount = 0;
int popped = 0; //increments when a balloon is 'popped'
cake cakeGraphic;

enum mode{SPLASH, MAIN, END};
mode screen = mode.SPLASH; //creating variable screen of type mode and setting its value to SPLASH

public void setup()
{
  size(1000,500); //width, height
  arrayListSetup();
  cakeGraphic = new cake(50, height-100);
}

public void draw()
{
  switch(screen)
  {
    case SPLASH:
      textAlign(LEFT);
      textSize(40);
      background(0); //black
      text("Press ENTER", width/3, height/2);
      
      textSize(15);
      text("Aneesa's Birthday Present 2019 - created 17/05/2019", 0, 15);//this really didn't need 5 months to develop
      
      text("© Adam Haigh 2019", 0, height-10);
      
      //flame animation runs better at 20FPS
      frameRate(20);
      cakeGraphic.cakeRender();
      
      break;
    
    case MAIN:
      frameRate(60);
      background(#FFC0CB); //pink
      textAnimation();
      
      for(balloon balloonVar : balloonArray) //for every balloon object in the balloonArray arrayList
      {
        if(balloonVar != null)
        {
          balloonVar.balloonMovement();
          balloonVar.balloonRender();
          //balloonVar.balloonCollision();
        }
      }
      
      for(int i=0; i<balloonArray.size(); i++)
      {
        if(balloonArray.get(i).getBalloonY()>=height || balloonArray.get(i).getBalloonY()<=-35) //if a balloon goes off-screen, it is removed from the arrayList
        {
          balloonArray.remove(i);
          popCount++;
          println("popCount = " + popCount);
        }
      }
      
      if(popCount == balloonCount) //if all the balloons have been removed from the screen, you can go to the end screen
      {
        textSize(20);
        text("Press ENTER", width/2, height-15);
      }
      break;
    
    case END:
      background(#8B008B); //dark magenta
      fill(255);
      textSize(35);
      textAlign(CENTER);
      text("Point of Intersection = Simultaneous Equations", width/2, height/2); //Year 12
      textSize(20);
      text("1 + tan2(x) = sec2(x)", width/2,height/1.5); //trig identity
      
      textSize(20);
      text("Click to restart", width/2, height-15);
      
    default:
      break;
  }
}

public void arrayListSetup()
{
  for(int i=0; i<totalBalloons/3; i++) //1/3 blue, 1/3 green, 1/3 red
  {
    balloonArray.add(new blueBalloon(int(random(10,width-50)), int(random(2)), int(random(1,5)))); //x, y, dy
  }
  for(int i=0; i<totalBalloons/3; i++)
  {
    balloonArray.add(new greenBalloon(int(random(10,width-50)), int(random(2)), int(random(1,5)))); //x, y, dy
  }
  for(int i=0; i<totalBalloons/3; i++)
  {
    balloonArray.add(new redBalloon(int(random(10,width-50)), int(random(2)), int(random(1,5)))); //x, y, dy
  }
}

public void textAnimation()
{  
  //println("frame = " + frame);
  textSize(40);
  textAlign(LEFT);
  text("HAPPY BIRTHDAY", width/3, 200);
  text("ANEESA!", width/2.5, 300); //birthday message. Could've thought of something more original
  text("HAVE AN AMAZING DAY!", width/4, 400);
  
  frame++;
  
  if(popCount != balloonCount) //animation runs while not all the balloons have been popped
  {
    switch(frame)
    {
      case 1: //first frame
        fill(255); //white
        break;
        
      case 30: //after 30 frames
        fill(255,215,0); //gold
        break;
        
      case 60: //after 60 frames
        fill(255, 165, 0); //orange
        break;
        
      case 90: //after 90 frames
        frame=0; //reset frame counter
        break;
        
      default:
        break;
    }
  }
  else
  {
    fill(255);
  }
}

public void keyPressed()
{
  if(key == ENTER && screen == mode.SPLASH) //if you're on the start screen
  {
    screen = mode.MAIN;
  }
  
  if(key == ENTER && screen == mode.MAIN && popCount == balloonCount) //you can go to the next screen when all the balloons have 'popped'
  {
    screen = mode.END;
  }
}

public void mousePressed() //click on the balloons to 'pop' them
{
  for(int i=0; i<balloonArray.size(); i++)
  {
    if(balloonArray.get(i).x<mouseX && balloonArray.get(i).x+30>mouseX && balloonArray.get(i).y<mouseY && balloonArray.get(i).y+30>mouseY) //if the mouse is in the balloon graphic
    {
      balloonArray.remove(i);
      balloonCount--;
      
      popped++; //for debugging purposes
      println("popped = " + popped);
    }
  }
  
  if(screen == mode.END) //reset varaibles when the code 'restarts'
  {
    screen = mode.SPLASH;
    popCount = 0;
    balloonCount = totalBalloons;
    frame = 0;
    arrayListSetup();
  }
}
