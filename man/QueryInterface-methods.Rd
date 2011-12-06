\name{QueryInterface-methods}
\docType{methods}
\alias{QueryInterface}
\alias{QueryInterface-methods}
\alias{QueryInterface,ANY-method}
\title{A generic function for the QueryInterface method 
   used in DCOM server objects.}
\description{
 This generic function is made available
 so that we can implement different methods
 for specific types of DCOM servers.
 At present, this is only call from
 the C++ code for the \code{RCOMObject} server
 which defers all methods to the corresponding
 R functions.  Derived C++ classes for other servers
 may also call this. Other server classes 
 provide a local implementation of QueryInterface
 or use the built-in version that uses the supplied
 UUIDs that the server implements rather than calling
 this generic R function.
 However, as mentioned, this is present so that 
 new methods can be defined.
}
\section{Methods}{
\describe{
\item{obj = "ANY"}{
  the basic catch-all method that returns FALSE
  indicating that the server does not implement the 
  queried interface.}
}}
\keyword{methods}
\concept{DCOM}
\concept{server}


