\name{COMSIDispatchObject}
\alias{COMSIDispatchObject}
\title{S-level IDispatch Mechanism for S-COM}
\description{
 This function is closely associated with
 the \code{\link{SCOMEnvironmentClass-class}}
 and \code{\link{SCOMFunctionClass}}
 classes and provides the necessary 
 functionality to control the
 COM invocation of methods and accessing of
 properties for an S-COM object.
 This provides S functions that implement
 the \code{Invoke} and \code{GetIDsOfNames}
 methods for the COM object.
 The \code{GetIDsOfNames} maps COM names
 to unique identifiers and \code{Invoke}
 handles the accessing of methods and properties
 in the S-level object underlying the S-COM object.
}
\usage{
COMSIDispatchObject(funs, properties = character(0), guids = character(),
	             .propertyEnvironment = environment(funs[sapply(funs, is.function)][[1]]))
}
\arguments{
  \item{funs}{a named list of the functions that are to be used as methods,
    and a .properties elements that give the names of the variables
   within \code{.propertyEnvironment} that are to be treated as properties.}
  \item{properties}{
   a character vector giving the names of the variables  in the 
   environment which are to be treated as properties of the COM object.
   This is used if it is supplied and there is no \code{.properties}
   element in \code{funs}.}
  \item{guids}{ a character vector of the UUIDs that this server object will admit
   to supporting/implementing.  These are used when clients call the 
   QueryInterface method of the server.}
  \item{.propertyEnvironment}{the environment in which to find the properties.
   By default, this is taken as the environment of the first function in the list
   of methods, i.e. \code{funs}.}
}

\details{
 This computes the list of all names in the
 properties, and  functions and their parameters.
 (This means that named values in \code{...} are currently
  not permitted, however this is easy to change.)
 and computes a map to use for associating names and identifiers.
  These are used by the client to map a name to an identifier and
 use that in calls.
}

\value{
 A list of two functions 
 that can be passed to the constructor
 of the C++ class \code{RCOMSObject}
 via the C routine \code{R_RCOMSObject}.
 The functions are the \code{Invoke} and \code{GetIDsOfNames}.
}
\references{
 \url{http://www.omegahat.org/RDCOMServer}
 \url{http://www.omegahat.org/SWinRegistry}
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}


\seealso{
 \code{\link{computeCOMNames}}
}

\examples{

}
\keyword{interface}

