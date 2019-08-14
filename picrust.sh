#!/bin/bash


#SBATCH --partition=longjobs
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=7-00:00:00
#SBATCH --job-name=picrust2
#SBATCH -o result_%N_%j.out
#SBATCH -e result_%N_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=larteag7@eafit.edu.co


export SBATCH_EXPORT=NONE
module load python/3.6.5_miniconda-4.5.4 
source activate picrust2
#/home/larteag7/apps/picrust2-2.1.0-b/scripts/picrust2_pipeline.py -s ps.rar_ASVs.fasta -i ps.rar_ASV_table.txt -o Try1-picrust-rar-may3 --threads 16  
/home/larteag7/apps/picrust2-2.1.0-b/scripts/picrust2_pipeline.py -s ps.norar_ASVs.fasta -i ps.norar_ASV_table.txt -o Try1-picrust-norar-may3 --threads 16