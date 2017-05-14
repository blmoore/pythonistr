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
#' len(1:5)
#'
#' # for rev the trend is reversed
#' reversed(5:1)
#'
#' # sorted
#' sorted(sample(1:5))

#' @rdname aliases
#' @export
len <- length

#' @rdname aliases
#' @export
reversed <- rev

#' @rdname aliases
#' @export
sorted <- sort


