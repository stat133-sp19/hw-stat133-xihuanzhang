# Binomial Related Functions

# 1.1
# Check probability value function
# Description: Check if the probability value is valid
# Param: prob  The Probability that we check whether is valid (numeric)
# Return: a logical vector of whether prob is a valid probability
library(ggplot2)
check_prob <- function(prob){
  if(prob<=1 & prob >= 0){
    return(TRUE)
  }else{
    stop("invalid prob value")
  }
}


# Check trials value function
# Description: Check if the trials value is valid
# Param: trials  The parameter that we check whether is valid or not
# Return: A logical vector of whether prob is a valid probability
check_trials <- function(trials){
  if((trials >= 0) & (trials%%1 == 0 )){
    return(TRUE)
  }else{
    stop("invalid trials value")
  }

}

# Check success value function
# Description: Check if the success value is valid
# Param: success The success value that we check whether is valid
# Param: trials  The trials value that we check whether is valid
# Return: A logical vector of whether the success is a valid probability
check_success <- function(success,trials){
  if(success>=0 & (success%%1 == 0) & success<= trials){
    return(TRUE)
  }else{
    stop("invalid success value")
  }
}

# 1.2
# Auxillary Mean function
# Description: Compute the expected value of the binomial distribution
# param: trials Number of trials in the binomial distribution
# param: prob Probability of success in the binomial distribution
#return the expected value of binomial distribution
#examples
#aux_mean(10, 0.3)
aux_mean <- function(trials, prob){
  return(trials*prob)
}

# Auxillary variance function
# Description: Compute the variance of the binomial distribution
# param: trials Number of trials in the binomial distribution
# param: prob Probability of success in the binomial distribution
# Return the variance of binomial distribution
#examples
#aux_variance(10, 0.3)
aux_variance <- function(trials, prob){
  return(trials*prob*(1-prob))
}



# Auxillary Mode function
# Description: Compute the mode of the binomial distribution
# param: trials Number of trials in the binomial distribution
# param: prob Probability of success in the binomial distribution
# Return the mode of binomial distribution
#examples
#aux_mode(10, 0.3)
aux_mode <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  m <- trials*prob+prob
  if(prob == 0){
      return(0)
     }else if(prob == 1){
      return(trials)
  }else if(!grepl("\\.", as.character(m))){
    return(c(m-1, m))
  }else{
    return(as.integer(m))
  }
}


 # Auxillary Skewness function
# Description: Compute the skewness of the binomial distribution
# param: trials Number of trials in the binomial distribution
# param: prob Probability of success in the binomial distribution
# Return the skewness of binomial distribution
#examples
#aux_skewness(10, 0.3)
aux_skewness <- function(trials, prob){
  skewness = (1-2*prob)/sqrt(trials * prob * (1- prob))
  return(skewness)
}


# Auxillary Kurtosis function
# Description: Compute the kurtosis of the binomial distribution
# param: trials Number of trials in the binomial distribution
# param: prob Probability of success in the binomial distribution
# Return the kurtosis of binomial distribution
#examples
#aux_kurtosis(10, 0.3)
aux_kurtosis <- function(trials, prob){
  kurtosis= (1 - 6 * prob * (1-prob) )/(trials * prob * (1-prob))
  return(kurtosis)
}

# 1.3
#' @title binomial choose function
#' @description calculates the number of combinations in which k successes can occur in n trials
#' @param n number of trials
#' @param k number of success
#' @return the number of combinations in which k successes can occur in n trials
#' @export
#' @examples
# bin_choose(n = 5, k = 2)
# bin_choose(5,0)
# bin_choose(5,1:3)
#' @export
bin_choose <- function(n,k){
  if(k>n){
    stop("k cannot be greater than n")
  }else{
    return(factorial(n)/(factorial(k)*factorial(n-k)))
  }
}

# 1.4
#' @title Binomial Probability
#' @description Calculates probability given certain number of successes, probability and trials
#' @param trials Number of trials  (numeric)
#' @param success Number of successes (numeric)
#' @param prob Probability of success in one trial (numeric)
#' @return Returns the probability given certain number of successes, probability and trials
#' @export
#' @examples
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#' bin_probability(success = 55, trials = 100, prob = 0.45)
#' @export
bin_probability <- function(success, trials, prob){
  if(check_trials(trials)!= TRUE){
    stop("invalid trials value")
  }else if(check_prob(prob) != TRUE){
    stop("invalid probability value")
  }else if(check_success(success, trials) != TRUE){
    stop("invalid success value")
  }else{
    bin_choose(trials, success)*(prob^(success))*((1-prob)^(trials-success))
  }
}


# 1.5
#' @title binomial distribution function
#' @description calculates the probability of different number of success trials
#' @param trials number of trials
#' @param prob success rate of each trials
#' @return A data frame with number of success and its probability
#' @export
#' @examples
#' bin_distribution(trials = 5, prob = 0.5)



bin_distribution <- function(trials,prob){
  probability <- c()
  if (check_trials(trials) & check_prob(prob)) {
    for (i in c(0:trials)) {
      probability[i+1] = bin_probability(i,trials,prob)
    }
    success <- c(0:trials)
    prob_table <- data.frame(cbind(success,probability))
    class(prob_table) <- c("bindist","data.frame")
    return(prob_table)
  }
}

#' @export
plot.bindist <- function(x){
  library(ggplot2)
  bin_dis <- ggplot2::ggplot(x, ggplot2::aes(x= x$success, y = x$probability))+ ggplot2::labs(x="successes")+ ggplot2::geom_histogram(stat = "identity", color = "#C0C0C0", fill="#C0C0C0")+ ggplot2::theme_classic()
  bindist <- bin_dis + ggplot2::scale_y_continuous(breaks = seq(0, max(x$probability), by = 0.05))+ ggplot2::scale_x_continuous(breaks=(seq(0, max(x$success), by = 1)))
  return(bindist)
}


# 1.6
#' @title binomial cumulative function
#' @description calculates the probability and cumulative probability of different success times
#' @param trials number of trials
#' @param success success rate of each trials
#' @return A data frame with number of success, probability and cumulative probability
#' @export
#' @examples
#' bin_cumulative(5,0.5)

bin_cumulative<-function(trials,prob){
  bin_dist<-bin_distribution(trials,prob)
  cum<-c()
  for (i in c(1:length(bin_dist$probability))){
    if (i==1){
      cum[i]<-bin_dist$probability[i]
    } else{
      cum[i]<-cum[i-1]+bin_dist$probability[i]
    }
  }
  bin_dist$cumulative<-cum
  class(bin_dist)<-c("bincum","data.frame")
  return(bin_dist)
}

#' @export
plot.bincum <- function(x){
  library(ggplot2)
  bincum <- ggplot2::ggplot(data = x, ggplot2::aes(x= x$success, y = x$cumulative)) + ggplot2::geom_line() + ggplot2::geom_point(shape = 1, size = 3) + ggplot2::theme_classic() + ggplot2::labs(x = "success", y = "")
  bincum <-  bincum + ggplot2::scale_y_continuous(breaks = seq(0, 1, by = 0.2))
  return(bincum)
}

#1.7
#' @title Binomial Variable
#' @description Calculate and form a Binomial Random Variable
#' @param trials Number of trials (numeric)
#' @param prob Probability of success (numeric)
#' @return A Binomial Random Variable object with attributes of trials and probability
#' @export
#' @examples
#' bin_variable(trials = 5, prob = 0.5)
bin_variable <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  binvar <- list(trials = trials, prob = prob)
  class(binvar) <- c("binvar")
  binvar
}


#' @export
print.binvar <- function(x) {
  cat('"Binomial variable"\n\n')
  cat("Parameters\n")
  cat("- number of trials:", x$trials, "\n")
  cat("- prob of success :", x$prob)
}

#' @export
summary.binvar <- function(x) {
  trials <- x$trials
  prob <- x$prob
  summary.binvar <- list(trials = x$trials,
                         prob = x$prob,
                         mean = aux_mean(trials, prob),
                         variance = aux_variance(trials, prob),
                         mode = aux_mode(trials, prob),
                         skewness = aux_skewness(trials, prob),
                         kurtosis = aux_kurtosis(trials, prob))
  class(summary.binvar) <- c("summary.binvar", "list")
  summary.binvar
}

#' @export
print.summary.binvar <- function(x) {
  cat('"Summary Binomial"\n\n')
  cat("Parameters\n")
  cat("- number of trials:", x$trials, "\n\n")
  cat("- prob of success :", x$prob, "\n\n")
  cat("Measures\n\n")
  cat("- mean    :", x$mean, "\n\n")
  cat("- variance:", x$variance, "\n\n")
  cat("- mode    :", x$mode, "\n\n")
  cat("- skewness:", x$skewness, "\n\n")
  cat("- kurtosis:", x$kurtosis,"\n\n")
}




# 1.8
#' @title Binomial Mean
#' @description Computes the expected value of the binomial distribution
#' @param trials Number of trials in the binomial distribution (numeric)
#' @param prob Probability of success in the binomial distribution (numeric)
#' @return Expected value of binomial distribution
#' @export
#' @examples
#' bin_mean(10,0.1)
bin_mean <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_mean(trials, prob))
}

#' @title Binomial variance function
#' @description Compute the variance of the binomial distribution
#' @param trials Number of trials in the binomial distribution
#' @param prob Probability of success in the binomial distribution
#' @return the variance of binomial distribution
#' @export
#' @examples
#' bin_variance(10,0.1)

bin_variance <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_variance(trials, prob))
}

#' @title Binomial Mode function
#' @description: Compute the mode of the binomial distribution
#' @param trials Number of trials in the binomial distribution
#' @param prob Probability of success in the binomial distribution
#' @return the mode of binomial distribution
#' @export
#' @examples
#' bin_mode(10,0.1)
bin_mode <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_mode(trials, prob))
}

#' @title Binomial Skewness function
#' @description: Compute the skewness of the binomial distribution
#' @param: trials Number of trials in the binomial distribution
#' @param: prob Probability of success in the binomial distribution
#' @return the skewness of binomial distribution
#' @export
#' @examples
#' bin_skewness(10,0.1)
bin_skewness <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_skewness(trials, prob))
}

#' @title Binomial Kurtosis function
#' @description Compute the kurtosis of the binomial distribution
#' @param trials Number of trials in the binomial distribution
#' @param prob Probability of success in the binomial distribution
#' @return the kurtosis of binomial distribution
#' @export
#' @examples
#' bin_kurtosis(10,0.1)

bin_kurtosis <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_kurtosis(trials, prob))
}









