#!/bin/sh
#sub command - for x in `/bin/ls *.txt` ; do bash bedSort.sh $x; done
jobname=`echo $1`
output=`basename $1`
cat > /tmp/tempscript.sh << EOF
#!/bin/bash
cd .
bedtools sort -i $output > $output.sorted.bed
EOF
qsub -q rcc-30d /tmp/tempscript.sh
sleep 1
rm /tmp/tempscript.sh
#rm *.o*
#rm *.e*
