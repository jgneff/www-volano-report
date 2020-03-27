#!/bin/sh
# server.sh - VolanoMark local loopback performance test.
# Run this script before starting "client.sh" on the same machine.
rm *.log

# Red Hat Linux 7.1
# /usr/java/jdk1.3.1/bin/java -server -showversion -Xms8m -Xmx64m COM.volano.Main
# /usr/local/j2sdk1.3.0/bin/java -green -showversion -Djava.compiler=OpenJIT -Xms8m -Xmx64m COM.volano.Main
# /usr/local/IBMJava2-13/bin/java -showversion -Xms8m -Xmx64m COM.volano.Main
# /usr/local/jrockit/jrockit -Xms8m -Xmx64m COM.volano.Main
# ./Main -Dtowerj.poll -Dtowerj.heapMax=67108864

# Sun Solaris 8 (6/00)
# /usr/java1.2/bin/java -Xms8m -Xmx64m COM.volano.Main
# /usr/j2se/bin/java -server -showversion -Xms8m -Xmx64m COM.volano.Main

# FreeBSD 4.2-RELEASE
# /usr/local/j2sdk1.3.0/bin/java -green -showversion -Djava.compiler=OpenJIT -Xms8m -Xmx64m COM.volano.Main
