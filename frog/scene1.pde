class Scene1 {
  Scene1() {
  }

  void display() {
    PImage background1 = loadImage("background1.gif");
    PImage chara1 = loadImage("chara1.gif");  
    image(background1, 0, 0);
    image(chara1, 200, 340, 160, 210);
            PImage smile = loadImage("smile.gif"); 

   //   timerbase= new TimerBase();
  //timerbase.display();
  //image(smile, 25, 720);
  }
}
