setGeneric("QueryInterface",
            function(obj, guid) {
              standardGeneric("QueryInterface")
            })

  # The default.
setMethod("QueryInterface", "ANY",
           function(obj, guid) {
             FALSE
           })

	
computeCOMNames <-
#
#  Compute the collection of names used in this collection.
#
function(els)
{
  funcs <- els[sapply(els, is.function)]
  n <- as.character(unlist(sapply(funcs, function(x) names(formals(x)))))

  i <- match(".properties", names(els))
  if(!is.na(i))
   propertyNames <- els[[".properties"]]
  else
   propertyNames <- character(0)

  n <- unique(c(names(funcs), n, propertyNames, ""))
  ans <- 1:length(n)
  names(ans) <- n
  ans
}

COMSIDispatchObject <-
#
# Generator for handling IDispatch at the S level.
# 
function(funs, properties = character(0), guids = character(),
	.propertyEnvironment = environment(funs[sapply(funs, is.function)][[1]]))
{
  if(length(properties))
    funs[[".properties"]] <- properties

  .ids <- computeCOMNames(funs)

  hasProperty <-
   function(name) {
     name %in% funs[[".properties"]]
   }

  getProperty = function(name) get(name, envir = .propertyEnvironment)
  setProperty = function(name, val) assign(name, val, envir = .propertyEnvironment)

  invoke <-
   function(id, method, args, namedArgs) {

     if(length(namedArgs)) {
       names(args)[1:length(namedArgs)] <- names(.ids)[namedArgs]
     }
     args <- rev(args)

     name <- names(.ids)[id]

     if(method[2] && !method[1] && !hasProperty(name)) {
       return(COMError("DISP_E_MEMBERNOTFOUND", className = c("COMReturnValue", "COMError")))
     }
	
        # If the name of the method/property is not in the list of functions
        # and the invocation type is for setting or getting a property,
        # then deal with properties.
     if(!(name %in% names(funs)) &  any(method[-1])) {
       if(method[2])
         return(getProperty(name))
       else
         return(setProperty(name, args[[1]]))
     } else if(method[1]) {
         # we are dealing with a method name.
       f <- funs[[name]]
       eval(as.call(c(f, args)), env = globalenv())
     } else {
         # Looking for an element which corresponds to a function but
         # method[1] is not set so can't call it.
       return(COMError("DISP_E_MEMBERNOTFOUND", className = c("COMReturnValue", "COMError")))
     }
   }

  getIDsOfNames <-
      # Lookup the integer identifier for a vector of names.
    function(ids) {
      i <- match(ids, names(.ids))       
      if(any(is.na(i))) {
        stop(paste("Names not found: ", paste(ids[is.na(i)], collapse=", "), " in ", paste(names(.ids), collapse=", " )))
      }

      .ids[i]
    }


  QueryInterface = function(obj, guid) {
    guid %in% guids
  }

 # Adding a third function means a destructor function.
  obj = list(Invoke = invoke, GetIDsOfNames = getIDsOfNames,
              QueryInterface = QueryInterface)	

  class(obj) = "RDCOMIDispatchServer"
  obj
}
			

