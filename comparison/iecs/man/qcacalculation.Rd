\name{qcacalculation}
\alias{qcacalculation}
\title{
Qca Calculation
}
\description{
This function completes the qca calculation.
}
\usage{
qcacalculation(consistencythreshold,samples)
}

\arguments{
  \item{consistencythreshold}{
threshold of consistency
}
  \item{samples}{
data of samples
}
}
\value{
The qca solution.
}
\references{
RAGIN C.The comparative method: moving beyond qualitative and quantitative strategies[M].California: University of California Press,1987:1-20
}
\seealso{
\code{\link{iecs}}
}
\examples{
samples<-data.frame(
V1=c(1,0,0,1,1,0,0,0,0,0,1,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
V2=c(0,0,1,0,1,0,1,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0),
V3=c(1,0,1,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
V4=c(1,1,1,1,1,0,0,0,1,0,0,0,0,0,1,1,1,1,1,1,1,0,1,0,1,0,1,0,0,1,0,1,0,1,1,0,1,0),
V5=c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,0,0,1,0,0)
)
qcasolution<-qcacalculation(consistencythreshold=0.8,samples=samples)
}
