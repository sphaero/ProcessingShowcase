JFLAGS = -g -cp ".:/opt/processing-3.5.3/core/library/core.jar"
JVMFLAGS = -cp ".:/opt/processing-3.5.3/core/library/core.jar"
JC = javac
JVM = java

.SUFFIXES: .java .class

.java.class:
	$(JC) $(JFLAGS) $*.java

CLASSES = src/*.java

MAIN = ProcessingShowcase

default: classes

classes: $(CLASSES:.java=.class)

clean:
	$(RM) *.class

run: $(MAIN).class
	$(JVM) $(JVMFLAGS) $(MAIN)
