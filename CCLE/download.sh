#!/bin/bash

function downloadData {
#:FUnction accepts the URL as a parameter
	url="$1"
	
	fileName="$(basename $url)"

#Check to see if the file has been downloaded already. If not, download it.
	if [ ! -f "$fileName" ]
	then 
		curl -o "$fileName" -L "$url"
	fi
}


#This will download the file using the function above

downloadData "https://portals.broadinstitute.org/ccle_legacy/downloadFile/DefaultSystemRoot/exp_10/ds_20/CCLE_copynumber_byGene_2013-12-03.txt.gz?downloadff=true&fileId=17599"
downloadData "https://portals.broadinstitute.org/ccle_legacy/downloadFile/DefaultSystemRoot/exp_10/ds_32/ccle2maf_20170805f.txt?downloadff=true&fileId=27366"
mv ccle2maf_20170805f.txt\?downloadff\=true\&fileId\=27366 meta2
mv CCLE_copynumber_byGene_2013-12-03.txt.gz\?downloadff\=true\&fileId\=17599 meta1.gz
gunzip meta1.gz

#unzip UCSF_Weiss_CTDD_data_submission.zip -d tmp
