\name{chisquare}
\alias{chisquare}
\title{
Chisquaretest for the Pattern in the Source Data
}
\description{
This function tests whether the pattern is related to the depend variable in the source dataset by Pearson's Chi-squared test with  yates' continuity correction.
}
\usage{
chisquare(pattern, samples)
}
\arguments{
  \item{pattern}{
the pathogenic pattern,for example,"[2,3]" denotes the mutation of the sceond and the third snp.
}
  \item{samples}{
the data of samples.
}
}
\value{
A numeric value of pvalue in the Pearson's Chi-squared test with  yates' continuity correction
}
\references{
Haviland MG. Yates's correction for continuity and the analysis of 2 x 2 contingency tables. Stat Med. 1990 Apr;9(4):363-7; discussion 369-83. doi: 10.1002/sim.4780090403. PMID: 2362976.
}
\examples{
samples<-data.frame(
V1=c(0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
V2=c(0,0,1,0,1,0,1,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0),
V3=c(0,0,1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
V4=c(1,1,1,1,1,0,0,0,1,0,0,0,0,0,1,1,1,1,1,1,1,0,1,0,1,0,1,0,0,1,0,1,0,1,1,0,1,0),
V5=c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
)
pattern<-list(2,3)
chisquaretest<-chisquare(pattern=pattern,samples=samples)
}

