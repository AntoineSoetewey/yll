#' Compute average years of life lost (YLL)
#'
#' \code{avg_yll} computes the average expected years of life lost (YLL), given
#' the number of deaths, the average age of death and the standard life
#' expectancy.
#'
#' \code{avg_yll} computes the average expected years of life lost (YLL). The
#' average YLL, which highlights premature causes of death and brings attention
#' to preventable deaths is computed by dividing the standard YLL by the number
#' of deaths (Aragon et al., 2008). The number of deaths, the average age of
#' death and the standard life expectancy at least must be provided (as numeric
#' vectors). Other arguments are provided to incorporate time discounting and
#' age weighting.
#'
#' @param ndeaths Number of deaths (numeric).
#' @param avg.age.death Average age of death (numeric).
#' @param life.expectancy The interpolated life expectancy at that age. In other
#'   words, the expected remaining number of years to live (numeric).
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
#' @seealso \code{\link{yll}} for the standard measure of years of life lost.
#'
#' @examples
#' # For 100 deaths with an average age of death of 60 years
#' # and an expected remaining number of years to live of 20 years:
#'
#' avg_yll(100, 60, 20)
#'
#' # Without discounting:
#'
#' avg_yll(100, 60, 20, discount.rate = 0)
#'
#' \dontrun{
#' avg_yll("a", "b", "c") # arguments must be numeric
#' avg_yll(100) # avg.age.death and life.expectancy are missing,
#' # with no default
#' avg_yll(100, 60) # life.expectancy is missing,
#' # with no default
#' }
#'
#' @author Antoine Soetewey \email{antoine.soetewey@@uclouvain.be}

# Set the function to compute YLL
avg_yll <- function(ndeaths, avg.age.death, life.expectancy,
                discount.rate = 0.03, beta = 0.04,
                modulation = 0, adjustment = 0.1658){
  # abbreviate inputs
  N <- ndeaths;         a <- avg.age.death
  L <- life.expectancy; r <- discount.rate
  b <- beta;         K <- modulation
  CC <- adjustment
  # do calculations
  if(discount.rate==0){
    (N*(K*CC*((exp(-b*a))/b^2)*((exp(-b*L))*
                                 (-b*(L+a)-1)-(-b*a-1))+((1-K)*L)))/N
  } else {
    (N*(K*((CC*exp(r*a))/(-(r+b)^2))*((exp(-(r+b)*(L+a))*(-(r+b)*
                                                           (L+a)-1))-(exp(-(r+b)*a)*(-(r+b)*a-1)))+((1-K)/r)*((1-exp(-r*L)))))/N
  }
}
