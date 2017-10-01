module load python-2.7.13

python $ROOT/OpenNMT-py/preprocess.py -train_src $DDIR/bpe.cleaned-tc-tok-train.et -train_tgt $DDIR/bpe.cleaned-tc-tok-train.en -valid_src $DDIR/bpe.tc-tok-dev.et -valid_tgt $DDIR/bpe.tc-tok-dev.en -save_data $DDIR/rdy -src_vocab_size 10000 -tgt_vocab_size 10000 -seed 123
