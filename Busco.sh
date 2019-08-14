#!/bin/bash


#SBATCH --partition=longjobs
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=5-00:00:00
#SBATCH --job-name=Busco
#SBATCH -o result_%N_%j.out
#SBATCH -e result_%N_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=larteag7@eafit.edu.co


export SBATCH_EXPORT=NONE
module load python/3.6.5_miniconda-4.5.4
source activate Misc
run_BUSCO.py -i Drechmeria-coniospora.fa  -o Drechmeria-coniospora -l sordariomyceta_odb9/ -m prot -c 16
run_BUSCO.py -i Hirsutella-minnesotensis.fa  -o Hirsutella-minnesotensis -l sordariomyceta_odb9/ -m prot -c 16
run_BUSCO.py -i Ophiocordyceps-australis.fa -o Ophiocordyceps-australis -l sordariomyceta_odb9/ -m prot -c 16
run_BUSCO.py -i Ophiocordyceps-camponoti-rufipedis.fa -o Ophiocordyceps-camponoti-rufipedis -l sordariomyceta_odb9/ -m prot -c 16
run_BUSCO.py -i Ophiocordyceps-polyrhachis-furcata.fa -o Ophiocordyceps-polyrhachis-furcata -l sordariomyceta_odb9/ -m prot -c 16
run_BUSCO.py -i Ophiocordyceps-unilateralis.fa -o Ophiocordyceps-unilateralis -l sordariomyceta_odb9/ -m prot -c 16
run_BUSCO.py -i Tolypocladium-capitatum.fa -o Tolypocladium-capitatum -l sordariomyceta_odb9/ -m prot -c 16
run_BUSCO.py -i Tolypocladium-ophioglossoides.fa -o Tolypocladium-ophioglossoides -l sordariomyceta_odb9/ -m prot -c 16
run_BUSCO.py -i Tolypocladium-paradoxum.fa -o Tolypocladium-paradoxum -l sordariomyceta_odb9/ -m prot -c 16