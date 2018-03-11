#!/bin/sh
#sub command - for x in `/bin/ls *.sra` ; do bash fastq-dump.sh $x; done
jobname=`echo $1`
output=`basename $1`
cat > /tmp/tempscript.sh << EOF
#!/bin/bash
cd .
fastq-dump --split-3 $output
EOF
qsub -V -cwd -l h_vmem=4G -pe shm 12 -N $jobname -e $jobname.err -o $jobname.out /tmp/tempscript.sh
sleep 1
rm /tmp/tempscript.sh