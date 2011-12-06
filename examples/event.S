library(SWinTypeLibs)

lib = LoadTypeLib("C:\\Program Files\\Microsoft Office\\Office\\EXCEL9.OLB")

i = getElements(lib[["Application"]])[[2]]
funcs = getFuncs(i)

 funcs = funcs[-c(1:7)]

methods = vector("list", length(funcs))
methods[1:length(methods)] = list(function(...){})
names(methods) = names(funcs)

methods[["SheetActivate"]] = function(sheet) {
                               cat("In sheet activate\n")
                             }

methods[["NewWorkbook"]] = function(book) {
                               n = book[["Parent"]][["Workbooks"]][["Count"]]
                               cat("In New workbook: # books", n, "\n")
                             }

methods[["SheetSelectionChange"]] =
                              function(sheet, range) {
                                 cat("Sheet selection changed\n")
                                }

methods[["WorkbookBeforeClose"]] =
                              function(book, cancel) {
                                 cat("Closing workbook\n")
                                }

getEventNameIDs =
function(info)
{
  tmp = names(getFuncs(info))
  el = sapply(tmp, function(x) getNameIDs(x, info))
  names(el) = tmp
  el
}

createCOMEventServer = function(funcs, ids) {
 invoke = 
   function(id, method, args, namedArgs) {
      funcName = names(ids)[which(ids == id)]
      if(length(funcName)) {
        eval(as.call(c(funcs[[funcName]], rev(args))), env = globalenv())
      } else {
	cat("Ignoring event number", id, "\n")
      }
   }

 list(Invoke = invoke, GetNamesOfIDs = NULL)
}

ids = getEventNameIDs(lib[["IAppEvents"]])
