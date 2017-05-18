
context("line iterator")

test_that("by_line applies functions line-by-line", {

  file <- file("test_df.csv", "r")
  expect_output(
    with(file, {
      by_line(file, function(l) print(l))
    })
  )

  # bare function without args
  file <- file("test_df.csv", "r")
  expect_output(
    with(file, {
      by_line(file, print)
    })
  )

  expect_error(isOpen(file))
})

test_that("by_line handles functions like apply", {

  # not implemented
  # expect_false(TRUE)

})
