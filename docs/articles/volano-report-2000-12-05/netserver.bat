@echo off
rem netserver.bat - VolanoMark network scalability test.
rem Run this script before starting "netclient.bat" on another machine.
del *.log

rem Microsoft Windows 2000 Professional
rem Stack options fail with JRockit and Windows 2000 Service Pack 1.
rem "\Program Files\JRockit\jrockit" -Xms8m -Xmx256m COM.volano.Main
rem "\Program Files\IBM\Java13\jre\bin\java" -showversion -Xms8m -Xmx256m -Xss32k COM.volano.Main
rem java -showversion -Xms8m -Xmx256m -Xss32k COM.volano.Main
