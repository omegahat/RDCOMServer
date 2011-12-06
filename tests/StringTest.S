library(RDCOMServer)
def = SCOMFunctionClass(list(WithString=function(str) {print(str); nchar(str)}), name = "StringRef", help = "Testing string references")
def@classId = getuuid("af95a273-d64c-4de4-7ba0-315ce8226ff5")
registerCOMClass(def)

