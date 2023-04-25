\name{judgecompatible}
\alias{judgecompatible}
\title{
Judge Whether a Sample is Compatible with the Pattern
}
\description{
This function judges whether a sample is compatible with the pattern or not.
}
\usage{
judgecompatible(pattern, sample)
}
\arguments{
  \item{pattern}{
the pathogenic pattern,for example,"[2,3]" denotes that the mutation of the sceond and third snp.
}
  \item{sample}{
the data of one sample.
}
}
\value{
Logical value.
}
\examples{
library(purrr)
library(plyr)
samples<-data.frame(
V1=c(0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
V2=c(0,0,1,0,1,0,1,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0),
V3=c(0,0,1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
V4=c(1,1,1,1,1,0,0,0,1,0,0,0,0,0,1,1,1,1,1,1,1,0,1,0,1,0,1,0,0,1,0,1,0,1,1,0,1,0),
V5=c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
)
splitsamples<-llply(transpose(samples), do.call, what = rbind)
sample<-splitsamples[[3]]
pattern<-list(2,3,4)
result<-judgecompatible(pattern=pattern,sample=sample)
}

