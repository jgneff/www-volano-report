#!/bin/sh
ulimit -n 8192
rm *.log
sync
for i in 1 2 3 4 5 6
  do
    sleep `expr $i \* 60`
    # Sun Solaris 8 (6/00)
    /usr/j2se/bin/java -server -showversion -Xms64m -Xmx256m -Xss64k COM.volano.Mark -host ppro2 -rooms `expr $i \* 50`
    mv vmark2_1_2.log test-$i.log
  done
grep throughput test*.log
