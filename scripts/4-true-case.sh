#!/bin/bash

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
 $ROOT/OpenNMT-py/tools/truecase.perl --model $lang-truecase.mdl < $DDIR/tok-$f > $DDIR/tc-tok-$f
 done
done
