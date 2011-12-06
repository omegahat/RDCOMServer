getCOMClassDefFileName <-
function()
{
  val = ""
  if("RCOMClassFile" %in% names(options()))
    val = options()[["RCOMClassFile"]]

  if(length(val) && val != "")
   return(val)
  
  val = Sys.getenv("R_COM_CLASS_FILE")
  if(val != "")
    return(val)

   # Why not system.file("RCOMClasses.rda", package = "RDCOMServer")
  paste(.find.package("RDCOMServer"), "RCOMClasses.rda", sep = .Platform$file.sep)
}

GetCOMClassDef <-
function(clsid, rda = getCOMClassDefFileName(), verbose = FALSE)	
{
  # Look for an agreed on entries in the registry for this CLSID
  # to see if we should load the class definition object from
  # elsewhere. If we can, then load it and return.
  # Check if a key exists.
  
 if(verbose)	
   cat("Looking for CLSID", clsid, "\n")


 if(require(SWinRegistry)) {

   # patch up the clsid with { } in case we are given it with no { }, i.e. from Ruuid.
  if(substring(clsid, 1,1) != "{") 
   clsid <- paste("{", clsid, "}", sep="")


   # See if there are any entries in the CLSID's folder
   # in the registry indicating how to create an object.

# registryKeyExists(c("CLSID", clsid, "profile"))
  tmp = getRegistryValue(c("CLSID", clsid), "profile", isError = FALSE)
  if(!is.na(tmp) && tmp != "") {
    if(file.exists(tmp))
      source(tmp)
    else {
      e = try(parse(text = tmp))
      if(!inherits(e, "try-error"))
	eval(e, envir = globalenv())
    }
  }

  tmp = getRegistryValue(c("CLSID", clsid), "rda", isError = FALSE)
  if(!is.na(tmp) && tmp != "") {
     env = new.env()
       # Want this to be a URI.
     tmp = getRegistryValue(c("CLSID", clsid), "rda")
     val = try(load(tmp, envir = env)) 
     if(!inherits(val, "try-error")) {
	val = get(val[1], envir = env)
        return(val)
     } else {
      cat("Couldn't load RDA file", tmp, "\n")
     }
  } else {
    tmp = getRegistryValue(c("CLSID", clsid), "Svariable", isError = FALSE)
    if(!is.na(tmp) && tmp != "")  {
       val = get(tmp)
       return(val)
    }
  }
 } else
   cat("Can't load SWinRegistry package\n")

 if(substring(clsid, 1,1) == "{") {
   clsid <- substring(clsid, 2, nchar(clsid)-1)
 }

 defs <- loadCOMClassDefs(rda)

 clsid <- toupper(clsid)
 which <- match(clsid, names(defs))
 if(is.na(which)) {
   stop("No COM class definition for class ID ", clsid, ".  Available UUIDs known to R", paste(names(defs), collapse=", "))
 }

 def <- defs[[which]]

 if(verbose && !is.null(def)) 
   cat("Found definition for CLSID", clsid, " ", def@name, "\n")

 def
}

