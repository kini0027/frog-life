class Scene3 {
  Scene3() {
  }


  void display() {
    PImage background3 = loadImage("background3.gif");
    PImage chara3 = loadImage("chara3.gif");  
    PImage cloud = loadImage("cloud.gif");  

    image(background3, 0, 0);

    if (mouseX>=100&&mouseX<=200&&mouseY>=8&&mouseY<=110) {
      image(cloud, 0, 90);
      String url = "http://weather.livedoor.com/forecast/rss/area/130010.xml";
      XML xml = loadXML( url );
      XML [] item = xml.getChild("channel").getChildren("item");
      fill(0);
      for ( int i=1; i<4; i++ ) {
        text( item[i].getChild("title").getContent(), 30, 20*i+123);
      }
    }
        if (flaggo==1)
    {
      if (charaX<0)
      {
        myServer.write(10);
        flaggo=2;
        speedX=0;
      }
    }
    charaX=charaX+speedX;
    charaY=charaY+speedY;

    Client nextClient=myServer.available();
    if (nextClient!=null)
    {
      charaX=600;
      charaY=300;
      flaggo=1;
      recvInt=nextClient.read();
    }
    image(chara3, charaX, charaY);
    charaX=charaX-recvInt;


    if (charaX<200)
    {
      recvInt=0;
    }
    if (charaX>300)
    {
      speedX=0;
    }
    if (charaX<-400)
    {
      speedX=0;
    }//スピード設定

    if (charaY<=200)
    {
      speedY=5;
    }
    if (charaY>=301)
    {
      speedY=0;
      speedX=-10;
    }
        PImage smile = loadImage("smile.gif"); 

     // timerbase= new TimerBase();
 // timerbase.display();
  //image(smile, 25, 720);
}
}
