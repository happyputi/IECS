chisquare <-
function(pattern,samples){  # argument "pattern" is the pathogenic pattern,for example,"[2,3]" denotes the mutation of the sceond and the third snp;argument "samples" is the data of samples 
options(warn=-1)  # turn off warning information
patternresult<-list()  # define the pattern result
splitsamples<-llply(transpose(samples), do.call, what = rbind)  # split the matrix into individual samples 
for(i in 1:length(splitsamples)) {if(judgecompatible(pattern,splitsamples[[i]])){patternresult<-c(patternresult,1)}  
else{patternresult<-c(patternresult,0)}}  # check whether the sample is compatible with the pattern
patternresultvec<-unlist(patternresult)  # transform pattern result to vector
sickenresult<-samples[[length(samples)]]  # define the sicken result
chisqtest<-try(chisq.test(patternresultvec,sickenresult)) # Pearson's Chi-squared test with samplesates' continuitsamples correction
if("try-error" %in% class(chisqtest)){return("NA")
}else{
exp<-chisqtest$expected
if((exp[[1]]>=5)&&(exp[[2]]>=5)&&(exp[[3]]>=5)&&(exp[[4]]>=5)){
x<-chisq.test(patternresultvec,sickenresult,correct=FALSE)
return(x[[3]])
}else{
y<-chisq.test(patternresultvec,sickenresult,correct=TRUE)
return(y[[3]])
}
}
}
