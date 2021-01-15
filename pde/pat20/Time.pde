class Time {
  int previousTime = 0;
  float deltaTime = 0;
  float deltaTimeInSeconds = 0;
  
  public void update() {
    int now = millis(); // Tijd sinds starten van de applicatie
    deltaTime = now - previousTime; // tijds verschil uitgerekend
    previousTime = now;
    deltaTimeInSeconds = deltaTime / 1000;
  }
}
