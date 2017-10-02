#!/bin/bash

#The name of the job is test_job
#SBATCH -J toneko-7

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is a 1 day
#SBATCH -t 24:00:00

#SBATCH --mem=80G

#SBATCH --partition=gpu
#SBATCH --gres=gpu:tesla:1

module load python-2.7.13

source env.sh

echo
echo Starting to create dictionary

python $ROOT/OpenNMT-py/preprocess.py -train_src $DDIR/bpe.cleaned-tc-tok-train.et -train_tgt $DDIR/bpe.cleaned-tc-tok-train.en -valid_src $DDIR/bpe.tc-tok-dev.et -valid_tgt $DDIR/bpe.tc-tok-dev.en -save_data $DDIR/rdy -src_vocab_size 30000 -tgt_vocab_size 30000 -seed 123

echo
echo Dictionary created
