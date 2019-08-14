#!/bin/bash


##SBATCH --partition=longjobs
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=
#SBATCH --cpus-per-task=
#SBATCH --time=5-00:00:00
#SBATCH --job-name=RAxML
#SBATCH -o result_%N_%j.out
#SBATCH -e result_%N_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=larteag7@eafit.edu.co


export SBATCH_EXPORT=NONE
# APOLO
#module load raxml/8.2.12_intel-17.0.1
#para apolo -- raxmlHPC-HYBRID-AVX
# CRONOS
#module load raxml/8.2.12_intel-18.02
#para cronos -- raxmlHPC-HYBRID-AVX2
srun --mpi=pmi2 raxmlHPC-HYBRID-AVX2 -T $SLURM_CPUS_PER_TASK -f a -p 12345 -x 12345 -# 10000 -m GTRCAT -n whole-cp -s cp-al.fa
