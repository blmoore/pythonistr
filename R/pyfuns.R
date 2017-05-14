## Python-inspired R functions

#' Separate a string into words
#'
#' Split a space-delimited string into
#' a character vector of words, this saves
#' a bit of typing and quote-matching similar
#' to \code{'list of strings'.split()} in
#' python.
#'
#' @param string a spaced character string to be
#' split into a word vector
#'
#' @usage
#' s(string)
#' separate(string)
#'
#' @examples
#' df <- data.frame(a = s("chr1 chr2 chrMT"),
#'                  b = 1:3,
#'                  c = 5:7)
#'
#' colnames(df) <- s("chr start end")
#' df
#'
#' # separate is an alias for s
#' separate("split this string")
#'
#' @export
s <- separate <- function(string) {

  if (!class(string) == "character" &
      length(string) == 1) {
    stop("separate requires a single string")
  }

  unlist(strsplit(string, "[[:space:]]+"))

}
