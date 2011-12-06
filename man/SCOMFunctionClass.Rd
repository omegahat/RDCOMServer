\name{SCOMFunctionClass}
\alias{SCOMFunctionClass}
\title{Constructor for Simple S-COM definition}
\description{
 This is the constructor function for defining a 
 COM  class in S that consists of a simple list
 of functions and properties that do not share
 state.

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
\usage{
SCOMFunctionClass(functions, properties = character(0), name, help = "", def = new("SCOMFunctionClass"), where = "")
}

\arguments{
  \item{functions}{a named list of functions. The names are the externally accessible 
   method names by which clients access functionality of objects of these classes.}
  \item{properties}{currently a character vector giving the names of S variables in
   the search path that can be accessed by clients.}
  \item{name}{the human-usable name of the COM class}
  \item{help}{a character vector giving description strings for each of the 
    methods (and properties).  Currently not used but will be in the future.}
  \item{def}{an instance of the target S class that is used to represent this definition.
   This is available as an argument to allow constructors for sub-classes to call
   this and supply their own instance to be populated with values.
   }
  \item{where}{currently unused but here for automatic registration.}
}
\details{

}
\value{
 The \code{def} object with slots filled in.

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

}
\keyword{interface}

