\name{SCOMNamedFunctionDispatch}
\alias{SCOMNamedFunctionDispatch}
\title{Create COM dispatch mechanism for COMSNamedFunctionClass instance}
\description{

 This function is used to create a dispatch mechanism for an instance
of an S COM object created from a \code{\link{SCOMNamedFunctionClass-class}}
definition object. This provides an invocation mechanism to handle
calls to the methods in the COM object and also a mapping of the names
of methods, properties and parameters to integers and back.

}
\usage{
SCOMNamedFunctionDispatch(funs, properties, propertyNames, nameMgr = COMNameManager())
}
\arguments{
  \item{funs}{a named character vector.
   The names are those used by COM clients
   to refer to methods in the COM server.
   The correspoding element in the vector
   is the name of the S function to invoke
   for that method name.
  }
  \item{properties}{a list of named values that act as local properties
   for the instance of the COM server}
  \item{propertyNames}{a character vector giving the names of 
    S variables that act as additional global or shared properties
    for the COM objects.}
  \item{nameMgr}{a function that performs all of the name-identifer mapping
  for properties. This function should work on numbers and return the corresponding names,
   names and return the corresponding identifiers, and if called with no arguments
   return the current map as a named integer vector.
   See \code{\link{COMNameManager}}. This is made accessible as an argument
   primarily so that one can provide a
   \code{\link{COMNameManager}} function that is initialized
   with a particular mapping, say computed from a type library.}
}

\value{
 A list with two functions that act as the
 invocation and name manager for the COM dispatch mechanism.
 \item{Invoke}{the invocation function that handles calls to 
   methods and properties by COM clients.}
 \item{GetNamesOfIDs}{the name mapper that is called by the client
  to map a name to an integer identifier.}
}

\references{
 \url{http://www.omegahat.org/RDCOMServer}
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}


\seealso{
 \code{\link{SCOMNamedFunctionClass-class}}
 \code{\link{SCOMNamedFunctionClass}}
 \code{\link{createCOMObject}}
}
\examples{

}
\keyword{interface}
\keyword{programming}


