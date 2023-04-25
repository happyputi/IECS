start<-Sys.time()  # start to time
source("patternjudge.R")
source("pvaluejudge.R")
library(lattice)
library(MDR)
addata<-read.csv("./data/MDR.csv",header=FALSE)
fit<-mdr.cv(data=addata,K=2,cv=10,ratio=1,equal="HR",genotype=c(0,1))
loc<-fit$"top models"[[2]]  # select the top interaction of two SNPs
accuracy<-fit$"top model accuracies"[[4]]  # get its accuracy
perm<-permute.mdr(accuracy,loci=loc,N.permute=100,method="CV",data=addata,cv=10,K=2,equal="HR",genotype=c(0,1),LRT=FALSE)  # permutation test
loc2<-list()  # initialize loc2
for (i in 1:length(loc)){loc2<-c(loc2,loc[[i]])} # change loc to list mode
paj<-patternjudge(loc2)  # judge whether loc2 is in the pathogenic model
pvj<-pvaluejudge(perm$"Permutation P-value")  # judge P-value,significant if less than 0.05 
if (paj&pvj){
belon<-("R")  # if pattern is in the pathogenic model and P-value is less than 0.05,mark "R"
MDRR<-MDRR+1  # count the right items
} else{
belon<-("W")  # esle,mark "W"
}
loc<-c(loc,perm$"Permutation P-value")  # get the P-value
loc1<-list()
for (i in 1:length(loc)){loc1<-c(loc1,loc[[i]])}
write.table( loc1,"./result/MDRBOOSTresult.txt",append=T,col.names=F,row.names=F,eol="\t")
end<-Sys.time()  # end to time
runningtime<-end-start  # calculate the runtime
write.table(runningtime,"./result/MDRBOOSTresult.txt",append=T,col.names=F,row.names=F,eol="\t")
write.table(belon,"./result/MDRBOOSTresult.txt",append=T,col.names=F,row.names=F,eol="\n")
MDRtime<-MDRtime+runningtime  # calculate the total time