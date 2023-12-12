#!/usr/bin/env python
import sys
from Bio import SearchIO

with open(sys.argv[1], 'r') as input:
    output = sys.argv[2]
    with open(output, 'w') as filtered:
        filtered.write(
            "#HMM_family\tHMM_len\tQuery_ID\tQuery_len\tE-value\tHMM_start\tHMM_end"
            "\tQuery_start\tQuery_end\tCoverage\n")
        for qresult in SearchIO.parse(input, 'hmmscan3-domtab'):
            query_id = qresult.id  # sequence ID from fasta
            query_len = qresult.seq_len
            hits = qresult.hits
            num_hits = len(hits)
            if num_hits > 0:
                for i in range(0, num_hits):
                    hit_evalue = hits[i].evalue  # evalue
                    hmmLen = hits[i].seq_len  # targvet length
                    hmm_aln = int(hits[i].hsps[0].hit_end) - int(hits[i].hsps[0].hit_start)  # length of alignment
                    coverage = hmm_aln / float(hmmLen)  # alignment coverage
                    hmm_name = hits[i].id  # targvet name
                    # if hit_evalue < 1.0e-3 and coverage > 0.3:
                    # if hit_evalue < 0.1 and coverage > 0.1:
                    filtered.write("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%f\n" % (hmm_name, hmmLen, query_id,
                                                                                    query_len, hit_evalue,
                                                                                    hits[i].hsps[0].hit_start,
                                                                                    hits[i].hsps[0].hit_end,
                                                                                    hits[i].hsps[0].query_start,
                                                                                    hits[i].hsps[0].query_end,
                                                                                    coverage))
                    # CAZY = {'CBM': 'Carbohydrate-binding module', 'CE': 'Carbohydrate esterase',
                    # 'GH': 'Glycoside hydrolase', 'GT': 'Glycosyltransferase', 'PL': 'Polysaccharide lyase',
                    # 'AA': 'Auxillary activities'}