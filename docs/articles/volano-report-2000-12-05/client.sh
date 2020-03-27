#!/bin/sh
# client.sh - VolanoMark local loopback performance test.
# Run this script after starting "server.sh" on the same machine.
sync
for i in 1 2 3 4
  do
    sleep 60

    # Red Hat Linux 6.2
    # /usr/local/jre1.2.2/bin/java -green -Djava.compiler=javacomp -Xms8m -Xmx64m COM.volano.Mark -count 100
    # /usr/local/IBMJava2-13/jre/bin/java -showversion -Xms8m -Xmx64m COM.volano.Mark -count 100
    # /usr/local/jre1.3/bin/java -classic -Djava.compiler=javacomp -showversion -Xms8m -Xmx64m COM.volano.Mark -count 100
    # /usr/local/jre1.3/bin/java -server -showversion -Xms8m -Xmx64m COM.volano.Mark -count 100
    # ./Mark -Dtowerj.poll -Dtowerj.heapMax=67108864 -count 100

    # Sun Solaris 8 (6/00)
    # $HOME/Solaris_JDK_1.2.2_05a/bin/java -Xms8m -Xmx64m COM.volano.Mark -count 100
    # $HOME/j2sdk1_3_0RC/bin/java -server -showversion -Xms8m -Xmx64m COM.volano.Mark -count 100

    # FreeBSD 4.0-RELEASE
    # /usr/local/jre1.2.2/bin/java -green -Djava.compiler=javacomp -Xms8m -Xmx64m COM.volano.Mark -count 100
    # /usr/local/jre1.3/bin/java -classic -Djava.compiler=javacomp -showversion -Xms8m -Xmx64m COM.volano.Mark -count 100

    mv vmark2_1_2.log test-$i.log
  done
grep throughput test*.log
