
library(RDCOMServer)

def = SCOMNamedFunctionClass(functions = c(normal="rnorm", poisson="rpois", binomial="rbinom"),
     			     name = "RNG",
			     help = "Generate values from probability distributions"
			    )

def@classId = getuuid("73335FBC-CAE2-4C1A-A7B5-1213E6F930D1")	
	
registerCOMClass(def)
