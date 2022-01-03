test_that("Is not leap year", {
  expect_error(is_leap_year(2017), TRUE)
  expect_error(is_leap_year(1900), TRUE)
})