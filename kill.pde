
void kill() {
  if( Serial.read() == 's') {
    while(1);
  }
}