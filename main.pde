
#define epsilon 0.01
#define dt 0.01	//100ms loop time

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

//--------------------------Variables--------------------------------
int ballPosition;
//-------------------------------------------------------------------


// Setup Functions
void setup() { 
	Serial.begin(9600);
	startLCD();
} 

// The Main Function
void loop() { 
	setpoint = getPotValue(potentiometerPin);
	ballPosition = getBallPosition(IRpin);
	
	gain = PID(setpoint, ballPosition);
	
	pwmOut(dutyCycle, frequency);	// run the fan
	kill();  // do we stop?
}