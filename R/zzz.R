.COMErrors = numeric()
.onLoad <- .First.lib <-
function(lib, pkg)
{
 .COMErrors <<- .Call("R_createCOMErrorCodes", PACKAGE = pkg)
}
