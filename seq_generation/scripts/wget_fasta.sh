#!/bin/bash -l

# get all CDS fastas for TFs of interest from plantTFDB. 

cd /Users/Sid/Projects/Tomato_project/promoter_analysis/testing/fastas/wget_fastas/All_Up;

for tf in $(cat All_Up_list.txt);

do 
    url=$(echo "http://planttfdb.cbi.pku.edu.cn/view_cds.php?sp=Sly&oid=Solyc08g005050.2.1" | sed "s/.\{18\}$/$tf.1/");

    wget -O "$tf".1 "${url}" | sed -e 's/<[^>]*>//g';

    less "$tf".1 | sed -e 's/<pre>//g' | sed -e 's/<\/pre>//g' > "$tf".1.fasta;

    rm -f "$tf".1;

done;  