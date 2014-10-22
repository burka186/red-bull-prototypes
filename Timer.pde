//adapted from Daniel Shiffman
class Timer {
 
  int startTime; 
  int pauseTime;
  
  public Timer(int inPauseTime) {
    pauseTime = inPauseTime;
  }
  void start() {
    startTime = millis(); 
  }
  boolean isFinished() { 
    int passedTime = millis() - startTime;
    
    if (passedTime > pauseTime) {
      
      
      return true;
    } else {
      return false;
    }
  }
}
