\name{computeCOMNames}
\alias{computeCOMNames}
\title{Generate name-id mapping}
\description{
 This constructs a mapping of the different names
 of the functions, properties and argument names within a
 collection of functions and property declarations for a COM object.
 The result is an integer vector that provides an ID for each 
 of the known names. This is used in the COM mechanism 
 to handle names in method/property  invocation.
}
\usage{
computeCOMNames(els)
}
\arguments{
  \item{els}{an list containing functions to export as methods 
  in a COM object and an 
  element named \code{.properties} giving the names of the
  properties to export.
 }
}
\details{
 This combines the property names with 
 the names of the methods and all of the 
 argument names for these functions.
}
\value{
 A named integer vector giving the mapping
 between the set of names to the corresponding integers.
}
\references{
 \url{http://www.omegahat.org/RDCOMServer}
 \url{http://www.omegahat.org/SWinRegistry}
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}


\seealso{
 \code{\link{COMSIDispatchObject}}
}

\examples{

}
\keyword{interface}


