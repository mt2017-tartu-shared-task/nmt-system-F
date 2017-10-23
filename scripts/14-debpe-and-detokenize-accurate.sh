#!/bin/bash

source env.sh

cat $ROOT/hyps/accurate-hyps.en | sed 's/@@ //g' | $MOSES/recaser/detruecase.perl | $MOSES/tokenizer/detokenizer.perl > $ROOT/hyps/accurate-final.en
