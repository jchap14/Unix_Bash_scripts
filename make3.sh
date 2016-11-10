#!/bin/bash
jobname=`echo $1`
output=`basename $1 .txt`
# the following command convert Mac to Unix LF
# cat test.txt | tr '\r' '\n' > test2.txt
# order of file should be condition \t target \t ct
cd .
cut -f 3 $output.txt > column3_.txt
tr '\n' '\t' < column3_.txt > line3_.txt
xargs -n3 < line3_.txt > three_.txt
tr ' ' '\t' < three_.txt > numbers.txt
#
awk 'NR == 3 || NR % 3 == 0 {print $2"\t"$1}' $output.txt > letters.txt
#
paste letters.txt numbers.txt > $output.final_.txt
sort $output.final_.txt > $output.final.txt 
rm letters.txt numbers.txt *_.txt
