# Complementary DNA 

complement_base <- function(base) {
  basepair = c("A", "T", "C", "G")
  
  if (base %in% basepair) {
    if (base == "A") return("T")
    if (base == "T") return("A")
    if (base == "G") return("C")
    if (base == "C") return("G")
  }
  
  return("N")
}

DNAseq <- function(x) {
  abc <- unlist(strsplit(toupper(x), NULL))
  
  complemented_seq <- sapply(abc, complement_base)
  
  return(paste(complemented_seq, collapse = ""))
}

# examples 

DNAseq("TCTCGGGCCTTGCTGGGCTTGGTTTCC")
DNAseq("TCTCGGGCCTT")

# create_DNA_&_complementary_DNA_table

create_DNA_table <- function(original_sequences) {
  complement_base <- function(base) {
    basepair = c("A", "T", "C", "G")
    
    if (base %in% basepair) {
      if (base == "A") return("T")
      if (base == "T") return("A")
      if (base == "G") return("C")
      if (base == "C") return("G")
    }
    
    return("N")
  }
  
  original_sequences <- toupper(original_sequences)
  result_list <- lapply(original_sequences, function(seq) {
    abc <- unlist(strsplit(seq, NULL))
    complemented_seq <- sapply(abc, complement_base)
    
    return(data.frame(Original_Sequence = seq,
                      Complemented_Sequence = paste(complemented_seq, collapse = "")))
  })
  
  result_df <- do.call(rbind, result_list)
  
  return(result_df)
}

# Example usage with multiple sequences:
original_sequences <- c("ATGCATGC", "CGTAGCTA", "ATCGATCG")
result_table <- create_DNA_table(original_sequences)
print(result_table)

