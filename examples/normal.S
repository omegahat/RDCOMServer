# Example of using environments

library(RDCOMServer)
	
g <- function() 
{
  mu <- 0
  sigma <- 1

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
       setMu = function(x) mu <<- x,
       setSigma = function(x) sigma <<- x,
       .properties = c("mu", "sigma"),
       .help = c(sample = "generate a sample of values",
                percentile = "CDF values from this distribution",
                quantile = "quantile values from this distribution",
                density = "values of the density function for this distribution"
                ))
}

normal = SCOMIDispatch(g, name = "Normal", help = "Normal distribution object for generating samples, quantiles, etc.")
normal@classId = getuuid("D9972BC3-F8CD-4079-8DA7-11693DF8162C")
registerCOMClass(normal) # , registry = FALSE) 