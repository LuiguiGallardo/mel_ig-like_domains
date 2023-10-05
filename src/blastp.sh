#!/usr/bin/env bash

# blastp: 2.5.0+

cat ../02_prodigal/prodigal_Fagoma_Raton_5498.faa | \
    blastp -db ../01_databases/uniprotkb_ig_like_AND_reviewed_true_2023_09_30.fasta \
    -num_threads 12 -evalue 1e-3 \
    -outfmt "6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore qcovs"\
    > ../03_blastp/blastp_prodigal_Fagoma_Raton_5498_outfmt6.tsv

# Filter identity and query coverage, ffrom 50 to 90
for ((perc=50; perc <= 100; perc +=5))
    do echo "cat ../03_blastp/blastp_prodigal_Fagoma_Raton_5498_outfmt6.tsv | \
    awk '\$3 >= $perc && \$13 >= $perc' \
    > ../03_blastp/blastp_prodigal_Fagoma_Raton_5498_outfmt6_cov-id_$perc.tsv"
done | bash

# Create table proteins
touch ../03_blastp/blastp_prodigal_Fagoma_Raton_5498_outfmt6_cov-id_values.tsv

printf "cov-id\tmatches\n" > ../03_blastp/blastp_prodigal_Fagoma_Raton_5498_outfmt6_cov-id_values.tsv

for ((perc=50; perc <= 100; perc +=5))
    do echo "printf "cov-id_"$perc'\t'"
    echo "cat ../03_blastp/blastp_prodigal_Fagoma_Raton_5498_outfmt6_cov-id_$perc.tsv | cut -f 1 | sort | uniq | wc -l "
done | bash >> ../03_blastp/blastp_prodigal_Fagoma_Raton_5498_outfmt6_cov-id_values.tsv

# Create table count contigs
touch ../03_blastp/../03_blastp/blastp_prodigal_Fagoma_Raton_5498_outfmt6_cov-id_contigs.tsv

printf "cov-id\tcontigs\n" > ../03_blastp/blastp_prodigal_Fagoma_Raton_5498_outfmt6_cov-id_contigs.tsv

for ((perc=50; perc <= 100; perc +=5))
    do echo "printf "cov-id_"$perc'\t'"
    echo "cat ../03_blastp/blastp_prodigal_Fagoma_Raton_5498_outfmt6_cov-id_$perc.tsv | cut -f 1 | cut -f -2 -d _ | sort | uniq | wc -l "
done | bash >> ../03_blastp/blastp_prodigal_Fagoma_Raton_5498_outfmt6_cov-id_contigs.tsv

# Create tables contigs
for ((perc=50; perc <= 100; perc +=5))
    do echo "cat ../03_blastp/blastp_prodigal_Fagoma_Raton_5498_outfmt6_cov-id_$perc.tsv | cut -f 1 | cut -f -2 -d _ | sort | uniq > ../03_blastp/contigs_prodigal_Fagoma_Raton_5498_outfmt6_cov-id_$perc.tsv"
done | bash