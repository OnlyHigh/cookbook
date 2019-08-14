#!/bin/bash

#SBATCH --partition=longjobs
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=5-00:00:00
#SBATCH --job-name=mtDNA
#SBATCH -o result_%N_%j.out
#SBATCH -e result_%N_%j.err
#SBATCH --mail-type=START,END
#SBATCH --mail-user=larteag7@eafit.edu.co


export SBATCH_EXPORT=NONE
#module load python/3.6.5_miniconda-4.5.1 #APOLO
module load python/3.6.5_miniconda-4.5.4  #CRONOS 
source activate Misc
hisat2 -q -x Scutigerella --threads 16 -1 ./Sym-Infected/Sym_forward.fq -2 ./Sym-Infected/Sym_reverse.fq -U ./Sym-Infected/Sym_single.fq -S mtDNA_Infected.sam --no-unal 
hisat2 -q -x Scutigerella --threads 16 -1 ./Sym-Healthy/output_forward_paired.fq -2 ./Sym-Healthy/output_reverse_paired.fq -U ./Sym-Healthy/unpaired.fq -S mtDNA_Healthy.sam --no-unal