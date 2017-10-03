#!/bin/bash

#The name of the job is test_job
#SBATCH -J toneko-2

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is 1 day
#SBATCH -t 24:00:00

#SBATCH --mem=10G

source env.sh

echo "Concatenating input corpora"
cat ${DDIR}/raw-all/*.en > ${DDIR}/all.en
cat ${DDIR}/raw-all/*.et > ${DDIR}/all.et

echo "Tab-joining and shuffling et and en corpora"
paste ${DDIR}/all.{et,en} | shuf > ${DDIR}/mixed-data.both

lines=$(wc -l ../data/mixed-data.both | cut -f 1 -d ' ')

echo "Spliting corpus"
sed -n 1,50000p ${DDIR}/mixed-data.both | cut -f 1 > ${DDIR}/test.et
sed -n 1,50000p ${DDIR}/mixed-data.both | cut -f 2 > ${DDIR}/test.en
sed -n 50001,75000p ${DDIR}/mixed-data.both | cut -f 1 > ${DDIR}/dev.et
sed -n 50001,75000p ${DDIR}/mixed-data.both | cut -f 2 > ${DDIR}/dev.en
sed -n 75001,${lines}p ${DDIR}/mixed-data.both | cut -f 1 > ${DDIR}/train.et
sed -n 75001,${lines}p ${DDIR}/mixed-data.both | cut -f 2 > ${DDIR}/train.en

echo "Splitting complete"
