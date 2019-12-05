import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import processing.core.PApplet;

public class ProcessingShowcase {

	public static void main(String[] args)
	{
		TextApp textApp = new TextApp();
		WindowMergeApp windowApp = new WindowMergeApp();

		String[] ta_args = {""};
		PApplet.runSketch(ta_args, textApp);

		String[] wa_args = new String[]{"ProcessingShowcase"};
		PApplet.runSketch(wa_args, windowApp);

		int currentSketchIndex = 0;

		while(true){

			//using a broad exception to just skip over any sketches that have problems
			try {
                String name = windowApp.sketches.get( windowApp.currentIndex ).pde;
                String dir = name.substring(0, name.lastIndexOf('.'));

				textApp.set_filename("pde/" + dir + "/" + name);

				//how long do you want each sketch to display for
				//6 seconds
				Thread.sleep(60*100);
				
                // setting the frameCount to -1 makes sure setup will be 
                // called again.
				if (windowApp.currentIndex + 1 >= windowApp.sketches.size() )
				{
					windowApp.currentIndex = 0;
				}
				else
				{
					windowApp.currentIndex++;
				}
				windowApp.frameCount = -1;
				
			}
			catch (Exception e) {
				System.err.println("There was a problem running a sketch!");
				e.printStackTrace();
				System.err.println("Skipping to the next sketch.");
			}
		}
	}
}
