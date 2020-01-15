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

