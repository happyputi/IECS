\name{extractpattern}
\alias{extractpattern}
\title{
Extract the Pattern of the Solution with the Highest Coverage
}
\description{
This function generates pattern marked by number from the solution with the highest coverage in the qcaresult.
}
\usage{
extractpattern(qcaresult, samples)
}
\arguments{
  \item{qcaresult}{
the result of qca calculation
}
  \item{samples}{
the data of samples
}
}
\value{
A list of the pattern marked by number
}
\references{
Gagliano SA, Sengupta S, Sidore C, Maschio A, Cucca F, Schlessinger D, Abecasis GR. Relative impact of indels versus SNPs on complex disease. Genet Epidemiol. 2019 Feb;43(1):112-117. doi: 10.1002/gepi.22175. Epub 2018 Nov 22. PMID: 30565766; PMCID: PMC6330128.
}
\seealso{
\code{\link{qcacalculation}}
}
\examples{
samples<-data.frame(
V1=c(0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
V2=c(0,0,1,0,1,0,1,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0),
V3=c(0,0,1,0,0,1,0,0,1,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
V4=c(1,1,1,1,1,0,0,0,1,1,0,0,0,0,1,1,1,1,1,1,1,0,1,0,1,0,1,0,0,1,0,1,0,1,1,0,1,0),
V5=c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,1,0)
)
qcaresultlist<-qcacalculation(consistencythreshold=0.8,samples)  # qca calculation for the data
if (length(qcaresultlist)==1){break  # no solution of qca
}else{
if (length(qcaresultlist)==7){solutionlist<-qcaresultlist[[1]][[1]]}else{  
solutionlist<-qcaresultlist[[1]]}
} # no prime implicants are tied
extractpattern<-extractpattern(qcaresult=solutionlist,samples=samples) 
}
