from Bio import SeqIO 
import sys 

#Given a fasta, separates the proteins from the peptides (50 aa), and writes into new files

long_proteins = []
short_proteins = []
fasta_file = sys.argv[1]
fasta_name = fasta_file.split(".")[0]

for record in SeqIO.parse(fasta_file, "fasta"):
	if len(record.seq) < 50 : 	
		short_proteins.append(record)
	else:
		long_proteins.append(record)

SeqIO.write(short_proteins, 'short_seqs'+ "_" + fasta_name + '.fasta', "fasta")
SeqIO.write(long_proteins, 'long_seqs' + "_" + fasta_name + '.fasta', "fasta")


	
