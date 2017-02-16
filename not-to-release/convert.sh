#!/bin/bash

udapy -h >/dev/null || { echo "udapy is not installed, see https://github.com/udapi/udapi-python"; exit 1; }

SCENARIO="ud.Convert1to2 skip=coord,nmod ud.ru.FixRemnant"
for a in train dev test; do
    cat ru-ud-$a.conllu | udapy -s $SCENARIO > ../ru-ud-$a.conllu
done

cat ../ru-ud-{train,dev,test}.conllu | udapy -HAMC ud.MarkBugs skip='no-(VerbForm|PronType)' > bugs.html
