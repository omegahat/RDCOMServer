.initSCOMClass <-
function(obj, name, help, clsid = NULL)
{
 obj@name = name
 obj@help = help

 if(is.null(clsid)) {
   if(require(Ruuid))
     obj@classId = getuuid()
 }

 invisible(obj)
}


if(FALSE) {	
 # Ignore for now.
SCOMGenericFunctionClass <-
function(functions, name, propertyNames = character(), ..., help = "",
         def = new("SCOMGenericFunctionClass"), where="")
{
 def <- .initSCOMClass(def, name = name, help = help) 
 def@functions = c(normal="rnorm", poisson="rpois", binomial="rbinom")
 def@propertyNames = propertyNames
 def@properties = list(...)
 
 def
}

SCOMEnvironmentClass <-
function(generator, name, help = "", def = new("SCOMEnvironmentClass"), where="")
{
 def <- .initSCOMClass(def, name = name, help = help) 
 def@generator = generator

 def
}
} # FALSE

SCOMFunctionClass <-
function(functions, properties = character(0), name, help = "", def = new("SCOMFunctionClass"), where="")
{
 def <- .initSCOMClass(def, name = name, help = help) 
 def@functions = functions
 def@properties = properties

 def
}

	
SCOMIDispatch <-
function(generator, name, help = "", def = new("SCOMIDispatch"), where="")
{
 def <- .initSCOMClass(def, name = name, help = help) 
 def@generator = generator

 def
}
	

