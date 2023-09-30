#!/usr/bin/env bash

# blast: 2.5.0+

makeblastdb -in ../01_databases/uniprotkb_ig_like_AND_reviewed_true_2023_09_30.fasta -dbtype prot -out ../01_databases/uniprotkb_ig_li
ke_AND_reviewed_true_2023_09_30.fasta