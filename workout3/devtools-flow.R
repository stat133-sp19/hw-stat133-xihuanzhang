# =====================================================
# Devtools Binomial Distribution workflow
#library(devtools)
# Description: The following commands are used to create my own Binomial package
# =====================================================

devtools::document()          # generate documentation
devtools::check_man()         # check documentation
devtools::test()              # run tests
devtools::build_vignettes()   # build vignettes
devtools::build()             # build bundle
devtools::install()           # install package
devtools::check()             # check

