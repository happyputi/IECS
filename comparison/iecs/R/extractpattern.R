extractpattern <-
function(qcaresult,samples){  # argument "qcaresult" is the result of qca calculation;argument "samples" is the data of samples
splitsamples<-llply(transpose(samples), do.call, what = rbind)  # split the matrix into samples
variable<-row.names(splitsamples[[1]])  # get the variable names
qcaresultiteration<-qcaresult
coverage<-qcaresultiteration[[3]]  # get the coverage of each solution 
coveragevec<-unlist(coverage)  # transform the coverage list into vector
#for (i in 1:length(coveragevec))
for (i in 1:length(coveragevec)){
highestcoverage<-which.max(coveragevec)  # select the solution with highest coverage
highestsolution<-highestcoverage[[1]]  # get the highest solution
highestsolutionwithrowname<-(row.names(qcaresultiteration))[[highestsolution]]  # get the highest solution with rowname
pattern<-chartr('*',' ',highestsolutionwithrowname)  # delete the asterisk
patternvec<-unlist(strsplit(pattern,split=' '))  # delete the space
getpatternnum<-list()  # define the result 
for (i in 1:length(variable)){
if (variable[[i]] %in% patternvec){
getpatternnum<-c(getpatternnum,i)}  # exract the pattern marked by number
}
if (length(getpatternnum)==0){  # if extract empty solution,set the coverage to 0
coveragevec[[highestsolution]]<-0
}else{
break}
}
return(getpatternnum)
}
