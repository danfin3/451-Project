
int getPotValue( unsigned char potPin ) {

	int val = analogRead(potPin);    // read the value from the sensor
	
	val = map(val, 0, 255, 0, 100);	remap the value so the maximum is the max height of the ball
	
	return val;
}
