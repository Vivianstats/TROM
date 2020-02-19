# this python code is to convert Gene Ontology annotation files into the format that the Bioconductor package "topGO" requires
# gene_ID<TAB>GO_ID1, GO_ID2, GO_ID3, ....

import sys

if len(sys.argv) < 3:
	print ("python convert.py input_file output_file")
	sys.exit()
	
f = open(sys.argv[1]) # input file
g = open(sys.argv[2], "w") # output file

# reading in every line in the input file
geneID2GO = {}

line = f.readline()
while line:
	if line[0] != "!":
		items = line.strip().split("\t")
		geneID = items[2]
		GO = items[4]
		if not geneID in geneID2GO.keys():
			geneID2GO[geneID] = [GO]
		else:
			geneID2GO[geneID].append(GO)
	line = f.readline()

# write "geneID2GO" to the output file
for gene in geneID2GO.keys():
	newline = gene + "\t"
	for GO in geneID2GO[gene]:
		newline = newline + GO + ", "
	newline = newline[:-2] + "\n"
	g.write(newline)

f.close()
g.close()
	

	
