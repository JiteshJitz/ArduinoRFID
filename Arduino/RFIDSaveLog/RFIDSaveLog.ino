#include "SPI.h"
#include "MFRC522.h"
#include <ESP8266WiFi.h>  
#include <Wire.h>
//RFID
#define SS_PIN D8
#define RST_PIN D2
//LED
#define B_pin D2
#define G_pin D1
#define R_pin D0
//speaker
int pinTone = D10;

const char* ssid     = "SweDev";    // Set your SSID
const char* password = "12345678";
const char* host = "192.168.137.1";  

MFRC522 rfid(SS_PIN, RST_PIN);
MFRC522::MIFARE_Key key;

void displayRGB(int B,int G,int R){
    digitalWrite(B_pin,B);
    digitalWrite(G_pin,G);
    digitalWrite(R_pin,R);
}

void speaker(int freq){
  analogWriteFreq(freq);
}

void setup() {
    Serial.begin(9600);
    Serial.print("Connecting to ");
    Serial.println(ssid);
    WiFi.begin(ssid, password);
    while (WiFi.status() != WL_CONNECTED) 
    {
      delay(500);
      Serial.print(".");                // Print WiFi status
    }
    Serial.println("");
    Serial.println("WiFi connected");   // Print connect status
    Serial.println("IP address: ");   
    Serial.println(WiFi.localIP());     // Print IP address  
    SPI.begin();
    rfid.PCD_Init();
    pinMode(B_pin, OUTPUT);
    pinMode(G_pin, OUTPUT);
    pinMode(R_pin, OUTPUT);
    analogWrite(pinTone,0);

}

void loop() {
    displayRGB(1,0,0);
    
    if (!rfid.PICC_IsNewCardPresent() || !rfid.PICC_ReadCardSerial())
      return;

    MFRC522::PICC_Type piccType = rfid.PICC_GetType(rfid.uid.sak);

    if (piccType != MFRC522::PICC_TYPE_MIFARE_MINI &&
    piccType != MFRC522::PICC_TYPE_MIFARE_1K &&
    piccType != MFRC522::PICC_TYPE_MIFARE_4K) {
    Serial.println(F("Your tag is not of type MIFARE Classic."));
    return;
    }

    String strID = "";
    for (byte i = 0; i < 4; i++) {
      strID +=
      (rfid.uid.uidByte[i] < 0x10 ? "0" : "") +
      String(rfid.uid.uidByte[i], HEX) +
      (i!=3 ? ":" : "");
  }
    strID.toUpperCase();
    rfid.PICC_HaltA();
    rfid.PCD_StopCrypto1();
    
    Serial.print("Tap card key: ");
    Serial.println(strID);

      //send data to server
    WiFiClient client;
    const int httpPort = 80;            // Set HTTP port
    if (!client.connect(host, httpPort))// Test connection 
    {
      Serial.println("connection failed"); // Print connection fail message
      return;
    }
    String url =  String("/arduino/callrfid.php?rfid=");
    url += strID;
  
    
    client.print(String("GET ") + url + " HTTP/1.1\r\n" +
                 "Host: " + host + "\r\n" +
                 "Connection: keep-alive\r\n" +
                 "Cache-Control: max-age=0\r\n\r\n");
    Serial.println("URL : ");         
    Serial.println(url);              // Print URL 
    delay(3000);
    int dataCallback = -1;
    String mag ="";
    while (client.available()) 
    {
      String line = client.readStringUntil('\r');
      Serial.print(line);
      mag = line;
    }
    Serial.println();
    Serial.println("closing connection"); // Print closing status

    if(mag.indexOf("true") != -1 ){
      dataCallback = 1;  
    }
     Serial.println(dataCallback);
//    delay(2000);

     if(dataCallback == 1){
            displayRGB(0,1,0);
            speaker(250);
            delay(500);
            speaker(0);
            delay(500);
      }else{
            displayRGB(0,0,1);
            speaker(250);
            speaker(250);
            delay(500);
            speaker(0);
            delay(500);
       }

      Serial.println("success");

}




