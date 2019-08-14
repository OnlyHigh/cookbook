#!/bin/bash


#SBATCH --partition=longjobs
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=5-00:00:00
#SBATCH --job-name=minimap2-pe
#SBATCH -o result_%N_%j.out
#SBATCH -e result_%N_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=larteag7@eafit.edu.co


export SBATCH_EXPORT=NONE
module load python/3.6.5_miniconda-4.5.4
source activate Misc
samtools sort -n -o aln-se-mapped-sortedbyname.bam aln-se-mapped.bam
samtools sort -n -o aln-pe-M1-mapped-sortedbyname.bam aln-pe-M1-mapped.bam
samtools fastq -0 /dev/null -F 0x900 aln-se-mapped-sortedbyname.bam > unpaired-M1-M2.fq
samtools fastq -1 M1-forward.fq -2 M1-reverse.fq -0 /dev/null -s /dev/null -n -F 0x900 aln-pe-M1-mapped-sortedbyname.bam