
<!-- README.md is generated from README.Rmd. Please edit that file -->
pythonistr
==========

[![travis\_status](https://travis-ci.org/blmoore/pythonistr.svg?branch=master)](https://travis-ci.org/blmoore/pythonistr) [![codecov](https://codecov.io/gh/blmoore/pythonistr/branch/master/graph/badge.svg)](https://codecov.io/gh/blmoore/pythonistr) [![docs\_badge](https://img.shields.io/badge/docs-latest-blue.svg)](http://blm.io/pythonistr) [![CRAN\_badge](http://www.r-pkg.org/badges/version/pythonistr)](https://cran.r-project.org/package=pythonistry)

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

isOpen(file_conn) # FALSE (well, error)
```

Even better, there's some support for line-by-line processing. In Python you might write:

``` python
with open('log.txt', 'r') as l:
  for line in l:
    print line
    if 'stop' in line:
      break
```

With pythonistr, you could write this as:

``` r
log <- file('log.txt', 'r')
with(log,
  by_line(log, 
    print, # function to apply to each line
    function(l) grepl("stop", l) # stop when true
  )
)
```

### Shortcuts

In python, to instantiate a list of strings with minimal typing you could use:

``` python
l = 'i want a list of words'.split()
```

pythonistr adds `separate` (or `s` for short):

``` r
l <- s("saves you typing and matching quotes")
l
#> [1] "saves"    "you"      "typing"   "and"      "matching" "quotes"
```

### Aliases

If you regularly switch between R and Python you might be used to getting tripped up by `length` vs. `len` but this isn't the only example. For example: which language prefers `reversed` over `rev`? Which implements `sorted` as well as `sort`?

pythonistr includes a few shortcuts to lower the context switching overhead, though it's probably a bad idea to rely on these in normal R programming.
