import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import processing.net.*;
Server myServer=new Server(this, 65432);

Minim minim;
AudioPlayer bgm;
AudioPlayer bgm2;
AudioPlayer gero;

Scene1 scene1;
Scene2 scene2;
Scene3 scene3;
TimerBase timerbase;
Title title;
Death death;

int [] HP =new int [1];
float charaX=200;
float charaY=300;
float speedX=0;
float speedY=0;
int flaggo=1;
int start;
int recvInt;
int foodcount=0;
int button=0;
int deathflag=0;

void setup() {
  size(600, 800);
  background(255); 
  String [] lines = loadStrings("HP.txt");
  HP[0]= int(lines[0]);
  minim = new Minim(this);
      bgm = minim.loadFile("kaerusong.mp3");
  bgm2 = minim.loadFile("retropark.mp3");
  bgm2.play();
}



void mousePressed() {
  if (mouseX>100&&mouseX<500&&mouseY>500&&mouseY<700) {
    button=1;
    minim = new Minim(this);
    gero = minim.loadFile("frog1.mp3");
    gero.play();
  }

  if (mouseX>0&&mouseX<90&&mouseY>8&&mouseY<93) {
    HP[0]++;
    minim = new Minim(this);
    gero = minim.loadFile("frog1.mp3");
    gero.play();
  }
  if (mouseX>=510&&mouseX<=600&&mouseY>=8&&mouseY<=90) {
    saveStrings( "HP.txt", str(HP));
  }
  if (mouseX>=200&&mouseX<=300&&mouseY>=8&&mouseY<=108) {
    speedY=-10;
  }
  if(HP[0]>=8){
  if (mouseX>=300&&mouseX<=430&&mouseY>=8&&mouseY<=88) {
    deathflag=1;
     bgm2.close();
     bgm.play();
  }
  }
}

void draw() {
  PImage food = loadImage("mosquito.gif");  
  PImage foodG = loadImage("mosquito2.gif");
  PImage sun = loadImage("sun.gif");  
  PImage sunG = loadImage("sun2.gif"); 
  PImage sleep = loadImage("sleep.gif");  
  PImage sleepG = loadImage("sleep2.gif"); 
  PImage cloud = loadImage("cloud.gif");  
  PImage step = loadImage("step.gif"); 
  PImage stepG = loadImage("step2.gif");  
  PImage heart = loadImage("heart.gif");  
    PImage smile = loadImage("smile.gif"); 

  if (button==0) {
    title = new Title();
    title.display();
  } else if (button==1) {
    scene1 = new Scene1();
    scene1.display();
  }
  if (HP[0]>3&&HP[0]<=8) {
    scene2 = new Scene2();
    scene2.display();
  }
  if (HP[0]>=8) { 
    scene3 = new Scene3();
    scene3.display();
  }
  image(food, 10, 8);
  image(sun, 100, 8);
  image(step, 200, 8);
  image(sleep, 510, 10);
  image(heart, 300, 10);
  if (mouseX>=10&&mouseX<=90&&mouseY>=8&&mouseY<=93) {
    image(foodG, 0, 0);
  }
  if (mouseX>=100&&mouseX<=200&&mouseY>=8&&mouseY<=110) {
    image(sunG, 90, 0);
  }
  if (mouseX>=200&&mouseX<=300&&mouseY>=8&&mouseY<=108) {
    image(stepG, 190, 0, 95, 95);
  }
  if (mouseX>=300&&mouseX<=430&&mouseY>=8&&mouseY<=80) {
    image(heart, 285, 6, 160, 88);
  }
  if (mouseX>=510&&mouseX<=600&&mouseY>=8&&mouseY<=90) {
    image(sleepG, 498, -7);
  }
    if (deathflag==1) {
    death = new Death();
    death.display();
  }

}
void stop() {
  bgm.close();
    bgm2.close();
  minim.stop();
  super.stop();
  myServer.stop();
}
