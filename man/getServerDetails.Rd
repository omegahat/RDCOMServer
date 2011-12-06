\name{getServerDetails}
\alias{getServerDetails}
\alias{setServerDetails}
\title{Get/Set the S object associated with a DCOM server instance}
\description{
 These functions allows us to retrieve or set the R object that is
 created to manage an R DCOM server instance.  This object
 provides access to the methods and properties made available
 by the server and also its proxy functions and method identifiers
 which manage the invocation of the methods and interface to 
 DCOM clients that access the server. 

 This is mainly used as a debugging device to understand what
 has been created by the lower-level machinery that creates the
 DCOM server instances. However, this reflection can be used in 
 various settings.
}
\usage{
getServerDetails(obj)
}
\arguments{
  \item{obj}{the DCOM server, an object of class RDCOMServer.}
}
\value{
  Currently an "arbitrary" R object, i.e. using old-style classes. 
}
\references{
 \url{http://www.omegahat.org/RDCOMServer}
 \url{http://www.omegahat.org/SWinRegistry}
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}

\seealso{
 \code{\link{createCOMObject}}
}
\examples{
}
\keyword{programming}
\keyword{interface}
\concept{reflection}

