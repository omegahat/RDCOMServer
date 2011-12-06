
 library(RDCOMServer)


g <- function(mu = 0, sigma = 1) 
{
  generic <- function(n, abc=10, k="My string") {
    n + 10
  }

  sample <- function(n) {
     rnorm(as.integer(n), mu, sigma)
  }

  percentile <- function(q, lower = TRUE) {
    pnorm(as.numeric(q), mu, sigma, lower.tail = as.logical(lower))
  }

  quantile <- function(p) {
    qnorm(as.numeric(p), mu, sigma)
  }

  density <- function(x) {
     dnorm(as.numeric(x), mu, sigma)
  }

  deviate <- function() {
    rnorm(1, mu, sigma)
  }

  list(sample = sample, percentile = percentile,
       quantile = quantile, density = density,
       deviate = deviate,
       generic = generic,
       .properties = c("mu", "sigma"),
       .help = c(sample = "generate a sample of values",
                percentile = "CDF values from this distribution",
                quantile = "quantile values from this distribution",
                density = "values of the density function for this distribution"
                ))
}


def = SCOMIDispatch(g, "SNormal")
def@classId = getuuid("c484d2f9-21f5-49ac-8c8d-2007e12245d3")
registerCOMClass(def)
