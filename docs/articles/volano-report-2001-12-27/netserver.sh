#!/bin/sh
# netserver.sh - VolanoMark network scalability test.
# Run this before starting "netclient.sh" on another machine.
ulimit -n 8192
rm *.log
sync

# Red Hat Linux 7.1
# /usr/java/jdk1.3.1/bin/java -server -showversion -Xms8m -Xmx256m -Xss32k COM.volano.Main
# /usr/local/j2sdk1.3.0/bin/java -green -showversion -Djava.compiler=OpenJIT -Xms8m -Xmx256m -Xss32k COM.volano.Main
# /usr/local/IBMJava2-13/bin/java -showversion -Xms8m -Xmx256m COM.volano.Main
# /usr/jrockit/jre1.3.1/bin/java -Xms8m -Xmx256m -Xss32k COM.volano.Main
# ./Main -Dtowerj.poll -Dtowerj.heapMin=8388608 -Dtowerj.stackSize=32768

# Sun Solaris 8 (6/00)
# /usr/java1.2/bin/java -Xms8m -Xmx256m -Xss32k COM.volano.Main
# /usr/j2se/bin/java -server -showversion -Xms8m -Xmx256m -Xss64k COM.volano.Main

# FreeBSD 4.2-RELEASE
# /usr/local/j2sdk1.3.0/bin/java -green -showversion -Djava.compiler=OpenJIT -Xms8m -Xmx256m -Xss32k COM.volano.Main
