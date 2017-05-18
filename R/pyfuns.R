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
#' @aliases separate
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
s <- function(string) {

  if (!class(string) == "character" &
      length(string) == 1) {
    stop("separate requires a single string")
  }

  unlist(strsplit(string, "[[:space:]]+"))

}

#' @aliases s
#' @export
separate <- s

#' Pseudo context-manager for connections
#'
#' A \code{with} method for connection objects
#' which closes the connection after evaluation.
#' This is modelled after the common python idiom.
#'
#' @param connection a connection, such as a file
#'   connection created with \code{\link[base]{file}}
#' @param expr expression to evaluate
#'
#' @examples
#' \dontrun{
#' connection <- file("file.csv", "r")
#'
#' with(connection, {
#'   print(connection)
#' })
#'
#' isOpen(connection)
#' }
#'
#' @seealso \code{\link[base]{with}}
#'
#' @keywords connection
#'
#' @export
with.connection <- function(connection, expr) {

  if (!"connection" %in% class(connection)) {
    stop("first argument must be a connection")
  }

  if (!isOpen(connection)) {
    stop("not an open connection")
  }

  eval(substitute(expr), parent.frame())
  close(connection)

  invisible(NULL)
}

#' Check for character within string
#'
#' Simple wrapper that checks if a character
#' or substring has an exact match in a string.
#' Really just a wrapper around \code{grepl}.
#'
#' @param char a character or substring to look
#'   for
#' @param string a string in which to match the
#'   character or substring
#'
#' @examples
#'
#' if ("w" %within% "hello, world!")
#'   print("Found it!")
#'
#' "char" %within% "character string"
#'
#' @export
`%within%` <- function(char, string, ...) {

  if (!class(char) == "character" & class(string) == "character") {
    stop("args must be characters")
  }

  grepl(char, string, ...)
}
