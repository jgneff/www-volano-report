#proc getdata
data:
  "IBM 1.3.0 Windows"                                2260
  "IBM 1.3.0 Linux"                                  1930
  "Microsoft 1.1.4 Windows"                          1890
  "Appeal JRockit 2.0.5 Windows"                     1830
  "Appeal JRockit 2.0.4 Linux"                       1816
  "Sun 1.3.0 Windows (HotSpot Server VM)"            1567
  "Sun 1.3.0 Linux (HotSpot Server VM)"              1404
  "Sun 1.2.2 Solaris (Exact VM)"                     1402
  "Blackdown 1.3.0 Linux (green threads, OpenJIT)"   1133
  "Sun 1.3.0 Solaris (HotSpot Server VM)"             946
  "Blackdown 1.3.0 FreeBSD (green threads, OpenJIT)"  907
  "Blackdown 1.3.0 Linux (green threads, nojit)"      633
  "Sun 1.3.0 Linux (green threads, nojit)"            600
		
#proc areadef
  title: VolanoMark 2.1.2 Performance
  titledetails: align=C size=14 adjust=0,0.13
  title2: Messages per second with 200 loopback connections
  title2details: align=C size=8
  rectangle: 1 1 6.26 5.75
  xrange: 0 2260
  yrange: 0 14

#proc bars
  horizontalbars: yes
  lenfield: 2
  colorlist: blue red blue blue red blue red green red green orange red red
  barwidth: 0.15
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
