\name{SCOMFunctionClass-class}
\docType{class}
\alias{SCOMFunctionClass-class}
\title{COM definition using named function list}
\description{
This class allows one to define different COM classes by grouping S
function objects together that act as methods.  These functions can
but need not share an environment.  The key thing is that they are
shared across different instances of the COM class, unlike
\code{SCOMEnvironmentClass-class} servers which have different
instances of the functions and their environments for each object.

 Unlike the \code{\link{SCOMIDispatch}} constructor,
 this definition does not have a generator function
 but instead re-uses the list of functions for each
 COM object that is created for this  class.
 In this way, they cannot share state.

 The properties are currently accessed as variables in
 the global environment and are specified simply as variable
 names. A variant of this class will allow them to be local to
 the object and specified as a list.

}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("SCOMFunctionClass", ...)}.
}
\section{Slots}{
  \describe{
    \item{\code{functions}:}{Object of class \code{"list"}
   this is a named list of functions. The names are used to identify the
   methods when dispatching the invocation by COM clients.
   The methods are implemented by the particular functions.
   The functions can share an environment, however there is no generator
   function to create separate instances of these functions for each COM
   object. Thus the environment would be shared across all objects, i.e. static
   methods.}
    \item{\code{properties}:}{Object of class \code{"character"}
       this is a vector giving the names of the top-level/global
     variables that are to be made accessible as properties
     of the COM server.
   }


   \item{classId}{Inherited from \code{\link{SCOMClass-class}}}
   \item{guids}{Inherited from \code{\link{SCOMClass-class}}}
   \item{help}{Inherited from \code{\link{SCOMClass-class}}}
   \item{version}{Inherited from \code{\link{SCOMClass-class}}}
   \item{name}{Inherited from \code{\link{SCOMClass-class}}}
   \item{progId}{Inherited from \code{\link{SCOMClass-class}}}

  }
}
\section{Extends}{
Class \code{"SCOMClass"}, directly.
}
\section{Methods}{
  \describe{
    \item{createCOMObject}{\code{signature(def = "SCOMFunctionClass")}:
     a method that creates an instance of this server
     as a C++ object along with a dispatch function to invoke the
     methods in the \code{functions} list.  }
  }
}
\references{
 \url{http://www.omegahat.org/RDCOMServer}
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}


\seealso{
 \code{\link{createCOMObject}}
 \code{\link{SCOMEnvironmentClass-class}}
 \code{\link{SCOMNamedFunctionClass-class}}
}

\examples{

}
\keyword{classes}
