#include "SPI.h"
#include "MFRC522.h"
#include <ESP8266WiFi.h>  
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#define OLED_RESET -1
Adafruit_SSD1306 OLED(OLED_RESET);


const char* ssid     = "SweDev";    
const char* password = "12345678";
const char* host = "192.168.137.1";  

#define SS_PIN D8
#define RST_PIN D3

MFRC522 rfid(SS_PIN, RST_PIN);
MFRC522::MIFARE_Key key;

void displayOLED(String string){
     OLED.clearDisplay();
     OLED.setTextColor(WHITE);
     OLED.setCursor(2,35);
     OLED.setTextSize(2);
     OLED.println(string);
     OLED.display();
     
}

void setup() {
  Serial.begin(9600);
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) 
  {
    delay(500);
    Serial.print(".");                
  }
  Serial.println("");
  Serial.println("WiFi connected");   
  Serial.println("IP address: ");     
  Serial.println(WiFi.localIP());     

  SPI.begin();
  rfid.PCD_Init();
  OLED.begin(SSD1306_SWITCHCAPVCC,0x3C);
}

void loop() {
  displayOLED(".........");
  if (!rfid.PICC_IsNewCardPresent() || !rfid.PICC_ReadCardSerial())
    return;

   displayOLED("Waiting...");

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

 
  Serial.print("Tap card key: ");
  Serial.println(strID);

  rfid.PICC_HaltA();
  rfid.PCD_StopCrypto1();
  //send data to server
  WiFiClient client;
  const int httpPort = 80;            // Set HTTP port
  if (!client.connect(host, httpPort))// Test connection 
  {
    Serial.println("connection failed"); // Print connection fail message
    return;
  }
  String url =  String("/arduino/temp.php?RFID=");
  url += strID;
  
  client.print(String("GET ") + url + " HTTP/1.1\r\n" +
               "Host: " + host + "\r\n" +
               "Connection: keep-alive\r\n" +
               "Cache-Control: max-age=0\r\n\r\n");
  Serial.println("URL : ");         
  Serial.println(url);              // Print URL 
  delay(3000);
  
  while (client.available()) 
  {
    String line = client.readStringUntil('\r');
    Serial.print(line);
  }
  Serial.println();
  Serial.println("closing connection"); // Print closing status
  displayOLED("Successful");
  delay(5000);
}


