\name{SCOMIDispatch}
\alias{SCOMIDispatch}
\title{Define S-level COM class}
\description{
 This defines an S-level COM object
 in terms of a generator function that,
 when called, creates a list of functions
 and meta-information about properties that
 represents a unique object whose methods
 are the functions and whose properties are 
 identified by a \code{.properties} element
 within the list.
 This object is then used in conjunction 
 with \code{\link{createCOMObject}} to 
 provide an invokable COM object.
}
\usage{
SCOMIDispatch(generator, name, help = "", def = new("SCOMIDispatch"), where = "")
}
\arguments{
  \item{generator}{the generator function which is called to create each individual
  object. This should return a named list of functions
  and property identifiers. The properties are identified by 
  a character vector in the element of the returned list named
  \code{.properties}.}
  \item{name}{the user-friendly name of the COM class which clients can
   use to create an instance of the COM object.}
  \item{help}{a string providing a description of the COM class.}
  \item{def}{a COM object which is filled in by this function
   and the \code{.initSCOMClass} function.
   This allows us to use inheritance relatively easily within these constructor
   functions by creating an object of a derived class and passing it up 
   to the  constructor functions for the ancestor classes.}
  \item{where}{ignored at present, but could be used to register the class.}
}
\details{

}
\value{
 An object of class \code{SCOMIDispatchClass}.
}

\references{
 \url{http://www.omegahat.org/RDCOMServer}
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}


\seealso{
 \code{\link{SCOMFunctionClass}}
 \code{\link{createCOMObject}}
}

\examples{

}
\keyword{interface}

