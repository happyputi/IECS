generatedata <-
function(datafull,noise,seed,casenumber){  # define the function
library(cna)
source("bringnoise.R")
dataFull<-ct2df(full.ct(datafull))  # transform the configuration table into a data frame
pathogenicmodel<-"A*B+C*D<->S"  # define the pathogenic model
idealdata<-ct2df(selectCases(pathogenicmodel, dataFull))  # generate the ideal data according to the pathogenic model
incompatibledata<-dplyr::setdiff(dataFull,idealdata)  # # generate the incompatible data
set.seed(seed)  # set the number of seed
datawithnoise<-bringnoise(idealdata,incompatibledata,numberofreplace=round(nrow(idealdata )*noise),add = F)  # generate the data with noise
finaldata<-cna::some(datawithnoise,casenumber,replace=T)  # randomly select the data according to the casenumber   
write.table(finaldata,file = "./data/IECS.txt",sep = ",",row.names = FALSE,col.names=FALSE)  # write the IECS data to file
write.table(finaldata,file = "./data/IECSS.txt",sep = ",",row.names = FALSE,col.names=FALSE)  # # write the IECS data to file
write.table(finaldata,file = "./data/IECS.csv",sep = ",",row.names = FALSE,col.names=TRUE)  # write the IECS data to csv file
MDRdataresult<-list()  # initialize the MDRdataresult
MDRdataresult<-c(MDRdataresult,finaldata[[length(finaldata)]])  # generate the MDRdata result 
MDRdataresultvec<-unlist(MDRdataresult)  # transform the MDRdata result into a vector
MDRdata<-list()  # initialize the MDRdata
MDRdata[[1]]=MDRdataresultvec  # put the MDRdata result to the first column
for (i in 1:(length(finaldata)-1)){
inter<-list()  # inter data
inter<-c(inter,finaldata[[i]])  
intervec<-unlist(inter)
MDRdata[[i+1]]=intervec  # put the other variables
}
write.table(MDRdata,file = "./data/MDR.csv",sep = ",",row.names = FALSE,col.names=FALSE)  # write the MDR data to file
write.table(MDRdata,file = "./data/BOOST.txt",sep = "  ",row.names = FALSE,col.names=FALSE)  # write the BOOST data to file
write.table("datafull","./result/generatedataresult.txt",append=T,col.names=F,row.names=F,eol=" ")
write.table("pathogenicmodel","./result/generatedataresult.txt",append=T,col.names=F,row.names=F,eol=" ")
write.table("noise","./result/generatedataresult.txt",append=T,col.names=F,row.names=F,eol=" ")
write.table("seed","./result/generatedataresult.txt",append=T,col.names=F,row.names=F,eol=" ")
write.table("casenumber","./result/generatedataresult.txt",append=T,col.names=F,row.names=F,eol="\n")
write.table(datafull,"./result/generatedataresult.txt",append=T,col.names=F,row.names=F,eol=" ")
write.table(pathogenicmodel,"./result/generatedataresult.txt",append=T,col.names=F,row.names=F,eol=" ")
write.table(noise,"./result/generatedataresult.txt",append=T,col.names=F,row.names=F,eol=" ")
write.table(seed,"./result/generatedataresult.txt",append=T,col.names=F,row.names=F,eol=" ")
write.table(casenumber,"./result/generatedataresult.txt",append=T,col.names=F,row.names=F,eol="\n")
}