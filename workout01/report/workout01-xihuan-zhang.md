Workout 1
================
xihuan zhang

``` r
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

<img src="../images/gsw-shot-chart.png" width="100%" style="display: block; margin: auto;" />

5.1)Effective Shooting Percentage

``` r
newdata <- read.csv(file = "../data/shots-data.csv", header = TRUE,sep = ",")
name_shottype <- select(newdata, name, shot_type, shot_made_flag)
```

``` r
#2PT Effective Shooting % by Player
two_points <- filter(name_shottype, shot_type == "2PT Field Goal")
arrange(
summarise(group_by(two_points, name),
          total = length(shot_type),
          made = sum(shot_made_flag == "shot_yes"), 
          perc_made = made/total 
),
desc(perc_made))
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Andre Iguodala   210   134     0.638
    ## 2 Kevin Durant     643   390     0.607
    ## 3 Stephen Curry    563   304     0.540
    ## 4 Klay Thompson    640   329     0.514
    ## 5 Graymond Green   346   171     0.494

``` r
#3PT Effective Shooting % by Player
three_points <- filter(name_shottype, shot_type == "3PT Field Goal")
arrange(
summarise(group_by(three_points, name),
          total = length(shot_type),
          made = sum(shot_made_flag == "shot_yes"), 
          perc_made = made/total 
),
desc(perc_made))
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Klay Thompson    580   246     0.424
    ## 2 Stephen Curry    687   280     0.408
    ## 3 Kevin Durant     272   105     0.386
    ## 4 Andre Iguodala   161    58     0.360
    ## 5 Graymond Green   232    74     0.319

``` r
#Effective Shooting % by Player
arrange(
summarise(group_by(name_shottype, name),
          total = length(shot_type),
          made = sum(shot_made_flag == "shot_yes"), 
          perc_made = made/total 
),
desc(perc_made))
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Kevin Durant     915   495     0.541
    ## 2 Andre Iguodala   371   192     0.518
    ## 3 Klay Thompson   1220   575     0.471
    ## 4 Stephen Curry   1250   584     0.467
    ## 5 Graymond Green   578   245     0.424

5.2)Narrative

Report
======

![Image of the Warriors](https://qph.fs.quoracdn.net/main-qimg-ec232d1c77da1599213e14b078d5b476)

-   Introduction: Golden State Warriors began in Philadelphia in 1946 and got their inaugural championship in the 1946-1947 season. It holds the name Golden State Warriors since 1971. In history, GSW has won four seasons, including the most recent 2014-2015, 2016-2017 and 2017-2018 seasons. The GSW has raised many famous players, such as Stephen Curry who got the NBA most valuable player award in the 2015-2016 season. As a competitive team, the GSW attracts much attention from the world, and many people want to know if it can remain champions in the 2018-2019 season. I analyzed their data in the 2016-2017 season to predict if they are going to be the champion in this season.

-   Motivation: Since the 2016-2017 season is a recent one, their current strength doesn’t change a lot compared to that season. We can predict the result by analyzing different members’ performance in the 2016-2017 season.

-   Background: The 2014-2015 season is a significant turning point for the GSW. They got their first champion after 40 years of obscurity. The GSW started the Steve Kerr era which is the Championship Era since that season. Under the leading of Steve Kerr, the GSW becomes a rising star in the world of basketball. The “famous four” of GSW are Kevin Durant, Stephen Curry, Draymond Green, and Klay Thompson, and they all had incredible performance in recent seasons. Plus, Andre Iguodala is also a key player of GSW.

-   Data and Analysis: I got those five players’ statistic in the 2016-2017 season from the GitHub website, which includes their game date, shot type, shot distance and many other data. I picked the two points shot statistic and three points shot statistic and made a table.

##### 2PT Effective Shooting % by Player:

``` r
two_points <- filter(name_shottype, shot_type == "2PT Field Goal")
arrange(
summarise(group_by(two_points, name),
          total = length(shot_type),
          made = sum(shot_made_flag == "shot_yes"), 
          perc_made = made/total 
),
desc(perc_made))
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Andre Iguodala   210   134     0.638
    ## 2 Kevin Durant     643   390     0.607
    ## 3 Stephen Curry    563   304     0.540
    ## 4 Klay Thompson    640   329     0.514
    ## 5 Graymond Green   346   171     0.494

##### 3PT Effective Shooting % by Player:

``` r
three_points <- filter(name_shottype, shot_type == "3PT Field Goal")
arrange(
summarise(group_by(three_points, name),
          total = length(shot_type),
          made = sum(shot_made_flag == "shot_yes"), 
          perc_made = made/total 
),
desc(perc_made))
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Klay Thompson    580   246     0.424
    ## 2 Stephen Curry    687   280     0.408
    ## 3 Kevin Durant     272   105     0.386
    ## 4 Andre Iguodala   161    58     0.360
    ## 5 Graymond Green   232    74     0.319

![Klay Thompson](https://media.gettyimages.com/photos/klay-thompson-of-the-golden-state-warriors-poses-for-a-portrait-with-picture-id970201180)
<img src="../../../playerstats/Klay.jpg" width="100%" style="display: block; margin: auto;" />

From the tables above, we can see that Klay Thompson did 640 two points shots which is the most among five players, and succeed in the percentage of 51.4%. For three points shots, Klay made the second most shots and had got the highest success rate. It’s obvious that Klay’s strategy is to make more shots. Comparing to his two points shot, he did better in three points shots. ![Andre Iguodala](https://www.gannett-cdn.com/-mm-/7349fb2ec8fa6eae87731d37a08df41a4a952655/c=320-223-4187-2408/local/-/media/2018/05/31/USATODAY/USATODAY/636633217332508663-2018-05-30-Andre-Iguodala.jpg?width=3200&height=1680&fit=crop)

<img src="../../../playerstats/Andre.jpg" width="100%" style="display: block; margin: auto;" />

Although Andre Iguodala made 210 two points shots which is the least among five players, he got the highest success rate, 63.8%. Andre also did the least three points shots with a success rate of 36%. Andre did much better in two points shots than three points shots. He focused on the quality more than quantity.
![Kevin Durant](https://static01.nyt.com/images/2017/04/07/sports/07durant-web1/07durant-web1-articleLarge.jpg?quality=75&auto=webp&disable=upscale)
<img src="../../../playerstats/Kevin.jpg" width="100%" style="display: block; margin: auto;" />

Kevin Durant got the second place in two points shots success rate and the third place in three points rate. Meanwhile, he attempted more two points shots than three points shots. It turns out that he tended to be a two points shots player. However, both the three points and two points success rate of current season are less than the 2016-2017 season.

![Stephen Curry](https://cdn.vox-cdn.com/thumbor/QnyGzZIeq92Mba_HwcQ87qUmBzU=/0x0:3915x2613/1200x800/filters:focal(1706x113:2332x739)/cdn.vox-cdn.com/uploads/chorus_image/image/59594853/usa_today_10816472.1525210208.jpg)
<img src="../../../playerstats/Stephen.jpg" width="100%" style="display: block; margin: auto;" />

Stephen Curry is a superstar even in such a famous team which has many talented players. As it shows in the table, Stephen did a good job in both two points shots and three points shots. For many players, they got a decreasing success rate when they have more attempts. However, Stephen kept a high success rate at the same time as having many attempts.
![Draymond Green](https://mk0slamonlinensgt39k.kinstacdn.com/wp-content/uploads/2017/11/Featured-Draymond.jpg)
<img src="../../../playerstats/Draymond.jpg" width="100%" style="display: block; margin: auto;" />

Draymond Green is also an excellent player. It seems that he got the lowest success rate in both kinds of shots among five players, but his performance is still much better than many players from other teams. The reason he ranked at such a place is that the other four players are the best among top players. He makes huge progress in the current season where he got a 54.9% success rate on two points shots. It is highly likely that he will achieve a higher overall success rate than the 2016-2017 season.

-   Discussion: At the beginning of 2018, a talented player DeMarcus Amir Cousins joined the GSW, and made the whole team even more competitive. However, it turns out that the GSW is facing some difficulties in the current season. On November 22nd, 2018, the GSW missed Stephen Curry and took their fourth consecutive loss to Oklahoma City Thunder, and they were finally defeated by 95 to 123. It was the first time that Steve Kerr had a taste of four-game losing streak since he was the coach. The last time when the GSW suffered a four-game losing streak was in the 2012-2013 season. However, they still have the chance to win this season since players still keep a high success rate now. For example, according to the statistic from basketball-reference website, Andre has a three points shots success rate of 64.2% which is higher than his success rate in the 2016-2017 season. Overall, five players all keep a stable performance in this season.

-   Conclusion: The GSW has a similar statistic as the 2016-2017 season where they won the championship, so they are a strong candidate for the champion in the 2018-2019 season. Although they are facing a very tough fight, they are still able to improve the situation as long as the coach Kerr set a powerful strategy and all players do as well as usual. Plus, with Andrew Bogot’s return, the Warriors have an even higher possibility to win the championship. In the recent Warriors and Nuggets game, the Warriors created the record of 51-point first quarter and a 142-111 victory at the end. In general, the chances of the Warriors winning this season are great, but it also depends on the Warriors performance in the playoffs. The result gained from past data can only be an estimation or a prediction but can’t be a conclusion since the situation changes in every game. We can never jump to the conclusion before collecting all the data. Do you think the GSW could win the champion again? Who is the MVP in your mind? Let’s stay focus on the Warriors’ performance together! Good luck, Warriors!

-   references:

    <https://github.com/ucb-stat133/stat133-hws>
    <https://www.basketball-reference.com/teams/GSW/2019.html> <https://www.basketball-reference.com/players/c/curryst01.html>
    <https://www.basketball-reference.com/players/t/thompkl01.html>
    <https://www.basketball-reference.com/players/i/iguodan01.html>
    <https://www.basketball-reference.com/players/d/duranke01.html>
    <https://www.basketball-reference.com/players/g/greendr01.html>
