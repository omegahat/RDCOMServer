\name{COMInterfaceServerInfo-class}
\docType{class}
\alias{COMInterfaceServerInfo-class}

\title{Server class that implements a known DCOM interface}
\description{
 This class is one for which we want to register the server,
 (as opposed to using it directly here), but for which 
 we also have pre-computed information about the ids of the methods.
 Essentially, this implements a known interface rather than is defining a new
 "dynamic" interface whose interface is not computible from a ITypeInfo.
}
\section{Objects from the Class}{A virtual Class: No objects may be created from it.}
\section{Slots}{
  \describe{
    \item{\code{ids}:}{Object of class \code{"numeric"} 
      this is a named numeric vector that maps the 
      names of the methods to their identifiers that are used
      in the actual calls by clients. }


    \item{\code{name}:}{Object of class \code{"character"} inherited from \code{\link{SCOMClass-class}} }
    \item{\code{version}:}{Object of class \code{"character"} inherited from \code{\link{SCOMClass-class}}}
    \item{\code{classId}:}{Object of class \code{"Ruuid"} inherited from \code{\link{SCOMClass-class}} }
    \item{\code{progId}:}{Object of class \code{"Ruuid"} inherited from \code{\link{SCOMClass-class}}}
    \item{\code{help}:}{Object of class \code{"character"}  inherited from \code{\link{SCOMClass-class}}}
    \item{\code{guids}:}{Object of class \code{"character"} inherited from \code{\link{SCOMClass-class}}}
  }
}
\section{Extends}{
Class \code{"SCOMClass"}, directly.
}
\section{Methods}{
No methods defined with class "COMInterfaceServerInfo" in the signature.
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
