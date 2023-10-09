#!/usr/bin/env bash

# hmmer: HMMER 3.1b2
hmmscan --domtblout ../04_hmm/prodigal_Fagoma_Raton_5498_hmmer_results.dm --cpu 12 ../01_databases/uniprotkb_ig_like_AND_reviewed_true_2023_09_30_aligned.hmm ../02_prodigal/prodigal_Fagoma_Raton_5498.faa > ../04_hmm/prodigal_Fagoma_Raton_5498_hmmer_results.out

hmmscan-parser.sh ../04_hmm/prodigal_Fagoma_Raton_5498_hmmer_results.dm > ../04_hmm/prodigal_Fagoma_Raton_5498_hmmer_results.dm.ps

cut -f1,3 ../04_hmm/prodigal_Fagoma_Raton_5498_hmmer_results.dm.ps  | sort -n > ../04_hmm/prodigal_Fagoma_Raton_5498_hmmer_final.tsv

$ cut -f1,3 [archivo.out.dm.ps]  | sort -n > [salida.txt]
$ sed -i 's/\.hmm//' salida.txt 