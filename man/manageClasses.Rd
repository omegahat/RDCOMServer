\name{loadCOMClassDefs}
\alias{loadCOMClassDefs}
\alias{saveCOMClassDefs}
\title{Manages S definitions of COM classes}
\description{
 These functions provide the default mechanism
 for managing the global collection of definitions
 of COM classes exported from S.
 These organize a collection of class definitions
 indexed by the UUID of the class and store these
 in a file which is consulted when new COM objects
 are requested by clients.
}
\usage{
loadCOMClassDefs(fileName = getCOMClassDefFileName())
saveCOMClassDefs(fileName, COMDefs)
}
\arguments{
  \item{fileName}{the name of the file in which the S object describing the class definitions
    is stored.}
  \item{COMDefs}{the collection of class defintions which is a named list 
  of class descriptions. The names/indices in this list are the UUIDs of the classes
  given as strings.}
}
\details{
 These functions merely serialize and deserialize an S object and 
 access elements within this object.
}
\value{
 \code{GetCOMClassDef} returns an object describing an S description
 of a COM class.
 \code{loadCOMClassDefs} returns the list of the COM  class definitions.
 \code{saveCOMClassDefs} returns the value \code{TRUE} if successful or
 raises an error  if not.
}

\references{
 \url{http://www.omegahat.org/RDCOMServer}
 \url{http://www.omegahat.org/SWinRegistry}
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}


\seealso{
 \code{\link{getCOMClassDefFileName}}  
 \code{\link{registerCOMClass}}
 \code{\link{unregisterCOMClass}}
 \code{\link{createCOMObject}}
}

\examples{

}
\keyword{interface}

