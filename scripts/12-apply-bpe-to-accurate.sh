#!/bin/bash

#The name of the job is test_job
#SBATCH -J toneko12

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is 1 day
#SBATCH -t 24:00:00

#SBATCH --mem=10G

source env.sh

echo Starting to apply BPE to accurate

stdbuf -oL  python $ROOT/OpenNMT-py/tools/subword-nmt/apply_bpe.py -c $DDIR/eten.bpe < $MROOT/lab3/accurat-dev/cleaned-tc-tok-dev.et > $DDIR/bpe.accurate.et
stdbuf -oL  python $ROOT/OpenNMT-py/tools/subword-nmt/apply_bpe.py -c $DDIR/eten.bpe < $MROOT/lab3/accurat-dev/cleaned-tc-tok-dev.en > $DDIR/bpe.accurate.en

echo Done
