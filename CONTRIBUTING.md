# Contributing to yll

Thank you for considering contributing to `yll`! This document outlines the process for contributing to this package and how you can help improve it.

## How to Contribute

### Reporting Bugs

If you find a bug, please open an issue on [GitHub](https://github.com/AntoineSoetewey/yll/issues) and include:

- A clear and descriptive title
- A minimal reproducible example demonstrating the bug
- The expected behaviour and what actually happened
- Your R session info (output of `sessionInfo()`)

### Suggesting Enhancements

Feature requests are welcome. Please open an issue on [GitHub](https://github.com/AntoineSoetewey/yll/issues) and describe:

- The motivation for the enhancement and the problem it solves
- How you envision the feature working
- Any relevant examples or references

### Submitting Pull Requests

1. Fork the repository and create a new branch from the default branch.
2. Make your changes, following the code style of the existing codebase.
3. Add or update tests in the `tests/` directory as appropriate.
4. Ensure all existing tests pass by running `devtools::test()`.
5. Update documentation if you change or add functionality by modifying the roxygen2 comments in the relevant files under `R/` and regenerating the `.Rd` files (e.g., with `devtools::document()`).
6. Open a pull request against the default branch with a clear description of your changes.

## Code Style

- Follow the [tidyverse style guide](https://style.tidyverse.org/) for R code.
- Use `snake_case` for object and function names in new code.
- For arguments, keep the existing public API conventions:
  - If a function already uses dotted argument names (e.g., `avg.age.death`,
    `discount.rate`), continue to use dotted names for any new or modified
    arguments so the API stays consistent.
  - For new functions, prefer `snake_case` argument names unless matching an
    existing dotted-name API clearly improves consistency.

## Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.
