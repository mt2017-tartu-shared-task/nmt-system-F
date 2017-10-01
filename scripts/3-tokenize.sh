#!/bin/bash

source env.sh

# change file rights just in case
chmod +x $ROOT/OpenNMT-py/tools/*.perl

echo Tokenizing
for f in $DDIR/{test,dev,train}.{en,et}
do
	$ROOT/OpenNMT-py/tools/tokenizer.perl < $f > $DDIR/tok-$(basename $f)
done
