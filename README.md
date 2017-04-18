###Promoter Analysis for Transcription Factors up and downregulated under different conditions.

####seq_generation/ 

##### 'scripts/': bash scripts used and run locally.

*   [`wget_fasta.sh`](scripts/wget_fasta.sh) - Downloaded and formatted 391 fastas CDS for the TFs, from HTML.
*   [`local_blast_and_promoter.sh`](scripts/local_blast_and_promoter.sh) - blastn of TFs against tomato ref genome v3, then grabbing 3kb upstream of respective TFs.

##### `fastas/`: 

* TF fastas, organized by experimental condition. 

##### 'blast_outs/':

* BLAST outputs TF aligned to ref gen, in blast outfmt 6.

##### 'promoters/':

* 3kb upstream of each TFs respective position, from the genome.