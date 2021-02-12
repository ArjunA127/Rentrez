# Biol 343 Wk5 assignment part I - Download
# Arjun Augustine
# 2/12/2021

# This script downloads 3 different sequences of the 16S gene of Borrelia burgdorferi, a bacteria that causes Lyme Disease, from NCBI.
# The sequences are cleaned up so just the base pairs are left with no new-line characters and are outputted as a dataframe with the sequence name and the sequence itself as separate columns.

# Link to github repository including all files required for this code to run:
# https://github.com/ArjunA127/Rentrez

# Load the rentrez package
library(rentrez)

# Create vector of sequence ascension numbers to fetch from GenBank
ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1")

# Obtain fasta files for the ascension numbers specified above from NCBI's nucleotide database
Bburg <- entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")

# Take a look at Bburg object
print(Bburg)

# Create a new object called Sequences that contains 3 elements: one for each sequence
sequences <- strsplit(Bburg, split = "\n\n")
print(sequences)


### Change sequences object from a list to data frame:

sequences <- unlist(sequences)

# Use regular expressions to separate the sequences from the headers
header <- gsub("(^>.*sequence)\\n[ATCG].*", "\\1", sequences)
seq <- gsub("^>.*sequence\\n([ATCG].*)", "\\1", sequences)
sequences <- data.frame(Name = header, Sequence = seq)

# Remove the newline characters from the sequences data frame using regular expressions
sequences$Sequence <- gsub("\\n", "", sequences$Sequence)

# Output this data frame to a file called Sequences.csv.
write.csv(sequences, "Sequences.csv")