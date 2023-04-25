pvaluejudge<-function(a){
if (is.na(a)){  # if NA，return "FALSE"
return(FALSE)
} else if (a<0.05){
return(TRUE)
} else{
return(FALSE)
}
}
