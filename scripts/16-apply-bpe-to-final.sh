#!/bin/bash

#The name of the job is test_job
#SBATCH -J toneko16

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is 1 day
#SBATCH -t 24:00:00

#SBATCH --mem=10G

source env.sh

echo Starting to tokenize and true case

for lang in et ; do 

	echo Working with language: $lang

	$ROOT/OpenNMT-py/tools/tokenizer.perl < $MROOT/lab3/accurat-dev/final.$lang > $DDIR/tok-final.$lang
	$ROOT/OpenNMT-py/tools/truecase.perl --model $DDIR/$lang-truecase.mdl < $DDIR/tok-final.$lang > $DDIR/tc-tok-final.$lang

done

echo Starting to apply BPE to accurate

stdbuf -oL  python $ROOT/OpenNMT-py/tools/subword-nmt/apply_bpe.py -c $DDIR/eten.bpe < $DDIR/cleaned-tc-tok-final.et > $DDIR/bpe.final.et

echo Done
