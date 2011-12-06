\name{SCOMClass-class}
\docType{class}
\alias{SCOMClass-class}
\title{SCOMClass - top-level class representing an R-level COM server interface}
\description{
This is the top-level virtual class for representing
the basic S-language definition for a COM object.
It provides slots for the name, class identifier (UUID),
the version identifier (string), the
program identifier and a string giving a description
of the class.
This is intended to be sub-classed by other particular
COM definition classes in S which provide a definition
for how to create instances of the object in S
that can be used as COM objects.
}
\section{Objects from the Class}{
 This is a virtual class.
}
\section{Slots}{
  \describe{
    \item{\code{name}:}{Object of class \code{"character"}. A string  
    giving the human-usable name for the COM class. This is used
    by clients to create an instance of the class.}
    \item{\code{version}:}{Object of class \code{"character"}.
     A string giving information about the version of the class.
     This is a free formatted string at present, but should be something of the form
     "major.minor-patch".}
    \item{\code{classId}:}{Object of class \code{"Ruuid"} 
     a unique identifier for the class. One can use 
     the \code{Ruuid} package from \url{http://www.bioconductor.org}
     or a system tool such as \code{guidgen} to generate the UUID.
     You will need the \code{Ruuid} package to create the object however.
     }
    \item{\code{progId}:}{Object of class \code{"Ruuid"} 
     not currently used. }
    \item{\code{help}:}{Object of class \code{"character"} 
       a string giving a human-readable description of the class.}
    \item{guids}{ a character vector of the UUIDs that this server object will admit
      to supporting/implementing.  These are used when clients call the 
      QueryInterface method of the server.}
  }
}

\section{Methods}{
No methods defined with class "SCOMClass" in the signature.
}


\references{
 \url{http://www.omegahat.org/RDCOMServer}
 \url{http://www.omegahat.org/SWinRegistry}
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}

\seealso{
 \code{\link{SCOMEnvironmentClass-class}}
 \code{\link{SCOMFunctionClass-class}}
 \code{\link{SCOMIDispatch-class}}
 \code{\link{SCOMNamedFunctionClass-class}}
}

\examples{
}
\keyword{classes}
