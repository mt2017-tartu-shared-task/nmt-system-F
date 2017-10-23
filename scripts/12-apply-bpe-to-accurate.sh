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

echo Starting to tokenize and true case

for lang in en et ; do 

	echo Working with language: $lang

	$ROOT/OpenNMT-py/tools/tokenizer.perl < $MROOT/lab3/accurat-dev/dev.$lang > $DDIR/tok-accurate-dev.$lang
	$ROOT/OpenNMT-py/tools/truecase.perl --model $DDIR/$lang-truecase.mdl < $DDIR/tok-accurate-dev.$lang > $DDIR/tc-tok-accurate-dev.$lang

done

#$ROOT/OpenNMT-py/tools/clean-corpus-n.perl $DDIR/tc-tok-accurate-dev en et $DDIR/cleaned-tc-tok-accurate-dev 1 100

echo Starting to apply BPE to accurate

stdbuf -oL  python $ROOT/OpenNMT-py/tools/subword-nmt/apply_bpe.py -c $DDIR/eten.bpe < $DDIR/cleaned-tc-tok-accurate-dev.et > $DDIR/bpe.accurate.et
stdbuf -oL  python $ROOT/OpenNMT-py/tools/subword-nmt/apply_bpe.py -c $DDIR/eten.bpe < $DDIR/cleaned-tc-tok-accurate-dev.en > $DDIR/bpe.accurate.en

echo Done
