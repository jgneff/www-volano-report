#!/bin/sh

# Sun Classic VM (build 1.3.1-b24, green threads, nojit)
# /usr/java/jdk1.3.1/bin/java -classic -showversion Server

# Sun Java HotSpot(TM) Server VM (build 1.3.1-b24, mixed mode) 
# /usr/java/jdk1.3.1/bin/java -server -showversion Server

# Classic VM (build Blackdown-1.3.1-FCS, green threads, nojit) 
/usr/local/j2sdk1.3.1/bin/java -green -showversion Server

# Java HotSpot(TM) Server VM (build Blackdown-1.3.1-FCS, mixed mode) 
# /usr/local/j2sdk1.3.1/bin/java -server -showversion Server

# JRockit Virtual Machine (build 3.0.0-dax.appeal.se-20011120-1610)
# /usr/jrockit/jre1.3.1/bin/java -version
# /usr/jrockit/jre1.3.1/bin/java Server

# TowerJ Compiler (version 3.8.1.0 (Tower JRE 1.3.1) x86-linux)
# ./Server -Dtowerj.poll

# IBM Classic VM (build 1.3.0, J2RE 1.3.0 IBM build cx130-20010925 (JIT enabled: jitc))
# $HOME/IBMJava2-13/bin/java -showversion Server
