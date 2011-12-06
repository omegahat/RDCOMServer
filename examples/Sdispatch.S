#
# An example of an S-COM object that handles the GetIDsOfNames and Invoke
# methods itself at the S level. It is a simple example that emulates 
# what is done in C++ code so does not have any practical importance.
# It does almost illustrate the basic mechanism being implemented in C++ and
# hopefully provides a useful starting place for providing more
# customized dispatch mechanisms.
#
# The caching of IDs is not currently done in the C++ code.
#

gen <- function(...)
{
  funcs <- list(...)

  invoke <-
   function(id, ...) {
      funcs[[id]](...)
   }

   ids <- function(name) {
     el <- match(name, names(funcs))
     if(any(is.na(el)))
       stop("methods not found", name[is.na(el)])

     as.integer(el)
   }

   list(invoke, ids)
}

SCOMIDispatch(gen(foo=function() 101, bar = function(n) { mean(rnorm(n))}))



	