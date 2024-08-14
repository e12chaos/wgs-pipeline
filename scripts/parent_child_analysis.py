# Example script to identify de novo mutations
import vcf

def find_denovo(parent1_vcf, parent2_vcf, child_vcf, output_file):
    parent1_variants = set([variant.POS for variant in vcf.Reader(open(parent1_vcf))])
    parent2_variants = set([variant.POS for variant in vcf.Reader(open(parent2_vcf))])
    child_variants = [variant for variant in vcf.Reader(open(child_vcf))]

    with open(output_file, 'w') as output:
        writer = vcf.Writer(output, vcf.Reader(open(child_vcf)))
        for variant in child_variants:
            if variant.POS not in parent1_variants and variant.POS not in parent2_variants:
                writer.write_record(variant)

find_denovo('BM002B_A_S1_L001_variants_filtered.vcf', 'BM002F_A_S3_L001_variants_filtered.vcf', 'BM002M_A_S2_L001_variants_filtered.vcf', 'denovo_variants.vcf')
