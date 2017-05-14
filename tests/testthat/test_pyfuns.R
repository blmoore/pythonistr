
context("with connections")

connection_error <- "invalid connection"

test_that("with closes file connection when done", {

  file_con <- file("test_df.csv", "r")
  expect_true(isOpen(file_con))

  expect_output(
    pythonistr::with.connection(file_con, {
      print(file_con)
    })
  )

  expect_error(isOpen(file_con), connection_error)
})

test_that("with can iterate line-by-line over a file", {

  file_con <- file("test_df.csv", "r")
  expect_output(
    with(file_con, {
      while (length(line) != 0) {
        line <- readLines(file_con, n = 1)
        print(line)
      }
    })
  )

})

test_that("with works with non-file connections", {

  text_conn <- textConnection(LETTERS)
  expect_output(
    with(text_conn, {
      chars <- scan(text_conn, "")
      print(chars)
    })
  )

  expect_error(isOpen(text_conn), connection_error)
})



