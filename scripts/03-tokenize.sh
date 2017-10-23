#!/bin/bash

#The name of the job is test_job
#SBATCH -J toneko03

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is 1 day
#SBATCH -t 24:00:00

#SBATCH --mem=10G

source env.sh

# change file rights just in case
chmod +x $ROOT/OpenNMT-py/tools/*.perl

echo Tokenizing
for f in $DDIR/{test,dev,train}.{en,et}
do
	echo "Working with file: $f"
	$ROOT/OpenNMT-py/tools/tokenizer.perl < $f > $DDIR/tok-$(basename $f)
done

echo Tokenization complete
