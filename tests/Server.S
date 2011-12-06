library(RDCOMServer)

g <- function()
{

  strings <-
   function(n) {
     # Check both single character strings and multi-character strings.
    data(state)
    c(letters[1:(n/2)],  state.name[1:(n/2)])
   }

  reals <-
   function(n) {
     as.numeric(1:n)
   }

  ints <-
   function(n) {
     as.integer(1:n)
   }

  logicals <-
   function(n) {
     as.logical(rep(c(TRUE, FALSE), length = n))
   }

  lists <-
     function(n) {
       list(1:n, as.numeric(1:(n+1)), letters[1:(n-1)])
     }

  argNames <-
    function(n, mean = 0, sd = 1) {

    }


  list(strings = strings, 
       reals = reals,
       ints = ints,
       logicals = logicals,
       lists = lists)
}

def = SCOMEnvironmentClass(g, name = "TestArrays", help = "Testing basic arrays/vectors")
def@classId = getuuid("94987A43-EDE9-4DB9-A793-C7D1530FB8BA")
registerCOMClass(def, registry = FALSE)	

