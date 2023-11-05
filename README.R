

#  Author: Nickolas Frost PhD
#  Contact: nickfrost01@gmail.com
#  Created: 08/17/23 


##~~~~~~~~~~~~~
##  Aims   ----
##~~~~~~~~~~~~~

#  The purpose of this R project is to predict
#  the outcome of NBA games in the 23-24 NBA season. 
#  Historical game data is available via the hoopR 
#  package install.packages("hoopR") 


##~~~~~~~~~~~~~
##  data   ----
##~~~~~~~~~~~~~

#  Several types of data are available to analyze: 
#  play-by-play data: load_nba_pbp(YEAR)         
#  player statistics: load_nba_player_box(YEAR) 
#  team box scores: load_nba_team_box(YEAR)  


##~~~~~~~~~~~~~~~~~
## resources   ----
##~~~~~~~~~~~~~~~~~

# FiveThirtyeight also has the 
# Raptor metric, find it at the link below 
# https://fivethirtyeight.com/features/introducing-raptor-our-new-metric-for-the-modern-nba/

# Pythagorean Expectation 
# https://en.wikipedia.org/wiki/Pythagorean_expectation#Use_in_basketball

# FiveThiryeight elaboration on how models work
# https://fivethirtyeight.com/methodology/how-our-nba-predictions-work/

# FiveThirtyeight Github with code and data
# https://github.com/fivethirtyeight

# More on Fivethirtyeight models 
#  ~  https://projects.fivethirtyeight.com/checking-our-work/
#  ~  https://blog.albertkuo.me/post/2022-01-21-how-good-is-fivethirtyeight-s-nba-prediction-model/


##~~~~~~~~~~~~~~~~~
##  my model   ----
##~~~~~~~~~~~~~~~~~

# OUTCOME: win (1) or loss (0)
# PREDICTORS: 
#   rebounds +
#   assists +
#   points +
#   home court + 
#   players +
#   rest days + 
#   injuries + 
#   ?


##~~~~~~~~~~~~~~~~~~~~~~~
##  Model Accuracy   ----
##~~~~~~~~~~~~~~~~~~~~~~~

#  a) predictions better than chance (50/50) 
#  b) predictions better than subjective picks 
#  c) predictions better than other models 
#  d) ?


