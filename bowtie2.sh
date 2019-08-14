#!/bin/bash
#SBATCH --partition=longjobs
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=5-0:00:00
#SBATCH --job-name=bow2
#SBATCH --cpus-per-task=16
#SBATCH -o result_%N_%j.out      # File to which STDOUT will be written
#SBATCH -e result_%N_%j.err      # File to which STDERR will be written
#SBATCH --mail-type=ALL
#SBATCH --mail-user=larteag7@eafit.edu.co

#export SBATCH_EXPORT=NONE
#export OMP_NUM_THREADS=1

# activate environment
## Para apolo:
#module load

## Para cronos:
module load bowtie2/2.3.4.1_intel-18.0.2
bowtie2 -x mt-frl -q --no-unal --end-to-end --very-sensitive -p 16 -U sym-single.fq -1 sym-forward.fq -2 sym-reverse.fq -S mt-frl-vs-ntall.sam
bowtie2 -x mt-frl -q --no-unal --very-sensitive-local -p 16 -U sym-single.fq -1 sym-forward.fq -2 sym-reverse.fq -S mt-frl-vsl-ntall.sam
bowtie2 -x mt-frl -q --end-to-end --very-sensitive -p 16 -U sym-single.fq -1 sym-forward.fq -2 sym-reverse.fq -S mt-frl-vs-all.sam
bowtie2 -x mt-frl -q --very-sensitive-local -p 16 -U sym-single.fq -1 sym-forward.fq -2 sym-reverse.fq -S mt-frl-vsl-all.sam