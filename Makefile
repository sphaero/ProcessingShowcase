PRC=/opt/processing-3.5.4
JFLAGS = -g -cp "./src:./src/pde:$(PRC)/core/library/core.jar:minim.jar:$(PRC)/core/library/jogl-all.jar:oscP5.jar:picocli-4.6.3.jar:video.jar:gst1-java-core-1.2.0.jar:jl1.0.1.jar:jna.jar"
JVMFLAGS = -cp "./src:./src/pde:$(PRC)/core/library/core.jar:$(PRC)/core/library/jogl-all.jar:$(PRC)/core/library/gluegen-rt.jar:oscP5.jar:picocli-4.6.3.jar:video.jar:gst1-java-core-1.2.0.jar:jl1.0.1.jar:jna.jar"
JC = javac #/usr/bin/javac
JVM = $(PRC)/java/bin/java
SKETCH_DIRS = pde/*


.SUFFIXES: .java .class

.java.class:
	$(JC) $(JFLAGS) $*.java

CLASSES = src/*.java

MAIN = ProcessingShowcase

default: classes

classes: $(CLASSES:.java=.class)

procparse:
	./processing-parse.sh pde/*

clean:
	$(RM) src/*.class src/pde/*.class src/procmod/*.class

run:
	$(JVM) -XX:+AlwaysPreTouch -Xss256k -Xms1g -Xmx1g $(JVMFLAGS) $(MAIN)

dist: classes
	echo "Manifest-Version: 1.0\nCreated-By: 1.6.0 (Sun Microsystems Inc.)\nClass-Path: $(PRC)/core/library/core.jar $(PRC)/core/library/jogl-all.jar $(PRC)/core/library/gluegen-rt.jar ./oscP5.jar ./picocli-4.6.1.jar\nMain-Class: ProcessingShowcase\n" > MANIFEST.MF
	jar cvfm dist/rigidtinkerer2.jar MANIFEST.MF
	cd src; jar uvf ../dist/rigidtinkerer2.jar *.class
	cd src/pde;	jar uvf ../../dist/rigidtinkerer2.jar *.class
	cd src;	jar uvf ../dist/rigidtinkerer2.jar procmod/*.class
	jar uvf dist/rigidtinkerer2.jar data/* ${SKETCH_DIRS}
	mkdir .oscp5
	cd .oscp5; jar -xf ../oscP5.jar; rm -rf META-INF; jar uvf ../dist/rigidtinkerer2.jar *
	rm -rf .oscp5
	mkdir .picocli
	cd .picocli; jar -xf ../picocli-4.6.3.jar; rm -rf META-INF; jar uvf ../dist/rigidtinkerer2.jar *
	rm -rf .picocli
	mkdir .video
	cd .video; jar -xf ../video.jar; rm -rf META-INF; jar uvf ../dist/rigidtinkerer2.jar *
	rm -rf .video
