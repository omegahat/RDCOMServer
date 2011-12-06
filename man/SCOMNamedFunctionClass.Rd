\name{SCOMNamedFunctionClass}
\alias{SCOMNamedFunctionClass}
\title{Constructor for describing a named function COM server}
\description{
 This is a constructor function for creating 
\code{\link{SCOMNamedFunctionClass}} objects describing
a COM class that is implemented by named S functions.
}
\usage{
SCOMNamedFunctionClass(functions, name, ..., propertyNames = character(0), help = "", def = new("SCOMNamedFunctionClass"))
}
\arguments{
  \item{functions}{}
  \item{name}{the name of the COM class}
  \item{\dots}{arbitrary named values that are collected into a list
  and used as properties for each COM object of this class. These 
  properties are local to each COM object.}
  \item{propertyNames}{a character vector giving the names of S variables
   that are to be treated as properties for the COM objects of this class.
   Note that these are shared across all COM objects.}
  \item{help}{a string giving a brief description about this class that might
  be useful for a client.}
  \item{def}{an instance of the target S class used to represent this
   definition. Rarely specified directly but mainly used for inheritance.}
}

\value{
 An object of class \code{\link{SCOMNamedFunctionClass}}.
}

\references{
 \url{http://www.omegahat.org/RDCOMServer}
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}


\seealso{
 \code{\link{SCOMNamedFunctionDispatch}}
 \code{\link{createCOMObject}}
}
\examples{

}
\keyword{interface}
\keyword{programming}

