##### Script to grab job outputs & assess why the failed

## grab job outputs for the day (change -b to current date)
qacct -j -b 201707200000 -u jchap14 > job_logs.txt
## grep interesting fields
cat job_logs.txt | grep -e end_time -e start_time -e maxvmem -e qmaster -e jobname -e jobnumber -e "failed" > fail_report.txt

## remove these files
rm job_logs.txt fail_report.txt