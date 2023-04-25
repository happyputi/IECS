patternjudgeiecs<-function(a){
c<-list(2,1)
d<-list(4,3)
if (length(a)==2){
p<-a%in%c
q<-a%in%d
if((p[[1]]&& p[[2]])|(q[[1]]&&q[[2]])){
return(TRUE)
} else{
return(FALSE)
}
}else{
return(FALSE)
}
}
