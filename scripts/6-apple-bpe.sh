source env.sh

echo
echo Apple BPE
cat $DDIR/cleaned-tc-tok-train.et $DDIR/cleaned-tc-tok-train.en | $ROOT/OpenNMT-py/tools/subword-nmt/learn_bpe.py -s 10000 > $DDIR/eten.bpe
echo 
echo Learned.
echo
echo Applying...
for lang in et en
do
	# apply to train
	python $ROOT/OpenNMT-py/tools/subword-nmt/apply_bpe.py -c $DDIR/eten.bpe < $DDIR/cleaned-tc-tok-train.$lang > $DDIR/bpe.cleaned-tc-tok-train.$lang 
	# apply to dev
	python $ROOT/OpenNMT-py/tools/subword-nmt/apply_bpe.py -c $DDIR/eten.bpe < $DDIR/tc-tok-dev.$lang > $DDIR/bpe.tc-tok-dev.$lang 
	# apply to test 
	python $ROOT/OpenNMT-py/tools/subword-nmt/apply_bpe.py -c $DDIR/eten.bpe < $DDIR/tc-tok-test.$lang > $DDIR/bpe.tc-tok-test.$lang 
done
