import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import netP5.*; 
import oscP5.*; 

import java.util.HashMap; 
import java.util.List; 
import java.util.ArrayList; 
import java.util.Arrays; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 
import java.lang.reflect.*;

public class WindowMergeApp extends PApplet {
	
	List<List<SketchShit>> sketches = new ArrayList<>();
    int currentIndex;
    int _runningIndex;
    int loopIndex[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    int loopCount = 0;
    PApplet sketch;
    achtergrond bgsketch = null;
    Boolean presentation = false;
    
    PFont mono = null;
    OscP5 oscP5 = null;
    int patternnr = 0;
    int patternrow = 0;
    int channel1instr = 0;
    int channel2instr = 0;
    int channel3instr = 0;
    int channel4instr = 0;
    int channel1note = 0;
    int channel2note = 0;
    int channel3note = 0;
    int channel4note = 0;
    char channel1effect;
    char channel2effect;
    char channel3effect;
    char channel4effect;
    String channel1effect_param = "00";
    String channel2effect_param = "00";
    String channel3effect_param = "00";
    String channel4effect_param = "00";
        
    float totalLength = 0;
    
	public void setup()
	{
		if (mono == null)  mono = createFont("static/RobotoMono-SemiBold.ttf", 64);
		if (oscP5 == null) oscP5 = new OscP5(this,6200);
		if (bgsketch == null )
		{
			bgsketch = new achtergrond();
			bgsketch.g = this.g;
			bgsketch.setSize(this.width, this.height);
			bgsketch.sketchPath(this.sketchPath());
		}

		SketchShit sht = getShit();
		sketch = sht.sketch;
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
		colorMode(RGB, 255, 255, 255);
		sketch.colorMode(RGB, 255, 255, 255);
		rectMode(CORNER);
		sketch.rectMode(CORNER);
		imageMode(CORNER);
		sketch.imageMode(CORNER);
		ellipseMode(CENTER);
		sketch.ellipseMode(CENTER);
		textAlign(LEFT);
		sketch.textAlign(LEFT);
		blendMode(BLEND);
		sketch.blendMode(BLEND);
		fill(255);
		sketch.fill(255);
		stroke(0);
		sketch.stroke(0);
		strokeWeight(1);
		sketch.strokeWeight(1);
		clear();
		sketch.clear();
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
		frame.setLocation(1, 1);
		bgsketch.push();
		bgsketch.draw();
		bgsketch.pop();
		
		try {
			sketch.push();
			sketch.handleDraw();
			sketch.pop();
		}
		catch (Exception e)
		{
			println(e.getMessage());
		}
		
		g.beginDraw();
		/*stroke(0);
		for (int i = 0; i < height; i+=3)
		{
		    line(0, i, width, i);
		}*/
		textFont(mono);
		textAlign(LEFT);
		text("pattern: "+ currentIndex, 10,height - 50);
		g.endDraw();
		
		if ( currentIndex != _runningIndex)
		{
			if ( currentIndex == -1 )
			{
				build();
			}
			if ( getShit()  == null ) 
			{
				_runningIndex = currentIndex; // just continue if next is null
			}
			else frameCount = -1; // triggers setup
		}
	}	
		
	public void frameResized(int w, int h)
	{
		println(w,h);
	}
	
	public void oscEvent(OscMessage message) 
	{
		if (message.checkAddrPattern("/patternevent" ) )
        {
		    /* print the address pattern and the typetag of the received OscMessage */
		    //print("### received an osc message.");
		    //print(" addrpattern: "+message.addrPattern());
		    //println(" typetag: "+message.typetag());
		    
		    //songposition = message.get(0).intValue();
		    patternnr = message.get(1).intValue();
		    patternrow = message.get(2).intValue();
		    channel1note = message.get(3).intValue();
		    channel1instr = message.get(4).intValue();
		    channel1effect = message.get(5).charValue();
		    channel1effect_param = message.get(6).stringValue();
		    channel2note = message.get(7).intValue();
		    channel2instr = message.get(8).intValue();
		    channel2effect = message.get(9).charValue();
		    channel2effect_param = message.get(10).stringValue();    
		    channel3note = message.get(11).intValue();
		    channel3instr = message.get(12).intValue();
		    channel3effect = message.get(13).charValue();
		    channel3effect_param = message.get(14).stringValue();
		    channel4note = message.get(15).intValue();;
		    channel4instr = message.get(16).intValue();
		    channel4effect = message.get(17).charValue();
		    channel4effect_param = message.get(18).stringValue();
		    //System.out.println(patternnr);
		    int idxNr = patternnr % sketches.size();  // sketches array determines maximum index nr
		    if ( currentIndex != idxNr )
			{
				loopCount++;
				loopIndex[idxNr]++;
			}
			currentIndex = idxNr;
		}
		
		try
		{
	      Method oscEvent = bgsketch.getClass().getMethod("oscEvent",
	                        new Class[] { OscMessage.class });
	      oscEvent.invoke(bgsketch, message );
	      oscEvent = sketch.getClass().getMethod("oscEvent",
                  new Class[] { OscMessage.class });
	      oscEvent.invoke(sketch, message );

	    } 
		catch (Exception e) {
	    	//System.out.println(e);
	    	// no such method, or an error.. which is fine, just ignore
	    }

	}
	
	public void build()
	{
		sketches.clear();
		currentIndex = 0;
		//List fill = Arrays.asList(new SketchShit("filler.pde", new filler()));
		List<SketchShit> filler = Arrays.asList(new SketchShit("filler.pde", new filler()));
		sketches.add(Arrays.asList(new SketchShit("pat_0_1.pde", new pat_0_1())));
		sketches.add(Arrays.asList(new SketchShit("pat1.pde", new pat1())));
		sketches.add(Arrays.asList(new SketchShit("pat2.pde", new pat2())));
		sketches.add(Arrays.asList(new SketchShit("pat3.pde", new pat3())));
		sketches.add(Arrays.asList(new SketchShit("pat4.pde", new pat4())));
		sketches.add(Arrays.asList(new SketchShit("backgrouind_v3.pde", new backgrouind_v3())));
		sketches.add(filler);
		sketches.add(Arrays.asList(new SketchShit("pat7.pde", new pat7())));
		sketches.add(Arrays.asList(new SketchShit("pat8.pde", new pat8())));
		sketches.add(Arrays.asList(new SketchShit("pat9.pde", new pat9())));
		sketches.add(Arrays.asList(new SketchShit("pat10.pde", new pat10())));
		sketches.add(null);
		sketches.add(Arrays.asList(new SketchShit("pat12.pde", new pat12())));
		sketches.add(Arrays.asList(new SketchShit("pad_13.pde", new pad_13())));
		sketches.add(Arrays.asList(new SketchShit("pat14_lieke.pde", new pat14_lieke())));
		sketches.add(filler);
	}	

	public SketchShit getShit()
	{
		if (currentIndex > sketches.size() - 1 )
			currentIndex = currentIndex % sketches.size();
		List<SketchShit> lsht = sketches.get(currentIndex);
		if (lsht == null) return null;
		return lsht.get(loopIndex[currentIndex] % lsht.size());
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
