#include <Arduino.h>
#include "control.h"

control Controlador;

void setup() {
  Controlador.setDIRd(D0, D1);
  Controlador.setSTEPd(A0, A1);
  Controlador.setDIRe(D2,D3);
  Controlador.setSTEPe(A2, A3);
    // put your setup code here, to run once:
}

void loop() {
  int x =0,y=0;
  Controlador.avanca(x,y);
    // put your main code here, to run repeatedly:
}
