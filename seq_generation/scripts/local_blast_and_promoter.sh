#!/bin/bash -l

#### LOCAL RUN: blastn transcription factors in tomato, then grab upstream promoter regions.


#skip makeblastdb if already done.
#makeblastdb -in /Users/Sid/Projects/Tomato_project/promoter_analysis/seq_generation/ref_gen_v3/S_lycopersicum_chromosomes.3.00.fa -parse_seqids -dbtype nucl # parse_seqids will grab the chr numbers for later matching


FILE=$( cat /Users/Sid/Projects/Tomato_project/promoter_analysis/seq_generation/fastas/wget_fastas/TF_list.txt ); 

for file in $FILE;

do

    tf=$(echo $file | sed 's/.*\///' );

    dir=$(echo $file | sed 's/\/.*//');

    blastn -query /Users/Sid/Projects/Tomato_project/promoter_analysis/seq_generation/fastas/wget_fastas/"$dir"/"$tf" -db /Users/Sid/Projects/Tomato_project/promoter_analysis/seq_generation/ref_gen_v3/S_lycopersicum_chromosomes.3.00.fa -outfmt 6 > /Users/Sid/Projects/Tomato_project/promoter_analysis/seq_generation/blast_outs/"$dir"/"$tf".out;

    match_id=$(head -1 /Users/Sid/Projects/Tomato_project/promoter_analysis/seq_generation/blast_outs/"$dir"/"$tf".out | cut -f 2); #get matching chr id.

    seq_start=$(head -1 /Users/Sid/Projects/Tomato_project/promoter_analysis/seq_generation/blast_outs/"$dir"/"$tf".out | cut -f 9); # get sequence match start position (sometimes top blast value isn't misses some of the beginning match to the query)

    promoter_start=$(echo "$seq_start"-3000 | bc); # find 3000 positions upstream

    blastdbcmd -db /Users/Sid/Projects/Tomato_project/promoter_analysis/seq_generation/ref_gen_v3/S_lycopersicum_chromosomes.3.00.fa -dbtype nucl -entry "$match_id" -range "$promoter_start"-"$seq_start" > /Users/Sid/Projects/Tomato_project/promoter_analysis/seq_generation/promoters/"$dir"/"$tf".promoter;

done;