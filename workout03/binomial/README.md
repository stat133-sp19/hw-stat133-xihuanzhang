# Overview

`"binomial"` is a self-created R package that implements functions for calculating probabilities of a Binomial random variable, and related calculations such as the probability distribution, and expected value, variance, etc.

## Steps

##### 1) Calculate the number of different combinations given certain number of trials and successes.


##### 2) Find the probability given certain number of trials and successes



##### 3) obtain a dataframe given certain number of trials and successes



##### 4) Plot the histogram of above dataframe



##### 5) Calculate the cumulative probability



##### 7) Create binomial variable using given number of trials and successes



##### 8) Obtain a summary of binomial variable above



##### 9) Calculate several statistics of binomial variable above

`bin_mean` gives the mean of given binomial distribution.    
`bin_variance` gives the variance of given binomial distribution.    
`bin_mode` gives the mode of given binomial distribution.         
`bin_skewness` gives the skewness of given binomial distribution.        
`bin_kurtosis` gives the kurtosis of given binomial distribution.  




## Motivation

This package is used to illustrate the usage and concepts of binomial package.

## Installation

Install the development version from GitHub via the package `"devtools"`:

```r
# development version from GitHub:
#install.packages("devtools") 
# install "binomial" (without vignettes)
devtools::install_github("stat133-sp19/hw-stat-133-XihuanZhang/binomial")
# install "binomial" (with vignettes)
devtools::install_github("stat133-sp19/hw-stat-133-XihuanZhang/binomial", build_vignettes = TRUE)
```

## Usage


step 1) loading the package using library(binomial)


step 2) test the functions

step 3) provide desired number of trials, number of sucesses and probability for one single trial.

step 4) the binomial package will return the results corresponding to given inputs


The content below provides some specific examples using binomial package



```{r}
#for example, we play 5 times and expect 2 successes

bin_choose(n=5,k=2)




#We generate the bin_probability function using bin_choose function above. Using the functions below, we can calculate the probability of winning 2 times in 5 trials with success probability of 0.5 for each single trial.

bin_probability(success = 2, trials = 5, prob = 0.5)




#Using given number of trials and successes, we can obtain a data frame containing all the results(probability) corresponding to consequtive number of trials from 0 to the given number of trials

dis1 <- bin_distribution(trials = 5, prob = 0.5)
dis1




#plot the data frame above
plot(dis1)



#Using given number of trials and successes, we can obtain a data frame containing all the results(probability and cumulative probability) corresponding to consequtive number of trials from 0 to the given number of trials

bin_cum<- bin_cumulative(trials = 5, prob = 0.5)
bin_cum



#plot the bin_cum we obtained above.
plot(bin_cum)


#obtian some statistics of our generated binomial variables

bin_mean(10,0.5)
bin_variance(10,0.5)
bin_mode(10,0.5)
bin_skewness(10,0.5)
bin_kurtosis(10,0.5)

```
