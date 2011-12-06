\name{COMNameManager}
\alias{COMNameManager}
\title{Generator function for name-id managing cache}
\description{

 This is a constructor function that generates a function object which
can be used to manage a unique set of name-identier pairs.  Each
resulting function from a call to this generator stores its own set
map of the names and their integer identifiers.  This can be used when
managing the mapping of COM names for properties, methods and
parameters. The behavior of the manager function is to allow
any names to be requested and simply add previously unseen 
values to the map. In this way, it is non-discriminating.
}
\usage{
COMNameManager(map = integer(0))
}
\arguments{
  \item{map}{a named integer vector giving an initial value
   for the mapping of the names to integers and vice-versa.}
}
\details{
  This generator function is merely used to 
 create a unique environment for each instance
 of the return value.
}
\value{
 A single function which acts as a name manager.
 If called with a numeric vector, this function returns 
 the associated names in its local map.
 If called with a character vector, it looks up the
 names and returns their associated integer identifiers.
 Any values not already in the map are added.
 And if called with no argument, the current map is returned.
}

\references{
 \url{http://www.omegahat.org/RDCOMServer}
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}

\seealso{
\code{\link{SCOMNamedFunctionClass-class}}
 \code{\link{SCOMNamedFunctionClass}}
 \code{\link{SCOMNamedFunctionDispatch}}
}
\examples{

}
\keyword{interface}

