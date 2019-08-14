#bax2bam ./m171222_102849_42244_c101415012550000001823309602281860_s1_p0.{1,2,3}.bax.h5
#blasr --bam --out baxxxxreads.bam --nproc $SLURM_NTASKS ./baxxxreads.bam ./ref.fasta                                                                                                                         
#samtools sort -o baxxreads.bam -@ $SLURM_NTASKS baxxxreads.bam                                                                                                                                               
#samtools index -@ $SLURM_NTASKS baxxreads.bam                                                                                                                                                                
#pbindex baxxreads.bam                                                                                                                                                                                        
#ipdSummary baxxx.blasr.bam --reference ref.fasta --identify m6A,m4C,m5C_TET --numWorkers $SLURM_NTASKS --gff basemod_015.gff 
