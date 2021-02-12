# Biol 343 Wk5 assignment part II
# Arjun Augustine
# 2/12/2021

# Link to github repository including all files required for this code to run:
# https://github.com/ArjunA127/Rentrez

# Load packages
library(rentrez)
library(Biostrings)

# Download the SARS-CoV-2 reference genome from Genbank. Use the accession NC_045512.2
cov <- entrez_fetch(db = "nuccore", id = "NC_045512.2", rettype = "fasta")

# Separate the sequence from the header
covSeq <- gsub("^>.*genome\\n([ATCG]*)\\n*", "\\1", cov)
# remove new line characters
covSeq <- gsub("\\n", "", covSeq)

# Use regular expressions in R to isolate the S protein from the genome you downloaded
# Note: The S protein starts at bp position 21,563 and ends at position 25,384

# Note: - covSeq is initially 29903 bp
#       - length of S protein sequence is 25385 - 21563 = 3822 bp

# Select a 3822 bp sequence starting at bp position 21,563 to get the S protein sequence
Sprot <- as.character(DNAString(covSeq, start = 21563, nchar = 3822))
print(Sprot)

# I copied the sequence from Sprot and pasted it into BLAST and ran it on default parameters.
# I think the S protein gene is highly conserved in in SARS-CoV-2 because all BLAST hits had high scores and E values of 0, percentage identity of or close to 100%, and with no or almost no gaps, which all indicate that the sequences are nearly identical.
# The hits from BLAST are from SARS-CoV-2 samples from many different regions, and the fact that the sequence for the S protein is so similar between all these samples indicates that it is highly conserved.