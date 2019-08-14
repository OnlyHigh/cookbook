#!/bin/bash

#SBATCH --partition=bigmem
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=24
#SBATCH --mem=250g
#SBATCH --time=120:00:00
#SBATCH --job-name=PolishingPurp
#SBATCH -o result_%N_%j.out
#SBATCH -e result_%N_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=larteag7@eafit.edu.co

export SBATCH_EXPORT=NONE
export OMP_NUM_THREADS=1


module load python/2.7.15_miniconda-4.5.4
module load samtools/1.3.1_intel-2017_update-1

source activate pilon
/home/larteag7/apps/minimap2-2.12_x64-linux/minimap2 -ax sr -t $SLURM_NTASKS ref.fa output_1_paired.fq output_2_paired.fq > aln-pe.sam
samtools view -@ $SLURM_NTASKS -bS aln-pe.sam > aln-pe.bam
samtools sort -o aln-pe-sorted.bam -@ $SLURM_NTASKS aln-pe.bam 
samtools index aln-pe-sorted.bam
bwa index ref.fa
bwa mem ref.fa unpaired.fq > aln-se.sam
samtools view -bS aln-se.sam > aln-se.bam
samtools sort -o aln-se-sorted.bam -@ $SLURM_NTASKS aln-se.bam
samtools index  aln-se-sorted.bam
pilon --genome ref.fa --frags aln-pe-sorted.bam --unpaired aln-se-sorted.bam 

