#!/usr/bin/env bash

# 1. Clustal omega alignment ig-like database (5,410 reviewed proteins)
# clustalo: 1.2.4
clustalo -i ../01_databases/01_reviewed/uniprotkb_ig_like_AND_reviewed_true_2023_09_30.fasta -o ../01_databases/01_reviewed/uniprotkb_ig_like_AND_reviewed_true_2023_09_30_aligned.fasta --full --threads 12

