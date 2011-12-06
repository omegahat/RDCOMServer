registerClassID <-
function(name, clsid = getuuid(), progId = name, appId = NULL, version = "1.0", 
	  dll = system.file("RDCOMEngine.dll", package = "RDCOMServer"),
	  exe = system.file("RDCOM.exe", package = "RDCOMServer"),
	  addClassID = FALSE, useEXE = FALSE,
          check = TRUE,
          rda = NULL, profile = NULL, ...,
          force = FALSE)
{
 if(!require(SWinRegistry)) {
  stop("Cannot register COM class identifier in registry. Install SWinRegistry")
 } 

 if(substring(as.character(clsid),1,1) != "{")
   clsid <- paste("{", toupper(as.character(clsid)), "}", sep="")

  if(useEXE)  {
   dll <- paste(exe, clsid)
   procKey = "LocalServer32"
  } else
    procKey = "InprocServer32"

  dll <- gsub("/", "\\\\", dll)

  if(check) {
    if(isRegistered(name))  {
      id <- lookupCLSIDByName(name)
      if(id != clsid && !force) {
       stop("Mismatch between Class IDs: original registry value ", id, " != ", clsid)
      }
    }
  }

  createRegistryKey("CLSID", clsid)
    setRegistryValue(c("CLSID", clsid), "", value = name)

    if(!is.null(appId)) {
      setRegistryValue(c("CLSID", clsid), "AppID", value=appId)
    }

    createRegistryKey(c("CLSID", clsid), procKey)
    setRegistryValue(c("CLSID", clsid, procKey), "", value=dll)

    if(!is.null(progId)) {
      createRegistryKey(c("CLSID", clsid), "ProgID")
      setRegistryValue(c("CLSID", clsid, "ProgID"),  "", value=progId)
    }

  extraKeys = c(rda = rda, profile = profile, ...)
  for(i in names(extraKeys)) {
    if(!is.null(extraKeys[i])) 
     setRegistryValue(c("CLSID", clsid), i, value=as.character(extraKeys[i]))
  }

# This should be the progId (?)

  createRegistryKey(name)

    createRegistryKey(name, "CLSID")
    setRegistryValue(c(name, "CLSID"), "", value=clsid)

    if(length(version)) {
     createRegistryKey(name, "CurVer")
     setRegistryValue(c(name, "CurVer"), "", value=version)
    }

  names(clsid) <- name
  invisible(clsid)
}

unregisterClassID <-
#
# In the future, if purge = FALSE, then we remove only the
# elements we set in registerClassID and do not just remove
# the entire folders.
#
# progId is only needed if purge = FALSE.
#
function(name, clsid = NULL, progId = name, purge = TRUE)
{
  if(is.null(clsid)) 
    clsid <- getRegistryValue(c(name, "CLSID"), "")

  if(substring(clsid, 1, 1) != "{")
    clsid <- paste("{", toupper(as.character(clsid)), "}", sep="") 

  if(purge) {
     contents <- getRegistry(c("CLSID", clsid))
     deleteRegistryKey(c("CLSID", clsid), asKey = TRUE, recursive = TRUE)
     return(contents)
  } else {
    # stop("Only purge = TRUE is currently supported by unregisterClassID") 
  
      keys = list(createRegistryPath(c("CLSID", clsid, "InprocServer32", ""), isValue = TRUE),
                  createRegistryPath(c("CLSID", clsid, "InprocServer32")),
		  createRegistryPath(c("CLSID", clsid, "LocalServer32", ""), isValue = TRUE),
                  createRegistryPath(c("CLSID", clsid, "LocalServer32")),
		  createRegistryPath(c("CLSID", clsid, "ProgID", ""), isValue = TRUE),
                  createRegistryPath(c("CLSID", clsid, "ProgID")),
                  createRegistryPath(c("CLSID", clsid)),
                  )

      for(i in keys) {
         if(registryKeyExists(i)) {
           if(is(i, "RegistryKeyPath") ||
                 (length(getRegistrySubKeyNames(i)) == 0 && length(getRegistryKeyValues(i)) == 0))
             deleteRegistryKey(i)
         }
      }

    if(FALSE) { # turned off for now.
      keys <- getRegistrySubKeyNames(c("CLSID", clsid))
      for(i in keys)
        deleteRegistryKey(c("CLSID", clsid), i, asKey = TRUE)

      deleteRegistryKey("CLSID", clsid, asKey = TRUE) 

      keys <- getRegistySubKeyNames(name)
      for(i in keys)
       deleteRegistryKey(name, i, asKey = TRUE)

      deleteRegistryKey(name, clsid, asKey = TRUE) 
    }
  }

  TRUE
}

lookupCLSIDByName <-
function(name)
{
  library(SWinRegistry)
  getRegistryValue(c(name, "CLSID"), "")
}

isRegistered <-
function(name)
{
 library(SWinRegistry)	
 if(registryKeyExists(name))
   name <- lookupCLSIDByName(name)

 registryKeyExists(c("CLSID", name))
}

					

