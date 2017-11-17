#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <ESP8266WebServer.h>
#include <WebSocketsServer.h>
#include <DNSServer.h>
#include "control.h"

control Controlador;


const char* ssid = "SSID";
const char* password = "somePassword";

ESP8266WebServer server(80);
WebSocketsServer webSocket(81);
//TODO establir direccio IP
IPAddress apIP(0, 0, 0, 0);
DNSServer dnsServer;

//TODO implementar l'esdeveniment del websocket
void webSocketEvent(uint8_t num, WStype_t type, uint8_t * payload, size_t length) {

  switch(type) {
    case WStype_DISCONNECTED:
        Serial.printf("[%u] Disconnected!\n", num);
        break;
    case WStype_CONNECTED: {
        IPAddress ip = webSocket.remoteIP(num);
        Serial.printf("[%u] Connected from %d.%d.%d.%d url: %s\n", num, ip[0], ip[1], ip[2], ip[3], payload);

        // send message to client
        webSocket.sendTXT(num, "Hello from Server");
        break;
    }
    case WStype_TEXT:
        //Serial.printf("MSG: %s\n", payload);
        String s = (char*) payload;
        int x = substr(s, ' ', 0).toInt();
        int y = substr(s, ' ', 1).toInt();
        Controlador.avanca(x,y);
        break;
    }
  }

  //TODO com rep el websocket les dades de x i y ?



}

void setupWebServer() {
  server.on("", []() {
    server.send(200, "text/html", "<html><body></body></html>");
  });
  server.begin();
}

void setupWebSocketServer()  {
  webSocket.begin();
  webSocket.onEvent(webSocketEvent);

}

void setupDNS() {
  dnsServer.setTTL(300);
  dnsServer.setErrorReplyCode(DNSReplyCode::ServerFailure);
  dnsServer.start(53, "*", apIP);
}

void setupWifi() {
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

void setupControlador() {
  Controlador.setDIRd(D0, D1);
  Controlador.setSTEPd(D2, D3);
  Controlador.setDIRe(D4,D5);
  Controlador.setSTEPe(D6, D7);
}

void setup() {
  Serial.begin(38400);
  setupControlador();
  setupWifi();
  setupDNS();
  setupWebServer();
  setupWebSocketServer();


}


void loop() {
  dnsServer.processNextRequest();
  webSocket.loop();
  server.handleClient();

    // put your main code here, to run repeatedly:
}
