#!/bin/bash

#SBATCH --partition=longjobs
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=5-00:00:00
#SBATCH --job-name=SRA-DATA
#SBATCH -o result_%N_%j.out
#SBATCH -e result_%N_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=larteag7@eafit.edu.co


export SBATCH_EXPORT=NONE
module load python/3.6.5_miniconda-4.5.4 
source activate Misc
#Descargar los datos
fastq-dump --defline-seq '@$sn[_$rn]/$ri' --split-files SRR3458647
#parallel-fastq-dump --defline-seq '@$sn[_$rn]/$ri' --split-files --sra-id SRR345864 --threads $SLURM_NTASKS 
#trimming and quality filtering
trimmomatic PE -phred33 SRR3458647_1.fastq SRR3458647_2.fastq output_forward_paired.fq.gz output_forward_unpaired.fq.gz output_reverse_paired.fq.gz output_reverse_unpaired.fq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36