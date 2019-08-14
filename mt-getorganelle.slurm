#!/bin/bash
#SBATCH --partition=longjobs
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=5-0:00:00
#SBATCH --job-name=frl2015-GO
#SBATCH --cpus-per-task=16
#SBATCH -o result_%N_%j.out      # File to which STDOUT will be written
#SBATCH -e result_%N_%j.err      # File to which STDERR will be written
#SBATCH --mail-type=ALL
#SBATCH --mail-user=larteag7@eafit.edu.co

#export SBATCH_EXPORT=NONE
#export OMP_NUM_THREADS=1

# activate environment
## Para apolo:
#module load python/3.5.2_intel-2017_update-1

## Para cronos:
module load python/3.6.5_miniconda-4.5.4
source activate Misc 

python /home/larteag7/apps/GetOrganelle/get_organelle_from_reads.py -1 sym-forward.fq -2 sym-reverse.fq -u sym-single.fq -s animal_mt_seed.fasta -R 15 -k 21,45,65,85,105 -F animal_mt -o frl2015-GetOrganelle