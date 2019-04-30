library(testthat)

context("tests for Checker functions")

# Test check_prob
test_that("Test if the check_prob works",{
    expect_true(check_prob(0))
    expect_length(check_prob(0.2),1)
    expect_type(check_prob(0.3), "logical")
    
} )

# Test check_trials
test_that("Test if the check_trials works",{
    expect_true(check_trials(5))
    expect_length(check_trials(1),1)
    expect_type(check_trials(13),"logical")
    
})

# Test check_success
test_that("Test if the check_success works",{
    expect_true(check_success(3,9))
    expect_length( check_success(2,10),1)
    expect_type(check_trials(15),"logical")
    
} )



