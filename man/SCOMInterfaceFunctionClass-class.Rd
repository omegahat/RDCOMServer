\name{SCOMInterfaceFunctionClass-class}
\docType{class}
\alias{SCOMInterfaceFunctionClass-class}

\title{Server for know DCOM interface implemented with
   simple collection of functions.}
\description{
 This class is an extension of \code{\link{COMInterfaceServerInfo-class}}
 meaning that it implements an existing and known DCOM interface.
 It also extends \code{\link{SCOMFunctionClass-class}} which means
 that it does NOT use a generator function to create the list
 of functions that implement the methods of the interface.
 Instead, the list of functions is provided as-is.
}
\section{Objects from the Class}{
  Objects can be created by calls of the form \code{new("SCOMInterfaceFunctionClass", ...)}.
}
\section{Slots}{
  \describe{
    \item{\code{functions}:}{Object of class \code{"list"} a named
     list of functions which act as the methods of the DCOM server. }
    \item{\code{properties}:}{Object of class \code{"character"} 
       a named list of values which act as the properties of the DCOM server. }


    \item{\code{ids}:}{Object of class \code{"numeric"} inherited from \code{\link{SCOMClass-class}} }
    \item{\code{name}:}{Object of class \code{"character"} inherited from \code{\link{SCOMClass-class}} }
    \item{\code{version}:}{Object of class \code{"character"} inherited from \code{\link{SCOMClass-class}} }
    \item{\code{classId}:}{Object of class \code{"Ruuid"} inherited from \code{\link{SCOMClass-class}} }
    \item{\code{progId}:}{Object of class \code{"Ruuid"} inherited from \code{\link{SCOMClass-class}}}
    \item{\code{help}:}{Object of class \code{"character"} inherited from \code{\link{SCOMClass-class}} }
    \item{\code{guids}:}{Object of class \code{"character"} inherited from \code{\link{SCOMClass-class}} }
  }
}
\section{Extends}{
Class \code{"COMInterfaceServerInfo"}, directly.
Class \code{"SCOMFunctionClass"}, directly.
Class \code{"SCOMClass"}, by class \code{"COMInterfaceServerInfo"}.
Class \code{"SCOMClass"}, by class \code{"SCOMFunctionClass"}.
}
\section{Methods}{
No methods defined with class "SCOMInterfaceFunctionClass" in the signature.
}

\references{
 \url{http://www.omegahat.org/RDCOMServer}
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}


\seealso{
  \code{\link{SCOMInterfaceEnvironmentClass-class}}
}
\examples{
}
\keyword{classes}
