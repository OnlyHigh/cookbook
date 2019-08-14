library(dada2); packageVersion("dada2")
path <- "/home/larteag7/Banana/May-06/Gissel"
fnFs <- sort(list.files(path, pattern="_FP.fastq", full.names = TRUE))
fnRs <- sort(list.files(path, pattern="_RP.fastq", full.names = TRUE))
sample.names <- sapply(strsplit(basename(fnFs), "_"), `[`, 1)
filtFs <- file.path(path, "filtered", paste0(sample.names, "_F_filt.fastq"))
filtRs <- file.path(path, "filtered", paste0(sample.names, "_R_filt.fastq"))
out <- filterAndTrim(fnFs, filtFs, fnRs, filtRs, truncLen=c(250,200), maxN=0, maxEE=c(2,2), truncQ=2, rm.phix=TRUE, compress=FALSE, multithread=TRUE)
out
errF <- learnErrors(filtFs, multithread=TRUE)
errR <- learnErrors(filtRs, multithread=TRUE)
derepFs <- derepFastq(filtFs, verbose=TRUE)
derepRs <- derepFastq(filtRs, verbose=TRUE)
names(derepFs) <- sample.names
names(derepRs) <- sample.names
dadaFs <- dada(derepFs, err=errF, multithread=TRUE)
dadaRs <- dada(derepRs, err=errR, multithread=TRUE)
mergers <- mergePairs(dadaFs, derepFs, dadaRs, derepRs, verbose=TRUE)
seqtab <- makeSequenceTable(mergers)
saveRDS(seqtab, "/home/larteag7/Banana/May-06/Gissel/seqtab.rds")
