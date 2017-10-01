module load python-2.7.13

python preprocess.py -train_src $ROOT/data/bpe.cleaned-tc-tok-train.et -train_tgt $ROOT/data/bpe.cleaned-tc-tok-train.en -valid_src $ROOT/data/bpe.tc-tok-dev.et -valid_tgt $ROOT/data/bpe.tc-tok-dev.en -save_data $ROOT/data/rdy -src_vocab_size 10000 -tgt_vocab_size 10000 -seed 123
