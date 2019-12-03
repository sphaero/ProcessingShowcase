import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import processing.core.PApplet;

public class ProcessingShowcase {

	public static void main(String[] args){
		
		List<PApplet> sketches = new ArrayList<>();
		sketches.add(new Relativity());
		sketches.add(new ColorVariables());
		sketches.add(new Skillslab_Picasso());
		sketches.add(new Mondriaan_());
        sketches.add(new Artwork02());
        sketches.add(new mondriaan_eind());
        sketches.add(new Mondriaan_inspratie_beeld());
        sketches.add(new Mondriaan());
        sketches.add(new truman_zon());
        sketches.add(new Jules_Janssen_Mondriaan());
		//add sketch classes here!

		
		//this is optional, but causes the sketches to appear in random order
		//copy this to where the index is reset to randomize whenever you loop
		Collections.shuffle(sketches);

		int currentSketchIndex = 0;

		while(true){

			//using a broad exception to just skip over any sketches that have problems
			try {
				PApplet sketch = sketches.get(currentSketchIndex);
				String[] processingArgs = {""};
				PApplet.runSketch(processingArgs, sketch);
                if ( sketch.getSurface().isStopped() )
                {
                    System.out.println(sketch.getSurface().isStopped());
                }
				// this is useful after we've looped	
				sketch.getSurface().resumeThread();
				
				//how long do you want each sketch to display for
				//60 seconds
				Thread.sleep(60*100);

                // setting the frameCount to -1 makes sure setup will be 
                // called again next time it resumes.
				sketch.frameCount = -1;
                // prevent sketches from continuing to run while they're hidden
				sketch.getSurface().pauseThread();
				
				//hide the sketch
				sketch.getSurface().setVisible(false);
			}
			catch (Exception e) {
				System.err.println("There was a problem running a sketch!");
				e.printStackTrace();
				System.err.println("Skipping to the next sketch.");
			}

			// move to the next sketch, loop back to the first after finishing
			currentSketchIndex++;
			if(currentSketchIndex >= sketches.size()){
				currentSketchIndex = 0;
			}

			//go back to the top of the while(true) loop
		}
	}
}
