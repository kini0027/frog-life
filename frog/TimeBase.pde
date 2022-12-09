class TimerBase {
  int i=0;
  boolean b=false;
  
  TimerBase(){
  } 

  void start(){
    i = millis();
    b = true;
  }

  void display(){
    int timeLeft = getTimeLeft();
    fill( 0,255,0 );
    rect( 120,740,timeLeft*4,28 );
    if(timeLeft==0){
          deathflag=1;
     bgm2.close();
     bgm.play();
    }
  }
  int getTimeLeft(){

    if( 100-(millis()-i)/1000 < 0 ){
      return 0;
    }
    return 100-(millis()-i)/1000;
  }
}
