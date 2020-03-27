#proc getdata
data:
  "IBM 1.3.0 Linux"                                  2456
  "IBM 1.3.0 Windows"                                2312
  "Microsoft 1.1.4 Windows"                          1909
  "Appeal JRockit 2.0.7 Windows"                     1857
  "Sun 1.3.1 Windows (HotSpot Server VM)"            1562
  "Sun 1.3.1 Linux (HotSpot Server VM)"              1496
  "Sun 1.2.2 Solaris (Exact VM)"                     1410
  "Blackdown 1.3.0 Linux (green threads, OpenJIT)"   1162
  "Blackdown 1.3.0 FreeBSD (green threads, OpenJIT)"  907
  "Sun 1.3.1 Solaris (HotSpot Server VM)"             817

#proc areadef
  title: VolanoMark 2.1.2 Performance
  titledetails: align=C size=14 adjust=0,0.13
  title2: Messages per second with 200 loopback connections
  title2details: align=C size=8
  rectangle: 1 1 6.26 5.05
  xrange: 0 2456
  yrange: 0 11

#proc bars
  horizontalbars: yes
  lenfield: 2
  colorlist: red blue blue blue blue red green red orange green
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
  label: Red Hat Linux 7.1

#proc legendentry
  sampletype: color
  details: green
  label: Solaris 8

#proc legendentry
  sampletype: color
  details: orange
  label: FreeBSD 4.2

#proc legend
  location: max-2.20 min+0.20
  noclear: yes
  specifyorder: Windows
                Red

#proc legend
  location: max-0.70 min+0.20
  noclear: yes
  specifyorder: Solaris
                FreeBSD
