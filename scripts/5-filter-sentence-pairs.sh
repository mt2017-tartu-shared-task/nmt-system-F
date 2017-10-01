source env.sh

echo
echo Filter sentence pairs

$ROOT/OpenNMT-py/tools/clean-corpus-n.perl $DDIR/tc-tok-train en et $DDIR/cleaned-tc-tok-train 1 100

echo Done filtering

