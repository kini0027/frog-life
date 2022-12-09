class Scene2 {

  Scene2() {
  }

  void display() {
    PImage background2 = loadImage("background2.gif");
    PImage chara2 = loadImage("chara2.gif");  
    PImage cloud = loadImage("cloud.gif");  
    image(background2, 0, 0);
    image(chara2, 260, 390);
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
        PImage smile = loadImage("smile.gif"); 

    //  timerbase= new TimerBase();
  //timerbase.display();
  //image(smile, 25, 720);
  }
}
