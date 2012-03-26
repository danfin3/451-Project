
int getBallPosition(pin) {
	
	int val;

	val = map(analogRead(pin), 40, 255, 0, 55);	//get the IR sensor value, remap it to useful range
	
	return val;
}