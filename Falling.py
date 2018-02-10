import Bio
from Bio import SeqIO
from Bio.Blast import NCBIXML
import sys

#Returns best hits from a BLAST xml, and give the location of the read in FAST5 raw data

xml_filename = sys.argv[1]
blast = NCBIXML.parse(open(xml_filename,'rU'))
read_ids = set([])
for record in blast:
	for blast_record in blast:
		for alignment in blast_record.alignments:
			read_name = alignment.title	
    			read_ids.add(read_name)
#print(read_ids, len(read_ids))
for read in read_ids:
	read_loc = read.split()[-1]
	print read_loc
