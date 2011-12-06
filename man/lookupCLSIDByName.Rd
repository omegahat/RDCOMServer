\name{lookupCLSIDByName}
\alias{lookupCLSIDByName}
\title{Resolve UUID for COM class}
\description{
This searches the Windows registry for 
the class identifier associated with
the given user-level name.
}
\usage{
lookupCLSIDByName(name)
}

\arguments{
  \item{name}{the user-level name (i.e. application identifier) for the COM class of interest.
   This is the name by which the class was registered.}
}
\details{
 This looks for an entry in the
 \code{HKEY_CLASSES_ROOT} key
 with this name and then looks for a
 sub-key named \code{CLSID}.
 The UUID is taken from the default value of this key.
}
\value{
 A
}

\references{
 \url{http://www.omegahat.org/RDCOMServer}
 \url{http://www.omegahat.org/SWinRegistry}
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}


\seealso{
 \code{\link{SCOMIDispatch}}
 \code{\link{SCOMFunctionClass}}
}

\examples{

}
\keyword{interface}

