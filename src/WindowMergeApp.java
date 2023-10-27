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
//import java.io.BufferedReader; 
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
    
    int played15 = -1;
    int nickidx = 0;
    String[] nicknames = {"sphaero","Congolais"
    		,"kurketrekker\n"
    		, "dipsy\n"
    		, "Codeclown\n"
    		, "Sojasaus\n"
    		, "Khetieq\n"
    		, "Waaaaaa!\n"
    		, "schmetterling\n"
    		, "toiletb0y\n"
    		, "Oswald\n"
    		, "yebbit\n"
    		, "debie.l\n"
    		, "JamPot\n"
    		, "Maassisimo\n"
    		, "Melman\n"
    		, "Sambal\n"
    		, "Bob_the_Builder\n"
    		, "green\n"
    		, "geek\n"
    		, "Lors\n"
    		, "sjeuf7\n"
    		, "kopjecode"};

        
    float totalLength = 0;
    
	public void setup()
	{
		if (mono == null)  mono = createFont("static/RobotoMono-SemiBold.ttf", 64);
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
		//surface.setLocation(1, 1);
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
		if (played15 == -1 && (channel1instr == 21 || channel2instr == 21 || channel3instr == 21 || channel4instr == 21) )
		{
			played15 = frameCount;
			nickidx++;
			nickidx = nickidx % nicknames.length;
		}
		if (played15 > 0 )
		{
			fill(255,(frameCount - played15) * 16);
			textFont(mono);
			textAlign(LEFT);
			text(nicknames[nickidx], 10,height - 50);
		}
		if (frameCount - played15 > 14 )
		{
			played15 =-1;
		}
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
		    else if ( currentIndex == idxNr && patternrow == 0 )
		    {
		    	// hey we're repeating the same patternnr
		    	loopIndex[idxNr]++;
		    	frameCount = -1;
		    }
			currentIndex = idxNr;
		}
		
		try
		{
	      Method oscEvent = sketch.getClass().getMethod("oscEvent",
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
		currentIndex = -1;
		//List fill = Arrays.asList(new SketchShit("filler.pde", new filler()));
		List<SketchShit> filler = Arrays.asList(new SketchShit("filler.pde", new filler()));	
		sketches.add(Arrays.asList(new SketchShit("pattern0.pde", new pattern0())));
		sketches.add(Arrays.asList(new SketchShit("pattern1.pde", new pattern1())));
		sketches.add(Arrays.asList(new SketchShit("pattern2.pde", new pattern2())));
		sketches.add(Arrays.asList(new SketchShit("warningtria.pde", new warningtria())));
		sketches.add(null);
		// 5
		sketches.add(null);
		sketches.add(null);
		sketches.add(Arrays.asList(new SketchShit("pettern_7_.pde", new pettern_7_())));		
		sketches.add(Arrays.asList(new SketchShit("pattern8.pde", new pattern8())));
		sketches.add(Arrays.asList(new SketchShit("pattern9.pde", new pattern9())));
		//10
		sketches.add(Arrays.asList(new SketchShit("pattern10.pde", new pattern10())));
		sketches.add(Arrays.asList(new SketchShit("pattern11.pde", new pattern11())));
		sketches.add(Arrays.asList(new SketchShit("filler.pde", new filler())));
		sketches.add(Arrays.asList(new SketchShit("pattern13willemijn.pde", new pattern13willemijn())));
		sketches.add(Arrays.asList(new SketchShit("patern14.pde", new patern14())));
		// 15
		sketches.add(Arrays.asList(new SketchShit("patern15.pde", new patern15())));
		sketches.add(Arrays.asList(new SketchShit("pattern16.pde", new pattern16())));
		sketches.add(Arrays.asList(new SketchShit("pattern17.pde", new pattern17())));
		sketches.add(Arrays.asList(new SketchShit("pattern18.pde", new pattern18())));
		sketches.add(Arrays.asList(new SketchShit("filler.pde", new filler())));
		// 20
		sketches.add(Arrays.asList(new SketchShit("pattern_20.pde", new pattern_20())));
		sketches.add(Arrays.asList(new SketchShit("filler.pde", new filler())));
		sketches.add(Arrays.asList(new SketchShit("pattern22.pde", new pattern22())));
		sketches.add(Arrays.asList(new SketchShit("pattern23n.pde", new pattern23n())));
		sketches.add(Arrays.asList(new SketchShit("pattern24.pde", new pattern24())));
		//25
		sketches.add(Arrays.asList(new SketchShit("patern_25.pde", new patern_25())));
		sketches.add(Arrays.asList(new SketchShit("filler.pde", new filler())));
		sketches.add(Arrays.asList(new SketchShit("pattern27.pde", new pattern27())));
		sketches.add(Arrays.asList(new SketchShit("filler.pde", new filler())));
		sketches.add(Arrays.asList(new SketchShit("pattern29.pde", new pattern29())));
		//30
		sketches.add(Arrays.asList(new SketchShit("pattern30.pde", new pattern30())));
		sketches.add(Arrays.asList(new SketchShit("pattern31.pde", new pattern31())));
		sketches.add(Arrays.asList(new SketchShit("filler.pde", new filler())));
		sketches.add(Arrays.asList(new SketchShit("filler.pde", new filler())));
		sketches.add(Arrays.asList(new SketchShit("pattern34.pde", new pattern34())));
		//35
		sketches.add(Arrays.asList(new SketchShit("pattern35.pde", new pattern35())));
		sketches.add(Arrays.asList(new SketchShit("pattern36.pde", new pattern36())));
		sketches.add(Arrays.asList(new SketchShit("pattern37.pde", new pattern37())));
		sketches.add(Arrays.asList(new SketchShit("pattern38.pde", new pattern38())));
		sketches.add(Arrays.asList(new SketchShit("pattern39.pde", new pattern39())));
		//40
		sketches.add(Arrays.asList(new SketchShit("pattern40.pde", new pattern40())));
		sketches.add(Arrays.asList(new SketchShit("pattern41.pde", new pattern41())));
		sketches.add(Arrays.asList(new SketchShit("pattern42.pde", new pattern42())));
		sketches.add(Arrays.asList(new SketchShit("pattern43.pde", new pattern43())));
		sketches.add(Arrays.asList(new SketchShit("patern_44.pde", new patern_44())));
		//45
		sketches.add(Arrays.asList(new SketchShit("pattern45.pde", new pattern45())));
		sketches.add(Arrays.asList(new SketchShit("pattern46.pde", new pattern46())));
		sketches.add(Arrays.asList(new SketchShit("warningtria.pde", new warningtria())));
		sketches.add(Arrays.asList(new SketchShit("warningtria.pde", new warningtria())));
		sketches.add(Arrays.asList(new SketchShit("pattern_49_2_0.pde", new pattern_49_2_0())));
	}	

	public SketchShit getShit()
	{
		if (currentIndex == -1 ) return new SketchShit("filler.pde", new filler());
		if (currentIndex > sketches.size() - 1 )
			currentIndex = currentIndex % sketches.size();
		List<SketchShit> lsht = sketches.get(currentIndex);
		if (lsht == null) return null;
		//println(loopIndex[currentIndex], lsht.size());
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
