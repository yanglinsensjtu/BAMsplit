#!/bin/bash
nums=($(seq 22))
nums[22]=X
nums[23]=Y
echo ${nums[*]}
chr=chr
bam='.bam'
con=con
for (( i = 0; i < 24; i++ )); do
	echo $chr${nums[i]}$bam
	samtools view -b -h R19026469LD01-T0502-CAR_sorted_dedup_realign.bam $chr$${nums[i]} > $chr${nums[i]}$bam
done
for (( i = 0; i < 24; i++ )); do
	echo $chr${nums[i]}$bam
	samtools index $chr${nums[i]}$bam
done
for (( i = 0; i < 24; i++ )); do
	echo $chr${nums[i]}$con$bam
	samtools view -b -h R19026468LD01-T0501-MOCK_sorted_dedup_realign.bam $chr$${nums[i]} > $chr${nums[i]}$con$bam
done
for (( i = 0; i < 24; i++ )); do
	echo $chr${nums[i]}$con$bam
	samtools index $chr${nums[i]}$con$bam
done