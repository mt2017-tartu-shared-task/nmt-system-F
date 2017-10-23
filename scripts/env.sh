#!/bin/bash 

ROOT=$(cd ../; pwd)
DDIR=${ROOT}/data
LOGDIR=${ROOT}/logs

MROOT=$(cd $ROOT/../materials; pwd)
MOSES=$(cd $ROOT/../moses-scripts/scripts; pwd)

mkdir -p $LOGDIR

echo Working with root directory $ROOT
echo and data directory $DDIR
echo logging to $LOGDIR
echo Materials root directory $MROOT
echo Moses scripts directory $MOSES
echo
