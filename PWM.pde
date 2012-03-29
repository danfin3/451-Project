void setupPWM( void ) {


	//Pins 3 and 11 are controlled by Timer 2
	// http://www.arduino.cc/playground/Main/TimerPWMCheatsheet
	pinMode(3, OUTPUT);
	TCCR2A = _BV(COM2A1) | _BV(COM2B1) | _BV(WGM21) | _BV(WGM20);
	OCR2A = 180;
	// Frequency: 16MHz/64/256 = 977Hz
	// Duty Cycle: (180+1)/256 = 70.7%
	
	pinMode(11, OUTPUT);
	TCCR2B = _BV(CS22);
	OCR2B = 50;
	// Frequency: 16MHz/64/256 = 977Hz
	// Duty Cycle: (50+1)/256 = 19.9%
	
}



void pwmOut(int dutyCycle, int frequency) {
	
	int output;
	
	analogWrite(motorPin,Output);
	
	//write to motor pin
}