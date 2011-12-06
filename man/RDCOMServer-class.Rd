\name{RDCOMServer-class}
\docType{class}
\alias{RDCOMServer-class}

\title{R class to represent an instance of an R-based DCOM server.}
\description{
 This class represents the running instance of the R-implemented
 DCOM server. It differs from the description class the describe
 a server in that this refers to the instance.  The
 instance is a C++-level object and this \code{RDCOMServer}
 class contains a handle to that object.
}
\section{Objects from the Class}{
Objects of this class are not instantiated directly
but rather via calls to  functions such as
 \code{\link{createCOMObject}}
 and indirectly when an external
 client application requests a
 new instance of a DCOM object that is implemented
 in R. This uses the registration mechanism to 
 store an R DCOM server description in the Windows
 registry.  More direct methods such
 as \code{\link{createCOMObject}} are used 
 when creating event handlers, and not relying
 on queries from other applications.

}
\section{Slots}{
  \describe{
    \item{\code{ref}:}{Object of class \code{"externalptr"}.
       This stores the reference to the C++-level object.
    }
  }
}
\section{Methods}{
No methods defined with class "RDCOMServer" in the signature.
}
\references{
 \url{http://www.omegahat.org/RDCOMServer}
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}


\seealso{
 \code{\link{createCOMObject}}
}
\examples{
}
\keyword{classes}
\concept{DCOM}
\concept{server}

