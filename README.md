
<!-- README.md is generated from README.Rmd. Please edit that file -->
`yll` - Why should I use it?
============================

The purpose of the package `yll` is to easily compute the standard expected years of life lost (YLL), as developed by the Global Burden of Disease Study (Murray, C.J., Lopez, A.D. and World Health Organization, 1996). The YLL is based on comparing the age of death to an external standard life expectancy curve. The goal of the package `yll` is also to easily compute the average YLL, which highlights premature causes of death and brings attention to preventable deaths (Aragon et al., 2008).

Installation
------------

You can install the released version of `yll` from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("yll")
```

and load the package with:

``` r
library(yll)
```

Examples - How do I use it?
---------------------------

To compute the YLL or the average YLL, you need at least:

-   the number of deaths,
-   the average age of death, and
-   the life expectancy at that age. In other words, the expected remaining number of years to live.

Other arguments (*i.e.*, `discount.rate`, `beta`, `modulation` and `adjustment`) have default values and are thus not obligatory. However, you can still always modify them by specifying the argument and the desired value. See also the help documentation of the package by calling `?yll` or `?avg_yll` in R.

Below examples of both functions included in the package.

### The years of life lost - `yll()`

For instance, imagine there are 100 deaths with an average age of death of 60 years and an expected remaining number of years to live of 20 years, the `yll()` function included in the `yll` package would look like this:

``` r
res <- yll(100, 60, 20)
res
#> [1] 1503.961
```

The standard expected years of life lost in our case is thus 1503.96 years. This includes a discounting rate of 0.03 (default rate). To perform the same computation without discounting rate, you specify `discount.rate = 0` in the argument of the `yll()` function:

``` r
res <- yll(100, 60, 20, discount.rate = 0)
res
#> [1] 2000
```

The standard expected years of life lost without discounting is now 2000 years.

### The average years of life lost - `avg_yll()`

It is also possible to compute the average years of life lost, thanks to the function `avg_yll()` included in the `yll` package. Compared to the standard YLL, the average YLL highlights premature causes of death and brings attention to preventable deaths. Mathematically, it is found by dividing the standard YLL by the number of deaths. It can, however, be easily computed via the function `avg_yll()`:

``` r
res <- avg_yll(100, 60, 20)
res
#> [1] 15.03961
```

Again, this includes a discount rate of 0.03. To remove the discount rate, set it to 0:

``` r
res <- avg_yll(100, 60, 20, discount.rate = 0)
res
#> [1] 20
```

#### References

Aragon, T. J., Lichtensztajn, D. Y., Katcher, B. S., Reiter, R., & Katz, M. H. (2008). Calculating expected years of life lost for assessing local ethnic disparities in causes of premature death. *BMC public health, 8*(1), 116.

Murray, C. J., Lopez, A. D., & World Health Organization. (1996). The global burden of disease: a comprehensive assessment of mortality and disability from diseases, injuries, and risk factors in 1990 and projected to 2020: summary.
