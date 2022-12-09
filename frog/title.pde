class Title {
  Title() {
  }

  void display() {
    PImage background1 = loadImage("background1.gif");
    PImage kaerustart = loadImage("kaerustart.png");
    PImage title = loadImage("title.png");
    image(background1, 0, 0);
    image(kaerustart,100,500);
    image(title,100,100);
  }
}
