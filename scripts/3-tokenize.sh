#!/bin/bash

source env.sh

echo Tokenizing
for f in $DDIR/{test,dev,train}.{en,et}
do
	$ROOT/OpenNMT-py/tools/tokenizer.perl < $f > $DDIR/tok-$f
done
