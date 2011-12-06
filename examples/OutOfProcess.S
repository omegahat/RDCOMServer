# This register an R server as an out of process
# version that use an executable and not a DLL.
#
# See OutOfProcess.pl for an example client.

library(RDCOMServer)

els <- 
 list(
     get=get, 
     set = function(name, value, pos = globalenv(), ...) { 
             assign(name, value, pos = pos); 
             TRUE
           }, 
     exists = exists,
     evaluate = function(cmd) {
        e <- parse(text = cmd)
	eval(e)	
     },
     library = library,
     search = search,
     print = function(x, ...) {print(get(x), ...); NULL},
     objects = function(..., env = globalenv()) { objects(..., envir = env)})


def <- SCOMFunctionClass(els, name = "R.ExternalEvaluator")
def@classId = getuuid("DC6FA172-0224-4b56-B571-8BB35564F2D4")
registerCOMClass(def, registry = FALSE)
registerClassID(def@name, def@classId, def@progId, useEXE = TRUE)
