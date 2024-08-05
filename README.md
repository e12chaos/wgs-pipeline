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

project_directory/<br/>
├── data/<br/>
│   ├── raw/<br/>
│   └── hg38.fa<br/>
├── scripts/<br/>
│   ├── qc.sh<br/>
│   ├── trimming.sh<br/>
│   ├── alignment.sh<br/>
│   └── variant_calling.sh<br/>
├── output/<br/>
│   ├── qc/<br/>
│   ├── trimmed/<br/>
│   ├── aligned/<br/>
│   └── variants/<br/>
└── README.md<br/>
