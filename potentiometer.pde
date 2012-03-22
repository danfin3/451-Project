
int getPotValue( unsigned char potPin ) {

	int val = analogRead(potPin);    // read the value from the sensor
	return val;
}
