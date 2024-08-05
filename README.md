# wgs-pipeline


# Human WGS Pipeline using hg38

## Overview
This pipeline processes raw whole-genome sequencing (WGS) data for human samples using the hg38 reference genome. The pipeline consists of four main steps: quality control (QC), trimming, alignment, and variant calling.

## Pipeline Steps

1. **Quality Control (QC)**
2. **Trimming**
3. **Alignment**
4. **Variant Calling**

## Prerequisites

Ensure the following tools are installed and accessible in your environment:
- FastQC
- Trimmomatic
- BWA
- Samtools
- GATK
- Picard (optional, if using Picard for MarkDuplicates)

## Directory Structure
```
project_directory/
├── data/
│   ├── raw/
│   └── hg38.fa
├── scripts/
│   ├── qc.sh
│   ├── trimming.sh
│   ├── alignment.sh
│   └── variant_calling.sh
├── output/
│   ├── qc/
│   ├── trimmed/
│   ├── aligned/
│   └── variants/
└── README.md
```