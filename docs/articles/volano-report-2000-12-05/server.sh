#!/bin/sh
# server.sh - VolanoMark local loopback performance test.
# Run this script before starting "client.sh" on the same machine.
rm *.log

# Red Hat Linux 6.2
# /usr/local/jre1.2.2/bin/java -green -Djava.compiler=javacomp -Xms8m -Xmx64m COM.volano.Main
# /usr/local/IBMJava2-13/jre/bin/java -showversion -Xms8m -Xmx64m COM.volano.Main
# /usr/local/jre1.3/bin/java -classic -Djava.compiler=javacomp -showversion -Xms8m -Xmx64m COM.volano.Main
# /usr/local/jre1.3/bin/java -server -showversion -Xms8m -Xmx64m COM.volano.Main
# ./Main -Dtowerj.poll -Dtowerj.heapMax=67108864

# Sun Solaris 8 (6/00)
# $HOME/Solaris_JDK_1.2.2_05a/bin/java -Xms8m -Xmx64m COM.volano.Main
# $HOME/j2sdk1_3_0RC/bin/java -server -showversion -Xms8m -Xmx64m COM.volano.Main

# FreeBSD 4.0-RELEASE
# /usr/local/jre1.2.2/bin/java -green -Djava.compiler=javacomp -Xms8m -Xmx64m COM.volano.Main
# /usr/local/jre1.3/bin/java -classic -Djava.compiler=javacomp -showversion -Xms8m -Xmx64m COM.volano.Main

