import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

import processing.core.PApplet;

public class ProcessingShowcase {

	procmod2.ModPlayer mplayer;

	int startPos = 0;   
	int endPos = 104;     
	int currentPos = 0;
	int currentPositie = 0;
	int currentPattern = 0;

	public void loadSounds() {
		System.out.println("fake loadSounds called");
	}

	public void loadSounds(int startPositie, int eindPositie)
	{
		loadSounds();
	}

	public void loadMusic(PApplet sketch) 
	{
	  // load the sound file
	  String modfile = "go.mod";
	  System.out.println( "Loading: " + modfile);
	  mplayer = new procmod2.ModPlayer(sketch, modfile);
	  mplayer.play();
	}
	
	public static void main(String[] args)
	{
		ProcessingShowcase inst = new ProcessingShowcase();
		
		TextApp textApp = new TextApp();
		WindowMergeApp windowApp = new WindowMergeApp();

		String[] ta_args = {""};
		PApplet.runSketch(ta_args, textApp);

		String[] wa_args = new String[]{"ProcessingShowcase"};
		PApplet.runSketch(wa_args, windowApp);

		inst.loadMusic(windowApp);
		
		int currentSketchIndex = -1;
		
		while(true){

			//using a broad exception to just skip over any sketches that have problems
			try 
			{
				if ( currentSketchIndex != windowApp.currentIndex )
				{
					currentSketchIndex = windowApp.currentIndex;
					
					SketchShit sht = windowApp.getShit();
					if (sht != null )
					{
						String name = sht.pde;
						String dir = name.substring(0, name.lastIndexOf('.'));
						textApp.set_filename("pde/" + dir + "/" + name);
					}
				}
				Thread.sleep(50);
			}
			catch (Exception e) {
				System.err.println("There was a problem setting the source of a sketch!");
				e.printStackTrace();
				break;
			}
		}
	}
}
