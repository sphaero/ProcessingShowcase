NAME="kp-3m"
PRC=/opt/processing-3.5.4
PRC4=/opt/processing-4.3
JFLAGS = -target 1.8 -source 1.8 -g -cp "./src:./src/pde:$(PRC)/core/library/core.jar:minim.jar:$(PRC)/core/library/jogl-all.jar:oscP5.jar:picocli-4.6.3.jar"
JVMFLAGS = -cp "./src:./src/pde:$(PRC)/core/library/core.jar:$(PRC)/core/library/jogl-all.jar:$(PRC)/core/library/gluegen-rt.jar:oscP5.jar:picocli-4.6.3.jar"
JC = $(PRC4)/java/bin/javac
JVM = $(PRC)/java/bin/java
JAR = $(PRC4)/java/bin/jar
SKETCH_DIRS = pde/*

PDE_FILES = $(shell find pde/ -type f -name '*.pde')
PDE_JAVA_FILES = $(patsubst pde/%.pde, src/pde/%.java, $(PDE_FILES))


.SUFFIXES: .java .class

.java.class:
	$(JC) $(JFLAGS) $*.java

CLASSES = src/*.java

MAIN = ProcessingShowcase

default: classes

classes: $(CLASSES:.java=.class)

src/pde/%.java : pde/%.pde 
#	@echo $< $@
	./scripts/proc-parse.sh $< $@

parse: $(PDE_JAVA_FILES)

procparse:
	./scripts/processing-parse.sh pde/*

clean:
	$(RM) src/*.class src/pde/*.class

run:
	$(JVM) -XX:+AlwaysPreTouch -Xss256k -Xms1g -Xmx1g $(JVMFLAGS) $(MAIN)

dist: classes
	echo "Manifest-Version: 1.0\nCreated-By: 1.6.0 (Sun Microsystems Inc.)\nClass-Path: $(PRC)/core/library/core.jar $(PRC)/core/library/jogl-all.jar $(PRC)/core/library/gluegen-rt.jar ./oscP5.jar ./picocli-4.6.3.jar\nMain-Class: ProcessingShowcase\n" > MANIFEST.MF
	$(JAR) cvfm dist/$(NAME).jar MANIFEST.MF
	cd src; $(JAR) uvf ../dist/$(NAME).jar *.class
	cd src/pde;	$(JAR) uvf ../../dist/$(NAME).jar *.class 
	$(JAR) uvf dist/$(NAME).jar data/* ${SKETCH_DIRS}
	mkdir .oscp5
	cd .oscp5; $(JAR) -xf ../oscP5.jar; rm -rf META-INF; $(JAR) uvf ../dist/$(NAME).jar *
	rm -rf .oscp5
	mkdir .picocli
	cd .picocli; $(JAR) -xf ../picocli-4.6.3.jar; rm -rf META-INF; $(JAR) uvf ../dist/$(NAME).jar *
	rm -rf .picocli
