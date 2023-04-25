setwd("./comparison")
library(lattice)
#iecs analysis
library(iecs)
iecssamples<-read.csv(file.choose())  # choose the data
startiecstime<-Sys.time()  # start timing
necessaryconditions(0.9,0.5,samples=iecssamples)  # necessaryconditionsanalysis
iecs(k=5,consistencythreshold=0.8,samples=iecssamples)  # iecs analysis
endiecstime<-Sys.time()  # end timing
analysistime<-endiecstime-startiecstime  # calculate the time
extractanalysistime<-format(analysistime,format="%M")  # extract time
print(paste("The total time of iecs analysis is:",extractanalysistime))  # print the analysis time

#MDR analysis
library(MDR)
samplesresult<-list()  # define an empty list
samplesresult<-c(samplesresult,iecssamples[[length(iecssamples)]])  # extract the result column
samplesresultvec<-unlist(samplesresult)  # change to vector
MDRsamples<-list()  # define an empty list
MDRsamples[[1]]=samplesresultvec  # put the result to the first column
for (i in 1:(length(iecssamples)-1)){  # put the other columns
condition<-list()
condition<-c(condition,iecssamples[[i]])
condition<-unlist(condition)
MDRsamples[[i+1]]=condition
}
write.table(MDRsamples,file = "MDR.csv",sep = ",",row.names = FALSE,col.names=FALSE)
MDRsamples<-read.csv("MDR.csv",header=FALSE)
startMDRtime<-Sys.time()  # start timing
fit<-mdr.cv(data=MDRsamples,K=2,cv=10,ratio=1,equal="HR",genotype=c(0,1))
accuracy<-fit$'final model accuracy'
loc<-fit$'final model'
perm<-permute.mdr(accuracy,loci=loc,N.permute=100,method="CV",data=MDRsamples,cv=10,K=2,equal="HR",genotype=c(0,1),LRT=FALSE) #"K=2" represents the maximum allowed interaction of two SNPs
print(loc)  
print(perm[[1]])
endMDRtime<-Sys.time()  # end timing
analysistime<-endMDRtime-startMDRtime  # calculate the time
extractanalysistime<-format(analysistime,format="%M")  # extract time
print(paste("The total time of MDR analysis is:",extractanalysistime))  # display the analysis time

#BOOST analysis
library(plyr)
library(purrr)
samplesresult<-list()  # define an empty list
samplesresult<-c(samplesresult,iecssamples[[length(iecssamples)]])  # extract the result column
samplesresultvec<-unlist(samplesresult)  # change to vector
BOOSTsamples<-list()  # define an empty list
BOOSTsamples[[1]]=samplesresultvec  # put the result to the first column
for (i in 1:(length(iecssamples)-1)){  # put the other columns
condition<-list()
condition<-c(condition,iecssamples[[i]])
condition<-unlist(condition)
BOOSTsamples[[i+1]]=condition
}
write.table(BOOSTsamples,file = "./data/BOOST.txt",sep = " ",row.names = FALSE,col.names=FALSE)
BOOSTsamples<-read.csv("./data/BOOST.txt",header=FALSE)
startBOOSTtime<-Sys.time()  # start timing
system2("CBOOST.exe",wait=T,stdout=F) # move CBOOST.exe and filenamelist.txt to current path firstly,then execute this command。
result<-try(boostcalculation<-read.table("InteractionRecords.txt",header = FALSE)) # read the result of BOOST
if("try-error" %in% class(result)){
write.table('NA','BOOSTresult.txt',append=T,col.names=F,row.names=F,eol='\t')
endBOOSTtime<-Sys.time()  # end timing
analysistime<-endBOOSTtime-startBOOSTtime
write.table(analysistime,'BOOSTresult.txt',append=T,col.names=F,row.names=F,eol='\t')
print('NA')  # display the time of analysis
print(paste("The total time of BOOST analysis is:",analysistime))  # display the time of analysis
} else{
pairwithmaxinteraction<-which.max(boostcalculation[[6]]) # the sixth column is the InteractionBOOST,select the max InteractionBOOST
boosttranspose<-llply(transpose(boostcalculation), do.call, what = rbind) # transpose 
maxcombination<-boosttranspose[[pairwithmaxinteraction]]  # get the maxcombination
maxcombinationlist<-list()  # define the maxcombinationlist
remaxcombinationlist<-list()  # define the regular maxcombinationlist
maxcombinationlist<-c(maxcombinationlist,maxcombination[[2]]) 
maxcombinationlist<-c(maxcombinationlist,maxcombination[[3]])  # append the combination
remaxcombinationlist[[1]]<-maxcombinationlist[[1]]+1  # add 1 to the corresponding serial number, which is consistent with MDR and IECS 
remaxcombinationlist[[2]]<-maxcombinationlist[[2]]+1  # complete the remaxcombinationlist
ch<-chisquare(remaxcombinationlist,iecssamples)  # chi-square test，remaxcombinationlist is the pattern，iecssamples is the source dataset
boostresult<-c(remaxcombinationlist,ch) # join the combination, p-value together
print(boostresult) # display result
endBOOSTtime<-Sys.time()  # end timing
analysistime<-endBOOSTtime-startBOOSTtime  # calculate the time
extractanalysistime<-format(analysistime,format="%M")  # extract time
print(paste("The total time of BOOST analysis is:",extractanalysistime))  # display the time of analysis 
} 
file.remove("data.csv","BOOSTresult.txt","MDR.csv","InteractionRecords.txt","MarginalAssoc.txt","./data/BOOST.txt")  # remove the file

