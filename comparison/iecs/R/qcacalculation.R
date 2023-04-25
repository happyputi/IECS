qcacalculation <-
function(consistencythreshold,samples){  # argument "samples" is the data of samples
splitsamples<-llply(transpose(samples), do.call, what = rbind)  # split the matrix into samples
variable<-row.names(splitsamples[[1]])  # get the variable names
sicken<-variable[[length(variable)]]  # get the sicken result
tt<-truthTable(samples,outcome=sicken,incl.cut=consistencythreshold,n.cut=1,complete=TRUE)  # get the truthTable
qcaresult<-list()  # define qca result
try(qcaresult<-c(minimize(tt,details = FALSE, pi.cons = 0,sol.cons = 0, all.sol = FALSE, row.dom = FALSE, min.pin = FALSE,max.comb = 0, first.min = FALSE, method = "CCubes"),qcaresult), silent = TRUE)  # get the qca result
if (length(qcaresult)!=0){
return(qcaresult[[11]])}  # return the qca result
else{return('FALSE')}
}
