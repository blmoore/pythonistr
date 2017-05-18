## Helpers and misc functions

#' Iterate over a connection by line
#'
#' Apply a function line-by-line to a connection,
#' such as an open file connection. This allows
#' simple processing without loading the entire
#' file to memory, something like the common
#' \code{for line in file: ...} approach in python.
#'
#' @param connection an open connection, such as a
#'   text connection as created by \code{\link[base]{file}}
#' @param FUN a function to apply to each line
#'   that can be read from the connection
#' @param STOP a function to generate a stop condition
#'   for reading lines of the connection
#' @param safe auto-stop iteraction on reaching an
#'   empty line in the connection (attempts to prevent
#'   infinite loops)
#' @param ... extra arguments passed to \code{FUN}
#'
#' @examples
#' \dontrun{
#' file <- file("myfile.txt", "r")
#'
#' # use with for automatic connection closing
#' with(file, {
#'   # read and print each line sequentially
#'   by_line(file, print)
#' })
#'
#' # stop reading after finding the word 'stop'
#' connex <- file("logfile.txt", "r")
#' by_line(connex, cat, function(line) grepl(line, "stop"))
#' close(connex)
#' }
#'
#' @export
by_line <- function(connection, FUN, STOP,
  safe = TRUE, max_lines = 0, ...) {

  FUN <- match.fun(FUN)

  # Default stop condition is empty line / EOF
  if (!missing(STOP)) {
    STOP <- match.fun(STOP)
  } else {
    STOP <- function(x) FALSE
  }

  # validate connection
  if (!"connection" %in% class(connection)) {
    stop("first argument must be a connection")
  }

  if (!isOpen(connection)) {
    stop("connection is not open")
  }

  output <- NULL
  loop <- TRUE
  loop_counter <- 0
  while (loop) {
    line <- readLines(connection, n = 1, skipNul = TRUE)

    # test for custom stop condition
    stop_condition <- forceAndCall(1, STOP, line)
    # message("stop condition", stop_condition)
    if (stop_condition) {
      loop <- FALSE
    }

    if (max_lines != 0 & loop_counter >= max_lines) {
      break
    }

    # help prevent infinite loops, exit on empty line
    if (safe & length(line) == 0) {
      break
    }

    # first time setup output object, no way to
    # pre-allocate if going line-by-line
    if (is.null(output)) {
      output <<- forceAndCall(1, FUN, line, ...)
    } else {
      if (length(output) > 1) {
        output <<- dplyr::combine(output, forceAndCall(1, FUN, line, ...))
      } else {
        output <<- c(output, forceAndCall(1, FUN, line, ...))
      }
    }

    # message("cmd output:", output)
  }
  output
}
