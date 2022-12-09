import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


import processing.net.*;
Client myClient=new Client(this, "127.0.0.1", 65432);


PImage background1;
PImage background2;
PImage background3;
PImage ike;
PImage chara1;
PImage chara2;
PImage chara3;
float charaX=600;
float charaY=300;
float speedXX=0;
float speedYY=0;
int flaggo=1;
int recvInt;

void setup()
{
  size(600, 800);
  ike=loadImage("ike2.jpeg");
  chara1=loadImage("chara1.gif");
  chara2=loadImage("chara2.gif");
  chara3=loadImage("chara3.gif");
  PFont myFont = createFont("MS Gothic", 48, true);
  textFont(myFont);

}

void draw()
{

  image(ike, 0, 0, width, height);
  fill(0, 255, 0);
  rect(0, 700, 150, 100);
  fill(0);
  textSize(50);
  text("帰宅", 25, 770);//帰宅ボタン

  charaX=charaX+speedXX;

  if (myClient.available()>0)
  {
    recvInt=myClient.read();
    charaX=600;
    speedXX=0;
    flaggo=1;
  }
  image(chara3, charaX, charaY);
  charaX=charaX-recvInt;


  if (charaX<200)
  {
    recvInt=0;
  }

  if (flaggo==1)
  {
    if (charaX<0)
    {
      myClient.write(10);
      flaggo=2;
    }
    if (charaX<-400)
    {
      speedXX=0;
    }
  }
  
}

void mousePressed()
{
  if (mouseX>=0&&mouseX<=150&&mouseY>=700&&mouseY<=800)
  {
    speedXX=-10;
  }
}
