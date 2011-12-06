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
     call = function(name, ...) {do.call(name, list(...))},
     objects = function(name = 1, ...) {objects(name = name, ...)})


source("extended.S")

def <- SCOMFunctionClass(els, name = "R.Evaluator", def=new("SCOMEngineClass"))
def@classId = getuuid("d09c2736-593e-42c2-f899-c3f91d4e19d2")
registerCOMClass(def, profile=paste(getwd(), "extended.S", sep=.Platform$file.sep))
