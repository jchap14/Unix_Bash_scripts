#!/bin/sh
gzfile=`echo $1`
cat > /tmp/tempscript.sh << EOF
#!/bin/bash
#$ -N $1
#$ -j y
#!/bin/bash
cd .
gunzip $output
EOF
qsub -V -cwd -l h_vmem=4G -pe shm 1 /tmp/tempscript.sh
sleep 1
rm /tmp/tempscript.sh

#for x in `/bin/ls *.gz` ; do bash gunzip.sh $x; done