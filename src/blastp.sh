#!/usr/bin/env bash

# blastp: 2.5.0+

printf "blast database: "$1"\n"
printf "input file: "$2"\n"
printf "output file: "$3"\n"

cat $2 | blastp -db $1 -num_threads 12 -outfmt 6 > $3 &
wait
