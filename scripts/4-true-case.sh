#!/bin/bash

#The name of the job is test_job
#SBATCH -J toneko-4

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

echo
echo Training true case
$ROOT/OpenNMT-py/tools/train-truecaser.perl --model $DDIR/en-truecase.mdl --corpus $DDIR/tok-train.en
$ROOT/OpenNMT-py/tools/train-truecaser.perl --model $DDIR/et-truecase.mdl --corpus $DDIR/tok-train.et

echo
echo True-casing
#!/bin/bash
for lang in en et;
do
 for f in $DDIR/{test,dev,train}.$lang ;
 do
 bname=$(basename $f)
 $ROOT/OpenNMT-py/tools/truecase.perl --model $DDIR/$lang-truecase.mdl < $DDIR/tok-$bname > $DDIR/tc-tok-$bname
 done
done
