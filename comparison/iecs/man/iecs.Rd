\name{iecs}
\alias{iecs}
\title{
Iterative Exclusion of Compatible Samples Analysis of the Data
}
\description{
This function completes the iecs analysis. 
}
\usage{
iecs(k,consistencythreshold,samples)
}
\arguments{
  \item{k}{
the iterations
}
  \item{consistencythreshold}{
the threshold of consistency
}
  \item{samples}{
the data of samples
}
}
\value{
The iecs solution.
}
\references{
Fiss,P.C.2011,Building Better Causal Theories: A Fuzzy Set Approach to Typologies in Organization Research,Academy of Management Journal, Vol.54, pp. 393~420
}
\seealso{
\code{\link{qcacalculation}}
}
\examples{
samples<-data.frame(
V1=c(1,0,1,0,1,0,1,1,0,1,1,0,1,1,0,0,1,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
V2=c(1,0,0,0,1,0,1,0,1,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0),
V3=c(1,1,1,1,1,0,1,1,1,0,0,0,1,1,0,0,1,1,0,1,1,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0),
V4=c(0,1,1,1,1,0,1,1,1,1,0,0,1,1,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
V5=c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
)
iecssolution<-iecs(k=2,consistencythreshold=0.8,samples=samples)
}