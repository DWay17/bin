#!/usr/bin/Rscript
# shuffle.r
files <- list.files(path=".", pattern="*.csv", full.names=T, recursive=FALSE)
lapply(files, function(file) {
    if (!grepl(".cfg.", file)) {
		M <- read.table(file, sep="\t", header=T) # load file
		M[] <- lapply(M, sample)
		write.table(M, gsub(".csv_", "_", paste(file, "_shuffled.csv", sep="")), sep="\t", quote=F, row.names=F, col.names=T)
    }
})
