#!/bin/bash


#SBATCH --partition=longjobs
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=5-00:00:00
#SBATCH --job-name=spades
#SBATCH -o result_%N_%j.out
#SBATCH -e result_%N_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=larteag7@eafit.edu.co


export SBATCH_EXPORT=NONE
module load python/3.6.5_miniconda-4.5.4
source activate Misc
#spades.py -1 forward.fq -2 reverse.fq -s unpaired.fq -o Try2 --threads 16 --careful -k 21,33,55,77,99,111
#spades.py -1 forward.fq -2 reverse.fq -s unpaired.fq --nanopore ONT.fq -o Try2-wiONT --threads 16 --careful -k 21,33,55,77,99,111
#unicycler -1 forward.fq -2 reverse.fq -s unpaired.fq -o Try1-Illumina-unicycler --threads 16 --min_fasta_length 1000
#velveth ./Try1-illumina-velvet/ 11,121,22 -fastq -shortPaired mapped-forward.fq mapped-reverse.fq 
velvetg ./Try1-illumina-velvet/