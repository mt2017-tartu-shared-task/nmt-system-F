#!/bin/bash

source env.sh

perl $ROOT/OpenNMT-py/tools/multi-bleu.perl $DDIR/bpe.tc-tok-test.en < $ROOT/hyps/hyps.en
