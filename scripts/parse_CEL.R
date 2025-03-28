source("http://bioconductor.org/biocLite.R")
biocLite()
 
biocLite("GEOquery")
biocLite("affy")
biocLite("gcrma")
biocLite("hugene10stv1cdf")
biocLite("hugene10stv1probe")
biocLite("hugene10stprobeset.db")
biocLite("hugene10sttranscriptcluster.db")
 
library(GEOquery)
library(affy)
library(gcrma)
library(hugene10stv1cdf)
library(hugene10stv1probe)
library(hugene10stprobeset.db)
library(hugene10sttranscriptcluster.db)
 
#Set working directory for download
setwd("E:/College/R") 
 
getGEOSuppFiles("GSE2443") 
 
setwd("E:/College/R/GSE2443")
untar("GSE2443_RAW.tar", exdir="data")
cels = list.files("data/", pattern = "CEL")
sapply(paste("data", cels, sep="/"), gunzip)
cels = list.files("data/", pattern = "CEL") 
 
setwd("E:/College/R/GSE2443/data")
raw.data=ReadAffy(verbose=TRUE, filenames=cels, cdfname="hugene10stv1") #From bioconductor

#perform RMA normalization (I would normally use GCRMA but it did not work with this chip)
data.rma.norm=rma(raw.data)

#Get the important stuff out of the data - the expression estimates for each array
rma=exprs(data.rma.norm)

#Format values to 5 decimal places
rma=format(rma, digits=5)

#Map probe sets to gene symbols or other annotations
#To see all available mappings for this platform
ls("package:hugene10stprobeset.db") #Annotations at the exon probeset level
ls("package:hugene10sttranscriptcluster.db") #Annotations at the transcript-cluster level (more gene-centric view)

#Extract probe ids, entrez symbols, and entrez ids
probes=row.names(rma)
Symbols = unlist(mget(probes, hugene10sttranscriptclusterSYMBOL, ifnotfound=NA))
Entrez_IDs = unlist(mget(probes, hugene10sttranscriptclusterENTREZID, ifnotfound=NA))

#Combine gene annotations with raw data
rma=cbind(probes,Symbols,Entrez_IDs,rma)

#Write RMA-normalized, mapped data to file
write.table(rma, file = "rma.txt", quote = FALSE, sep = "\t", row.names = FALSE, col.names = TRUE)


 
