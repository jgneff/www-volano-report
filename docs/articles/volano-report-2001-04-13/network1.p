#proc getdata
data:
  "IBM 1.3.0 Windows"                                3294  3294
  "IBM 1.3.0 Linux"                                   436   436
  "Microsoft 1.1.4 Windows"                          3776  3776
  "Appeal JRockit 2.0.5 Windows"                     6000  6000+
  "Appeal JRockit 2.0.4 Linux"                       2610  2610
  "Sun 1.3.0 Windows (HotSpot Server VM)"            3273  3273
  "Sun 1.3.0 Linux (HotSpot Server VM)"               422   422
  "Sun 1.2.2 Solaris (Exact VM)"                     4060  4060
  "Blackdown 1.3.0 Linux (green threads, OpenJIT)"   6000  6000+
  "Sun 1.3.0 Solaris (HotSpot Server VM)"            4500  4000-5000
  "Blackdown 1.3.0 FreeBSD (green threads, OpenJIT)"  983   983
  "Blackdown 1.3.0 Linux (green threads, nojit)"     6000  6000+
  "Sun 1.3.0 Linux (green threads, nojit)"           1015  1015
	
#proc areadef
  title: VolanoMark 2.1.2 Network Scalability
  titledetails: align=C size=14 adjust=0,0.13
  title2: Maximum number of client network connections
  title2details: align=C size=8
  rectangle: 1 1 6.20 5.75
  xrange: 0 6000
  yrange: 0 14

#proc bars
  horizontalbars: yes
  lenfield: 2
  labelfield: 3
  barwidth: 0.15
  colorlist: blue red blue blue red blue red green red green orange red red
  labeldetails: adjust=0,-0.03
  showvalues: yes
	
#proc yaxis:
  stubs: datafields 1
  axisline: none
  tics: none
  stubdetails: align=L adjust=0.16,0.16

#proc legendentry
  sampletype: color
  details: blue
  label: Windows 2000

#proc legendentry
  sampletype: color
  details: red
  label: Red Hat Linux 7.0

#proc legendentry
  sampletype: color
  details: green
  label: Solaris 8

#proc legendentry
  sampletype: color
  details: orange
  label: FreeBSD 4.2

#proc legend
  location: max-2.20 min+0.40
  noclear: yes
  specifyorder: Windows
                Red

#proc legend
  location: max-0.70 min+0.40
  noclear: yes
  specifyorder: Solaris
                FreeBSD
