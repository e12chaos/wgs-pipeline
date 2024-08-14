#!/bin/bash
#SBATCH --job-name=bioinfo_picard
#SBATCH -p short
#SBATCH --mem 64G
#SBATCH -t 1-00:00:00
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=aitken.n@northeastern.edu

# Step ?: Picard
module load miniconda3/23.5.2
source activate binf6310
module load samtools
module load gatk

picard AddOrReplaceReadGroups \
    I=../output/VC/VC_dedup_recal/BM002B_A_S1_L001_dedup.bam \
    O=../output/VC/VC_dedup_recal/BM002B_A_S1_L001_dedup_RG.bam \
    RGID=1 \
    RGLB=lib1 \
    RGPL=illumina \
    RGPU=unit1 \
    RGSM=sample1

picard AddOrReplaceReadGroups \
    I=../output/VC/VC_dedup_recal/BM002F_A_S3_L001_dedup.bam \
    O=../output/VC/VC_dedup_recal/BM002F_A_S3_L001_dedup_RG.bam \
    RGID=1 \
    RGLB=lib1 \
    RGPL=illumina \
    RGPU=unit1 \
    RGSM=sample1

picard AddOrReplaceReadGroups \
    I=../output/VC/VC_dedup_recal/BM002M_A_S2_L001_dedup.bam \
    O=../output/VC/VC_dedup_recal/BM002M_A_S2_L001_dedup_RG.bam \
    RGID=1 \
    RGLB=lib1 \
    RGPL=illumina \
    RGPU=unit1 \
    RGSM=sample1
