#!/bin/bash
#SBATCH --job-name=bioinfo_bqsr_call
#SBATCH -p short
#SBATCH --mem 64G
#SBATCH -t 1-00:00:00
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=aitken.n@northeastern.edu

# Step 3: Apply BQSR and Call Variants
# Load modules

module load miniconda3/23.5.2
source activate binf6310
module load samtools
module load gatk

# Define variables for paths
REFERENCE="../data/hg38.fa"
OUTPUT_DIR="../output/VC/bqsr_call"
INPUT_DIR="../output/VC/VC_sorting"
KNOWN_SITES="known_variants.vcf"


gatk ApplyBQSR -R reference_genome.fa -I BM002B_A_S1_L001_dedup.bam --bqsr-recal-file BM002B_A_S1_L001_recal.table -O BM002B_A_S1_L001_bqsr.bam
gatk ApplyBQSR -R reference_genome.fa -I BM002F_A_S3_L001_dedup.bam --bqsr-recal-file BM002F_A_S3_L001_recal.table -O BM002F_A_S3_L001_bqsr.bam
gatk ApplyBQSR -R reference_genome.fa -I BM002M_A_S2_L001_dedup.bam --bqsr-recal-file BM002M_A_S2_L001_recal.table -O BM002M_A_S2_L001_bqsr.bam

gatk HaplotypeCaller -R reference_genome.fa -I BM002B_A_S1_L001_bqsr.bam -O BM002B_A_S1_L001_variants.vcf
gatk HaplotypeCaller -R reference_genome.fa -I BM002F_A_S3_L001_bqsr.bam -O BM002F_A_S3_L001_variants.vcf
gatk HaplotypeCaller -R reference_genome.fa -I BM002M_A_S2_L001_bqsr.bam -O BM002M_A_S2_L001_variants.vcf