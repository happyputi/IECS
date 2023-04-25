judgecompatible <-
function(pattern,sample){  # argument "pattern" is the pathogenic pattern,for example,"[2,3]" denotes that the mutation of the sceond and third snp;argument "sample" is the data of one sample
result<-(1==1) # define the initial result
for (i in 1:length(pattern)){
intermediateresult<-(sample[[pattern[[i]]]]==1) # calcuate the intermediate result
result<-(result&&intermediateresult)} # calcuate the final result
return(result)
}
