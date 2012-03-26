
float PID(int setpoint, int actualPosition) {

	static float pre_error = 0;
	static float integral = 0;
	float error;
	float derivative;
	float output;
	
	//calculate P
	error = setpoint - actualPosition;
	
	//calculate I
	if( abs(error) > epsilon ) {	// in case of error too small, stop integration
		integral = integral + error * dt;
	}
	
	//calculate D
	derivative = (error-pre_error)/dt;
	
	//calculate output
	output = kp*error + ki*integral + kd*derivative;
	
	//Update error
	pre_error = error;
	
	return output;
}