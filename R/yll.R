#' Compute years of life lost (YLL)
#'
#' \code{yll} computes the standard expected years of life lost (YLL), given the
#' number of deaths, the average age of death and the standard life expectancy.
#'
#' \code{yll} computes the standard expected years of life lost (YLL) as
#' developed by the Global Burden of Disease Study (Murray, C.J., Lopez, A.D.
#' and World Health Organization, 1996). The YLL is based on comparing the age
#' of death to an external standard life expectancy curve (Aragon et al., 2008).
#' The number of deaths, the average age of death and the standard life
#' expectancy at least must be provided (as numeric vectors). Other arguments
#' are provided to incorporate time discounting and age weighting.
#'
#' @param ndeaths Number of deaths (numeric).
#' @param avg.age.death Average age of death (numeric).
#' @param life.expectancy The interpolated life expectancy at that age. In other
#'   words, the expected remaining number of years to live if the person would
#'   have lived (numeric).
#' @param discount.rate Discount rate (default is set to 0.03) (numeric).
#' @param beta Age-weighting constant (default is set to 0.04) (numeric).
#' @param modulation Age-weighting modulation constant (= 0, no weighting; = 1,
#'   weighting, default is set to 0) (numeric).
#' @param adjustment Adjustment constant for age-weights (default is set to
#'   0.1658) (numeric).
#'
#' @return Since all inputs are numeric vectors, the output will be a numeric
#'   vector.
#'
#' @references Aragon, T. J., Lichtensztajn, D. Y., Katcher, B. S., Reiter, R.,
#'   & Katz, M. H. (2008). Calculating expected years of life lost for assessing
#'   local ethnic disparities in causes of premature death. \emph{BMC public
#'   health, 8}(1), 116.
#'
#' @seealso \code{\link{avg_yll}} for the average years of life lost.
#'
#' @examples
#' # For 100 deaths with an average age of death of 60 years
#' # and an expected remaining number of years to live of 20 years:
#'
#' yll(100, 60, 20)
#'
#' # Without discounting:
#'
#' yll(100, 60, 20, discount.rate = 0)
#'
#' \dontrun{
#' yll("a", "b", "c") # arguments must be numeric
#' yll(100) # avg.age.death and life.expectancy are missing,
#' # with no default
#' yll(100, 60) # life.expectancy is missing,
#' # with no default
#' }
#'
#' @author Antoine Soetewey \email{antoine.soetewey@@uclouvain.be}

# Set the function to compute YLL
yll <- function(ndeaths, avg.age.death, life.expectancy,
                discount.rate = 0.03, beta = 0.04,
                modulation = 0, adjustment = 0.1658){
  # abbreviate inputs
  N <- ndeaths;         a <- avg.age.death
  L <- life.expectancy; r <- discount.rate
  b <- beta;         K <- modulation
  CC <- adjustment
  # do calculations
  if(discount.rate==0){
    N*(K*CC*((exp(-b*a))/b^2)*((exp(-b*L))*
                                 (-b*(L+a)-1)-(-b*a-1))+((1-K)*L))
  } else {
    N*(K*((CC*exp(r*a))/(-(r+b)^2))*((exp(-(r+b)*(L+a))*(-(r+b)*
                                                           (L+a)-1))-(exp(-(r+b)*a)*(-(r+b)*a-1)))+((1-K)/r)*((1-exp(-r*L))))
  }
}
