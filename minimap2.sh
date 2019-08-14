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
#minimap2 -ax sr ref.fa tot_DNA_M1_F_trm_p1.fastq tot_DNA_M1_R_trm_p2.fastq > aln-pe-M1.sam
minimap2 -ax sr ref.fa tot_DNA_M2_F_trm_p1.fastq tot_DNA_M2_R_trm_p2.fastq > aln-pe-M2.sam