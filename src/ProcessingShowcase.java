import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;
import picocli.CommandLine.Parameters;
import processing.core.PApplet;

@Command(name = "processingshowcase", version = "ProcessingShowcase 1.0", mixinStandardHelpOptions = true) 
public class ProcessingShowcase implements Runnable {

	@Option(names = { "-p", "--present" }, description = "Enable present mode ") 
	boolean present = false;

	@Option(names = { "-i", "--inverse" }, description = "Inverse text screen (flip background/foreground colors)") 
	boolean inv_color = false;
    
    int startPos = 0;   
	int endPos = 104;     
	int currentPos = 0;
	int currentPositie = 0;
	int currentPattern = 0;
	
	
	@Override
    public void run() { 
        // The business logic of the command goes here...
        // In this case, code for generation of ASCII art graphics
        // (omitted for the sake of brevity).
		ProcessingShowcase inst = new ProcessingShowcase();
		
		TextApp textApp = new TextApp();
		WindowMergeApp windowApp = new WindowMergeApp();
		textApp.presentation = present;
		textApp.inv_color = inv_color;
		windowApp.presentation = present;
		
		String[] ta_args = {""};
		PApplet.runSketch(ta_args, textApp);

		String[] wa_args = new String[]{"ProcessingShowcase"};
		PApplet.runSketch(wa_args, windowApp);
	
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
	
	public static void main(String[] args)
	{
		int exitCode = new CommandLine(new ProcessingShowcase()).execute(args); 
        System.exit(exitCode); 
	}
}
