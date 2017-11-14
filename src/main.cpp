#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <ESP8266WebServer.h>
#include "control.h"

control Controlador;

const char* ssid = "SSID";
const char* password = "somePassword";

ESP8266WebServer server(80);

void webServerSetUp() {
  server.on("", []() {
    server.send(200, "text/html", "<html><body></body></html>");
  });
  server.begin();
}

void wifiSetup() {
  WiFi.begin(ssid,password);
  while (WiFi.status()  != WL_CONNECTED) {
    Serial.print(".");
    delay(1000);
  }
  if (WiFi.status() == WL_CONNECTED) {
    Serial.println("");
    Serial.print("Connected to ");
    Serial.println(ssid);
    Serial.print("IP Address: ");
    Serial.println(WiFi.localIP());

    /* code */
  }
  else {
    Serial.println("Connection Error");

  }
}

void setup() {
  Serial.begin(38400);
  Controlador.setDIRd(D0, D1);
  Controlador.setSTEPd(D2, D3);
  Controlador.setDIRe(D4,D5);
  Controlador.setSTEPe(D6, D7);
  wifiSetup();
  webServerSetUp();

    // put your setup code here, to run once:
}

void loop() {
  int x =0,y=0;
  Controlador.avanca(x,y);
    // put your main code here, to run repeatedly:
}
