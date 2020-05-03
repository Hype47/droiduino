/*
 * Tutorial to connect HC05 Bluetooth Module to Arduino board
 * by Droiduino
 * 
 * ver 1.0
 */

const int ledPin = 13; // Built in LED in Arduino board
String msg;

void setup() {
  // Initialization
  pinMode(ledPin, OUTPUT);
  digitalWrite(ledPin, LOW);
  Serial.begin(9600); // Communication rate of the Bluetooth Module
}

void loop() {
  // To read message received from other Bluetooth Device
  if (Serial.available() > 0){ // Check if there is data coming
    msg = Serial.read(); // Read the message
  }

  /*
   * Transmitting a message is as simple as printing to
   * Serial port
   */
   Serial.println("This is Bluetooth message");

   // Visual indicator that the board is transmitting
   digitalWrite(ledPin, HIGH);
   delay(1000);
   digitalWrite(ledPin, LOW);
   delay(1000);
}
