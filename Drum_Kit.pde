import processing.sound.*;
import processing.serial.*;

Serial port;
final String serialName = "COM4";
SoundFile[] notes = new SoundFile[3];
final int S=1000;
int input;
int hit;
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
  stroke(0);
  fill(255);
  rect(0*S/3, 0, S/3, S);
  rect(1*S/3, 0, S/3, S);
  rect(2*S/3, 0, S/3, S);
  textFont(f);
  textAlign(CENTER);
  if(input == 0){
    fill(0,0,0);
  }
  if (input == 1){
    notes[input-1].play();
    hit = 1;
    delay(300);
    println(input);
  }
  if (input == 2){
    notes[input-1].play();
    hit = 2;
    delay(300);
    println(input);
  }
  if (input == 3){
    notes[input-1].play();
    hit = 3;
    delay(300);
    println(input);
  }
  if(hit == 1){
    fill(255, 0, 0);
    text("Kick", 333/2, S/2);
  }
  else{
    fill(0,0,0);
    text("Kick", 333/2, S/2);
  }
   if(hit == 2){
    fill(255, 0, 0);
    text("Snare", (S/3)+333/2, S/2);
  }
  else{
    fill(0,0,0);
    text("Snare", (S/3)+333/2, S/2);
  }
   if(hit == 3){
    fill(255, 0, 0);
    text("Hi-Hat", (2*S/3)+333/2, S/2);
  }
  else{
    fill(0,0,0);
    text("Hi-Hat", (2*S/3)+333/2, S/2);
  }
}
  
