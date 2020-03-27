#proc getdata
data:
  "IBM 1.3.0 Linux"                                   438   438
  "IBM 1.3.0 Windows"                                3293  3293
  "Microsoft 1.1.4 Windows"                          3780  3780
  "Appeal JRockit 2.0.7 Windows"                     6000  6000+
  "Sun 1.3.1 Windows (HotSpot Server VM)"            3200  3200
  "Sun 1.3.1 Linux (HotSpot Server VM)"               410   410
  "Sun 1.2.2 Solaris (Exact VM)"                     4060  4060
  "Blackdown 1.3.0 Linux (green threads, OpenJIT)"   6000  6000+
  "Blackdown 1.3.0 FreeBSD (green threads, OpenJIT)"  983   983
  "Sun 1.3.1 Solaris (HotSpot Server VM)"            3500  3000-4000

#proc areadef
  title: VolanoMark 2.1.2 Network Scalability
  titledetails: align=C size=14 adjust=0,0.13
  title2: Maximum number of client network connections
  title2details: align=C size=8
  rectangle: 1 1 6.20 5.05
  xrange: 0 6000
  yrange: 0 11

#proc bars
  horizontalbars: yes
  lenfield: 2
  labelfield: 3
  barwidth: 0.15
  colorlist: red blue blue blue blue red green red orange green
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
