
setClass("SCOMNamedFunctionClass",
	  representation("SCOMClass",
              # can be named character vector to provide aliases for COM view.
              # e.g. functions=c(normal="rnorm", ...)
	                 functions="character",
                         propertyNames="character",
                         properties="list"))

SCOMNamedFunctionClass =
 function(functions, name, ..., propertyNames = character(0),
          help = "", def = new("SCOMNamedFunctionClass"))
{
  def = .initSCOMClass(def, name = name, help = help) 

  def@functions = functions
  if(length(names(def@functions)) == 0)
    names(def@functions) = def@functions
  which = names(def@functions) == ""
  if(any(which))
     names(def@functions)[which] = def@functions[which]

  def@propertyNames = propertyNames
  def@properties = list(...)

  def
}


COMNameManager <-
function(map = integer(0))
{
 if(length(map) && !(is.numeric(map) && !is.null(names(map)))) {
   tmp <- 1:length(map)
   names(tmp) <- as.character(map)
   map <-  tmp
 }


 lookup <-
   function(name) {
 
     if(missing(name))
      return(map)

     if(is.numeric(name)) {
       return(names(map)[name])
     }

     idx <- match(name, names(map))

     if(any(is.na(idx))) {
       n <- name[is.na(idx)]
       orig <- length(map) + 1
       tmp <- seq(from = orig, length = length(n))
       names(tmp) <- n

       map <<- c(map, tmp)        
       idx[is.na(idx)] <- seq(orig,  length = length(n))
     }

cat(name, "=>", idx, "\n")
     as.integer(idx)
   }

  lookup
}



SCOMNamedFunctionDispatch =
#
# Generator for handling IDispatch at the S level.
# 
function(funs, properties, propertyNames, nameMgr = COMNameManager())
{
  isProperty = function(name) {
    name %in% c(names(properties), propertyNames)
  }

  setProperty = function(name, val) {
    if(name %in% names(properties))
      properties[[name]] <<- val
    else if(name %in% propertyNames)
      assign(name, val, envir = globalenv())
  }

  getProperty = function(name) {
    if(name %in% names(properties))
      properties[[name]]
    else if(name %in% propertyNames)
      get(name, envir = globalenv())
  }

  invoke =
   function(id, method, args, namedArgs) {
     if(length(namedArgs)) {
       names(args)[1:length(namedArgs)] = nameMgr(namedArgs)
     }
     args = rev(args)

     methodName = nameMgr(id)

     if(!(methodName %in% names(funs)) &&  any(method[-1])) {
       if(!isProperty(methodName)) 
         return(COMError("DISP_E_MEMBERNOTFOUND", className = c("COMReturnValue", "COMError")))
         
       if(method[2]) {
          getProperty(methodName)
       } else {
          setProperty(methodName, args[[1]])
       }
     } else {
       if(!method[1])
         return(COMError("DISP_E_MEMBERNOTFOUND", className = c("COMReturnValue", "COMError")))
       else
         eval(do.call(funs[methodName], args), envir = globalenv())
     }
  }

  list(Invoke= invoke, GetNamesOfIDs = nameMgr)	
}


setMethod("createCOMObject", "SCOMNamedFunctionClass", 
   function(def) {
     obj = SCOMNamedFunctionDispatch(def@functions, def@properties, def@propertyNames)
    .Call("R_RCOMSObject", obj)
   })
