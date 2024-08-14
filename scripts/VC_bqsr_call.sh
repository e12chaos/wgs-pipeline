#!/bin/bash
#SBATCH --job-name=bioinfo_bqsr_call
#SBATCH -p short
#SBATCH --mem 64G
#SBATCH -t 1-00:00:00
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=aitken.n@northeastern.edu

module load miniconda3/23.5.2
source activate binf6310
module load samtools
module load gatk

gatk ApplyBQSR -R ../data/hg38.fa -I ../output/VC/VC_dedup_recal/BM002B_A_S1_L001_dedup_RG.bam --bqsr-recal-file ../output/VC/VC_dedup_recal/BM002B_A_S1_L001_recal.table -O ../output/VC/VC_bqsr_call/BM002B_A_S1_L001_bqsr.bam
gatk ApplyBQSR -R ../data/hg38.fa -I ../output/VC/VC_dedup_recal/BM002F_A_S3_L001_dedup_RG.bam --bqsr-recal-file ../output/VC/VC_dedup_recal/BM002F_A_S3_L001_recal.table -O ../output/VC/VC_bqsr_call/BM002F_A_S3_L001_bqsr.bam
gatk ApplyBQSR -R ../data/hg38.fa -I ../output/VC/VC_dedup_recal/BM002M_A_S2_L001_dedup_RG.bam --bqsr-recal-file ../output/VC/VC_dedup_recal/BM002M_A_S2_L001_recal.table -O ../output/VC/VC_bqsr_call/BM002M_A_S2_L001_bqsr.bam

gatk HaplotypeCaller -R ../data/hg38.fa -I ../output/VC/VC_bqsr_call/BM002B_A_S1_L001_bqsr.bam -O ../output/VC/VC_bqsr_call/vcf/BM002B_A_S1_L001_variants.vcf
gatk HaplotypeCaller -R ../data/hg38.fa -I ../output/VC/VC_bqsr_call/BM002F_A_S3_L001_bqsr.bam -O ../output/VC/VC_bqsr_call/vcf/BM002F_A_S3_L001_variants.vcf
gatk HaplotypeCaller -R ../data/hg38.fa -I ../output/VC/VC_bqsr_call/BM002M_A_S2_L001_bqsr.bam -O ../output/VC/VC_bqsr_call/vcf/BM002M_A_S2_L001_variants.vcf




# # Step 3: Apply BQSR and Call Variants
# # Load modules

# module load miniconda3/23.5.2
# source activate binf6310
# module load samtools
# module load gatk

# # Define variables for paths
# REFERENCE="../data/hg38.fa"
# OUTPUT_DIR="../output/VC/bqsr_call"
# INPUT_DIR="../output/VC/VC_dedup_recal"
# KNOWN_SITES="../data/known_sites/Mills_and_1000G_gold_standard.indels.hg38.vcf"

# # Ensure output directory exists
# mkdir -p $OUTPUT_DIR

# # Apply BQSR
# gatk ApplyBQSR \
#    -R $REFERENCE \
#    -I $INPUT_DIR/BM002B_A_S1_L001_dedup.bam \
#    --bqsr-recal-file $INPUT_DIR/BM002B_A_S1_L001_recal.table \
#    -O $OUTPUT_DIR/BM002B_A_S1_L001_bqsr.bam

# gatk ApplyBQSR \
#    -R $REFERENCE \
#    -I $INPUT_DIR/BM002F_A_S3_L001_dedup.bam \
#    --bqsr-recal-file $INPUT_DIR/BM002F_A_S3_L001_recal.table \
#    -O $OUTPUT_DIR/BM002F_A_S3_L001_bqsr.bam

# gatk ApplyBQSR \
#    -R $REFERENCE \
#    -I $INPUT_DIR/BM002M_A_S2_L001_dedup.bam \
#    --bqsr-recal-file $INPUT_DIR/BM002M_A_S2_L001_recal.table \
#    -O $OUTPUT_DIR/BM002M_A_S2_L001_bqsr.bam

# # Call variants using HaplotypeCaller
# gatk HaplotypeCaller \
#    -R $REFERENCE \
#    -I $OUTPUT_DIR/BM002B_A_S1_L001_bqsr.bam \
#    -O $OUTPUT_DIR/BM002B_A_S1_L001_variants.vcf

# gatk HaplotypeCaller \
#    -R $REFERENCE \
#    -I $OUTPUT_DIR/BM002F_A_S3_L001_bqsr.bam \
#    -O $OUTPUT_DIR/BM002F_A_S3_L001_variants.vcf

# gatk HaplotypeCaller \
#    -R $REFERENCE \
#    -I $OUTPUT_DIR/BM002M_A_S2_L001_bqsr.bam \
#    -O $OUTPUT_DIR/BM002M_A_S2_L001_variants.vcf
