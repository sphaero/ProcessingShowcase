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
    PApplet sketch;
    
	public void setup()
	{	
		//surface.setResizable(true);
		sketch = sketches.get(currentIndex).sketch;
		if (sketch.g== null )
		{
			sketch.g = this.g;
			sketch.setSize(this.width, this.height);
			// is protected unfortunately so we can't use
			// frameRate() methods
			//sketch.surface = this.getSurface;
		}
		if (sketch.width != this.width || sketch.height != this.height )
		{
			sketch.setSize(this.width, this.height);
		}
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
		sketch.postEvent(pe);
	}
	
	public void draw()
	{
		//playSounds();
		sketch.handleDraw();
	}
	
	public void frameResized(int w, int h)
	{
		println(w,h);
	}
	
	public void settings() 
	{  
		size(640, 360);
		currentIndex = 0;
		// order is the pattern number!!!
        sketches.add(new SketchShit("Rondjes_groterwordend.pde", new Rondjes_groterwordend()));
        sketches.add(new SketchShit("Artwork02.pde", new Artwork02()));
        sketches.add(new SketchShit("Jules_Janssen_Mondriaan.pde", new Jules_Janssen_Mondriaan()));
        sketches.add(new SketchShit("Mondriaan.pde", new Mondriaan()));
        sketches.add(new SketchShit("Mondriaan_.pde", new Mondriaan_()));
        sketches.add(new SketchShit("Mondriaan_continue_to_black.pde", new Mondriaan_continue_to_black()));
        sketches.add(new SketchShit("Mondriaan_inspratie_beeld.pde", new Mondriaan_inspratie_beeld()));
        sketches.add(new SketchShit("Skillslab_Picasso.pde", new Skillslab_Picasso()));
        sketches.add(new SketchShit("mondriaan.pde", new mondriaan()));
        sketches.add(new SketchShit("mondriaan_eind.pde", new mondriaan_eind()));
        sketches.add(new SketchShit("test.pde", new test()));
        sketches.add(new SketchShit("truman_zon.pde", new truman_zon()));
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
