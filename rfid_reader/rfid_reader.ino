/*
 * Connect to MFRC522 RFID Reader module
 * by Droiduino
 */

#include <SPI.h>
#include <MFRC522.h> // Library to use MFRC522 module

// Configure Pins for the MFRC522 module
const int RST_PIN = 9; 
const int SS_PIN = 10;

uint8_t successRead;    // Variable integer to keep if we have Successful Read from Reader
byte readCard[4];   // Stores scanned ID read from RFID Module
String uidStr;
String charBegin = "<";
String charEnd = ">";

MFRC522 mfrc522(SS_PIN, RST_PIN);  // Create MFRC522 instance

void setup() {
  Serial.begin(9600); // Default communication rate of the Bluetooth module
  while (!Serial);    // Do nothing if no serial port is opened (added for Arduinos based on ATMEGA32U4)
  SPI.begin();      // Init SPI bus
  mfrc522.PCD_Init();   // Init MFRC522
  mfrc522.PCD_DumpVersionToSerial();  // Show details of PCD - MFRC522 Card Reader details

  //If you set Antenna Gain to Max it will increase reading distance
  mfrc522.PCD_SetAntennaGain(mfrc522.RxGain_max);
}

/* ===================================== Main Loop ======================================== */
void loop() {
  // Read RFID's UID
  successRead = getID();
}


/* =================================== Get UID from RFID Tags =========================== */
uint8_t getID() {
  // Getting ready for Reading....
  if ( ! mfrc522.PICC_IsNewCardPresent()) { //If a new PICC placed to RFID reader continue
    return 0;
  }
  if ( ! mfrc522.PICC_ReadCardSerial()) {   //Since a PICC placed get Serial and continue
    return 0;
  }

  // Transmitting data to remote device
  Serial.println(charBegin);
  for ( uint8_t i = 0; i < 7; i++) { // support 7 byte
    readCard[i] = mfrc522.uid.uidByte[i];
    Serial.print(readCard[i], HEX);
  }
  Serial.println(charEnd);

  // Stop reading
  mfrc522.PICC_HaltA(); 
  return 1;
}
