excludesamples <-
function(pattern,samples){  # argument "pattern" is the pathogenic pattern,for example,"[1,3]" denotes the mutation of the first and the third snp;argument "samples" is the data of samples
splitsamples<-llply(transpose(samples), do.call, what = rbind)  # split the matrix into samples
for(i in 1:length(splitsamples)) {if(judgecompatible(pattern,splitsamples[[i]])){splitsamples[[i]]<-'NONE'}}  # check whether a sample is compatible with the pattern
remainingsamples<-list()  #define the result
for (i in 1:length(splitsamples)) {if (length(splitsamples[[i]])!=1){listdata<-list(splitsamples[[i]]);remainingsamples<-c(remainingsamples,listdata)}}  # remain the incompatible samples
file.remove("data.csv")  # remove the data of the prior round 
remainingsamplest<-llply(transpose(remainingsamples), do.call, what = rbind)  # transpose the remaining samples into matrix
write.table(remainingsamplest,file = "data.csv",sep = ",",row.names = FALSE,col.names = FALSE)  # update the data
}
