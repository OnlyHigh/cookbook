from Bio import SeqIO
import sys 
# Returns the total length of the contigs assembled by Canu and the expected coverage for a 4m genome

fasta_filename = sys.argv[1]

read_lens = []
for seq_record in SeqIO.parse(fasta_filename, "fasta"):
	seqDescription = seq_record.description
	#print(seqDescription)
	length = seqDescription.split(" ")[1]
	read_lens.append(length)
#print(read_lens)
raw_number = [] 
for i in read_lens:
	number = i.split("=")[-1]
	raw_number.append(number)

int_number = []
for i in raw_number:
	int_number.append(int(i))

totalcontiglen = sum(int_number)
print(totalcontiglen)

def porcentaje(x, z):
	coverage = (x*100)/z
	return coverage

print(porcentaje(totalcontiglen, 4000000))
