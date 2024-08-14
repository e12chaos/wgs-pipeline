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
module load miniconda3/23.5.2
source activate binf6310
module load samtools
module load gatk

# Index the VCF file for known sites
gatk IndexFeatureFile -F ../data/known_sites/Mills_and_1000G_gold_standard.indels.hg38.vcf

mkdir -p tmp
export TMPDIR=/scratch/aitken.n/data/bioinfo_fastq/tmp

gatk --java-options "-Xmx60G" MarkDuplicates -I ../output/VC/VC_sorting/BM002B_A_S1_L001_sorted.bam -O ../output/VC/VC_dedup_recal/BM002B_A_S1_L001_dedup.bam -M ../output/VC/VC_dedup_recal/dedup_recal_metrics/BM002B_A_S1_L001_metrics.txt --TMP_DIR $TMPDIR
gatk --java-options "-Xmx60G" MarkDuplicates -I ../output/VC/VC_sorting/BM002F_A_S3_L001_sorted.bam -O ../output/VC/VC_dedup_recal/BM002F_A_S3_L001_dedup.bam -M ../output/VC/VC_dedup_recal/dedup_recal_metrics/BM002F_A_S3_L001_metrics.txt --TMP_DIR $TMPDIR
gatk --java-options "-Xmx60G" MarkDuplicates -I ../output/VC/VC_sorting/BM002M_A_S2_L001_sorted.bam -O ../output/VC/VC_dedup_recal/BM002M_A_S2_L001_dedup.bam -M ../output/VC/VC_dedup_recal/dedup_recal_metrics/BM002M_A_S2_L001_metrics.txt --TMP_DIR $TMPDIR

gatk BaseRecalibrator -I ../output/VC/VC_dedup_recal/BM002B_A_S1_L001_dedup_RG.bam -R ../data/hg38.fa --known-sites ../data/known_sites/Mills_and_1000G_gold_standard.indels.hg38.vcf -O ../output/VC/VC_dedup_recal/BM002B_A_S1_L001_recal.table
gatk BaseRecalibrator -I ../output/VC/VC_dedup_recal/BM002F_A_S3_L001_dedup_RG.bam -R ../data/hg38.fa --known-sites ../data/known_sites/Mills_and_1000G_gold_standard.indels.hg38.vcf -O ../output/VC/VC_dedup_recal/BM002F_A_S3_L001_recal.table
gatk BaseRecalibrator -I ../output/VC/VC_dedup_recal/BM002M_A_S2_L001_dedup_RG.bam -R ../data/hg38.fa --known-sites ../data/known_sites/Mills_and_1000G_gold_standard.indels.hg38.vcf -O ../output/VC/VC_dedup_recal/BM002M_A_S2_L001_recal.table
