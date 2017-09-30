#!/bin/bash

source env.sh

echo "Concatenating input corpora"
cat ${DDIR}/raw-all/*.en > ${DDIR}/all.en
cat ${DDIR}/raw-all/*.et > ${DDIR}/all.et

echo "Tab-joining and shuffling et and en corpora"
paste ${DDIR}/all.{et,en} | shuf > ${DDIR}/mixed-data.both

echo "Spliting corpus"
sed -n 1,100p ${DDIR}/mixed-data.both | cut -f 1 > ${DDIR}/test.et
sed -n 1,100p ${DDIR}/mixed-data.both | cut -f 2 > ${DDIR}/test.en
sed -n 101,200p ${DDIR}/mixed-data.both | cut -f 1 > ${DDIR}/dev.et
sed -n 101,200p ${DDIR}/mixed-data.both | cut -f 2 > ${DDIR}/dev.en
sed -n 201,9000p ${DDIR}/mixed-data.both | cut -f 1 > ${DDIR}/train.et
sed -n 201,9000p ${DDIR}/mixed-data.both | cut -f 2 > ${DDIR}/train.en
