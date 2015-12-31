#!/bin/bash
curl -O http://www2.census.gov/geo/docs/reference/county_adjacency.txt
cp county_adjacency.txt tmp1.txt
LC_CTYPE=C LANG=C sed -i.bak $'s/"\t/";\t/g' tmp1.txt
LC_CTYPE=C LANG=C sed -i.bak $'s/\t\t"/\t\t;;"/g' tmp1.txt
LC_CTYPE=C LANG=C sed -i.bak $'s/\t"/\t;"/g' tmp1.txt
LC_CTYPE=C LANG=C sed -i.bak $'s/\t//g' tmp1.txt
## Add "Watonwan County, MN" to line 9625
LC_CTYPE=C LANG=C sed -i.bak '9629s/.*/"Watonwan County, MN";27165;"Blue Earth County, MN";27013/' tmp1.txt
## Change the old FIPS code of 02195 for Petersburgh Alaska to the new one of 02280
LC_CTYPE=C LANG=C sed -i.bak 's/02195/02280/g' tmp1.txt
LC_CTYPE=C LANG=C tr  '\n' ':'  < tmp1.txt > tmp2.txt
LC_CTYPE=C LANG=C sed -i.bak $'s/:;;/;/g'  tmp2.txt
LC_CTYPE=C LANG=C sed -i.bak $'s/:/\\\n/g'  tmp2.txt
LC_CTYPE=C LANG=C sed -i.bak $'s/ County//g' tmp2.txt
LC_CTYPE=C LANG=C sed -i.bak $'s/ Census Area//g' tmp2.txt
LC_CTYPE=C LANG=C sed -i.bak $'s/ and Borough//g' tmp2.txt
LC_CTYPE=C LANG=C sed -i.bak $'s/ Borough//g' tmp2.txt
cp tmp2.txt countyAdjClean.txt

