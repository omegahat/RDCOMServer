\name{registerCOMClass}
\alias{registerCOMClass}
\alias{unregisterCOMClass}
\title{Register S COM class definition}
\description{
  These functions manage the definitions of COM classes
 defined in R.  The idea is that the definitions are stored in an S list
 indexed by the class UUIDs. When a COM object is requested, R is started and then consults
 this list to find the actual definition. These functions also optionally modify the Windows registry to 
 explicitly make the COM class accessible to clients in other languages.
}
\usage{
registerCOMClass(def, clsid = def@classId, registry = TRUE, rda = getCOMClassDefFileName(), ...)
unregisterCOMClass(name, clsid = NULL, registry = TRUE,  rda = getCOMClassDefFileName())
}

\arguments{
  \item{def}{the S object representing the definition of the COM class within R.}
  \item{name}{the user-level name of the COM class. If clsid is not specified in 
    \code{unregisterCOMClass}, we lookup the ID using this name.}
  \item{clsid}{the UUID that is used to identify this COM class.
    This is used as the name in the R list and in the Windows registry.}
  \item{registry}{a logical value indicating whether to 
    also perform the operation in the Windows registry, making the
    class visible to other clients.}
  \item{rda}{a vector giving the name(s) of the file in which the 
    S COM class definitions are stored.  The first element is used as the
    location to find the current definitions and the second element is used
    as the file name in which to store the new definitions created when 
    adding or deleting this COM class. If the vector only has one element,
    that file name is used for both input and output.}
  \item{...}{arguments passed on to \code{\link{registerClassID}}}
}
\details{
 This reads the existing definitions from a serialized R object
 and adds or removes the class definition using the class ID (uuid)
 to identify it in the list.  If \code{registry} is \code{TRUE},
 the appropriate keys and values are added or removed from the
 Windows registry.
}
\value{
 For \code{registerClassID}, a logical value \code{TRUE} if successful 
 or an error is raised.

 \code{unregisterClassID} when called with \code{purge} 
 as \code{TRUE} returns the contents of the
 registry key for the UUID before it was removed.
 This allows one to restore any additional entries if one
 wants re-register the class.
 If \code{purge} is \code{FALSE},
 it will return \code{TRUE} if removing only the
 S-generated keys was successful,  or otherwise raise an error.
}

\references{
 \url{http://www.omegahat.org/RDCOMServer}
 \url{http://www.omegahat.org/SWinRegistry}
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}


\seealso{
 \code{\link{registerClassID}}
 \code{\link{unregisterClassID}}
 \code{\link{getCOMClassDefFileName}}
}

\examples{
def <- SCOMFunctionClass(list(ttest = function(x, ...) t.test(as.numeric(x),...)), name = "R.TTest")
def@classId = getuuid("11D2A4BC-7EBC-4236-80FF-2588EFCD8821")
registerCOMClass(def)
}

\keyword{interface} 

