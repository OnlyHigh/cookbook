~/mummer-4.0.0beta2/nucmer --mum -t 6 -p plfjvsudea Purp-polished-abyss.fasta PLBJ-1.fna  
~/mummer-4.0.0beta2/nucmer --mum -t 6 -p plfjvsudea Purp-polished-abyss.fasta PLFJ-1.fna  
~/mummer-4.0.0beta2/nucmer --mum -t 6 -p plfjvsudea Purp-polished-abyss.fasta S20  
~/mummer-4.0.0beta2/nucmer --mum -t 6 -p s20vsudea Purp-polished-abyss.fasta S2003R1.fna  
~/mummer-4.0.0beta2/nucmer --mum -t 6 -p s201vsudea Purp-polished-abyss.fasta S201800.fna  
~/mummer-4.0.0beta2/nucmer --mum -t 6 -p tericvsudea Purp-polished-abyss.fasta TERICBC1_251.fasta  
~/mummer-4.0.0beta2/nucmer --mum -t 6 -p 361vsudea Purp-polished-abyss.fasta 361.fa 

~/mummer-4.0.0beta2/mummerplot --filter -p 361vsudea --layout -t 6 --png 361vsudea.delta
~/mummer-4.0.0beta2/mummerplot --filter -p plbjvsudea --layout -t 6 --png plbjvsudea.delta
~/mummer-4.0.0beta2/mummerplot --filter -p plfjvsudea --layout -t 6 --png plfjvsudea.delta
~/mummer-4.0.0beta2/mummerplot --filter -p s200vsudea --layout -t 6 --png s200vsudea.delta
~/mummer-4.0.0beta2/mummerplot --filter -p s201vsudea --layout -t 6 --png s201vsudea.delta
~/mummer-4.0.0beta2/mummerplot --filter -p tericvsudea --layout -t 6 --png tericvsudea.delta
