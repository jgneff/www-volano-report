#!/bin/sh
# client.sh - VolanoMark local loopback performance test.
# Run this script after starting "server.sh" on the same machine.
sync
for i in 1 2 3 4
  do
    sleep 60

    # Red Hat Linux 7.1
    # /usr/java/jdk1.3.1/bin/java -server -showversion -Xms8m -Xmx64m COM.volano.Mark -count 100
    # /usr/local/j2sdk1.3.0/bin/java -green -showversion -Djava.compiler=OpenJIT -Xms8m -Xmx64m COM.volano.Mark -count 100
    # /usr/local/IBMJava2-13/bin/java -showversion -Xms8m -Xmx64m COM.volano.Mark -count 100
    # /usr/jrockit/jre1.3.1/bin/java -Xms8m -Xmx64m COM.volano.Mark -count 100
    # ./Mark -Dtowerj.poll -Dtowerj.heapMin=8388608 -Dtowerj.heapMax=67108864 -count 100

    # Sun Solaris 8 (6/00)
    # /usr/java1.2/bin/java -Xms8m -Xmx64m COM.volano.Mark -count 100
    # /usr/j2se/bin/java -server -showversion -Xms8m -Xmx64m COM.volano.Mark -count 100

    # FreeBSD 4.2-RELEASE
    # /usr/local/j2sdk1.3.0/bin/java -green -showversion -Djava.compiler=OpenJIT -Xms8m -Xmx64m COM.volano.Mark -count 100

    mv vmark2_1_2.log test-$i.log
  done
grep throughput test*.log
