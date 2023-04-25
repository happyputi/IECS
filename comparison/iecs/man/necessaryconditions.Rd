\name{necessaryconditions}
\alias{necessaryconditions}
\title{
Necessary Conditions Analysis
}
\description{
This function analysis the necessary conditions and calculate the pvalue of Pearson's Chi-squared test with  yates' continuity correction.
}
\usage{
necessaryconditions(inclthreshold,covthreshold,samples)
}
\arguments{
  \item{inclthreshold}{
threshold of incl.
}
  \item{covthreshold}{
threshold of cov.
}
  \item{samples}{
data of samples.
}
}
\value{
   \item{inclN }{The inclusion score}
   \item{RoN }{The relevance of necessity}
   \item{covN }{The coverage score}
   \item{pvalue }{The pvalue of chisquare}
}
\references{
Greckhamer, Thomas & Misangyi, Vilmos & Fiss, Peer. (2013). The two QCAs: From a small-N to a large-N set-theoretic approach. Configurational Theory and Methods in Organizational Research. 38. 49-75. 10.1108/S0733-558X(2013)0000038007. 
}
\seealso{
\code{\link{qcacalculation}}
}
\examples{
samples<-data.frame(
V1=c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
V2=c(0,0,1,0,1,0,1,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0),
V3=c(1,0,1,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
V4=c(1,1,1,1,1,0,0,0,1,0,0,0,0,0,1,1,1,1,1,1,1,0,1,0,1,0,1,0,0,1,0,1,0,1,1,0,1,0),
V5=c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,0,0,1,0,0)
)
necessaryconditionsanalysis<-necessaryconditions(inclthreshold=0.9,covthreshold=0.5,samples=samples)
}