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
    Boolean fuckyouplayed = false;
    
    float totalLength = 0;
    int counter = 0;
    
	public void setup()
	{
		fuckyouplayed = false;
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
		try {
			pushMatrix();
			sketch.handleDraw();
			popMatrix();
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
		/*textFont(mono);
		textAlign(LEFT);
		text("pattern: "+ currentIndex, 10,height - 50);
		*/
		//println(channel4instr);
		if (channel4instr == 18)
		{
			fuckyouplayed = true;
		}
		if (fuckyouplayed)
		{
		  fill(0);
		  for (int i=0;i<width;i+=3)
		  {
		    rect(i,0,2,height);
		  }
		  fill(222,5,5);
		  textFont(mono);
		  textSize(257);
		  textAlign(CENTER,CENTER);
		  text("MASS", width/2,130); 
		  fill(255,0,0);
		  textSize(206);
		  text("SPRIT", width/2,284);  
		}
		/*if (strobe != patternrow )
		{
			OscMessage lamp1on = new OscMessage("/lamp1");
			lamp1on.add(255); // add an int to the osc message 

			OscMessage lamp1off = new OscMessage("/lamp1");
			lamp1off.add(0); // add an int to the osc message

			if (strobe == -1) { strobe =patternrow; background(colors[1]); oscP5.send(lamp1off, lichttafel); }
			else if (channel4instr == 28 && channel1instr == 28 && channel2instr == 28 && channel3instr == 28) { strobe =-1; background(colors[1]); oscP5.send(lamp1on, lichttafel); }
	        else if (channel4instr == 28 && channel1instr == 28 && channel2instr == 28) { strobe = -1; background(colors[2]); oscP5.send(lamp1on, lichttafel);}
		    else if (channel4instr == 28 && channel1instr == 28) { strobe = -1; background(colors[3]); oscP5.send(lamp1on, lichttafel);}
		    else if (channel4instr == 28) { strobe = -1; background(colors[4]); oscP5.send(lamp1on, lichttafel);}
	        else if (channel4instr == 28 || channel1instr == 28 || channel2instr == 28 || channel3instr == 28) { strobe = -1; background(colors[0]); oscP5.send(lamp1on, lichttafel);}
		}*/
		
		g.endDraw();
		counter++;
		
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
	      Method oscEvent = sketch.getClass().getMethod("oscEvent",
	                        new Class[] { OscMessage.class });
	      oscEvent.invoke(sketch, message );
	    } 
		catch (Exception e) {
	    	//System.out.println("No modRowEvent found in the sketch!");
	    	// no such method, or an error.. which is fine, just ignore
	    }

	}
	
	public void build()
	{
		sketches.clear();
		currentIndex = 0;
		//List fill = Arrays.asList(new SketchShit("filler.pde", new filler()));
		sketches.add(Arrays.asList(new SketchShit("intro.pde", new intro())));
		sketches.add(Arrays.asList(new SketchShit("pattern_1_ks.pde", new pattern_1_ks())));
		sketches.add(Arrays.asList(new SketchShit("pattern2.pde", new pattern2())));
		sketches.add(Arrays.asList(new SketchShit("pattern3.pde", new pattern3())));
		sketches.add(Arrays.asList(new SketchShit("pattern_4_ks.pde", new pattern_4_ks())));
		sketches.add(Arrays.asList(new SketchShit("pattern5.pde", new pattern5()))); //5
		sketches.add(Arrays.asList(new SketchShit("pattern6.pde", new pattern6()))); //5
		sketches.add(Arrays.asList(new SketchShit("pattern7.pde", new pattern7()))); //5
		sketches.add(Arrays.asList(new SketchShit("pattern_8_ks.pde", new pattern_8_ks())));
		sketches.add(Arrays.asList(new SketchShit("pattern9.pde", new pattern9()))); 
		sketches.add(Arrays.asList(new SketchShit("pattern10.pde", new pattern10())));//10
		sketches.add(Arrays.asList(new SketchShit("pattern11.pde", new pattern11())));
		sketches.add(null);
		sketches.add(Arrays.asList(new SketchShit("sini_pattern_14.pde", new sini_pattern_14())));
		sketches.add(null);
		sketches.add(null);
		sketches.add(null);
		sketches.add(Arrays.asList(new SketchShit("pattern_17.pde", new pattern_17())));
		sketches.add(Arrays.asList(new SketchShit("pattern_18.pde", new pattern_18())));
		sketches.add(Arrays.asList(new SketchShit("pattern19.pde", new pattern19())));
		sketches.add(Arrays.asList(new SketchShit("pattern20.pde", new pattern20())));
		sketches.add(null);
		sketches.add(Arrays.asList(new SketchShit("pattern_22.pde", new pattern_22())));
		sketches.add(null);
		sketches.add(null);
		sketches.add(null); //25
		sketches.add(null);
		sketches.add(Arrays.asList(new SketchShit("filler.pde", new filler())));
		sketches.add(Arrays.asList(new SketchShit("pattern28.pde", new pattern28())));
		sketches.add(Arrays.asList(new SketchShit("pattern29.pde", new pattern29()))); //sketches.add(Arrays.asList(new SketchShit("pattern292.pde", new pattern292())));
		sketches.add(Arrays.asList(new SketchShit("pattern30.pde", new pattern30()))); //30
		sketches.add(Arrays.asList(new SketchShit("pattern31.pde", new pattern31())));
		sketches.add(Arrays.asList(new SketchShit("pattern32.pde", new pattern32())));
		//sketches.add(Arrays.asList(new SketchShit("sketch_lucas_5.pde", new sketch_lucas_5())));
		sketches.add(Arrays.asList(new SketchShit("pattern_33.pde", new pattern_33())));
		sketches.add(Arrays.asList(new SketchShit("pattern_34.pde", new pattern_34())));
		sketches.add(Arrays.asList(new SketchShit("pattern_35.pde", new pattern_35())));
		sketches.add(Arrays.asList(new SketchShit("pattern_36.pde", new pattern_36())));
		sketches.add(Arrays.asList(new SketchShit("pattern_37.pde", new pattern_37())));
		sketches.add(Arrays.asList(new SketchShit("frankseductiondemo.pde", new frankseductiondemo())));
		sketches.add(null);
		sketches.add(Arrays.asList(new SketchShit("pattern40.pde", new pattern40()))); //40
		sketches.add(Arrays.asList(new SketchShit("pattern41.pde", new pattern41())));
		sketches.add(Arrays.asList(new SketchShit("pattern_42.pde", new pattern_42())));
		sketches.add(Arrays.asList(new SketchShit("filler.pde", new filler())));
		sketches.add(Arrays.asList(new SketchShit("pattern_44.pde", new pattern_44())));
		sketches.add(Arrays.asList(new SketchShit("pattern_45.pde", new pattern_45())));
		sketches.add(Arrays.asList(new SketchShit("pattern_46.pde", new pattern_46())));
		sketches.add(Arrays.asList(new SketchShit("filler.pde", new filler())));
		sketches.add(Arrays.asList(new SketchShit("filler.pde", new filler())));
		sketches.add(Arrays.asList(new SketchShit("intro.pde", new intro())));
		sketches.add(Arrays.asList(new SketchShit("intro.pde", new intro()))); //50
		sketches.add(Arrays.asList(new SketchShit("intro.pde", new intro())));
		sketches.add(Arrays.asList(new SketchShit("intro.pde", new intro())));
		sketches.add(Arrays.asList(new SketchShit("pattern_53.pde", new pattern_53())));
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
