setwd("./comparison")
#library(admisc)
#library(purrr)
#library(plyr)
#library(lattice)
#library(MDR)
#library(iecs)
#source("chisquare.R")
#source("pvaluejudge.R")
#source("patternjudge.R")
#source("patternjudgeiecs.R")
see<<-3 # initial seed 
MDRtime<<-0
BOOSTtime<<-0
IECStime<<-0
MDRR<<-0  # initialize the number of right result of MDR
BOOSTR<<-0  # initialize the number of right result of BOOST
IECSR<<-0  # initialize the number of right result of IECS
source("generatedata.R")  
for (i in 1:1000){
see<-see+50  # add the number of seed
generatedata(datafull="A*B*C*D*E*S",noise=0.3,seed=see,casenumber=200)  # generate the dataset according to the arguments
source("MDR.R")  # MDR analysis
source("BOOST.R")  # BOOST analysis
source("IECSP.R")   # IECS analysis
}
write.table(MDRtime/1000,"./result/compareresult200samples.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of MDR
write.table(MDRR/1000,"./result/compareresult200samples.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of MDR
write.table(BOOSTtime/1000,"./result/compareresult200samples.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of BOOST
write.table(BOOSTR/1000,"./result/compareresult200samples.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of BOOST
write.table(IECStime/1000,"./result/compareresult200samples.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of iecs
write.table(IECSR/1000,"./result/compareresult200samples.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of IECS
see<<-3 # initial seed 
MDRtime<<-0
BOOSTtime<<-0
IECStime<<-0
MDRR<<-0  # initialize the number of right result of MDR
BOOSTR<<-0  # initialize the number of right result of BOOST
IECSR<<-0  # initialize the number of right result of IECS
source("generatedata.R")  
for (i in 1:1000){
see<-see+50  # add the number of seed
generatedata(datafull="A*B*C*D*E*S",noise=0.3,seed=see,casenumber=400)  # generate the dataset according to the arguments
source("MDR.R")  # MDR analysis
source("BOOST.R")  # BOOST analysis
source("IECSP.R")   # IECS analysis
}
write.table(MDRtime/1000,"./result/compareresult400samples.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of MDR
write.table(MDRR/1000,"./result/compareresult400samples.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of MDR
write.table(BOOSTtime/1000,"./result/compareresult400samples.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of BOOST
write.table(BOOSTR/1000,"./result/compareresult400samples.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of BOOST
write.table(IECStime/1000,"./result/compareresult400samples.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of iecs
write.table(IECSR/1000,"./result/compareresult400samples.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of IECS
see<<-3 # initial seed 
MDRtime<<-0
BOOSTtime<<-0
IECStime<<-0
MDRR<<-0  # initialize the number of right result of MDR
BOOSTR<<-0  # initialize the number of right result of BOOST
IECSR<<-0  # initialize the number of right result of IECS
source("generatedata.R")  
for (i in 1:1000){
see<-see+50  # add the number of seed
generatedata(datafull="A*B*C*D*E*S",noise=0.3,seed=see,casenumber=600)  # generate the dataset according to the arguments
source("MDR.R")  # MDR analysis
source("BOOST.R")  # BOOST analysis
source("IECSP.R")   # IECS analysis
}
write.table(MDRtime/1000,"./result/compareresult600samples.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of MDR
write.table(MDRR/1000,"./result/compareresult600samples.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of MDR
write.table(BOOSTtime/1000,"./result/compareresult600samples.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of BOOST
write.table(BOOSTR/1000,"./result/compareresult600samples.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of BOOST
write.table(IECStime/1000,"./result/compareresult600samples.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of iecs
write.table(IECSR/1000,"./result/compareresult600samples.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of IECS
see<<-3 # initial seed 
MDRtime<<-0
BOOSTtime<<-0
IECStime<<-0
MDRR<<-0  # initialize the number of right result of MDR
BOOSTR<<-0  # initialize the number of right result of BOOST
IECSR<<-0  # initialize the number of right result of IECS
source("generatedata.R")  
for (i in 1:1000){
see<-see+50  # add the number of seed
generatedata(datafull="A*B*C*D*E*S",noise=0.3,seed=see,casenumber=800)  # generate the dataset according to the arguments
source("MDR.R")  # MDR analysis
source("BOOST.R")  # BOOST analysis
source("IECSP.R")   # IECS analysis
}
write.table(MDRtime/1000,"./result/compareresult800samples.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of MDR
write.table(MDRR/1000,"./result/compareresult800samples.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of MDR
write.table(BOOSTtime/1000,"./result/compareresult800samples.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of BOOST
write.table(BOOSTR/1000,"./result/compareresult800samples.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of BOOST
write.table(IECStime/1000,"./result/compareresult800samples.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of iecs
write.table(IECSR/1000,"./result/compareresult800samples.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of IECS
see<<-3 # initial seed 
MDRtime<<-0
BOOSTtime<<-0
IECStime<<-0
MDRR<<-0  # initialize the number of right result of MDR
BOOSTR<<-0  # initialize the number of right result of BOOST
IECSR<<-0  # initialize the number of right result of IECS
source("generatedata.R")  
for (i in 1:1000){
see<-see+50  # add the number of seed
generatedata(datafull="A*B*C*D*E*S",noise=0.3,seed=see,casenumber=1000)  # generate the dataset according to the arguments
source("MDR.R")  # MDR analysis
source("BOOST.R")  # BOOST analysis
source("IECSP.R")   # IECS analysis
}
write.table(MDRtime/1000,"./result/compareresult1000samples.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of MDR
write.table(MDRR/1000,"./result/compareresult1000samples.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of MDR
write.table(BOOSTtime/1000,"./result/compareresult1000samples.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of BOOST
write.table(BOOSTR/1000,"./result/compareresult1000samples.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of BOOST
write.table(IECStime/1000,"./result/compareresult1000samples.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of iecs
write.table(IECSR/1000,"./result/compareresult1000samples.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of IECS
see<<-3 # initial seed 
MDRtime<<-0
BOOSTtime<<-0
IECStime<<-0
MDRR<<-0  # initialize the number of right result of MDR
BOOSTR<<-0  # initialize the number of right result of BOOST
IECSR<<-0  # initialize the number of right result of IECS
source("generatedata.R")  
for (i in 1:1000){
see<-see+50  # add the number of seed
generatedata(datafull="A*B*C*D*E*S",noise=0.3,seed=see,casenumber=1200)  # generate the dataset according to the arguments
source("MDR.R")  # MDR analysis
source("BOOST.R")  # BOOST analysis
source("IECSP.R")   # IECS analysis
}
write.table(MDRtime/1000,"./result/compareresult1200samples.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of MDR
write.table(MDRR/1000,"./result/compareresult1200samples.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of MDR
write.table(BOOSTtime/1000,"./result/compareresult1200samples.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of BOOST
write.table(BOOSTR/1000,"./result/compareresult1200samples.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of BOOST
write.table(IECStime/1000,"./result/compareresult1200samples.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of iecs
write.table(IECSR/1000,"./result/compareresult1200samples.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of IECS
see<<-3 # initial seed 
MDRtime<<-0
BOOSTtime<<-0
IECStime<<-0
MDRR<<-0  # initialize the number of right result of MDR
BOOSTR<<-0  # initialize the number of right result of BOOST
IECSR<<-0  # initialize the number of right result of IECS
source("generatedata.R")  
for (i in 1:1000){
see<-see+50  # add the number of seed
generatedata(datafull="A*B*C*D*E*S",noise=0.3,seed=see,casenumber=1400)  # generate the dataset according to the arguments
source("MDR.R")  # MDR analysis
source("BOOST.R")  # BOOST analysis
source("IECSP.R")   # IECS analysis
}
write.table(MDRtime/1000,"./result/compareresult1400samples.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of MDR
write.table(MDRR/1000,"./result/compareresult1400samples.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of MDR
write.table(BOOSTtime/1000,"./result/compareresult1400samples.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of BOOST
write.table(BOOSTR/1000,"./result/compareresult1400samples.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of BOOST
write.table(IECStime/1000,"./result/compareresult1400samples.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of iecs
write.table(IECSR/1000,"./result/compareresult1400samples.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of IECS
file.remove("data.csv","BOOSTresult.txt","MDR.csv","InteractionRecords.txt","MarginalAssoc.txt","./data/BOOST.txt","./data/IECS.txt","./data/IECSS.txt","./data/MDR.csv","./data/IECS.csv")  # remove file 