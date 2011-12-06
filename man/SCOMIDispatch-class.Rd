\name{SCOMIDispatch-class}
\docType{class}
\alias{SCOMIDispatch-class}
\title{Typical COM server class representation}
\description{
This class is a simple extension
of \code{SCOMEnvironmentClass-class} and so it
supports having a generator function
that is used to create each instance of
the COM object at the S level (e.g. 
creating unique function lists for each instance
that share a common environment with each other
but separate from other instances).

The only difference between this and \code{SCOMEnvironmentClass-class}
is that we use a different dispatch mechanism for the two classes.
For this class, we use the more complete and easier-to-understand S
function \code{\link{COMSIDispatchObject}} to create both the dispatch
mechanism that handles method invocation for the object, and the
mapping of names to integers and back.  The
\code{SCOMEnvironmentClass-class} uses a C++-level mechanism and
should not be used at this point.

}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("SCOMIDispatch", ...)}.
}
\section{Slots}{
  \describe{

   \item{\code{generator}}{Inherited from \code{\link{SCOMEnvironmentClass-class}}}

   \item{classId}{Inherited from \code{\link{SCOMClass-class}}}
   \item{guids}{Inherited from \code{\link{SCOMClass-class}}}
   \item{help}{Inherited from \code{\link{SCOMClass-class}}}
   \item{version}{Inherited from \code{\link{SCOMClass-class}}}
   \item{name}{Inherited from \code{\link{SCOMClass-class}}}
   \item{progId}{Inherited from \code{\link{SCOMClass-class}}}
  }
}
\section{Extends}{
Class \code{"SCOMEnvironmentClass"}, directly.
Class \code{"SCOMClass"}, by class "SCOMEnvironmentClass".
}
\section{Methods}{
  \describe{
    \item{createCOMObject}{\code{signature(def = "SCOMIDispatch")}: 
     create an instance of the COM server and the associated C++ object
     that makes the server available to clients.}
  }
}
\references{
 \url{http://www.omegahat.org/RDCOMServer}
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}

\seealso{
\code{\link{createCOMObject}}
\code{\link{SCOMIDispatch}}
\code{\link{SCOMEnvironmentClass-class}}
}

\examples{
\dontrun{
 gen = function(mu = 0, sd = 1) {
         list(sample=function(n) rnorm(n, mu, sd),
              quantiles=function(p) qnorm(p, mu, sd)
             )
       }

 def = SCOMIDispatch(gen, "SimpleNormal")
 registerCOMClass(def)
}
}
\keyword{classes}
