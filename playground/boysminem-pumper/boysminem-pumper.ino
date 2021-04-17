// bullish
const int sminemButtonPin = 2;
const int pumpItLedPin =  12;
// bearish
const int bognadoffButtonPin = 3;
const int dumpItLedPin =  13;

// manipulate the market
int pumpButtonPushed = 0;
int dumpButtonPushed = 0;

void setup() {
  // initialize the LED pins as outputs
  pinMode(pumpItLedPin, OUTPUT);
  pinMode(dumpItLedPin, OUTPUT);
  // initialize market manipulation buttons
  pinMode(sminemButtonPin, INPUT);
  pinMode(bognadoffButtonPin, INPUT);
  // initialize serial output
  Serial.begin(9600);
}

void loop() {
  // read market manipulation signals
  pumpButtonPushed = digitalRead(sminemButtonPin);
  dumpButtonPushed = digitalRead(bognadoffButtonPin);

  // check if the pushbutton is pressed. If it is, the buttonState is HIGH:
  if (pumpButtonPushed == 1) {
    // turn LED on:
    Serial.println(1);
    digitalWrite(pumpItLedPin, HIGH);
    digitalWrite(dumpItLedPin, LOW);
  }

  if (dumpButtonPushed == 1) {
    Serial.println(2);
    digitalWrite(pumpItLedPin, LOW);
    digitalWrite(dumpItLedPin, HIGH);
  }
  delay(111);
}
