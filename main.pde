#include "PID_v1.h"

void kill(void);

int fanPin = 5;  // motor connected to pin ~D5
int IRpin = 0;   // IR Sensor connected to pin A0

double Setpoint, Input, Output;
//Specify the links and initial tuning parameters
PID myPID(&Input, &Output, &Setpoint,0.1,5,5, DIRECT);

int IRread = 0;  // IR Sensor range value
int mappedIRread = 0;  // remapped IR Sensor range value

void setup() { 
	Serial.begin(9600);
	
	//initialize the variables we're linked to
	Setpoint = 20;
	
	//turn the PID on
	myPID.SetMode(AUTOMATIC);
} 

void loop() { 
	mappedIRread = map(analogRead(IRpin), 40, 255, 0, 55);	//get the IR sensor value, remap it to useful range
	
	//Serial.println(mappedIRread);	// show the mapped value on the serial port
	
	Input = mappedIRread;		// pass the value to the PID controller
	myPID.Compute();			// run the PID
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