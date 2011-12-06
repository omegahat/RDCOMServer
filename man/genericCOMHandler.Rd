\name{genericCOMHandler}
\alias{genericCOMHandler}
\title{Dispatch mechanism for arbitrary S object}
\description{
 This function is used to create a dynamic dispatch handler
 for representing an arbitrary S object as  a COM object.
 It takes the S object and exports its named elements and
 attributes as properties and allows clients to call 
 arbitrary S functions as methods with this object as 
 the first argument.
}
\usage{
genericCOMHandler(obj)
}
\arguments{
  \item{obj}{the S object to be exported as a COM object.}
}
\details{
  This creates a closure that has access to the object
 and which provides methods for the \code{Invoke}
 and \code{GetIDsOfNames} methods for a COM object. 
 These are then passed to the C++ constructor function
 for the C++ class \code{RCOMSObject} which calls these methods
 when the corresponding COM object methods are invoked. 
}
\value{
 A list with two elements
 \item{Invoke}{the function which is called in response to 
  low-level COM invocations for this object.
  It is given the integer identifier for the method, 
  the style of invocation as a logical vector of length 4,
  the argument values, the integer identifiers for the names
  of any named arguments.
  The arguments are given in reverse order and the
  named arguments come first. See 
  \code{genericCOMHandler} for an example.
  }
 \item{GetIDsOfNames}{a function that maps the names of methods,
  properties and argument parameters to integers that are fixed across calls.
  This allows clients to cache these values.}
}

\references{
 \url{http://www.omegahat.org/RDCOMServer}
 \url{http://www.omegahat.org/RDCOMClient}
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}

\examples{

}
\keyword{interface}

