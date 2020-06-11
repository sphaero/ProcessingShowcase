package procmod2;

import processing.core.*;

import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Properties;
import java.lang.reflect.*;

import de.quippy.javamod.main.JavaModMainBase;
import de.quippy.javamod.main.gui.PlayThread;
import de.quippy.javamod.main.gui.PlayThreadEventListener;
import de.quippy.javamod.main.playlist.PlayList;
import de.quippy.javamod.mixer.Mixer;
import de.quippy.javamod.multimedia.MultimediaContainer;
import de.quippy.javamod.multimedia.MultimediaContainerManager;
import de.quippy.javamod.multimedia.mod.ModContainer;
import de.quippy.javamod.multimedia.mod.loader.pattern.*;
import de.quippy.javamod.system.Log;

/*
 * This class provides the methods for loading and playing Mod files in Processing.
 * The class also provides events to the parent sketch to receive mod events
 * For example:
 * just add void modRowEvent( int channel, int instrument, int note ) to a sketch which will be 
 * called with the current channel, instrument and note being played. Zeroes (0) are received when nothing is played!
 * 
 * This library just implements a slightly modified JavaMod by Daniel Becker so all respect goes to him!
 *
 * @example ModPlayer 
 */

public class ModPlayer extends JavaModMainBase implements PlayThreadEventListener
{
	
	// myParent is a reference to the parent sketch
	PApplet myParent;
	public final static String VERSION = "##library.prettyVersion##";
	
	Method modRowEvent;
	Method modPatternEvent;
	
	public boolean verbose = false;
	private URL modFileName;
	public MultimediaContainer currentContainer;
	private File wavFileName;
	private PlayThread playerThread = null;
	private PlayList currentPlayList = null;
	
	/**
	 * a Constructor, usually called in the setup() method in your sketch to
	 * initialize and start the Library.
	 * 
	 * @example ModPlayer
	 * @param theParent the parent PApplet
	 * @param modFile path to a mod file
	 */
	public ModPlayer(PApplet theParent, String modFile) {
		super(false);
		myParent = theParent;
		
		try
		{
			modFileName = new URL( myParent.dataPath(modFile) );
		}
		catch (MalformedURLException ex) // This is evil, but I dont want to test on local files myself...
		{
			try
			{
				modFileName = (new File(modFile)).toURI().toURL();
			}
			catch (MalformedURLException exe) // This is even more evil...
			{
				Log.error("This is not parsable: " + modFile, ex);
				System.exit(-1);
			}
		}
		// just a lame test to see if the file is there before we init.
		if ( new File(modFileName.getPath() ).isFile() )
		{
			initJavaMod();
		}
		else
		{
			Log.error("Cannot find " + modFileName.getPath());
		}
		// check to see if the host applet implements
	    // public void modRowEvent ...
	    try {
	      modRowEvent = myParent.getClass().getMethod("modRowEvent",
	                                    new Class[] { int.class, int.class, int.class });
	    } catch (Exception e) {
	    	System.out.println("No modRowEvent found in the sketch!");
	      // no such method, or an error.. which is fine, just ignore
	    }
	    try {
	      modPatternEvent = myParent.getClass().getMethod("modPatternEvent",
	                                    new Class[] { int.class, int.class });
	    } catch (Exception e) {
	    	System.out.println("No modPatternEvent found in the sketch!");
	      // no such method, or an error.. which is fine, just ignore
	    }
	}
	
	
	private void initJavaMod() 
	{
		System.out.println("##library.name## ##library.prettyVersion## by ##author##");
	
		Properties props = new Properties();
		props.setProperty(ModContainer.PROPERTY_PLAYER_ISP, "3"); // interpolation: 0:none; 1:linear; 2:cubic spline; 3:fir interpolation
		props.setProperty(ModContainer.PROPERTY_PLAYER_STEREO, "2");
		props.setProperty(ModContainer.PROPERTY_PLAYER_WIDESTEREOMIX, "TRUE");
		props.setProperty(ModContainer.PROPERTY_PLAYER_NOISEREDUCTION, "FALSE");
		props.setProperty(ModContainer.PROPERTY_PLAYER_MEGABASS, "FALSE");
		props.setProperty(ModContainer.PROPERTY_PLAYER_NOLOOPS, "0"); //set infinit loop handling: 0:original; 1:fade out; 2:ignore"
		props.setProperty(ModContainer.PROPERTY_PLAYER_MSBUFFERSIZE, "20");
		props.setProperty(ModContainer.PROPERTY_PLAYER_BITSPERSAMPLE, "16");
		props.setProperty(ModContainer.PROPERTY_PLAYER_FREQUENCY, "44100");
		
		MultimediaContainerManager.configureContainer(props);

		try 
		{
			MultimediaContainer newContainer = MultimediaContainerManager.getMultimediaContainer(modFileName);
			if (newContainer!=null) currentContainer = newContainer;
		}
		catch (Throwable ex)
    	{
			Log.error("[MainForm::loadMultimediaFile] Loading failure", ex);
			currentContainer = null;
    	}
    	finally
    	{
    		
    	}
	}
	
	/**
	 * start playing of the mod file.
	 */
	public void play() 
	{
		if (currentContainer != null )
		{
			Mixer mixer = createNewMixer();
			mixer.setExportFile(wavFileName);
			playerThread = new PlayThread(mixer, this);
			mixer.setListener(this, playerThread);
			playerThread.start();
		}
	}
	
	/**
	 * Pause playing
	 */
	public void pause()
	{
		if (playerThread.isRunning())
			playerThread.pausePlay();
	}

    /**
     * Stop playing
     */

	public void stop()
	{
		if (playerThread.isRunning())
			playerThread.stopMod();
	}

	/**
	 * return the version of the Library.
	 * 
	 * @return String
	 */
	public static String version() {
		return VERSION;
	}

	private Mixer createNewMixer()
	{
		Mixer mixer = currentContainer.createNewMixer();
		if (mixer!=null)
		{
			mixer.setVolume(1.0f);
		}
		return mixer;
	}
	
	public void playThreadEventOccured(PlayThread thread)
	{
		System.out.println("playThreadEvent occured");
	}
	
	public void mixerEventOccured(int rowIndex, PatternRow row) 
	{
		if (verbose) 
			System.out.println(rowIndex + ":" + row.toString());

		if (modRowEvent != null) 
		{
		    try 
		    {
		    	PatternElement[] els = row.getPatternElement();
		    	for (int i=0;i<els.length;i++)
		    	{
		    		modRowEvent.invoke(myParent, els[i].getChannel(), els[i].getInstrument(), els[i].getNoteIndex() );
		    	}
		    }
		    catch (Exception e) 
		    {
				System.err.println("Disabling modRowEvent() because of an error.");
				e.printStackTrace();
				modRowEvent = null;
		    }
		  }
	};
	
	public void patternEventOccured(int pattern, int position) 
	{
		if (verbose) 
			System.out.println("PatternEvent: " + pattern + ":" + position);
	
		if (modPatternEvent != null) 
		{
		    try 
		    {
	    		modPatternEvent.invoke(myParent, pattern, position );
		    }
		    catch (Exception e) 
		    {
				System.err.println("Disabling modPatternEvent() because of an error.");
				e.printStackTrace();
				modPatternEvent = null;
		    }
		}
	};
}

