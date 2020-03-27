@echo off
rem client.bat - VolanoMark local loopback performance test.
rem Run this script after starting "server.bat" on the same machine.

for /L %%i in (1,1,4) do (
  jview sleep 60

  rem Microsoft Windows 2000 Professional
  rem "\Program Files\JRockit\jrockit" -Xms8m -Xmx64m COM.volano.Mark -count 100
  rem "\Program Files\IBM\Java13\jre\bin\java" -showversion -Xms8m -Xmx64m COM.volano.Mark -count 100
  rem java -showversion -Xms8m -Xmx64m COM.volano.Mark -count 100

  move vmark2_1_2.log test-%%i.log
)

find "throughput" test*.log
