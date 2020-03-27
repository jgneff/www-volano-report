#proc getdata
data:
  1000  2149  ....  1658  2596  1761  1285  ....  2353  1349   955  ....  1031   885
  2000  2483  ....   874  2490   917   878  ....  2193   707  1089  ....   586  ....
  3000  2082  ....   505  2166  ....   530  ....  1974   480   762  ....   402  ....
  4000  ....  ....  ....  1940  ....  ....  ....  1599   334   497  ....   296  ....
  5000  ....  ....  ....  1724  ....  ....  ....  ....   246  ....  ....   459  ....
  6000  ....  ....  ....  1373  ....  ....  ....  ....   275  ....  ....   246  ....
	
#proc areadef
  title: VolanoMark 2.1.2 Network Scalability
  titledetails: align=C size=14 adjust=0,0.35
  title2: Messages per second at 1000-6000 network connections
  title2details: align=C size=8 adjust=0,0.20
  rectangle: 1 1 4.97 6.09
  xrange: 1000 6000
  yrange: 0 2600

#proc xaxis
  label: Concurrent Connections
  stubs: incremental 1000

#proc yaxis
  label: Messages per Second
  labeldetails: adjust=-0.1,0
  stubs: incremental 100

#proc lineplot
  xfield: 1
  yfield: 2
  linedetails: color=blue width=0.5 style=1
  pointsymbol: shape=nicecircle style=fill fillcolor=blue radius=0.01

#proc annotate
  location: @XFINAL(s) @YFINAL(s)
  textdetails: size=8 align=L adjust=0.05,-0.05
  text: IBM 1.3.0 Windows

#proc lineplot
  xfield: 1
  yfield: 4
  linedetails: color=blue width=0.5 style=1
  pointsymbol: shape=nicecircle style=fill fillcolor=blue radius=0.01

#proc annotate
  location: @XFINAL(s) @YFINAL(s)
  textdetails: size=8 align=L adjust=0.05,0.06
  text: Microsoft 1.1.4 Windows

#proc lineplot
  xfield: 1
  yfield: 5
  linedetails: color=blue width=0.5 style=0
  pointsymbol: shape=nicecircle style=fill fillcolor=blue radius=0.01

#proc annotate
  location: @XFINAL(s) @YFINAL(s)
  textdetails: size=8 align=L adjust=0.05,-0.05
  text: Appeal JRockit 2.0.5 Windows

#proc lineplot
  xfield: 1
  yfield: 6
  linedetails: color=red width=0.5 style=0
  pointsymbol: shape=nicecircle style=fill fillcolor=red radius=0.01

#proc annotate
  location: @XFINAL(s) @YFINAL(s)
  textdetails: size=8 align=L adjust=0.05,-0.05
  text: Appeal JRockit 2.0.4 Linux

#proc lineplot
  xfield: 1
  yfield: 7
  linedetails: color=blue width=0.5 style=0
  pointsymbol: shape=nicecircle style=fill fillcolor=blue radius=0.01

#proc annotate
  location: @XFINAL(s) @YFINAL(s)
  textdetails: size=8 align=L adjust=0.05,0.12
  text: Sun 1.3.0 Windows (HotSpot Server VM)

#proc lineplot
  xfield: 1
  yfield: 9
  linedetails: color=green width=0.5 style=0
  pointsymbol: shape=nicecircle style=fill fillcolor=green radius=0.01

#proc annotate
  location: @XFINAL(s) @YFINAL(s)
  textdetails: size=8 align=L adjust=0.05,-0.05
  text: Sun 1.2.2 Solaris (Exact VM)

#proc lineplot
  xfield: 1
  yfield: 10
  linedetails: color=red width=0.5 style=0
  pointsymbol: shape=nicecircle style=fill fillcolor=red radius=0.01

#proc annotate
  location: @XFINAL(s) @YFINAL(s)
  textdetails: size=8 align=L adjust=0.05,0
  text: Blackdown 1.3.0 Linux (green threads, OpenJIT)

#proc lineplot
  xfield: 1
  yfield: 11
  linedetails: color=green width=0.5 style=0
  pointsymbol: shape=nicecircle style=fill fillcolor=green radius=0.01

#proc annotate
  location: @XFINAL(s) @YFINAL(s)
  textdetails: size=8 align=L adjust=0.05,-0.05
  text: Sun 1.3.0 Solaris (HotSpot Server VM)

#proc lineplot
  xfield: 1
  yfield: 13
  linedetails: color=red width=0.5 style=1
  pointsymbol: shape=nicecircle style=fill fillcolor=red radius=0.01

#proc annotate
  location: @XFINAL(s) @YFINAL(s)
  textdetails: size=8 align=L adjust=0.05,-0.10
  text: Blackdown 1.3.0 Linux (green threads, nojit)
