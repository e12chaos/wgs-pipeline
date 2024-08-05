#!/bin/bash
#SBATCH --job-name=bioinfo_sorting
#SBATCH -p short
#SBATCH --mem 64G
#SBATCH -t 1-00:00:00
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=aitken.n@northeastern.edu

# Step 1: Create Sequence Dictionary and Sort SAM Files

module load samtools
module load gatk

gatk CreateSequenceDictionary -R ../data/hg38.fa
samtools faidx ../data/hg38.fa

gatk SortSam -I ../output/alignment/BM002B_A_S1_L001.sam -O ../output/VC/VC_sorting/BM002B_A_S1_L001_sorted.bam -SO coordinate
gatk SortSam -I ../output/alignment/BM002F_A_S3_L001.sam -O ../output/VC/VC_sorting/BM002F_A_S3_L001_sorted.bam -SO coordinate
gatk SortSam -I ../output/alignment/BM002M_A_S2_L001.sam -O ../output/VC/VC_sorting/BM002M_A_S2_L001_sorted.bam -SO coordinate