#!/bin/bash

#The name of the job is test_job
#SBATCH -J toneko05

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is 1 day
#SBATCH -t 24:00:00

#SBATCH --mem=10G

source env.sh

echo
echo Filter sentence pairs

$ROOT/OpenNMT-py/tools/clean-corpus-n.perl $DDIR/tc-tok-train en et $DDIR/cleaned-tc-tok-train 1 100
$ROOT/OpenNMT-py/tools/clean-corpus-n.perl $DDIR/tc-tok-dev en et $DDIR/cleaned-tc-tok-dev 1 100

echo Done filtering
