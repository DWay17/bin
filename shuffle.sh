#!/bin/sh
exit 1
IN="ssdfis.csv"
cut -f 1 < $IN > $IN"_f1"
cut -f 2 < $IN > $IN"_f2"
cut -f 3 < $IN > $IN"_f3"
cut -f 4 < $IN > $IN"_f4"
paste $IN"_f1" $IN"_f2" $IN"_f3" $IN"_f4" > $IN"_shuffled"
