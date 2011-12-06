setGeneric("createCOMObject", function(def) standardGeneric("createCOMObject"))

setMethod("createCOMObject", "SCOMEnvironmentClass", function(def) {
            ptr = .Call("R_RCOMEnvironmentObject", def, PACKAGE="RDCOMServer")
	    new("RDCOMServer", ref = ptr)
   })


internalCreateCOMSObject =
function(obj)	
 .Call("R_RCOMSObject", obj, PACKAGE="RDCOMServer")	
	
setMethod("createCOMObject", "SCOMIDispatch", function(def) {
	     funcs <- def@generator()
             obj <- COMSIDispatchObject(funcs)
             internalCreateCOMSObject(obj)
   })

setMethod("createCOMObject", "matrix", function(def) {
             obj <- COMSIDispatchObject(matrixCOMHandler(def))
             internalCreateCOMSObject(obj)
   })	

# values doesn't really make sense here.
setMethod("createCOMObject", "data.frame", function(def) {
             obj <- COMSIDispatchObject(matrixCOMHandler(def))
             internalCreateCOMSObject(obj)
   })	

setMethod("createCOMObject", "SCOMFunctionClass", function(def) {
             obj <- COMSIDispatchObject(def@functions, def@properties)
             internalCreateCOMSObject(obj)
   })

if(length(findClass("SCOMGenericFunctionClass"))) {
 setMethod("createCOMObject", "SCOMGenericFunctionClass", function(def) {
             obj <- COMSIDispatchObject(def@functions)
             internalCreateCOMSObject(obj)
   })
}

setMethod("createCOMObject", "ANY", function(def) {
             obj <- genericCOMHandler(def)
             internalCreateCOMSObject(obj)
   })

getServerDetails =
function(obj)
{
  .Call("R_RCOMSObjectGetDef", obj, PACKAGE = "RDCOMServer")
}			

setServerDetails =
function(obj, def)
{
  .Call("R_RCOMSObjectSetDef", def, PACKAGE = "RDCOMServer")
}			


getNativeServerClass =
function(obj)
{
   .Call("R_getNativeRDCOMClass", obj, PACKAGE = "RDCOMServer")
}			
	

matrixCOMHandler <-
function(m)
{
 f=list(dim = function() dim(m),
 	column = function(j) m[,j, drop = TRUE],
        row = function(i) m[i,, drop = TRUE],
        element = function(i,j) m[i,j],
        nrow = function() nrow(m),
        ncol = function() nrow(m),
        rownames = function() rownames(m),
        colnames = function() colnames(m),
        .properties = character(0)
       )

 if(is.matrix(m))
   f[["values"]] = function() as.vector(m)
  
 f
}	
