#!/bin/bash

#The name of the job is test_job
#SBATCH -J toneko-8

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is a 8 day
#SBATCH -t 192:00:00

#SBATCH --mem=150G

#SBATCH --partition=gpu
#SBATCH --gres=gpu:tesla:1

module load python-2.7.13

source env.sh

echo
echo Starting to train

python $ROOT/OpenNMT-py/train.py -data $DDIR/rdy -save_model $ROOT/model/toneko-model --gpuid 0

echo
echo Training completed
