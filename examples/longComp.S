library(RDCOMServer)

Count =
function(verbose = TRUE) {
    ctr = 0
    foo = file("foo", "w")    
    while(TRUE) {
       ctr = ctr + 1
       if(verbose && (ctr %% 1000) == 0) {
          cat("Counter", ctr, "\n", file = stderr())
          flush(foo)
       }
    }
   close(foo)
}

def = SCOMFunctionClass(functions = list(Count=Count, Get=function() 10.1),
     			     name = "longComp",
			     help = ""
			    )

def@classId = getuuid("a06944db-7b30-4f91-c1b2-fdc8d81a76a6")	
	
registerCOMClass(def)
