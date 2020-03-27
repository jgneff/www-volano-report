#!/bin/sh
ulimit -n 8192
rm *.log
sync
for i in 1 2 3 4 5
  do
    sleep `expr $i \* 60`

    # Sun Solaris 8 (6/00)
    # Use the J2SE 1.3.0 HotSpot Server VM, even though it's slower than the
    # J2SE 1.2.2 ExactVM, since the HotSpot VM can handle more connections.
    # The ExactVM fails with a segmentation violation at 4,076 connections
    # on Solaris Intel (but not on Solaris SPARC, I'm told).
 
    $HOME/j2sdk1_3_0RC/bin/java -server -showversion -Xms64m -Xmx256m -Xss64k COM.volano.Mark -host ppro2 -rooms `expr $i \* 50`

    mv vmark2_1_2.log test-$i.log
  done
grep throughput test*.log
