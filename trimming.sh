#!/bin/bash

#SBATCH --partition=longjobs
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=5-00:00:00
#SBATCH --job-name=Diplopod-trimming
#SBATCH -o result_%N_%j.out
#SBATCH -e result_%N_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=larteag7@eafit.edu.co


export SBATCH_EXPORT=NONE
module load python/3.6.5_miniconda-4.5.4 
#module load openmpi-1.8-x86_64 Failed
module load openmpi/3.1.1_intel-18.0.2
source activate Misc
#trimming
#trimmomatic PE -threads 24 -phred33 SRR1574920_1.fastq SRR1574920_2.fastq output_forward_paired.fq output_forward_unpaired.fq output_reverse_paired.fq output_reverse_unpaired.fq ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36 AVGQUAL:30
#assembly
spades.py -1 output_forward_paired.fq -2 output_reverse_paired.fq -s unpaired.fq --only-error-correction -k 21,33,55,65,71,77,79,81 -o Diplopod-Spades --threads 16
#mpirun -np 2 abyss-pe name=Diplopod k=96 in='output_forward_paired.fq output_forward_paired.fq'

