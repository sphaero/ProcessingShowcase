import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 


import java.util.HashMap; 
import java.util.List; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 
import java.lang.reflect.*;

public class WindowMergeApp extends PApplet {
	
	List<SketchShit> sketches = new ArrayList<>();
    int currentIndex;
    int _runningIndex;
    PApplet sketch;
    
	public void setup()
	{	
		sketch = sketches.get(currentIndex).sketch;
		_runningIndex = currentIndex;
		if (sketch.g== null )
		{
			sketch.g = this.g;
			sketch.setSize(this.width, this.height);
			sketch.sketchPath(this.sketchPath());
			// is protected unfortunately so we can't use
			// frameRate() methods
			//sketch.surface = this.getSurface;
		}
		if (sketch.width != this.width || sketch.height != this.height )
		{
			sketch.setSize(this.width, this.height);
		}
		sketch.resetMatrix();
		rectMode(CORNER);
		textAlign(LEFT);
		clear();
        try 
        {
            sketch.setup();
        }
        catch (Exception e)
        {
            println(e);
            e.printStackTrace();
        }
	}

	public void postEvent(processing.event.Event pe) 
	{
		if (sketch != null) sketch.postEvent(pe);
	}
	
	public void draw()
	{
		//playSounds();
		try {
			pushMatrix();
			sketch.handleDraw();
			popMatrix();
		}
		catch (Exception e)
		{
			println(e.getMessage());
		}
		if ( currentIndex != _runningIndex)
		{
			if ( currentIndex == -1 )
			{
				build();
			}
			if (sketches.get(currentIndex) == null ) _runningIndex = currentIndex; // just continue if next is null
			else frameCount = -1; // triggers setup
		}
	}
	
	public void frameResized(int w, int h)
	{
		println(w,h);
	}
	
	public void modRowEvent( int channel, int instrument, int note )
	{
		try
		{
	      Method modRowEvent = sketch.getClass().getMethod("modRowEvent",
                            new Class[] { int.class, int.class, int.class });
	      modRowEvent.invoke(sketch, channel, instrument, note );
	    } catch (Exception e) {
	    	System.out.println("No modRowEvent found in the sketch!");
	    	// no such method, or an error.. which is fine, just ignore
	    }
	}
	
	public void modPatternEvent( int pattern, int position )
	{
		println("BWAAAAAH");
		currentIndex = position;
	}
	
	public void build()
	{
		sketches.clear();
		currentIndex = 0;
		// order is the pattern number!!! (78+51=129)
		sketches.add(new SketchShit("Skillslabfinal_part_2.pde", new Skillslabfinal_part_2()));
		sketches.add(new SketchShit("Skillslabfinal_part_3.pde", new Skillslabfinal_part_3()));
		sketches.add(new SketchShit("part2.pde", new part2()));
		sketches.add(new SketchShit("part3.pde", new part3()));
		sketches.add(null);
	}
	
	public void settings() 
	{  
		size(720, 480);
		//fullScreen(2);
		build();
	}
	
	static public void main(String[] passedArgs) 
	{
		String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "MergeApp" };
	    if (passedArgs != null) {
	      PApplet.main(concat(appletArgs, passedArgs));
	    } else {
	      PApplet.main(appletArgs);
	    }
	  }
}
