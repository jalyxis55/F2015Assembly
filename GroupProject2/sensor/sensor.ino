/*
 * October 2015
 * Group Echo Project
 * Freddy Esteban, Gina Hall, Jennifer Shelby
 * 
 * Chicken Feeder Alert
 * This device will be installed into the lid of a 25cm tall chicken feeder, 
 * pointing down towards the food. When the food level falls to below 5cm, 
 * the red alert light will turn on. Otherwise, while full, the green light
 * will be on.
 * 
 * Parts Used:
 * Arduino Uno
 * HC-SR04 Ping distance sensor (max distance 500cm)
*/

#define trigPin 13      //Arduino pin for the sensor's trigger pin
#define echoPin 12      //Arduino pin for the sensor's echo pin
#define ledRed 11       //Arduino pin for the red led (food is empty)
#define ledGreen 10     //Arduino pin for the green led (food is full)

void setup() {
  Serial.begin (9600);        //open serial monitor at 9600 baud to see ping results
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  pinMode(ledRed, OUTPUT);
  pinMode(ledGreen, OUTPUT);
}

void loop() {
  long duration;
  long cm;      //distance in centimeters
  
  digitalWrite(trigPin, LOW);   // low is off, high is on
  delayMicroseconds(2);
  
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  
  digitalWrite(trigPin, LOW);
  duration = pulse In(echoPin, HIGH);

  cm = (duration/2) / 28;   //(round trip microseconds)/28 microseconds per cm
  Serial.print(cm);
  Serial.println(" distance");
  Serial.print(duration);
  Serial.println(" time");

  // This is where the LED On/Off happens
  //Food levels are considered "empty" when distance from lid > 20cm
  if (cm > 20) {
    digitalWrite(ledRed,HIGH);    //red is on
    digitalWrite(ledGreen,LOW);   //green is off
    Serial.println("EMPTY\n");
  } else {
    digitalWrite(ledRed,LOW);     //red is off
    digitalWrite(ledGreen,HIGH);  //green is on
    Serial.println("FULL\n");

  //error/out of range
  //16" = ~41cm : >41 * 28 = ~1150
  } if (cm >= 41 || cm <= 0){
    Serial.println("Out of range\n");
  }

  delay(3000);     //in microseconds
}
