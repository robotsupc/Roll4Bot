#include "control.h"

void control::sendDriverData(control::stepDriver &d) {
  if (d.flag) {
    digitalWrite(d.dirPIN[0], HIGH);
    digitalWrite(d.dirPIN[1], HIGH);
  }
  else {
    digitalWrite(d.dirPIN[0], LOW);
    digitalWrite(d.dirPIN[1], LOW);
  }
  analogWrite(d.stepPIN[0], d.vel);
  analogWrite(d.stepPIN[1], d.vel);
}

void control::sendData() {
  sendDriverData(motE);
  sendDriverData(motD);
}

control::control() {

}
void control::setSTEPe(uint8_t p1, uint8_t p2) {
  motE.stepPIN[0] = p1;
  motE.stepPIN[1] = p2;
  pinMode(motE.stepPIN[0],OUTPUT);
  pinMode(motE.stepPIN[1],OUTPUT);
}
void control::setDIRe(uint8_t p1, uint8_t p2) {
  motE.dirPIN[0] = p1;
  motE.dirPIN[1] = p2;
  pinMode(motE.dirPIN[0],OUTPUT);
  pinMode(motE.dirPIN[1],OUTPUT);
}
void control::setSTEPd(uint8_t p1, uint8_t p2) {
  motD.stepPIN[0] = p1;
  motD.stepPIN[1] = p2;
  pinMode(motD.stepPIN[0],OUTPUT);
  pinMode(motD.stepPIN[1],OUTPUT);
}
void control::setDIRd(uint8_t p1, uint8_t p2) {
  motD.dirPIN[0] = p1;
  motD.dirPIN[1] = p2;
  pinMode(motD.dirPIN[0],OUTPUT);
  pinMode(motD.dirPIN[1],OUTPUT);
}

int control::velD(){
  return motD.vel;
}
int control::velE(){
  return motE.vel;
}

bool control::dirD(){
  return motD.flag;
}
bool control::dirE(){
  return motE.flag;
}

//TODO configurar definitivament les velocitats de sortida
void control::avanca(int x, int y){

  if(y>0){
    motD.flag = motE.flag = true;
    if(x>0){
      motD.vel= y-x;
      motE.vel= y;
    }
    else{
      motD.vel= y;
      motE.vel= y+x;
    }
  }
  else{
    y= -y;
    // x = -x; //potser tambe s'ha d'invertir x
    motD.flag = motE.flag = false;
    if(x>0){
      motD.vel= y-x;
      motE.vel= y;
    }
    else{
      motD.vel= y;
      motE.vel= y+x;
    }
  }
  //casos que y es proper a 0 i amb una x mes gran canvien de sentit
  if(motD.vel<0){
    motD.flag = !motD.flag;
    motD.vel = -motD.vel;
  }
  if(motE.vel<0){
    motE.flag = !motE.flag;
    motE.vel = -motE.vel;
  }
  sendData();
}
