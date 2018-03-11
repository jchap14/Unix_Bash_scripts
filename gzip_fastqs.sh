#!/bin/sh

# for x in `/bin/ls *.fastq` ; do bash gzip_fastqs.sh $x; done

name=`basename $1 .fastq`
#name=`basename $1 .fq`

cat > /tmp/tempscript.sh << EOF
#!/bin/bash
#$ -N $name.gzip
#$ -j y
gzip $1
EOF
qsub -V -cwd -l h_vmem=4G -pe shm 1 /tmp/tempscript.sh
sleep 1
rm /tmp/tempscript.sh