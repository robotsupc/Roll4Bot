#ifndef CONTROL
#define CONTROL
#include <Arduino.h>

class control {

private:

struct stepDriver{
  uint8_t stepPIN[2];
  uint8_t dirPIN[2];
  bool flag;
  int vel;

};
stepDriver motD;
stepDriver motE;

void sendData();
void sendDriverData(stepDriver &d);





public:

control();
void setSTEPe(uint8_t p1,uint8_t p2);
void setDIRe(uint8_t p1,uint8_t p2);
void setSTEPd(uint8_t p1,uint8_t p2);
void setDIRd(uint8_t p1,uint8_t p2);
int velD(); //consultar velocitat del motor dret
int velE(); //consultar velocitat del motor esquerra
bool dirD(); //consulatar direcció del motor dret
bool dirE(); //consulatar direcció del motor esquerra

void avanca(int x, int y); // calculs de direcció i velocitat

};


#endif
