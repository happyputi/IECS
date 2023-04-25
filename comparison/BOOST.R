library(purrr)
library(plyr)
start<-Sys.time()  # start to time
system("CBOOST.exe",show.output.on.console=F,wait=T)  # call BOOST method
fit<-try((boostre<-read.table("InteractionRecords.txt",header = FALSE)),TRUE) # read the data,keep silent
if("try-error" %in% class(fit)){
write.table("NA","./result/MDRBOOSTresult.txt",append=T,col.names=F,row.names=F,eol="\t")
end<-Sys.time()  # end to time
runningtime<-end-start  # calculate the runtime
write.table(runningtime,"./result/MDRBOOSTresult.txt",append=T,col.names=F,row.names=F,eol="\t") 
write.table("W","./result/MDRBOOSTresult.txt",append=T,col.names=F,row.names=F,eol="\n")
} else{
xx<-which.max(boostre[[6]])  # select the item with max InteractionBOOST value
repo<-llply(transpose(boostre), do.call, what = rbind)
yy<-repo[[xx]]  # get the combination
re<-list()
re1<-list()
re<-c(re,yy[[2]])
re<-c(re,yy[[3]])
re1[[1]]<-re[[1]]+1  # add the number to keep consistent with BOOST and IEV
re1[[2]]<-re[[2]]+1
paj<-patternjudge(re1)  # judge whether the pattern is right
snp2<-read.csv("data/IECSS.txt",header = FALSE)  # get the source data
chtest<-try((ch<-chisquare(re1,snp2)),TRUE)  # get the P-value of Chi-square test
if("try-error" %in% class(chtest)){
ch<-1  # set a 1 to P-value
}
pvj<-pvaluejudge(ch)  # judge the P-value of Chi-square test
if (paj&pvj){
belon<-("R")  # if pattern is in the pathogenic model and P-value is less than 0.05,mark "R"
BOOSTR<-BOOSTR+1  # count the right items
} else{
belon<-("W")  # esle,mark "W"
}
boostresult<-c(re1,ch)
write.table(boostresult,"./result/MDRBOOSTresult.txt",append=T,col.names=F,row.names=F,eol="\t")
end<-Sys.time()  # end to time
runningtime<-end-start  # calculate the time
write.table(runningtime,"./result/MDRBOOSTresult.txt",append=T,col.names=F,row.names=F,eol="\t")
write.table(belon,"./result/MDRBOOSTresult.txt",append=T,col.names=F,row.names=F,eol="\n")
} 
BOOSTtime<-BOOSTtime+runningtime  # calculate the total time
