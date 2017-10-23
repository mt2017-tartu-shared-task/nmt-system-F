#!/bin/bash

source env.sh

perl $ROOT/OpenNMT-py/tools/multi-bleu.perl $DDIR/bpe.accurate.en < $ROOT/hyps/accurate-hyps.en
