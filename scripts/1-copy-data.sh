#!/bin/bash

#The name of the job is test_job
#SBATCH -J toneko-1

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is 1 day
#SBATCH -t 24:00:00

#SBATCH --mem=10G

source env.sh

cp -r /gpfs/hpchome/maksym95/shared-task-2017/data/* $DDIR/

echo Copy complete
