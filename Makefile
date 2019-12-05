JFLAGS = -g -cp "./src:/opt/processing-3.5.3/core/library/core.jar"
JVMFLAGS = -cp "./src:/opt/processing-3.5.3/core/library/core.jar"
JC = javac
JVM = java
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
	$(RM) src/*.class

run:
	$(JVM) $(JVMFLAGS) $(MAIN)
