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
samtools view -bS -@ 16 aln-pe-M2.sam > aln-pe-M2.bam 
samtools sort -o aln-pe-M2-mapped-sortedbyname.bam aln-pe-M2-mapped.bam
samtools index aln-pe-M2-mapped-sortedbyname.bam
