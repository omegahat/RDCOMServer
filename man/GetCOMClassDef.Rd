\name{GetCOMClassDef}
\alias{GetCOMClassDef}
\title{Find S COM class definition from a class UUID}
\description{
  This function is called by a COM factory  to create an
  instance of a particular COM class defined in S when
  such an object is requested by a client.
  This looks for the information to create the COM
  object in two ways.

  Firstly, it attempts to look in the registry for
  the class entry for the given UUID identifier.
  If this exists, it looks for entries for
  \code{profile} to see if there is an S script
  that it should execute before creating the server.
  This can be used to initialize the R session appropriately
  so that packages, methods, data, etc. are available to support
  the server.
  It then checks to see if there is an entry in the registry
  named \code{rda} and if so, deserializes the file given by
  that entries value. The first object from deserializing is
  used as the COM server object.
  If no \code{rda} entry exists but there is an entry
  named \code{Svariable}, we then attempt to retrieve
  the S object that is currently bound/assigned to that variable
  and use that.
  
  The typical mechanism does not use \code{rda} or \code{Svariable}
  entries. Instead, the developer of a COM server in S
  registers the server definition using
  \code{\link{registerCOMClass}}.  \code{GetCOMClassDef}
  then uses the UUID passed to it to find the definition
  in a list of such server definitions. This list
  is stored in a serialized S object residing on the system
  and created during the call to \code{\link{registerCOMClass}}.
  
}
\usage{
GetCOMClassDef(clsid, rda = getCOMClassDefFileName(), verbose = FALSE)
}
\arguments{
  \item{clsid}{the UUID identifying the particular COM class definition.
   This is an object of class uuid from the \code{Ruuid} package
   or a character vector giving the UUID in string form.}  
  \item{rda}{the name of an R data file containing the serialized object
    giving the list of COM class definitions. 
  } 
  \item{verbose}{a logical value indicating whether to write diagnostic messages about progress
   to the console.}  
}
\value{
  An object that "defines" an S COM server
  which can be passed to \code{\link{createCOMObject}}.
}

\references{
 \url{http://www.omegahat.org/RDCOMServer}
 \url{http://www.omegahat.org/SWinRegistry}
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}


\seealso{
\code{\link{registerCOMClass}}  
\code{\link{createCOMObject}}
}
\examples{

}
\keyword{interface}

