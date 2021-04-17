import processing.serial.*;
import processing.sound.*;


Serial myPort;
String myText = "";
String portId = "/dev/ttyACM0";
color c =  color(44,44,44);
SoundFile file;

void setup() {
  size(300, 300);
  myPort = new Serial(this, portId, 9600);
  file = new SoundFile(this, "sminem.mp3");
}

void draw() {
  background(c);
}

void serialEvent(Serial myPort) {
  String inString = myPort.readStringUntil('\n');
  String trimmedInString;
  int currentValue;
  
  if (inString != null) {
    trimmedInString = trim(inString);
    currentValue = int(trimmedInString);

    if (currentValue == 1) {
      file.play();
      c = color(255, 0, 0);
    }
    
    if (currentValue == 2) {
      c = color(0, 255, 0);
    }
  }
}
