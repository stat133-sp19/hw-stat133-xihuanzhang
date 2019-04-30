#================================================
#Devtools Workflow
#library(devtools)
#Description: Following commands are used to generate my own binomial package
#================================================

devtools::document()          # generate documentation
devtools::check_man()         # check documentation
devtools::test()              # run tests
devtools::build_vignettes()   # build vignettes
devtools::build()             # build bundle
devtools::install()           # install package
devtools::check()             # check


