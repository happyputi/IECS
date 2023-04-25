necessaryconditions <-
function(inclthreshold,covthreshold,samples){  # argument "samples" is the data of samples
necessarycondition<- superSubset(samples, outcome = colnames(samples)[[length(samples)]], incl.cut = inclthreshold, cov.cut = covthreshold,depth=1)
sicken<-samples[[length(samples)]]  # select the result list
pvalue<-list()  # define the pvalue list
for (i in 1:length(necessarycondition[[1]][[1]])){
x<-necessarycondition[[2]][[i]]
#p<-chisq.test(x,sicken)[[3]]
chisqtest<-try(chisq.test(x,sicken)) # Pearson's Chi-squared test with samplesates' continuitsamples correction
if("try-error" %in% class(chisqtest)){p<-"NA"
}else{
exp<-chisqtest$expected
if((exp[[1]]>=5)&&(exp[[2]]>=5)&&(exp[[3]]>=5)&&(exp[[4]]>=5)){
x<-chisq.test(x,sicken,correct=FALSE)
p<-(x[[3]])
}else{
y<-chisq.test(x,sicken,correct=TRUE)
p<-(y[[3]])
}
}
pvalue<-c(pvalue,p)  # calculate the pvalue
}
result<-necessarycondition[[1]]  # define the result
result[["pvalue"]]<-pvalue  # add a column
return(result)
}
