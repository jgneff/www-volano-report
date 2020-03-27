@echo off
rem netserver.bat - VolanoMark network scalability test.
rem Run this script before starting "netclient.bat" on another machine.
del *.log

rem Microsoft Windows 2000 Professional
rem jview COM.volano.Main
rem \jdk1.3.1\bin\java -server -showversion -Xms8m -Xmx256m -Xss32k COM.volano.Main
rem "\Program Files\IBM\Java13\bin\java" -showversion -Xms8m -Xmx256m -Xss32k COM.volano.Main
rem \jdk1.3.1\bin\java -jrockit -showversion -Xms8m -Xmx256m -Xss32k COM.volano.Main
