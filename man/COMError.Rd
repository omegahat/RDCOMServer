\name{COMError}
\alias{COMError}
\alias{getCOMErrorCode}
\alias{.COMErrors}
\title{Constructor for COM error}
\description{
This is an S-level constructor
that allows a programmer to return an error from
an S function to a C-level routine.
One can indicate different types of errors
using the different error codes
that are available in the S object named \code{.COMErrors}.
}
\usage{
COMError(code, description = "", className = "COMError")
getCOMErrorCode(name)
}
\arguments{
  \item{code}{a name or value of the error code that corresponds to the internal
    C-level API for Windows errors. These are dynamically computed 
    when the package is loaded and available as an S vector
    as in the variable \code{.COMErrors} }
  \item{description}{text describing the problem.}
  \item{className}{the name of the S3 class used to represent 
    the error. Currently, this is just an S3-style class name.}
  \item{name}{the name of the COM error whose numeric value is to be retrieved. }
}
\value{
 An S3-style object containing elements
for 
 \item{code}{the numeric value of the code}
 \item{description}{the string describing the error}
}

\references{
 \url{http://www.omegahat.org/RDCOMServer}
 \url{http://www.omegahat.org/SWinRegistry}
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}


\seealso{
 \code{\link{SCOMIDispatch}}
}
\examples{
\dontrun{
 COMError("DISP_E_MEMBERNOTFOUND", "No such element 'foo'")

 name <- "foo"
 COMError("DISP_E_MEMBERNOTFOUND", paste("No such element '", name, "'", sep=""))
}
}
\keyword{interface}

