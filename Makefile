PRC=/opt/processing-3.5.3
JFLAGS = -g -cp "./src:./src/pde:$(PRC)/core/library/core.jar:minim.jar:$(PRC)/core/library/jogl-all.jar:javamod.jar"
JVMFLAGS = -cp "./src:./src/pde:$(PRC)/core/library/core.jar:$(PRC)/core/library/jogl-all.jar:$(PRC)/core/library/gluegen-rt.jar:javamod.jar"
JC = javac
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
	$(RM) src/*.class src/pde/*.class

run:
	$(JVM) $(JVMFLAGS) $(MAIN)

dist: classes
	echo "Manifest-Version: 1.0\nCreated-By: 1.6.0 (Sun Microsystems Inc.)\nClass-Path: $(PRC)/core/library/core.jar $(PRC)/core/library/jogl-all.jar $(PRC)/core/library/gluegen-rt.jar javamod.jar\nMain-Class: ProcessingShowcase\n" > MANIFEST.MF
	jar cvfm dist/birrrd.jar MANIFEST.MF -C src src/*.class -C src/pde src/pde/*.class data/*
