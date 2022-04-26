import processing.core.PApplet;
import processing.core.PFont;

public class TextApp extends PApplet {

	Boolean presentation = false;
	String filename = "";
	Boolean changed = false;
	String[] content = {"Hello world"};
	
	public void setup()
	{
		surface.setResizable(true);
		clear();
		PFont mono;
		// The font "andalemo.ttf" must be located in the 
		// current sketch's "data" directory to load successfully
		mono = createFont("FreeMono.ttf", 30);
		background(0);
		textFont(mono, 20);
	}
	
	public void update() {
		
		if (changed)
		{
			println("updating");
			String[] contentb = {"Error loading " + filename};
			synchronized (content) { 
				try 
				{
					String[] contentc = loadStrings(filename);
					contentb = contentc;				
				}
				catch(Exception e)
				{
					println("file error");
				}
				finally {
					content = contentb;
					changed = false;				
				}
			}
		}
	}
	
	public void draw()
	{
		update();
		clear();
		background(0);
		if (content != null)
		{
			int cursorY = 0;
			for(int i = 0; i < content.length;i++)
			{
				cursorY += 20;
				//fill(196);
				fill(0,100,20);
				text(i+1, 5, cursorY+1);
				//fill(0,0,0);
				fill(130,255,150);
				text(content[i], 40, cursorY);
			}
		}
	}
	
	public void set_filename(String new_filename)
	{
		println(System.getProperty("user.dir"));
		println("setting filename " + new_filename );
		filename = new_filename;
		changed = true;
	}
	
	public void settings() 
	{ 
		if ( presentation )
			fullScreen(1);
		else
			size(720, 480);
	}
	
	static public void main(String[] passedArgs) 
	{
	    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "Source" };
	    if (passedArgs != null) 
	    {
	      PApplet.main(concat(appletArgs, passedArgs));
	    } 
	    else 
	    {
	      PApplet.main(appletArgs);
	    }
    }
}
