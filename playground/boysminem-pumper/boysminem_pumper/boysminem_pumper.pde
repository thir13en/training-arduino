import processing.serial.*;
import processing.sound.*;


Serial myPort;
String myText = "";
String portId = "/dev/ttyACM0";
SoundFile sminemPumpVoiceover;
SoundFile bognadoffDumpVoiceover;
color c =  color(44, 44, 44);
PImage sminemImg;
PImage btcMoonImg;
PImage bognadoffImg;
PImage btcDoomImg;
PImage displayImg;
PImage btcImg;

void setup() {
  size(1111, 777);
  myPort = new Serial(this, portId, 9600);
  sminemPumpVoiceover = new SoundFile(this, "sminem.mp3");
  bognadoffDumpVoiceover = new SoundFile(this, "bognadoff.mp3");
  bognadoffImg = loadImage("bognadoff.jpeg");
  sminemImg = loadImage("sminem2.png");
  btcMoonImg = loadImage("bitcoin-moon.png");
  btcDoomImg = loadImage("bitcoin-doom.jpeg");
}

void draw() {
  background(c);

  if (displayImg != null) {
    image(btcImg, 111, 111);
    image(displayImg, 0, 0);
  }
}

void serialEvent(Serial myPort) {
  String inString = myPort.readStringUntil('\n');
  String trimmedInString;
  int currentValue;
  
  if (inString != null) {
    trimmedInString = trim(inString);
    currentValue = int(trimmedInString);

    if (currentValue == 1) {
      bognadoffDumpVoiceover.play();
      displayImg = bognadoffImg;
      btcImg = btcDoomImg;
      c = color(255, 0, 0);
    }
    
    if (currentValue == 2) {
      displayImg = sminemImg;
      btcImg = btcMoonImg;
      sminemPumpVoiceover.play();
      c = color(0, 255, 0);
    }
  }
}
