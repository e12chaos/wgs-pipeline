#!/bin/bash
#SBATCH --job-name=bioinfo_coop-work	  # Name of the job
#SBATCH -p short                        # Who to bill for the job
#SBATCH --mem 16G                         # How much memory
#SBATCH -t 1-00:00:00                        # How long
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=aitken.n@northeastern.edu

# mkdir -p ../output/trim

# trimmomatic PE ../data/BM002B_A_S1_L001_R1_001.fastq.gz ../data/BM002B_A_S1_L001_R2_001.fastq.gz \
#     ../output/trim/BM002B_A_S1_L001_R1_001_paired.fastq.gz ../output/trim/BM002B_A_S1_L001_R1_001_unpaired.fastq.gz \
#     ../output/trim/BM002B_A_S1_L001_R2_001_paired.fastq.gz ../output/trim/BM002B_A_S1_L001_R2_001_unpaired.fastq.gz \
#     ILLUMINACLIP:adapters.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

trimmomatic PE ../data/BM002F_A_S3_L001_R1_001.fastq.gz ../data/BM002F_A_S3_L001_R2_001.fastq.gz \
    ../output/trim/BM002F_A_S3_L001_R1_001_paired.fastq.gz ../output/trim/BM002F_A_S3_L001_R1_001_unpaired.fastq.gz \
    ../output/trim/BM002F_A_S3_L001_R2_001_paired.fastq.gz ../output/trim/BM002F_A_S3_L001_R2_001_unpaired.fastq.gz \
    ILLUMINACLIP:adapters.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

trimmomatic PE ../data/BM002M_A_S2_L001_R1_001.fastq.gz ../data/BM002M_A_S2_L001_R2_001.fastq.gz \
    ../output/trim/BM002M_A_S2_L001_R1_001_paired.fastq.gz ../output/trim/BM002M_A_S2_L001_R1_001_unpaired.fastq.gz \
    ../output/trim/BM002M_A_S2_L001_R2_001_paired.fastq.gz ../output/trim/BM002M_A_S2_L001_R2_001_unpaired.fastq.gz \
    ILLUMINACLIP:adapters.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
