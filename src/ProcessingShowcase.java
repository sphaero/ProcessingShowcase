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
import ddf.minim.*; 

public class ProcessingShowcase {

	Minim minim;
	AudioPlayer snip;

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

	public void _loadSounds(PApplet sketch) 
	{
	  // load the sound file
	  String soundfile = "sound/psychotech.wav";
	  System.out.println( "Loading: " + soundfile);
	  minim = new Minim(sketch);
	  snip = minim.loadFile(soundfile);
	  currentPositie = startPos;
	  currentPattern = pospatterns[currentPositie][1];
	  System.out.println( "playing position: "+ currentPositie + " pattern: " + currentPattern );
	  snip.setLoopPoints(startPos * 6666, (endPos+1) * 6666);
	  snip.loop(-1); //infinite loop
	  //snip.play();
	}

	public int playSounds() {
		int musicpos = snip.position();
		if ( currentPositie != PApplet.parseInt(musicpos / 6666 ) &&  PApplet.parseInt(musicpos / 6666 ) - currentPositie <= 1 )
		{
			if( musicpos >= (endPos+1) * 6666 )
			{
				currentPositie = startPos;
			}
			else
			{
				currentPositie = PApplet.parseInt(musicpos / 6666 );
			}
			currentPattern = pospatterns[currentPositie][1];
			System.out.println( "playing position: "+ currentPositie + " pattern: " + currentPattern );
			return currentPositie;

		}
		return -1;
	}
	
	int[][] pospatterns = {
			{0, 0},
			{1, 1},
			{2, 4},
			{3, 2},
			{4, 3},
			{5, 4},
			{6, 2},
			{7, 8},
			{8, 9},
			{9, 9},
			{10, 10},
			{11, 11},
			{12, 11},
			{13, 12},
			{14, 13},
			{15, 13},
			{16, 14},
			{17, 15},
			{18, 15},
			{19, 16},
			{20, 17},
			{21, 18},
			{22, 19},
			{23, 20},
			{24, 20},
			{25, 21},
			{26, 22},
			{27, 22},
			{28, 23},
			{29, 23},
			{30, 24},
			{31, 24},
			{32, 25},
			{33, 25},
			{34, 26},
			{35, 26},
			{36, 24},
			{37, 24},
			{38, 27},
			{39, 28},
			{40, 28},
			{41, 29},
			{42, 29},
			{43, 30},
			{44, 30},
			{45, 31},
			{46, 31},
			{47, 32},
			{48, 32},
			{49, 33},
			{50, 33},
			{51, 34},
			{52, 35},
			{53, 35},
			{54, 36},
			{55, 36},
			{56, 35},
			{57, 35},
			{58, 34},
			{59, 38},
			{60, 39},
			{61, 39},
			{62, 40},
			{63, 40},
			{64, 41},
			{65, 42},
			{66, 42},
			{67, 41},
			{68, 43},
			{69, 43},
			{70, 44},
			{71, 44},
			{72, 45},
			{73, 46},
			{74, 46},
			{75, 45},
			{76, 47},
			{77, 48},
			{78, 48},
			{79, 49},
			{80, 49},
			{81, 48},
			{82, 48},
			{83, 51},
			{84, 50},
			{85, 50},
			{86, 51},
			{87, 52},
			{88, 52},
			{89, 53},
			{90, 53},
			{91, 54},
			{92, 54},
			{93, 55},
			{94, 55},
			{95, 54},
			{96, 54},
			{97, 53},
			{98, 53},
			{99, 58},
			{100, 56},
			{101, 57},
			{102, 57},
			{103, 56},
			{104, 59},
			{105, 59},
			{106, 59},
			{107, 59}
	};
	
	public static void main(String[] args)
	{
		ProcessingShowcase inst = new ProcessingShowcase();
		
		TextApp textApp = new TextApp();
		WindowMergeApp windowApp = new WindowMergeApp();

		String[] ta_args = {""};
		PApplet.runSketch(ta_args, textApp);

		String[] wa_args = new String[]{"ProcessingShowcase"};
		PApplet.runSketch(wa_args, windowApp);

		inst._loadSounds(windowApp);
		
		int currentSketchIndex = 0;
		
		while(true){

			//using a broad exception to just skip over any sketches that have problems
			try {
				int pos = inst.playSounds();
				if ( pos != -1 )
				{
					int patt = inst.pospatterns[pos][1];
					if ( windowApp.currentIndex != patt && windowApp.sketches.get( patt % windowApp.sketches.size() ) != null )
					{
						windowApp.currentIndex = patt % windowApp.sketches.size();
						
						String name = windowApp.sketches.get( windowApp.currentIndex ).pde;
		                String dir = name.substring(0, name.lastIndexOf('.'));
	
						textApp.set_filename("pde/" + dir + "/" + name);
					}
				}
				Thread.sleep(50);
			}
			catch (Exception e) {
				System.err.println("There was a problem running a sketch!");
				e.printStackTrace();
				System.err.println("Skipping to the next sketch.");
				break;
			}
		}
	}
}
