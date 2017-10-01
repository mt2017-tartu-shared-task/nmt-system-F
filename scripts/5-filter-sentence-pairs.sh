source env.sh

echo
echo Filter sentence pairs

$ROOT/OpenNMT-py/tools/clean-corpus-n.perl tc-tok-train en et cleaned-tc-tok-train 1 100

echo Done filtering

