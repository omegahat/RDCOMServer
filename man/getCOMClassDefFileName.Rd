\name{getCOMClassDefFileName}
\alias{getCOMClassDefFileName}
\title{Find name of file containing centralized COM class definitions}
\description{
 When we register an S COM class definition, the default approach is to 
 store it in an S list indexed by its UUID and serialize this 
 list of know classes to a file. When R is asked to create an instance
 of such a class, it consults this list and finds the definition using
 the specified UUID.
 This function provides a way to find the name of the file containing
 the serialized list of definitions.
 To allow the user  provide some control over where this file is stored,
 we look first for an environment variable named
 \code{R_COM_CLASS_FILE}. If this is set, we assume its value is the name
 of the file.
 Otherwise, we check if there is a setting for the option named
 \code{RCOMClassFile}. If there is, we use that.
 And if neither of these is set, we use the default file name which is
 \code{RCOMClasses.rda} in the top directory of the installed
 RDCOMServer package.
}
\usage{
getCOMClassDefFileName()
}
\value{
 A string giving the default name of the file 
 to use for serializing and deserializing class definitions.
}

\references{
 \url{http://www.omegahat.org/RDCOMServer}
 \url{http://www.omegahat.org/SWinRegistry}
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}


\seealso{
 \code{\link{registerCOMClass}}
 \code{\link{unregisterCOMClass}}
 \code{\link{GetCOMClassDef}}
 \code{\link{loadCOMClassDefs}}
 \code{\link{saveCOMClassDefs}}
}
\examples{
  getCOMClassDefFileName()

  options(RCOMClassFile="c:\\R\\COMClassDefs.rda")
  getCOMClassDefFileName()

  Sys.putenv("R_COM_CLASS_FILE" = "c:\\R\\COMClassDefs.rda")
  getCOMClassDefFileName()
}
\keyword{interface}


