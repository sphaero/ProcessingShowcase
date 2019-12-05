JFLAGS = -g -cp ".:/opt/processing-3.5.3/core/library/core.jar"
JVMFLAGS = -cp ".:/opt/processing-3.5.3/core/library/core.jar"
JC = javac
JVM = java
PRC = /opt/processing-3.5.3/processing-java
OPT = --sketch=$1 --force --output=$1-parsed  --build
SHOWCASE_ROOT="/home/arnaud/eclipse-workspace/processing-showcas>
SKETCH_DIRS = pde/*


.SUFFIXES: .java .class

.java.class:
	$(JC) $(JFLAGS) $*.java

CLASSES = src/*.java

MAIN = ProcessingShowcase

procparse:
	./processing-parse.sh pde/*

default: classes

classes: procparse $(CLASSES:.java=.class)

clean:
	$(RM) src/*.class

run: $(MAIN).class
	$(JVM) $(JVMFLAGS) $(MAIN)
