
//--------------Arduino Library Class Declarations-------------------
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);
//-------------------------------------------------------------------


//-------------------Arduino I/O Pin Declarations--------------------
unsigned char motorPin = 5;  // motor connected to pin ~D5
unsigned char IRpin = 0;   // IR Sensor connected to pin A0
unsigned char potentiometerPin = 2;	//potentiometer pin
//-------------------------------------------------------------------

//--------------------PID Control Values-----------------------------
double kp, kd, ki;
int setpoint;
//-------------------------------------------------------------------


int IRread = 0;  // IR Sensor range value
int mappedIRread = 0;  // remapped IR Sensor range value


// Setup Functions
void setup() { 
	Serial.begin(9600);
	startLCD();
} 

// The Main Function
void loop() { 
	mappedIRread = map(analogRead(IRpin), 40, 255, 0, 55);	//get the IR sensor value, remap it to useful range
	
	//Serial.println(mappedIRread);	// show the mapped value on the serial port

	analogWrite(fanPin,Output);	// run the fan
	Serial.println(Output);		// print the output to the serial
	
	kill();  // do we stop?
}