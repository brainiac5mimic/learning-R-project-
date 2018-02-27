library("ShortRead")

sampler <- FastqSampler("SP1.fq")
fq <- yield(sampler)
head(sread(fq), 5)
# Quality reads
encoding(quality(fq))
head(quality(fq), 5)

fls <- "SP1.fq"
qaSummary <- qa(fls, type="fastq")

#browseURL(report(qaSummary))

qaSummary
head(qaSummary[["readCounts"]])
head(qaSummary[["baseCalls"]])


#filtering
	
 

 		## trim and filter, e.g., reads cannot contain 'N'...
 		fq <- fq[nFilter()(fq)] # see ?srFilter for pre-defined filters

		## trim as soon as 2 of 5 nucleotides has quality encoding less
		## than "4" (phred score 20)
 		fq <- trimTailw(fq, 2, "4", 2)

 		## drop reads that are less than 36nt
 		fq <- fq[width(fq) >= 10]

 		## append to destination
		file <- "C:/Users/Mark Holton/Documents/R/new.fq"
 		writeFastq(fq,file,compress=FALSE)
 	


 fq

strm <- FastqStreamer("SP1.fq")

##loop that goes through part of the data at a time.

repeat {
 fq2 <- yield(strm)
 if (length(fq2) == 0)
 break
 ## process chunk
 

 		## trim and filter, e.g., reads cannot contain 'N'...
 		fq2 <- fq2[nFilter()(fq2)] # see ?srFilter for pre-defined filters

		## trim as soon as 2 of 5 nucleotides has quality encoding less
		## than "4" (phred score 20)
 		fq2 <- trimTailw(fq2, 2, "4", 2)

 		## drop reads that are less than 36nt
 		fq2 <- fq2[width(fq2) >= 10]

 		## append to destination
		file <- "C:/Users/Mark Holton/Documents/R/new2.fq"
 		writeFastq(fq2,file,compress=FALSE)

}
fq2