@echo off
rem server.bat - VolanoMark local loopback performance test.
rem Run this script before starting "client.bat" on the same machine.
del *.log

rem Microsoft Windows 2000 Professional
rem jview COM.volano.Main
rem \jdk1.3.1\bin\java -server -showversion -Xms8m -Xmx64m COM.volano.Main
rem "\Program Files\IBM\Java13\bin\java" -showversion -Xms8m -Xmx64m COM.volano.Main
rem \jdk1.3.1\bin\java -jrockit -showversion -Xms8m -Xmx64m COM.volano.Main

rem SET JETVMPROP=-Djet.gc.heaplimit:67108864
rem Main.exe
