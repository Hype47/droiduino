/*
 * Code for connecting Arduino board to Android
 * using Bluetooth
 * by Droiduino
 * 
 */

 /*
   * Char to Integer conversion according to ASCII Table
   * this is used to convert command from Android
   * "w" = 119
   * "s" = 115
   * "d" = 100
   * 
   */

int ledPin = 13; // Built-in LED
int androidCmd; // Command message from Android

void setup() {
  // LED Setup
  pinMode(ledPin, OUTPUT);
  digitalWrite(ledPin, LOW); // LED is OFF by default
  
  // Bluetooth Setup
  Serial.begin(9600); // Default communication rate of the Bluetooth Module

}

void loop() {
  // Read incoming command from Android
  if (Serial.available() > 0){
    androidCmd = Serial.read();
    Serial.println(androidCmd); // For debug purpose
  }

  // Translate Android command into Action
  if (androidCmd == 119){ // Equivalent to the character "w"
    Serial.println("LED is ON/n"); // Send status message to Android
    digitalWrite(ledPin, HIGH); // Turn On LED
  } else {
    if (androidCmd == 115){ // Equivalent to the character "s"
      Serial.println("LED is OFF/n"); // Send status message to Android
      digitalWrite(ledPin, LOW); // Turn Off LED
    } else {
      if (androidCmd == 100){ // Equivalent to the character "d"
        Serial.println("LED is Blinking/n"); // Send status message to Android
        blinkingLed(); // LED is blinking
      }
    }
  }
}

// Function to Blink LED
// Called from the loop function
void blinkingLed(){
  digitalWrite(ledPin,HIGH);
  delay(500);
  digitalWrite(ledPin,LOW);
  delay(500);
}
