import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 


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
    
    int go_played;
    int go_draw_frame_count = 0;
    float choose = 0.0f;
    PFont mono = null;
	

	public void setup()
	{
		if (mono == null)  mono = createFont("FreeMono.ttf", 30);
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
		textAlign(LEFT);
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
        go_played = 0;
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
		fill(255);
		stroke(0);
		//textFont(mono);
		//text("pattern: "+ currentIndex, 10,25);
		//go_draw_for(15);
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
	
	public void go_draw_for(int frames) // frames = het aantal frames dat je wilt tekenen
	{
	  if ( go_played == 1 )
	  {
	    go_draw_frame_count = frames;
	    go_played = 0;
	    choose = random(1);
	  }
	  if (go_draw_frame_count != 0 )
	  {
	    //
	    // Vanaf hier kun je je eigen draw dingen doen
	    //
		if ( choose > 0.5 )
		{
			go_bleep();
		}
		else
		{
			go_gogov2();
		}
	    
	    // einde draw dingen
	    //
	    go_draw_frame_count = go_draw_frame_count - 1;
	  }
	}
	
	public void go_bleep()
	{
	  fill(121, 134, 210);
	  text("GO", 160, 140);
	    textSize(100);
	    fill(254, 237, 246);
	  text("GO", 360, 240);
	  textSize(200);
	      fill(255, 83, 191);
	  text("GO", 560, 40);
	  textSize(50);
	    fill(255, 83, 191);
	  text("GO", 120, 290);
	    textSize(100);
	    fill(121, 134, 210);
	  text("GO", 700, 300);
	  textSize(200);
	      fill(254, 237, 246);
	  text("GO", 230, 60);
	  textSize(50);
	}
	
	public void go_gogov2()
	{
	    fill(121,134,210);
	    text("GO",-30,550);
	    textSize(400);
	    fill(255,83,191);
	    
	    text("GO",330,260);
	    fill(254,237,246);
	    
	    text("GO",100,380);
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
	    	//System.out.println("No modRowEvent found in the sketch!");
	    	// no such method, or an error.. which is fine, just ignore
	    }
		//  We reageren alleen op instrument 2
	    if (instrument == 2)
		{
		    println(channel +":"+ instrument +":"+ note);
		    //  Whatever instrument is being played just set a background color from the note played.
		    go_played = 1;
		}
	}
	
	public void modPatternEvent( int pattern, int position )
	{
		System.out.println("pattern " + pattern + " , position " + position );
		if ( currentIndex != pattern )
		{
			loopCount++;
			loopIndex[pattern]++;
		}
		currentIndex = pattern;
	}
	
	public void build()
	{
		sketches.clear();
		currentIndex = 1;
		// order is the pattern number!!! (78+51=129)
		sketches.add(Arrays.asList( new SketchShit("pat_0.pde", new pat_0()),
									new SketchShit("pat0.pde", new pat0())));
		sketches.add(Arrays.asList(new SketchShit("intro.pde", new intro())));
		sketches.add(null); // intro
		sketches.add(null); // intro
		sketches.add(Arrays.asList(new SketchShit("pat4.pde", new pat4())));
		sketches.add(Arrays.asList(new SketchShit("pat5.pde", new pat5()))); // 5
		sketches.add(Arrays.asList(new SketchShit("pat6.pde", new pat6()), new SketchShit("position6.pde", new position6())));
		sketches.add(Arrays.asList(new SketchShit("Pat7.pde", new Pat7())));
		sketches.add(Arrays.asList(new SketchShit("pat8.pde", new pat8())));
		sketches.add(Arrays.asList(new SketchShit("pat9.pde", new pat9())));
		sketches.add(Arrays.asList(new SketchShit("pat10.pde", new pat10()))); // 10
		sketches.add(Arrays.asList(new SketchShit("pat11.pde", new pat11())));
		sketches.add(Arrays.asList(new SketchShit("pat12.pde", new pat12())));
		sketches.add(Arrays.asList(new SketchShit("pattern13panlat.pde", new pattern13panlat())));
		sketches.add(Arrays.asList(new SketchShit("pattern14panlat.pde", new pattern14panlat())));
		sketches.add(Arrays.asList(new SketchShit("pat15_18.pde", new pat15_18()))); // 15
		sketches.add(null);
		sketches.add(null);
		sketches.add(null);
		sketches.add(Arrays.asList(new SketchShit("pat19.pde", new pat19())));
		sketches.add(Arrays.asList(new SketchShit("pat20.pde", new pat20()))); // 20
		sketches.add(Arrays.asList(new SketchShit("pat21.pde", new pat21())));
		sketches.add(Arrays.asList(new SketchShit("pat22.pde", new pat22())));
		sketches.add(Arrays.asList(new SketchShit("pat23.pde", new pat23())));
		sketches.add(Arrays.asList(new SketchShit("pat24.pde", new pat24())));
		sketches.add(Arrays.asList(new SketchShit("pat25.pde", new pat25()))); // 25
		sketches.add(Arrays.asList(new SketchShit("pat26.pde", new pat26())));
		sketches.add(Arrays.asList(new SketchShit("pat27.pde", new pat27())));
		sketches.add(Arrays.asList(new SketchShit("pat28.pde", new pat28())));
		sketches.add(Arrays.asList(new SketchShit("pat29.pde", new pat29())));
		sketches.add(Arrays.asList(new SketchShit("pat30_chrisboender.pde", new pat30_chrisboender()))); // 30
		sketches.add(Arrays.asList(new SketchShit("pat31_chrisboender.pde", new pat31_chrisboender())));
		sketches.add(Arrays.asList(new SketchShit("sketch_32laraoostveen.pde", new sketch_32laraoostveen())));
		sketches.add(Arrays.asList(new SketchShit("pat33_chrisboender.pde", new pat33_chrisboender())));
		sketches.add(Arrays.asList(new SketchShit("Pat34.pde", new Pat34())));
		sketches.add(Arrays.asList(new SketchShit("PAT35.pde", new PAT35())));
		sketches.add(Arrays.asList(new SketchShit("PAT36.pde", new PAT36())));
		sketches.add(Arrays.asList(new SketchShit("patt56.pde", new patt56())));
		sketches.add(Arrays.asList(new SketchShit("PAT38.pde", new PAT38())));
		sketches.add(Arrays.asList(new SketchShit("PAT39.pde", new PAT39())));
		sketches.add(Arrays.asList(new SketchShit("Pattern_40.pde", new Pattern_40()))); // 40
		sketches.add(Arrays.asList(new SketchShit("pattern_41.pde", new pattern_41())));
		sketches.add(null);
		sketches.add(Arrays.asList(new SketchShit("PAT_43.pde", new PAT_43())));
		sketches.add(Arrays.asList(new SketchShit("PAT_44.pde", new PAT_44())));
		sketches.add(Arrays.asList(new SketchShit("PAT_45.pde", new PAT_45()))); // 45
		sketches.add(Arrays.asList(new SketchShit("pattern4647lisa.pde", new pattern4647lisa())));
		sketches.add(null);
		sketches.add(Arrays.asList(new SketchShit("lisa48.pde", new lisa48())));
		sketches.add(Arrays.asList(new SketchShit("pat49.pde", new pat49())));
		sketches.add(Arrays.asList(new SketchShit("pat50.pde", new pat50()))); // 50
		sketches.add(Arrays.asList(new SketchShit("demo_sketch_pat51", new demo_sketch_pat51() )));
		sketches.add(Arrays.asList(new SketchShit("demo_sketch_pat52", new demo_sketch_pat52() )));
		sketches.add(Arrays.asList(new SketchShit("tune_5_Pattern_53_Mijs_versie_2.pde", new tune_5_Pattern_53_Mijs_versie_2())));
		sketches.add(Arrays.asList(new SketchShit("tune_5_pattern_54_Mijs_versie_2.pde", new tune_5_pattern_54_Mijs_versie_2())));
		sketches.add(Arrays.asList(new SketchShit("nr_55Laraoostveen.pde", new nr_55Laraoostveen()))); // 55
		sketches.add(Arrays.asList(new SketchShit("tune6_pattern56.pde", new tune6_pattern56())));
		sketches.add(Arrays.asList(new SketchShit("pat57_59.pde", new pat57_59())));
		sketches.add(null);
		sketches.add(null);
		sketches.add(Arrays.asList(new SketchShit("pat60.pde", new pat60()))); // 60
		sketches.add(Arrays.asList(new SketchShit("pat61.pde", new pat61())));
		sketches.add(Arrays.asList(new SketchShit("Pat62.pde", new Pat62())));
		sketches.add(Arrays.asList(new SketchShit("pat57_59.pde", new pat57_59())));
		sketches.add(null);
		sketches.add(null); // 65

		/*
		sketches.add(Arrays.asList(new SketchShit("sketch_200610a_maartenastridagnes.pde", new sketch_200610a_maartenastridagnes())));
		sketches.add(null);
		sketches.add(Arrays.asList(new SketchShit("Skillslabfinal_part_2_v2.pde", new Skillslabfinal_part_2_v2()), 
				                   new SketchShit("part2.pde", new part2()),
				                   new SketchShit("Dave_Haverkort_skillslab_patt2_BYOB.pde", new Dave_Haverkort_skillslab_patt2_BYOB()),
				                   new SketchShit("Dave_Haverkort_skillslab_patt2_GO_GO.pde", new Dave_Haverkort_skillslab_patt2_GO_GO())
								));
		sketches.add(Arrays.asList(new SketchShit("Skillslabfinal_part_3_v2.pde", new Skillslabfinal_part_3_v2()), 
								   new SketchShit("part3.pde", new part3()),
								   new SketchShit("Dave_Haverkort_skillslab_patt3_BYOB.pde", new Dave_Haverkort_skillslab_patt3_BYOB()),
								   new SketchShit("Dave_Haverkort_skillslab_patt3_GO_GO.pde", new Dave_Haverkort_skillslab_patt3_GO_GO())
						   		));
		sketches.add(Arrays.asList(new SketchShit("MuziekGo.pde", new MuziekGo()),
								   new SketchShit("muziekding2.pde", new muziekding2()),
								   new SketchShit("Eind_visual_Skillslab_4.pde", new Eind_visual_Skillslab_4()),
								   new SketchShit("skillslab_sketch_patroon45_susanne.pde", new skillslab_sketch_patroon45_susanne())
						));
		sketches.add(Arrays.asList(new SketchShit("Patt5_Bloem.pde", new Patt5_Bloem()),
				                   new SketchShit("MuziekBlokken.pde", new MuziekBlokken()),
				                   new SketchShit("Eind_visual_Skillslab_5.pde", new Eind_visual_Skillslab_5()),
				                   new SketchShit("skillslab_sketch_samengevoegd_patroon5.pde", new skillslab_sketch_samengevoegd_patroon5()),
								   new SketchShit("Patt5_3.pde", new Patt5_3())
						));
		sketches.add(null);
		sketches.add(Arrays.asList(new SketchShit("credits.pde", new credits())));
		sketches.add(Arrays.asList(new SketchShit("sketch_200610a_maartenastridagnes.pde", new sketch_200610a_maartenastridagnes())));
		*/
	}
	
	public SketchShit getShit()
	{
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
