# Processing Showcaser

This java application builds on Processing and merges multiple sketches into one

Needs java installed and processing 3.5.3 in /opt

```
sudo apt install openjdk-8-jdk-headless
sudo tar -c /opt -xzf processing-3.5.3-linux64.tgz
```

Build the application using Make:

* `make procparse` processes the sketches and builds classes of them. For now outputs code which need to be included in the main application.
* `make` builds the application
* `make run` runs the built application

# Example systemd user start service

.config/systemd/user/processing-showcase.service:
```
[Unit]
Description=Processing Showcase autostarter
After=xorg.target
 
[Service]
Environment="DISPLAY=:0.0"
Type=simple
WorkingDirectory=/home/ect/src/ProcessingShowcase
ExecStart=/opt/processing-3.5.3/java/bin/java -cp "./src:./src/pde:/opt/processing-3.5.3/core/library/core.jar:minim.jar:jsminim.jar:/opt/processing-3.5.3/core/library/jogl-all.jar:/opt/processing-3.5.3/core/library/gluegen-rt.jar:mp3spi1.9.5.jar:tritonus_aos.jar:tritonus_share.jar" ProcessingShowcase
 
[Install]
WantedBy=default.target
```
