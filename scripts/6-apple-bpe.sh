source env.sh

echo
echo Apple BPE
cat $DDIR/cleaned-tc-tok-train.et $DDIR/cleaned-tc-tok-train.en |/gpfs/hpchome/vampnik/shared-task-2017/demo/OpenNMT-py/tools/subword-nmt/learn_bpe.py -s 10000 > eten.bpe
echo 
echo Learned.
echo
echo Applying...
for lang in et en do
# apply to train
/gpfs/hpchome/vampnik/shared-task-2017/demo/OpenNMT-py/tools/subword-nmt/apply_bpe.py -c eten.bpe < $DDIR/cleaned-tc-tok-train.$lang > bpe.cleaned-tc-tok-train.$lang 
# apply to dev
/gpfs/hpchome/vampnik/shared-task-2017/demo/OpenNMT-py/tools/subword-nmt/apply_bpe.py -c eten.bpe < $DDIR/tc-tok-dev.$lang > bpe.tc-tok-dev.$lang 
# apply to test 
/gpfs/hpchome/vampnik/shared-task-2017/demo/OpenNMT-py/tools/subword-nmt/apply_bpe.py -c eten.bpe < $DDIR/tc-tok-test.$lang > bpe.tc-tok-test.$lang 
done
