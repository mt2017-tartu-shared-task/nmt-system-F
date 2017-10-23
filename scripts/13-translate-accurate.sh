#!/bin/bash

#The name of the job is test_job
#SBATCH -J toneko13

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is 1 day
#SBATCH -t 24:00:00

#SBATCH --mem=10G

#SBATCH --partition=gpu
#SBATCH --gres=gpu:tesla:1

module load python-2.7.13

source env.sh

stdbuf -oL python $MROOT/lab3/OpenNMT-py/translate.py -attn_debug -model $ROOT/models/toneko-model_acc_71.01_ppl_4.08_e13.pt -src $DDIR/bpe.accurate.et -output $ROOT/hyps/accurate-hyps.en -gpu 0

echo Done!
