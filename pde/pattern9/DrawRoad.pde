void drawRoad()
{
  noStroke();
  fill(0, 0, 50);
  rect(0, 400, width, 200);
  fill(10, 10, 100);
  rect(0, 370, width, 80);


  if (lineTracker > 20 | channel2note == 266)
  {
    fill(50, 50, 200);
    rect(linePosTracker, 400, 100, 10);
    linePosTracker = linePosTracker - (50 * lineSpeedMultiplier);
    lineTracker = 19;
    if (linePosTracker < -200)
    {
      lineTracker = 0;
      linePosTracker = 720;
    }
  }


  if (lineTracker2 > 20 | channel2note == 226)
  {
    fill(50, 50, 200);
    rect(linePosTracker2, 400, 100, 10);
    linePosTracker2 = linePosTracker2 - (50 * lineSpeedMultiplier);
    lineTracker2 = 19;
    if (linePosTracker2 < -200)
    {
      lineTracker2 = 0;
      linePosTracker2 = 720;
    }
  }

  if (lineTracker3 > 20 | channel2note == 226 && channel3instr == 13)
  {
    fill(200, 200, 255);
    rect(linePosTracker3, 400, 100, 10);
    linePosTracker3 = linePosTracker3 - (50 * lineSpeedMultiplier);
    lineTracker3 = 19;
    if (linePosTracker3 < -200)
    {
      lineTracker3 = 0;
      linePosTracker3 = 720;
    }
  }
}
