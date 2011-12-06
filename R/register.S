registerCOMClass <-
function(def, clsid = def@classId, registry = TRUE, 
	  rda = getCOMClassDefFileName(), ...)
{
  # This expects no {} around the clsid
 clsid <- gsub("[{}]", "", as.character(clsid))
  
 if(length(rda) == 1)
  rda <- rep(rda, 2)

 defs <- loadCOMClassDefs(rda[1])

 if(is.null(defs))
  defs <- list()

 defs[[toupper(as.character(clsid))]] <- def
 saveCOMClassDefs(rda[2], defs)

 if(registry)
    registerClassID(def@name, clsid, version = def@version, ...)

  TRUE
}

unregisterCOMClass <-
 function(name, clsid = NULL, registry = TRUE,
	  rda = getCOMClassDefFileName())
{
  if(is.null(clsid))
    clsid <- getRegistryValue(c(name, "CLSID"), "")

  if(registry)
    unregisterClassID(name, clsid)

  if(length(rda) == 1)
    rda <- rep(rda, 2)

  defs <- loadCOMClassDefs(rda[1])
  which <- match(id, names(defs))
  if(!is.na(which)) {
     ans <- defs[[which]]
     defs <- defs[-which]
     saveCOMClassDefs(rda[2], defs)
  } else 
     stop("Can't find class definition for CLSID ", id)

  ans   
}

	
saveCOMClassDefs <-
function(fileName, COMDefs)
{
 save(COMDefs, file = fileName)

 TRUE
}

loadCOMClassDefs <-
function(fileName = getCOMClassDefFileName())
{
 if(!file.exists(fileName)) 
   return(NULL)

 library(methods)

 env <- new.env()
 load(fileName, env)
 defs <- get(objects(envir = env)[1], envir=env)

 invisible(defs)
}
