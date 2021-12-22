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
	
	List<SketchShit> sketches = new ArrayList<>();
    int currentIndex;
    int _runningIndex;
    PApplet sketch;
    Boolean presentation = false;
    
    PFont mono = null;
    OscP5 oscP5 = null;
    int patternnr = 0;
    int patternrow = 0;
    int colors[] = { color(70, 35, 122), color(61, 220, 151), color(243, 167, 18), color(1, 186, 239), color(255, 0, 127) };
    int strobe = 0;
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
    
    NetAddress lichttafel = new NetAddress("10.2.4.29",7700);
    
	public void setup()
	{
		if (mono == null)  mono = createFont("ArcadeClassic.ttf", 30);
		if (oscP5 == null) oscP5 = new OscP5(this,6200);
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
		rectMode(CORNER);
		imageMode(CORNER);
		ellipseMode(CENTER);
		textAlign(LEFT);
		blendMode(BLEND);
		fill(255);
		stroke(0);
		strokeWeight(1);
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
		frame.setLocation(1, 1);
		try {
			pushMatrix();
			sketch.handleDraw();
			popMatrix();
		}
		catch (Exception e)
		{
			println(e.getMessage());
		}
		
		/*g.beginDraw();
		stroke(0);
		for (int i = 0; i < height; i+=3)
		{
		    line(0, i, width, i);
		}
		textFont(mono);
		text("pattern: "+ currentIndex, 10,25);
		
		g.endDraw();
		*/
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
		if (message.checkAddrPattern("/loop" ) )
        {
			//message.typetag()[0] == 'T'
			Boolean loop = message.typetag().charAt(0) == 'T';
			if (!loop)
			{
				println("Loop detected with no looping so let's exit", loop);
				System.exit(0);
			}
        }
		if (message.checkAddrPattern("/patternevent" ) )
        {
		    /* print the address pattern and the typetag of the received OscMessage */
		    //print("### received an osc message.");
		    //print(" addrpattern: "+message.addrPattern());
		    //println(" typetag: "+message.typetag());
		    
		    //songposition = message.get(0).intValue();
		    int pattern = message.get(1).intValue();
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
		    //System.out.println(pattern);
		    //patternrow = message.get(2).intValue();
		    /*if ( currentIndex != pattern )
			{
				loopCount++;
				loopIndex[pattern]++;
			}*/
			currentIndex = pattern;
		}
		
		try
		{
	      Method oscEvent = sketch.getClass().getMethod("oscEvent",
	                        new Class[] { OscMessage.class });
	      oscEvent.invoke(sketch, message );
	    } 
		catch (Exception e) {
	    	//System.out.println("No modRowEvent found in the sketch!");
	    	// no such method, or an error.. which is fine, just ignore
	    }

	}
	
	public void modRowEvent( int channel, int instrument, int note )
	{
		try
		{
	      Method modRowEvent = sketch.getClass().getMethod("modRowEvent",
                            new Class[] { int.class, int.class, int.class });
	      modRowEvent.invoke(sketch, channel, instrument, note );
	    } catch (Exception e) {
	    	//System.out.println("No modRowEvent found in the sketch!");
	    	// no such method, or an error.. which is fine, just ignore
	    }
		//  We reageren alleen op instrument 2
	    if (instrument == 2)
		{
		    println(channel +":"+ instrument +":"+ note);
		    //  Whatever instrument is being played just set a background color from the note played.
 		}
	}
	
	public void modPatternEvent( int pattern, int position )
	{
		System.out.println("pattern " + pattern + " , position " + position );
		/*if ( currentIndex != pattern )
		{
			loopCount++;
			loopIndex[pattern]++;
		}*/
		currentIndex = pattern;
	}
	
	public void build()
	{
		sketches.clear();
		currentIndex = 0;
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
	
	public SketchShit getShit()
	{
		if (currentIndex > sketches.size() - 1 )
			currentIndex = currentIndex % sketches.size();
		return sketches.get(currentIndex);
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
