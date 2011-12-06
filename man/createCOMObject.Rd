\name{createCOMObject}
\alias{createCOMObject}
\alias{createCOMObject,SCOMEnvironmentClass-method}
\alias{createCOMObject,SCOMIDispatch-method}
\alias{createCOMObject,SCOMFunctionClass-method}
\alias{createCOMObject,SCOMNamedFunctionClass-method}
\alias{createCOMObject,ANY-method}
\alias{createCOMObject,matrix-method}
\alias{createCOMObject,data.frame-method}
\title{Instantiate S COM Object}
\description{
 This generic function is called when the
 COM mechanism needs to create a COM object.
 This happens in two ways: a) when a client
 attempts to create a new instance of COM class,
 or b) when we convert an S value to a COM object
 as the return value or result from a COM method.
 The different methods for this generic take
 care of interpreting the S object suitably.
 In (a), typically the previously registered
 S description of the COM class is fetched
 from disk using the class UUID in the request
 and a suitable S object and dispatch mechanism
 are generated. 
 In case (b), we rely on there being a suitable
 method for \code{createCOMObject}.
 The default is to create a COM object using
 \code{\link{genericCOMHandler}}.

 Each method must return an S object that is
 simply an external pointer to a C++ object.
 The collection of available C++ classes
 is listed in the regular documentation for this package.
}
\usage{
createCOMObject(def)
}

\arguments{
  \item{def}{an S object either describing the COM class and 
  how to instantiate objects and control the dispatching of methods,
  or a regular S value that needs to be exposed as a dynamic COM object.}
}
\details{
 
}
\value{
 The methods must return an external pointer
 whose contents identify a C++ object that extends
 the \code{RCOMObject} class. 
 Typically, people will use the existing classes
 and modify the code provided in the examples and methods
 in this package. It is possible to introduce new C++ classes
 that control the dispatching in different ways or offer
 different interfaces. 
}
\references{
 \url{http://www.omegahat.org/RDCOMServer}
 \url{http://www.omegahat.org/SWinRegistry}
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}

\seealso{
 \code{\link{genericCOMHandler}}
 \code{\link{COMSIDispatchObject}}
}

\examples{

}
\keyword{interface}

