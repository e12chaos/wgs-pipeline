#!/bin/bash
#SBATCH --job-name=bioinfo_coop-work	  # Name of the job
#SBATCH -p short                        # Who to bill for the job
#SBATCH --mem 64G                         # How much memory
#SBATCH -t 1-00:00:00                        # How long
#SBATCH -N 1
#SBATCH -c 12
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=aitken.n@northeastern.edu

# Create output directory
mkdir -p ../output/alignment

# Index reference if not already indexed
if [ ! -f ../data/hg38.fa.bwt ]; then
    bwa index ../data/hg38.fa
fi

# Run bwa mem for BM002M_A_S2_L001
bwa mem -t 12 ../data/hg38.fa ../output/trim/BM002M_A_S2_L001_R1_001_paired.fastq.gz ../output/trim/BM002M_A_S2_L001_R2_001_paired.fastq.gz > ../output/alignment/BM002M_A_S2_L001.sam
