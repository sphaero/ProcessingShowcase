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
		if (played15 == -1 && (channel1instr == 21 || channel2instr == 21 || channel3instr == 21 || channel4instr == 21
				|| channel1instr == 3 || channel2instr == 3 || channel3instr == 3 || channel4instr == 3) )
		{
			played15 = millis();
			nickidx++;
			nickidx = nickidx % nicknames.length;
		}
		if (played15 > 0 )
		{
			push();
			int a = millis() - played15;
			fill((millis() - played15), a > 0 && a < 1000 ? a * 4: 0 );
			//println(millis());
			//println("blaa", played15, (millis() - played15));
			textFont(mono);
			textAlign(LEFT);
			text(nicknames[nickidx], 32,height - 50);
			pop();
		}
		if ( millis() - played15 > 1000 )
		{
			played15 = -1;
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
		    	currentIndex = idxNr;
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
		List<SketchShit> filler = Arrays.asList(new SketchShit("filler.pde", new filler()));
		
		sketches.add(filler);
		sketches.add(Arrays.asList(new SketchShit("intro.pde", new intro())));
		sketches.add(Arrays.asList(new SketchShit("intro.pde", new intro())));
		sketches.add(null);
		sketches.add(null);
		sketches.add(Arrays.asList(new SketchShit("pattern5.pde", new pattern5()))); // 5
		sketches.add(Arrays.asList(new SketchShit("demo_test_hidde.pde", new demo_test_hidde())));
		sketches.add(Arrays.asList(new SketchShit("flags.pde", new flags())));
		sketches.add(Arrays.asList(new SketchShit("makeskeleton.pde", new makeskeleton())));		
		sketches.add(Arrays.asList(new SketchShit("medlab_les4_mimicmusic_thomas_wind.pde", new medlab_les4_mimicmusic_thomas_wind())));
		sketches.add(Arrays.asList(new SketchShit("shadertest.pde", new shadertest()))); // 10
		sketches.add(Arrays.asList(new SketchShit("sillyskeleton.pde", new sillyskeleton())));
		sketches.add(Arrays.asList(new SketchShit("voetbal2.pde", new voetbal2())));
		sketches.add(Arrays.asList(new SketchShit("voorbereiding_4_okt_.pde", new voorbereiding_4_okt_())));
		sketches.add(Arrays.asList(new SketchShit("pattern14.pde", new pattern14())));
		sketches.add(Arrays.asList(new SketchShit("pattern15.pde", new pattern15()))); //15
		sketches.add(Arrays.asList(new SketchShit("pattern16.pde", new pattern16())));
		sketches.add(null);
		sketches.add(Arrays.asList(new SketchShit("pat19.pde", new pat19())));
		sketches.add(Arrays.asList(new SketchShit("pattern19.pde", new pattern19())));
		sketches.add(null); // 20
		sketches.add(Arrays.asList(new SketchShit("pattern21.pde", new pattern21())));
		sketches.add(null);
		sketches.add(Arrays.asList(new SketchShit("pattern23.pde", new pattern23())));
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
