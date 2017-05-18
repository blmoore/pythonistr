## Aliases to lessen the pain of Python -> R context switching

#' Python-inspired aliases for R functions
#'
#' These are some aliases for R function which are
#' more in line with Python equivalents.
#'
#' @name aliases
#'
#' @examples
#' # python abbreviates to len, R is lengthier
#' base::length(1:5)
#' len(1:5)
#'
#' # for rev the trend is reversed
#' base::rev(5:1)
#' reversed(5:1)
#'
#' # returns a sorted copy
#' base::sort(sample(1:5))
#' sorted(sample(1:5))
#'
#' # don't really use these...
#' identical(False, FALSE)
#' isTRUE(True)

#' @rdname aliases
#' @export
len <- length

#' @rdname aliases
#' @export
reversed <- rev

#' @rdname aliases
#' @export
sorted <- sort

#' @rdname aliases
#' @export
True <- TRUE

#' @rdname aliases
#' @export
False <- FALSE

