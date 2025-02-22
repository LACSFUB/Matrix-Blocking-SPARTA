#!/bin/bash

OPTS="-r 3 -v -1 -i 2 -R saad_blocks -s 1 -a -1 -F jaccard -M 1"
DATA={1}

DATE=$(date +"%m-%d-%Y");
RESULTS="results/test_cublas_reordering-RMAT-${DATE}.txt"

:>${RESULTS};

e_value=(0.1 0.5);

P_value=(64);
l_value=(0);

for f in ${1}*; do
  for e in ${e_value[@]}; do
    for P in ${P_value[@]}; do
      for l in ${l_value[@]}; do 
		echo $f $e $P $l $(date)
	      	./programs/cuda/test_cublas_reorder_optimized ${OPTS} -f $f -e $e -P $P -l $l >> ${RESULTS}
      done
    done
  done
done



