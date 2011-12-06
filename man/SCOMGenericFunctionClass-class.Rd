\name{SCOMNamedFunctionClass}
\docType{class}
\alias{SCOMNamedFunctionClass-class}
\title{COM definition using global S functions}
\description{

COM objects created from this class offer methods that are simply S
functions.  Each COM class of this type provides access to a
collection of (related) S functions and values.  In addition to
accessing these global functions, each instance can have additional
properties that are specific to it and not shared across different COM
servers.

}
\section{Objects from the Class}{
}
\section{Slots}{
  \describe{
    \item{\code{functions}:}{Object of class \code{"character"} 
       a character vector giving the names of the
      S global functions which are to be made available as 
      methods for the COM server.
    }
    \item{\code{propertyNames}:}{Object of class \code{"character"} 
     the names of S global variables which are to be made accessible as 
    properties of the COM server. }
    \item{\code{properties}:}{Object of class \code{"list"} 
      additional properties given as a named list of values.
      These are per-instance values that are separate across different 
      instances of this server class.
    }
  }
}
\section{Extends}{
Class \code{"SCOMClass"}, directly.
}
\section{Methods}{
  \describe{
    \item{createCOMObject}{\code{signature(def = "SCOMNamedFunctionClass")}: 
    creates an instance of this server as a C++-level object.}
  }
}

\references{
 \url{http://www.omegahat.org/RDCOMServer}
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}

\seealso{
 \code{\link{createCOMObject}}
 \code{\link{SCOMEnvironmentClass-class}}
 \code{\link{SCOMFunctionClass-class}}
}

\examples{

}
\keyword{classes}
