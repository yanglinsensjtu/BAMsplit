#!/bin/bash
aNUMlist=($(seq 22))
aNUMlist[22]=X
aNUMlist[23]=Y
echo ${aNUMlist[*]}
chr=chr
bam='.bam'
con=con
for (( i = 0; i < 24; i++ )); do
	echo $chr${aNUMlist[i]}$bam
	samtools index $chr${aNUMlist[i]}$bam
done
for (( i = 0; i < 24; i++ )); do
	samtools view -b -h R19026468LD01-T0501-MOCK_sorted_dedup_realign.bam $chr$${aNUMlist[i]} > $chr${aNUMlist[i]}$con$bam
done
for (( i = 0; i < 24; i++ )); do
	echo $chr${aNUMlist[i]}$con$bam
	samtools index $chr${aNUMlist[i]}$con$bam
done