import processing.sound.*;
import processing.serial.*;

Serial port;
final String serialName = "COM4";
SoundFile[] notes = new SoundFile[3];
final int S=1000;
int input;
PFont f;
boolean keys[] = new boolean[3];


void setup(){
  size(1000,1000);
  f = createFont("Arial", 32, true);
  for (int i=0; i<notes.length; i++) {
    notes[i]=new SoundFile(this, ""+(i+1)+".wav"); 
  }
  port = new Serial(this, serialName, 9600);
}
void draw(){
  background(255); 
  if(port.available()>0){
    input = port.read();
  }
  switch(input){
    case 0: //kick
      notes[0].play();
    case 1: //snare
      notes[1].play();
  }

  //hi-hat
  
  //for(int i=0;i<3;i++) {
  //  if(!keys[i]){
  //    fill(0,0,0);
  //  }
  //  else{
  //    fill(245,245,220);
  //  }
  //  stroke(255);
  //  rect(i*S/3, 0, S/3, S);
  //  fill(0);
  //  textFont(f);
  //  textAlign(CENTER);
  //  text("Kick", 333/2, S/2);
  //  text("Snare", (S/3)+333/2, S/2);
  //  text("Hi-Hat", (2*S/3)+333/2, S/2);
}
//void keyPressed() {
//  if(key>='1'&&key<='3') {
//    int i=key-'1';
//    keys[i]=true;
//    notes[i].play();   
//  }
//}
//void keyReleased() {
//  if(key>='1'&&key<='3') keys[key-'1']=false;
//}