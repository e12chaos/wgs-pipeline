#!/bin/bash
#SBATCH --job-name=bioinfo_dedup_recal
#SBATCH -p short
#SBATCH --mem 64G
#SBATCH -t 1-00:00:00
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=aitken.n@northeastern.edu

# Step 2: Mark Duplicates and BaseRecalibrator

module load samtools
module load gatk

gatk CreateSequenceDictionary -R ../data/hg38.fa
samtools faidx ../data/hg38.fa

gatk MarkDuplicates -I ../output/VC/VC_sorting/BM002B_A_S1_L001_sorted.bam -O ../output/VC/VC_dedup_recal/BM002B_A_S1_L001_dedup.bam -M BM002B_A_S1_L001_metrics.txt
gatk MarkDuplicates -I ../output/VC/VC_sorting/BM002F_A_S3_L001_sorted.bam -O ../output/VC/VC_dedup_recal/BM002F_A_S3_L001_dedup.bam -M BM002F_A_S3_L001_metrics.txt
gatk MarkDuplicates -I ../output/VC/VC_sorting/BM002M_A_S2_L001_sorted.bam -O ../output/VC/VC_dedup_recal/BM002M_A_S2_L001_dedup.bam -M BM002M_A_S2_L001_metrics.txt

gatk BaseRecalibrator -I ../output/VC/VC_dedup_recal/BM002B_A_S1_L001_dedup.bam -R ../data/hg38.fa --known-sites known_variants.vcf -O ../output/VC/VC_dedup_recal/BM002B_A_S1_L001_recal.table
gatk BaseRecalibrator -I ../output/VC/VC_dedup_recal/BM002F_A_S3_L001_dedup.bam -R ../data/hg38.fa --known-sites known_variants.vcf -O ../output/VC/VC_dedup_recal/BM002F_A_S3_L001_recal.table
gatk BaseRecalibrator -I ../output/VC/VC_dedup_recal/BM002M_A_S2_L001_dedup.bam -R ../data/hg38.fa --known-sites known_variants.vcf -O ../output/VC/VC_dedup_recal/BM002M_A_S2_L001_recal.table
