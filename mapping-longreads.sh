#!/bin/bash


#SBATCH --partition=longjobs
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=5-00:00:00
#SBATCH --job-name=canu
#SBATCH -o result_%N_%j.out
#SBATCH -e result_%N_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=larteag7@eafit.edu.co


export SBATCH_EXPORT=NONE
module load python/3.6.5_miniconda-4.5.4
#source activate Misc
source activate nanopack
#minimap2 -ax map-ont -t 16 ref.fa ont.fq > aln-minimap2-cp.sam
#samtools view -bS -F 4 aln-minimap2-cp.sam > mapped.bam
#samtools sort -o mapped-sorted-cp.bam mapped.bam
/home/larteag7/.local/bin/NanoStat --readtype 1D --fastq ont-mapped.fq -o Sacha-NanoStats -t 16
/home/larteag7/.local/bin/NanoPlot -o Sacha-NanoPlot -t 16 --fastq ont-mapped.fq