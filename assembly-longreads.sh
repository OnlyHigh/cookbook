#!/bin/bash


#SBATCH --partition=longjobs
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=5-00:00:00
#SBATCH --job-name=unicycler
#SBATCH -o result_%N_%j.out
#SBATCH -e result_%N_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=larteag7@eafit.edu.co


export SBATCH_EXPORT=NONE
module load python/3.6.5_miniconda-4.5.4
#python/2.7.15_miniconda-4.5.4 #APOLO
source activate Misc
#Hybrid unicycler
#unicycler -1 mapped-forward.fq -2 mapped-reverse.fq -l mapped-ont.fq --threads 16 -o Try2-unicycler-hybrid
#Minimap assembly
minimap2 -x ava-ont -t 16 mapped-ont.fq mapped-ont.fq | gzip -1 > overlaps.paf.gz
miniasm -f mapped-ont.fq overlaps.paf.gz > sacha.gfa
awk '/^S/{print ">"$2"\n"$3}' reads.gfa | fold > sacha-cp-minimap2.fa
#wtdbg2 assembly
#wtdbg2 -x ont -g 500m -i ONT.fq -t16 -fo Sacha
#wtpoa-cns -t16 -i Sacha.ctg.lay.gz -fo Sacha.ctg.fa