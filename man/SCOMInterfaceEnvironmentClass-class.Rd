\name{SCOMInterfaceEnvironmentClass-class}
\docType{class}
\alias{SCOMInterfaceEnvironmentClass-class}

\title{Class implementing a known DCOM interface using 
        a generator function to obtain the methods list.}
\description{
 This class is an extension of \code{\link{COMInterfaceServerInfo-class}}
 meaning that it implements an existing and known DCOM interface.
 It also extends \code{\link{SCOMEnvironmentClass-class}} which means
 that it uses a generator function to create the list
 of functions that implement the methods of the interface.
 The generator function allows the methods list to use a common
 environment to share mutable variables across calls.
}
\section{Objects from the Class}{

}
\section{Slots}{
  \describe{
    \item{\code{ids}:}{Object of class \code{"numeric"} inherited from \code{\link{SCOMClass-class}} }
    \item{\code{name}:}{Object of class \code{"character"} inherited from \code{\link{SCOMClass-class}} }
    \item{\code{version}:}{Object of class \code{"character"} inherited from \code{\link{SCOMClass-class}} }
    \item{\code{classId}:}{Object of class \code{"Ruuid"} inherited from \code{\link{SCOMClass-class}} }
    \item{\code{progId}:}{Object of class \code{"Ruuid"} inherited from \code{\link{SCOMClass-class}}}
    \item{\code{help}:}{Object of class \code{"character"} inherited from \code{\link{SCOMClass-class}} }
    \item{\code{guids}:}{Object of class \code{"character"} inherited from \code{\link{SCOMClass-class}} }


    \item{\code{generator}:}{Object of class \code{"function"} inherited from \code{\link{SCOMEnvironmentClass-class}} }
  }
}
\section{Extends}{
Class \code{"COMInterfaceServerInfo"}, directly.
Class \code{"SCOMEnvironmentClass"}, directly.
Class \code{"SCOMClass"}, by class \code{"COMInterfaceServerInfo"}.
Class \code{"SCOMClass"}, by class \code{"SCOMEnvironmentClass"}.
}
\section{Methods}{
No methods defined with class "SCOMInterfaceEnvironmentClass" in the signature.
}

\references{
 \url{http://www.omegahat.org/RDCOMServer}
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}


\seealso{
 \code{\link{SCOMClass-class}}
}
\examples{
}
\keyword{classes}
