/*
 *  Code for hacking toy car's RC Transmitter
 *  by Droiduino
 *  
 */

const int relayPin1 = 8; // forward
const int relayPin2 = 9; // reverse
const int relayPin3 = 10; // turn left
const int relayPin4 = 11; // turn right
String cmdText; // Command message from Android
int cmdInt;

const int ledPin = 13;

void setup() {
  // Pin and RC Channel setup
  pinMode(relayPin1, OUTPUT);
  pinMode(relayPin2, OUTPUT);
  digitalWrite(relayPin1, LOW);
  digitalWrite(relayPin2, LOW);
  pinMode(relayPin3, OUTPUT);
  pinMode(relayPin4, OUTPUT);
  digitalWrite(relayPin3, LOW);
  digitalWrite(relayPin4, LOW);

  pinMode(ledPin, OUTPUT);
  digitalWrite(ledPin, LOW);

  // Bluetooth Setup
  Serial.begin(9600); // Default communication rate of the Bluetooth module
}

void loop() {

  // Read command from Android
  if (Serial.available() > 0){
    cmdInt = Serial.read();
    Serial.println(cmdInt); // For debug purpose
  }

  /*
   * Use Unsigned number from ASCII table
   * "w" = 119
   * "s" = 115
   * "a" = 97
   * "d" = 100
   * 
   */

  // Forward Reverse
  if (cmdInt == 119){ 
    digitalWrite(relayPin1, HIGH);
    digitalWrite(relayPin2, LOW);
    digitalWrite(ledPin, HIGH);
  } else {
      if (cmdInt == 115){
        digitalWrite(relayPin1, LOW);
        digitalWrite(relayPin2, HIGH);
      } else {
          if (cmdInt == 120){
            digitalWrite(relayPin1, LOW);
            digitalWrite(relayPin2, LOW);
            digitalWrite(ledPin, LOW);
        }
    }
  }

  // Turning
  if (cmdInt == 97){
    digitalWrite(relayPin3, HIGH);
    digitalWrite(relayPin4, LOW);
  } else {
      if (cmdInt == 100){
        digitalWrite(relayPin3, LOW);
        digitalWrite(relayPin4, HIGH);
      } else {
          if (cmdInt == 122){
            digitalWrite(relayPin3, LOW);
            digitalWrite(relayPin4, LOW);
        }
    }
  }  
}
