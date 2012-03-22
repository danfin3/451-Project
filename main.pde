#include "PID_v1.h"

void kill(void);

int fanPin = 5;  // motor connected to pin ~D5
int IRpin = 0;   // IR Sensor connected to pin A0

int IRread = 0;  // IR Sensor range value
int mappedIRread = 0;  // remapped IR Sensor range value

void setup() { 
	Serial.begin(9600);

} 

void loop() { 
	mappedIRread = map(analogRead(IRpin), 40, 255, 0, 55);	//get the IR sensor value, remap it to useful range
	
	//Serial.println(mappedIRread);	// show the mapped value on the serial port

	analogWrite(fanPin,Output);	// run the fan
	Serial.println(Output);		// print the output to the serial
	
	kill();  // allow a kill command
}




//---------------------------------------------//
//------------------FUNCTIONS------------------//
//---------------------------------------------//

void kill() {
  if( Serial.read() == 's') {
    while(1);
  }
}