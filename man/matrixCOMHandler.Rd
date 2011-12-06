\name{matrixCOMHandler}
\alias{matrixCOMHandler}
\title{COM dispatcher for an S matrix}
\description{
 This is a function that generates suitable
 functions for making an S matrix accessible
 as a COM object.
 It returns a list of functions that have access 
 to the original matrix object and which allow
 client applications to access the values,
 dimensions, etc. of the matrix.
 This function is used when R tries to create
 a COM object when convering a matrix to a COM 
 return value or argument to a COM method. 
}
\usage{
matrixCOMHandler(m)
}
\arguments{
  \item{m}{the original S matrix that is to be expose
  to the COM world}
}
\details{
 This is called by the method for the \code{createCOMObject} 
 function for a matrix object.
 The resulting list of functions is then used
 to create a \code{COMSIDispatchObject} object
 which is passed to the C/C++ code to implement
 the COM object.
}
\value{
 A list of functions which act as methods for the COM
 representation of the matrix.
  \item{values}{return the elements of the matrix as a single array,
    using \code{\link[base]{as.vector}}}
  \item{dim}{return an array of length 2 giving the number of rows and columns of the matrix.}
  \item{column}{return a particular column. This can be called with a scalar or an array 
    identifying the column or columns. These identifiers may be numbers or strings.
    If more than one column is accessed, the result will be another COM  matrix object.}
  \item{row}{same as \code{column} above, but for rows.}
  \item{element}{access a particular element of the matrix, (i,j)}
  \item{nnrow}{the number of rows in the matrix}
  \item{ncol}{the number of columns in the matrix.}
  \item{rownames}{the array of row names, or NULL}
  \item{colnames}{the array of column names, or NULL}
  \item{.properties}{empty character vector.}
}

\seealso{
 \code{\link{createCOMObject}}
 \code{\link{COMSIDispatchObject}}
}
\examples{

}
\keyword{interface}

