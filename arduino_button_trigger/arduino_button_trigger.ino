
#include <MakerBoard.h>

void setup() {
  Serial.begin(9600);
  mb.begin();
}


/* On = 1, Off = 0
 * Kick = 10, Snare = 11, Hi-Hat = 12
 */
void loop() {
  //kick 
  if(mb.getButton(0)==0){
    Serial.write(1);
    Serial.write(10);
  }
  //kick release
  if(mb.getButton(0)==1){
    Serial.write(0);
  }
  //snare
  if(mb.getButton(1)==0){
    Serial.write(1);
    Serial.write(11);
  }
  //snare release
  if(mb.getButton(1)==1){
    Serial.write(0);
  }
  //hi-hat
  if(mb.getButton(2)==0){
    Serial.write(1);
    Serial.write(12);
  }
  //hi-hat release
  if(mb.getButton(2)==1){
    Serial.write(0);
  }
  delay(100);
}
