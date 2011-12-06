genericCOMHandler <-
#
# The idea is very simple. We present a COM object
# associated with an arbitrary S object and 
# we respond to property requests by looking 
# for named elements either in the object itself
# or in its attributes.
# 
# We can respond to methods by calling the 
# corresponding S function with the object as
# the first argument.
#
function(obj)	
{
  .nameIDs <- integer(0)

  getIDsOfNames <-  function(ids) {

# cat("Looking for ids for", ids, "\n") 
    idx <- match(ids, names(.nameIDs))

     # Any names that aren't there, just add them to the list of known names.
    if(any(is.na(idx))) {
       n <- ids[is.na(idx)]
       tmp <- seq(from = length(.nameIDs) + 1, length = length(n))
       names(tmp) <- n

       .nameIDs <<- c(.nameIDs, tmp)
    }

    as.integer(.nameIDs[ids])
  }


  hasProperty <- 
     function(name) {
       els <- c(names(obj), names(attributes(obj)))
       return(!is.na(match(name, els)))
     }

  getProperty <-
     function(name) {
       if(!is.null(names(obj))) {
         idx <- match(name, names(obj))  
         if(!is.na(idx))
          return(obj[[name]])
       }

       if(!is.null(names(attributes(obj)))) {
         idx <- match(name, names(attributes(obj)))
         if(!is.na(idx))
          return(attr(obj, name))
       }

       NULL
     }

  invoke <- 
    function(id, method, args, namedArgs) {
if(id == 0) {
#  cat("Id of 0 passed to invoke\n")
  return(COMError("DISP_E_MEMBERNOTFOUND", className = c("COMReturnValue", "COMError")))
}

     name <- names(.nameIDs)[id]

# cat("method name", name, "from", id, "\n")
# cat("method name", hasProperty(name),"\n")		
     if(method[2] && hasProperty(name)) {
       val <- getProperty(name)
       return(val)
     }

     if(method[1]) {
        if(exists(name, mode = "function")) {
#          cat("[Generic] Calling", name, "\n")
   	  if(is.null(args))
	    args <- list(obj)
	  else
	    args <- c(obj, args)
          return(do.call(name, args))
	}
     }

     stop("[Generic COM Object::invoke] Can't handle ", name)
   }

   list(Invoke = invoke, GetIDsOfNames = getIDsOfNames)
}
