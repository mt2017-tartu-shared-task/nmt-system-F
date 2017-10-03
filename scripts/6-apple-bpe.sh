#!/bin/bash

#The name of the job is test_job
#SBATCH -J toneko-6

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is 1 day
#SBATCH -t 24:00:00

#SBATCH --mem=10G

source env.sh

echo
echo Apple BPE
cat $DDIR/cleaned-tc-tok-train.et $DDIR/cleaned-tc-tok-train.en | python $ROOT/OpenNMT-py/tools/subword-nmt/learn_bpe.py -s 100000 > $DDIR/eten.bpe
echo 
echo Learned.
echo
echo Applying...
for lang in et en
do
	# apply to train
	python $ROOT/OpenNMT-py/tools/subword-nmt/apply_bpe.py -c $DDIR/eten.bpe < $DDIR/cleaned-tc-tok-train.$lang > $DDIR/bpe.cleaned-tc-tok-train.$lang 
	# apply to dev
	python $ROOT/OpenNMT-py/tools/subword-nmt/apply_bpe.py -c $DDIR/eten.bpe < $DDIR/cleaned-tc-tok-dev.$lang > $DDIR/bpe.cleaned-tc-tok-dev.$lang 
	# apply to test 
	python $ROOT/OpenNMT-py/tools/subword-nmt/apply_bpe.py -c $DDIR/eten.bpe < $DDIR/tc-tok-test.$lang > $DDIR/bpe.tc-tok-test.$lang 
done

echo Apple BPE completed
