% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pyfuns.R
\name{with.connection}
\alias{with.connection}
\title{Pseudo context-manager for connections}
\usage{
\method{with}{connection}(connection, expr)
}
\arguments{
\item{connection}{a connection, such as a file
connection created with \code{\link[base]{file}}}

\item{expr}{expression to evaluate}
}
\description{
A \code{with} method for connection objects
which closes the connection after evaluation.
This is modelled after the common python idiom.
}
\examples{
\dontrun{
connection <- file("file.csv", "r")

with(connection, {
  print(connection)
})

isOpen(connection)
}

}
\seealso{
\code{\link[base]{with}}
}
\keyword{connection}
