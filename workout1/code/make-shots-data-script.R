######################
##title: make shots data
##description: analyze shots data of NBA
##inputs: data of Andre, Draymond, Kevin, Klay, Stephen
##outputs: organized data
######################
setwd("/Users/zhangxihuan/Desktop/workout01/code")
andre <- read.csv(file= "/Users/zhangxihuan/Desktop/workout01/data/andre-iguodala.csv", stringsAsFactors = FALSE)
draymond <- read.csv(file= "/Users/zhangxihuan/Desktop/workout01/data/draymond-green.csv", stringsAsFactors = FALSE)
kevin <- read.csv(file= "/Users/zhangxihuan/Desktop/workout01/data/kevin-durant.csv", stringsAsFactors = FALSE)
klay <- read.csv(file= "/Users/zhangxihuan/Desktop/workout01/data/klay-thompson.csv", stringsAsFactors = FALSE)
stephen <- read.csv(file= "/Users/zhangxihuan/Desktop/workout01/data/stephen-curry.csv", stringsAsFactors = FALSE)

andre$name <- c("Andre Iguodala")
draymond$name <- c("Graymond Green")
kevin$name <- c("Kevin Durant")
klay$name <- c("Klay Thompson")
stephen$name <- c("Stephen Curry")

andre$shot_made_flag[andre$shot_made_flag == "n"]<- c("shot_no")
andre$shot_made_flag[andre$shot_made_flag == "y"]<- c("shot_yes")
draymond$shot_made_flag[draymond$shot_made_flag == "n"]<- c("shot_no")
draymond$shot_made_flag[draymond$shot_made_flag == "y"]<- c("shot_yes")
kevin$shot_made_flag[kevin$shot_made_flag == "n"]<- c("shot_no")
kevin$shot_made_flag[kevin$shot_made_flag == "y"]<- c("shot_yes")
klay$shot_made_flag[klay$shot_made_flag == "n"]<- c("shot_no")
klay$shot_made_flag[klay$shot_made_flag == "y"]<- c("shot_yes")
stephen$shot_made_flag[stephen$shot_made_flag == "n"]<- c("shot_no")
stephen$shot_made_flag[stephen$shot_made_flag == "y"]<- c("shot_yes")

andre$minute <- 12*andre$period - andre$minutes_remaining
draymond$minute <- 12*draymond$period - draymond$minutes_remaining
kevin$minute <- 12*kevin$period - kevin$minutes_remaining
klay$minute <- 12*klay$period - klay$minutes_remaining
stephen$minute <- 12*stephen$period - stephen$minutes_remaining

sink(file = "../output/andre-iguodala-summary.txt")
summary(andre)
sink()

sink(file = "../output/draymond-green-summary.txt")
summary(draymond)
sink()

sink(file = "../output/kevin-durant-summary.txt")
summary(kevin)
sink()

sink(file = "../output/klay-thompson-summary.txt")
summary(klay)
sink()

sink(file = "../output/stephen-curry-summary.txt")
summary(stephen)
sink()

total <- rbind(andre, draymond, kevin, klay, stephen)

write.csv(total, "../data/shots-data.csv")
  


sink(file = "../output/shots-data-summary.txt")
summary(total)
sink()
