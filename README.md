
<!-- README.md is generated from README.Rmd. Please edit that file -->

pythonistr
==========

[![Travis-CI Build Status](https://travis-ci.org/blmoore/pythonistr.svg?branch=master)](https://travis-ci.org/blmoore/pythonistr) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/pythonistr)](https://cran.r-project.org/package=pythonistry)

pythonistr brings over a few ideas from the python language into R.

Install
-------

Install from github with:

``` r
devtools::install_github("blmoore/pythonistr")
```

Usage
-----

### Python functions

Python has a great context management system that closes file connections when they fall out of scope:

``` python
with open('file.csv', 'r') as f:
  for line in f:
    print(line)
```

Pythonistr adds a `with` method to connections which mirrors this behaviour:

``` r
file_conn <- file("file.csv", "r")
with(file_conn, {
  while (length(line) != 0) {
    line <- readLines(file_conn, n = 1)
    print(line)
  }
})
```

### Aliases

If you regularly switch between R and Python you might be used to getting tripped up by `length` vs. `len` but this isn't the only example.

Let's play Python or R:

-   `rev` vs. `reversed`?
-   `sort` or `sorted`?
