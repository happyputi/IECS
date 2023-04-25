iecs <-
function(k,consistencythreshold,samples){  # argument "k" is the iterations;argument "samples" is the data of samples
start<-Sys.time()  # start to time
iecssolution<-list()  # define the result
write.table(samples,file = "data.csv",sep = ",",row.names = FALSE,col.names = FALSE)
write.table(samples,file = "sourcedata.csv",sep = ",",row.names = FALSE,col.names = FALSE)
write.table("pattern",'result.txt',append=T,col.names=F,row.names=F,eol='\t')
write.table("p-value",'result.txt',append=T,col.names=F,row.names=F,eol='\n')
for (i in (1:k)){
fit<-try(snp<-read.csv("data.csv",header = FALSE))  # read data
if("try-error" %in% class(fit)){
break}else{
qcaresultlist<-qcacalculation(consistencythreshold=consistencythreshold,snp)  # qca calculation for the data
if (length(qcaresultlist)==1){break}  # no solution of qca
else{if (length(qcaresultlist)==7){solutionlist<-qcaresultlist[[1]][[1]]}  # some prime implicants are tied 
else {solutionlist<-qcaresultlist[[1]]}}  # no prime implicants are tied
pattern<-extractpattern(solutionlist,snp)  # extract pattern from the solution 
if (length(pattern)!=0){
iecssolution<-c(iecssolution,list(pattern))  # combine the iecs solution
excludesamples(pattern,snp) # exclude samples which is compatible with the pattern
}
else {break}
}
}  # end generating the iecs solution
snps<-read.csv("sourcedata.csv",header = FALSE)  # chisquare test in the source data
if ((length(iecssolution))!=0){
for (i in 1:length(iecssolution)){
pvalue<-chisquare(iecssolution[[i]],snps)  # Pearson's Chi-squared test with Yates' continuity correction
write.table((iecssolution[[i]]),'result.txt',append=T,col.names=F,row.names=F,eol='\t')
write.table((pvalue),'result.txt',append=T,col.names=F,row.names=F,eol='\n')
}
}else
{
NULL
}
end<-Sys.time()  # end to time
runtime<-end-start  #calculate the runtime
extracttime<-format(runtime,format="%M")  # extract time
write.table("runtime",'result.txt',append=T,col.names=F,row.names=F,eol='\t')
write.table(extracttime,'result.txt',append=T,col.names=F,row.names=F,eol='\n')
finaliecsresult<-read.csv("result.txt",sep='\t')
file.remove("data.csv")  # remove the file
file.remove("sourcedata.csv")  # remove the file
file.remove("result.txt")  # remove the file
return(finaliecsresult)
}
