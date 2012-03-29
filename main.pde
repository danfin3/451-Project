
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

	setpoint = getPotValue(potentiometerPin);	//get the desired position of the ball
	lcd.print("Desired Position: ");
	lcd.println(setpoint);
	ballPosition = getBallPosition(IRpin);		//get the actual position of the ball
	lcd.print("Current Position: ");
	lcd.println(ballPosition);
	
	gain = PID(setpoint, ballPosition);			//send the desired and actual positions to the PID controller
	
	pwmOut(dutyCycle, frequency);	// run the fan
	kill();  // do we stop?
}