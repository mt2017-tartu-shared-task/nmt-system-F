#!/bin/bash

source env.sh

cat $ROOT/hyps/final-hyps.en | sed 's/@@ //g' | $MOSES/recaser/detruecase.perl | $MOSES/tokenizer/detokenizer.perl > $ROOT/hyps/final-final.en
