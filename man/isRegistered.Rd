\name{isRegistered}
\alias{isRegistered}
\title{Determines if COM class is in registry}
\description{
This function checks the Windows registry
for an entry for the specified COM class.
The caller can identify the class either by
its user-level name or its UUID.
}
\usage{
isRegistered(name)
}
\arguments{
  \item{name}{an identifier for the COM class, which can be either
   the human readable name/program id, or the UUID for the class.}
}
\details{
 This looks in the standard place for the program name 
 and then looks for the class identifier.
}
\value{
 A logical value indicating if there is an entry in the
 windows registry associated with this DCOM class.
}

\references{
 \url{http://www.omegahat.org/RDCOMServer}
 \url{http://www.omegahat.org/SWinRegistry}
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}
\seealso{
 \code{\link{lookupCLSIDByName}}
 \code{\link[SWinRegistry]{registryKeyExists}}
 \code{\link[SWinRegistry]{getRegistryValue}}
}

\examples{

}
\keyword{interface}


