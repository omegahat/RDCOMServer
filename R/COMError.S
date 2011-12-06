getCOMErrorCode <-
function(name)
{
 .COMErrors[name]
}


COMError <-
function(code, description = "", className = "COMError")
{
  if(is.character(code))
    code <- getCOMErrorCode(code)

  x <- list(code = as.numeric(code), description = description)
  class(x) <- className
  x
}
			