bringnoise<-function(idealdata,incompatibledata,numberofreplace,add=FALSE,bias=NULL){
if(add){
x<-idealdata
y<-some(incompatibledata,numberofreplace,replace=TRUE,prob=bias)  # extract the data from incompatible data
noisedata<-rbind(x,y)
}else{
x<-idealdata[sample(nrow(idealdata),nrow(idealdata)-numberofreplace,replace=F),]  # extract the data from ideal data  
y<-some(incompatibledata,numberofreplace,replace=TRUE,prob=bias)
noisedata<-rbind(x,y)
}
return(noisedata)
}
getcomp<-cna:::getComplexity
