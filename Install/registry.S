library(SWinRegistry)

createRegistryKey("SOFTWARE", "R-core", .BuiltinKeys[4])
createRegistryKey(c("SOFTWARE", "R-core"), "RDCOMServer", .BuiltinKeys[4])
setRegistryValue(c("SOFTWARE", "R-core", "RDCOMServer"),  "R_HOME", Sys.getenv("R_HOME"), top =.BuiltinKeys[4])