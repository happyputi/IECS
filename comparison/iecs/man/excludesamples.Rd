\name{excludesamples}
\alias{excludesamples}
\title{
Exclude the Samples Compatible with the Pattern
}
\description{
The function excludes all samples that is compatible with the pattern.
}
\usage{
excludesamples(pattern, samples)
}
\arguments{
  \item{pattern}{
pathogenic pattern,for example,"[1,3]" denotes the mutation of the first and the third snp.
}
  \item{samples}{
the data of samples.
}
}
\value{
The .csv file which contains remaining samples in list format in current work dictionary.
}
\references{
Zhao, Feifei & Song, Manshu & Wang, Youxin & Wang, Wei. (2016). Genetic model. Journal of cellular and molecular medicine. 20. 10.1111/jcmm.12751. 
}

\examples{
samples<-data.frame(
V1=c(0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
V2=c(0,0,1,0,1,0,1,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0),
V3=c(0,0,1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
V4=c(1,1,1,1,1,0,0,0,1,0,0,0,0,0,1,1,1,1,1,1,1,0,1,0,1,0,1,0,0,1,0,1,0,1,1,0,1,0),
V5=c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
)
write.table(samples,file = "data.csv")
pattern<-list(1,3)
excludesamples(pattern=pattern,samples=samples)
}
