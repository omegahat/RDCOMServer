\name{registerClassID}
\alias{registerClassID}
\alias{unregisterClassID}
\title{COM IDs for Windows Registry}
\description{
 These function manage the publication of a COM class 
 in the Windows registry.  
 \code{registerClassID} adds the relevant keys and values
 to the  Windows registry to make the COM class accessible
 by either human-readable name or class UUID.
 It associates the COM class with the R COM DLL or executable.
}
\usage{
registerClassID(name, clsid, progId = name, appId = NULL, version = "1.0", 
   dll = system.file("RDCOMEngine.dll", package = "RDCOMServer"), 
   exe = system.file("RDCOM.exe", package = "RDCOMServer"), 
   addClassID = FALSE, useEXE = FALSE, check = TRUE, rda = NULL, profile = NULL, ...,
   force = FALSE)
unregisterClassID(name, clsid = NULL, progId = name, purge = TRUE)
}
%- maybe also `usage' for other objects documented here.
\arguments{
  \item{name}{the name of the COM class by which people clients can create it.}
  \item{clsid}{the UUID that identifies the COM class.}
  \item{progId}{the human-readable program ID.
   When unregistering, this is 
   the name of the program identifier which may have been registerd
  in \code{registerCOMClass}. If specified and the key exists, this is removed.
  Not be implemented yet.}
  \item{appId}{}
  \item{version}{a string giving the version of the COM class}
  \item{dll}{the name of the DLL or executable (.EXE) file to use 
    when instantiating the COM object. This will almost always be either
    \code{RCOMEngine.dll} or \code{RDCOM.exe}
    for the in-process or out-of-process servers.
    This option can be controlled via the \code{useEXE} argument.
  }
  \item{exe}{the name of the EXE file to use for an out-of-process server.}
  \item{addClassID}{currently ignored!}
  \item{useEXE}{a logical value indicating whether to register the in-process DLL 
   or out-of-process EXE as the server code.}
  \item{check}{a logical value which controls whether we check to see if 
   there is alread an entry with the specified name or class identifier
   in the Windows registry.}
  \item{rda}{the name of a file which is expected to contain a
    serialized S object (created using \code{\link[base]{save}}).
    This is only used if we do not want to store the definition of
    the S object in the central S table of COM objects.
    This function then puts the name of the file (this value) 
    into the class's key in the Windows registry
    and S will look for this when attempting to create the object.
    One must be careful if using in-process servers on remote machines
    the file exists on the relevant machine.
    Otherwise one can use URIs.
   }
  \item{profile}{the name of an S source file or URI that is 
    \code{\link[base]{source}}'d when this class definition is
    first loaded. This can be used to initialize the R session
    appropriately.
    One must be careful if using in-process servers on remote machines
    the file exists on the relevant machine.
    Otherwise one can use URIs.
  }
  \item{...}{a collection of key name-value pairs of the form
       \code{key1=string, key2 = string, ...}
     These are added to the class id's registry folder/key
     as sub-keys. These can be used by methods 
     that operate on the objects or class identifier.
     The values can also be added to the S object defining the
     COM class and usually this is more convenient.
     However, it is easier to view them in the registry and 
     also to dynamically edit them without having to modify the
     S object.
   }
 \item{purge}{a logical value which if \code{TRUE} causes the entire key 
  and its sub-keys in the registry for this class to be deleted. 
  Any entries that were not added during the regular registration will
  be removed. A value of \code{FALSE} attempts to 
  remove only the keys that were registered by R in a call
  to \code{registerClassID}.}
 \item{force}{a logical value that, if \code{TRUE}, 
   proceeds with the registration even if there is an entry for that
   program ID with a different UUID for the class.}
}
\details{
 This uses the \code{SWinRegistry} package
 to create or delete the keys in the Windows 
 registry.
}
\value{
 If successful, this returns the class identifier 
 as a named string (character vector). The name is
 the name supplied. This is useful if one allows the function to 
 generate the UUID.
}
\references{
 \url{http://www.omegahat.org/RDCOMServer}
 \url{http://www.omegahat.org/SWinRegistry}
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}

\seealso{
 \code{\link{registerCOMClass}}
 \code{\link{unregisterCOMClass}}
}

\examples{

}
\keyword{interface}


