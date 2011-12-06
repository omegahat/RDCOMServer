\name{SCOMEnvironmentClass-class}
\docType{class}
\alias{SCOMEnvironmentClass-class}
\title{Class for COM definitions involving a generator function, typically using closures.}
\description{

This class is used to represent a COM definition that involves a
generator function that is called to create unique instances when a
COM object is needed of this class.  The part of the class that
involves an \code{environment} is typically that the generator
function returns a list of functions that share a common environment
and the variables within that environment.  This gives the mutable
state and this is a very natural way to think of COM objects in R.

This class should not be used directly at present. Instead,
use \code{SCOMIDispatch-class} which is almost exactly
the same but uses a more complete dispatch mechanism that is
implemented in S (\code{\link{COMSIDispatchObject}}).

}
\section{Objects from the Class}{
 Using this class directly is stronly discouraged at present.
 Instead, use the \code{\link{SCOMIDispatch-class}}
 and its constructor function \code{\link{SCOMIDispatch}}.
}
\section{Slots}{
  \describe{
    \item{\code{generator}:}{Object of class \code{"function"}.
     This is the generator function that is invoked each time
     a new COM object is requested for this class.
     It is expected to return a list of functions which are used
     as the methods. The names of the elements in the list are used
     as the names of the methods that are visible to clients.
     Any properties that are to be exported are identified
     by having an element named \code{.properties}
     in the list which contains a character vector giving
     the names of the accessible properties.
    }

   \item{classId}{Inherited from \code{\link{SCOMClass-class}}}
   \item{guids}{Inherited from \code{\link{SCOMClass-class}}}
   \item{help}{Inherited from \code{\link{SCOMClass-class}}}
   \item{version}{Inherited from \code{\link{SCOMClass-class}}}
   \item{name}{Inherited from \code{\link{SCOMClass-class}}}
   \item{progId}{Inherited from \code{\link{SCOMClass-class}}}
  }
}
\section{Extends}{
Class \code{"SCOMClass"}, directly.
}
\section{Methods}{
  \describe{
    \item{createCOMObject}{\code{signature(def = "SCOMEnvironmentClass")}: ... }
  }
}
\references{
 \url{http://www.omegahat.org/RDCOMServer}
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}


\seealso{
 \code{\link{SCOMIDispatch}}
}

\examples{
# Don't use this class directly. 
# 


}
\keyword{classes}
