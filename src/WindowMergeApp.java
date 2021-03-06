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

public class WindowMergeApp extends PApplet {
	
	List<SketchShit> sketches = new ArrayList<>();
    int currentIndex;
    int _runningIndex;
    PApplet sketch;
    Boolean presentation = false;
    
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
	
	public void build()
	{
		sketches.clear();
		currentIndex = 0;
		// order is the pattern number!!! (78+51=129)
		sketches.add(new SketchShit("demo_intro.pde", new demo_intro()));
		sketches.add(new SketchShit("pat1.pde", new pat1()));
		sketches.add(new SketchShit("pat2.pde", new pat2()));
		sketches.add(new SketchShit("pat3.pde", new pat3()));
		sketches.add(new SketchShit("pat4.pde", new pat4()));
		sketches.add(new SketchShit("pat27_28.pde", new pat27_28())); // 5 not used
		sketches.add(sketches.get(5)); // 6 not used
		sketches.add(sketches.get(5)); // 7 not used
		sketches.add(new SketchShit("pat8.pde", new pat8()));
		sketches.add(new SketchShit("pat_9_9.pde", new pat_9_9()));
		sketches.add(new SketchShit("pat10_11.pde", new pat10_11()));
		sketches.add(new SketchShit("pat10_11.pde", new pat10_11()));
		sketches.add(new SketchShit("pat12.pde", new pat12()));
		sketches.add(new SketchShit("pat13.pde", new pat13()));
		sketches.add(new SketchShit("pad141515.pde", new pad141515()));
		sketches.add(new SketchShit("pad141515.pde", new pad141515()));
		sketches.add(new SketchShit("pad161718.pde", new pad161718()));
		sketches.add(new SketchShit("pad161718.pde", new pad161718()));
		sketches.add(new SketchShit("pad161718.pde", new pad161718()));
		sketches.add(new SketchShit("path20.pde", new path20()));
		sketches.add(new SketchShit("pad19.pde", new pad19()));
		sketches.add(new SketchShit("pad21.pde", new pad21()));
		sketches.add(new SketchShit("pad22.pde", new pad22()));
		sketches.add(new SketchShit("pad23.pde", new pad23()));
		sketches.add(new SketchShit("Pattern_24_House.pde", new Pattern_24_House()));
		sketches.add(new SketchShit("Pattern_25_KONFETTI_CANON.pde", new Pattern_25_KONFETTI_CANON()));
		sketches.add(new SketchShit("Pattern_26_ROAD.pde", new Pattern_26_ROAD()));
		sketches.add(new SketchShit("pat27_28.pde", new pat27_28())); 
		sketches.add(null);
		sketches.add(new SketchShit("pat29_31.pde", new pat29_31())); 
		sketches.add(new SketchShit("pat29_31.pde", new pat29_31()));
		sketches.add(new SketchShit("pat29_31.pde", new pat29_31()));
		sketches.add(new SketchShit("Pattern_32_BOUNCING_BALLS.pde", new Pattern_32_BOUNCING_BALLS()));
		sketches.add(new SketchShit("Pattern_33_MOUNTAIN.pde", new Pattern_33_MOUNTAIN()));
		sketches.add(new SketchShit("path34.pde", new path34()));
		sketches.add(new SketchShit("path35.pde", new path35()));
		sketches.add(new SketchShit("pad36.pde", new pad36()));
		sketches.add(sketches.get(5)); // 37 not used
		sketches.add(new SketchShit("pat_38_39_39_40_40.pde", new pat_38_39_39_40_40()));
		sketches.add(null);
		sketches.add(null);
		sketches.add(new SketchShit("pat41_42.pde", new pat41_42()));
		sketches.add(new SketchShit("pat41_42.pde", new pat41_42()));
		sketches.add(new SketchShit("pat43.pde", new pat43()));
		sketches.add(new SketchShit("pat44.pde", new pat44()));
		sketches.add(new SketchShit("pat45_46_47_48_49.pde", new pat45_46_47_48_49()));
		sketches.add(new SketchShit("pat45_46_47_48_49.pde", new pat45_46_47_48_49()));
		sketches.add(new SketchShit("pat45_46_47_48_49.pde", new pat45_46_47_48_49()));
		sketches.add(new SketchShit("pat45_46_47_48_49.pde", new pat45_46_47_48_49()));
		sketches.add(new SketchShit("pat45_46_47_48_49.pde", new pat45_46_47_48_49()));
		sketches.add(new SketchShit("Pattern_50_ROOTS.pde", new Pattern_50_ROOTS()));
		sketches.add(new SketchShit("Pattern_51_SHAKY.pde", new Pattern_51_SHAKY()));
		sketches.add(new SketchShit("pat52.pde", new pat52()));
		sketches.add(new SketchShit("pattern53.pde", new pattern53()));
		sketches.add(new SketchShit("pattern54.pde", new pattern54()));
		sketches.add(new SketchShit("pat55.pde", new pat55())); // 55
		sketches.add(new SketchShit("pat56_57_58.pde", new pat56_57_58()));
		sketches.add(new SketchShit("pat56_57_58.pde", new pat56_57_58()));
		sketches.add(new SketchShit("pat56_57_58.pde", new pat56_57_58()));
		sketches.add(new SketchShit("demo_outro.pde", new demo_outro()));		
	}
	
	public void settings() 
	{  
		if ( presentation )
			fullScreen(2);
		else
			size(720, 480);
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
