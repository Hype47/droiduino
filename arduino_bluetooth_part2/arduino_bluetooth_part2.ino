/*
 * Tutorial to connect Arduino board to Android Smartphone
 * using Bluetooth connection
 * by Droiduino
 */

const int ledPin = 13; // Built in LED in Arduino board
String msg,cmd;

void setup() {
  // Initialization
  pinMode(ledPin, OUTPUT);
  digitalWrite(ledPin, LOW);
  Serial.begin(9600); // Communication rate of the Bluetooth Module
  msg = "";
}

void loop() {
  
  // To read message received from other Bluetooth Device
  if (Serial.available() > 0){ // Check if there is data coming
    msg = Serial.readString(); // Read the message as String
    Serial.println("Android Command: " + msg);
  }

  // Control LED in Arduino board
  if (msg == "<turn on>"){
    digitalWrite(ledPin, HIGH); // Turn on LED
    Serial.println("LED is turned on\n"); // Then send status message to Android
    msg = ""; // reset command
  } else {
    if (msg == "<turn off>"){
      digitalWrite(ledPin, LOW); // Turn off LED
      Serial.println("LED is turned off\n"); // Then send status message to Android
      msg = ""; // reset command
    }
  }

}
