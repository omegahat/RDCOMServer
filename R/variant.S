setClass("DCOMVARIANTRef",
	 representation(ref="externalptr",
	                type = "integer",
                        "VIRTUAL"))

setClass("IntegerVARIANTRef", contains = "DCOMVARIANTRef")
setClass("RealVARIANTRef", contains = "DCOMVARIANTRef")
setClass("LogicalVARIANTRef", contains = "DCOMVARIANTRef")


VariantTypeEnum =
 c("EMPTY" = 0, "NULL" = 1, "I2" = 2, I4 = 3, R4 = 4, R8 = 5,
   CY = 6, DATE = 7, BSTR = 8, DISPATCH = 9, 
   ERROR = 10, BOOL = 11, VARIANT = 12, UNKNOWN = 13, DECIMAL = 14,
   I1 = 16, UI1 = 17, UI2 = 18, UI4 = 19, I8 = 20, UI8 = 21, INT = 22, UINT = 23, VOID = 24,
     HRESULT = 25, PTR = 26, SAFEARRAY = 27, CARRAY = 28, USERDEFINED = 29, 
   LPSTR = 30, LPWSTR = 31, RECORD = 36) 

storage.mode(VariantTypeEnum) = "integer"

VariantClasses = c(Integer = 3, Real = 5, Logical = 11)
VariantCoercion = c(Integer = as.integer, Real = as.numeric, Logical = as.logical)

createDynamicVariantReference =
function(val, type, obj = NULL)
{
 if(is.null(obj)) {
   i = match(type, VariantClasses)
   if(is.na(i))
    stop("Unrecognized type for dynamic variant in R")
   klass = paste(names(VariantClasses)[i], "VARIANTRef", sep = "")
   obj = new(klass)
 }

 obj@ref = val
 obj@type = type

 return(obj)
}


setGeneric("getValueOf", function(obj) standardGeneric("getValueOf"))
setGeneric("setValueOf", function(obj, value) standardGeneric("setValueOf"))

setMethod("getValueOf", "DCOMVARIANTRef",
           function(obj) {
              .Call("R_getDynamicVariantValue", obj@ref, PACKAGE = "RDCOMServer")
           })

setMethod("setValueOf", "DCOMVARIANTRef",
           function(obj, value) {
             i =  match(class(obj), paste(names(VariantCoercion), "VARIANTRef", sep = ""))
             if(is.na(i))
              stop("DCOMVARIANTRef class ", class(obj), " not currently supported")

             value = VariantCoercion[[i]](value)
             .Call("R_setDynamicVariantValue", obj@ref, value, PACKAGE = "RDCOMServer")
           })

if(FALSE) {
	#XXX Do we ever use these.
setMethod("$", "DCOMVARIANTRef",
            function(x, name) {
	       if(is.na(pmatch(name,  "value")))
	         stop("Only value is a supported field of a DCOMVARIANTRef object")

               getValueOf(x)
            })

setMethod("$<-", "DCOMVARIANTRef",
            function(x, name, value) {
	       if(is.na(pmatch(name,  "value")))
	         stop("Only value is a supported field of a DCOMVARIANTRef object")

               setValueOf(x, value)

               x
            })
}