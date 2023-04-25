library(iecs)
source("patternjudgeiecs.R")
iecssamples<-read.csv("./data/IECS.csv")  # choose the data
startiecstime<-Sys.time()  # start timing
iterations<-10
consistencythreshold<-0.5
iecsresult<-iecs(k=iterations,consistencythreshold=consistencythreshold,samples=iecssamples)  # iecs analysis
endiecstime<-Sys.time()  # end timing
analysistime<-endiecstime-startiecstime  # calculate the time
IECStime<-IECStime+analysistime
# change pattern to number function
changetonumber <-function(pattern){
x<-strsplit(pattern," ")
result<-list()
for (i in 1:length(x[[1]])){
y<-as.numeric(x[[1]][[i]])
result<-c(result,y)
}
return(result)
}
#start to judge
mar<-0  # start to judge result
for (i in 1:(length(iecsresult[[1]])-1)){
pattern<-iecsresult[[1]][[i]]   
patterntonum<-changetonumber(pattern) 
write.table(patterntonum,"./result/iecsresult.txt",append=T,col.names=F,row.names=F,eol="\t")
ch<-as.numeric(iecsresult[[2]][[i]])  # get the P-value
write.table(ch,"./result/iecsresult.txt",append=T,col.names=F,row.names=F,eol="\n")
paj<-patternjudgeiecs(patterntonum)  # judge the pattern
pvj<-pvaluejudge(ch)  # judge P-value,less than 0.05
if (paj&pvj){
mar<-mar+1  # get the number of right solutions
} else{
NULL}
}
if(mar){
belon<-("R")  # put the mark of solution
IECSR<-IECSR+1
} else{
belon<-("W")
}  # end to judge solution
write.table(iecsresult[[1]][[length(iecsresult[[1]])]],"./result/iecsresult.txt",append=T,col.names=F,row.names=F,eol="\t")
write.table(iecsresult[[2]][[length(iecsresult[[2]])]],"./result/iecsresult.txt",append=T,col.names=F,row.names=F,eol="\t")
write.table(belon,"./result/iecsresult.txt",append=T,col.names=F,row.names=F,eol="\n")