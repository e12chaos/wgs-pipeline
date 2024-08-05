mkdir -p output/QC_Reports
fastqc data/BM002B_A_S1_L001_R1_001.fastq.gz data/BM002B_A_S1_L001_R2_001.fastq.gz -o output/QC_Reports
fastqc data/BM002F_A_S3_L001_R1_001.fastq.gz data/BM002F_A_S3_L001_R2_001.fastq.gz -o output/QC_Reports
fastqc data/BM002M_A_S2_L001_R1_001.fastq.gz data/BM002M_A_S2_L001_R2_001.fastq.gz -o output/QC_Reports