
# NBA Box Scores and Perfomance Metrics  
# Seasons: 2018-19, 2019-20, 2020-21, 2021-22, 2022-23


# packages ####
library(psych)                # Descriptive statistics
library(hoopR)                # NBA Play by Play Data
library(janitor)              # Examining and Cleaning Data
library(tidyverse)            # Load the 'Tidyverse'
library(fivethirtyeight)      # Data Behind FiveThirtyEight
library(fivethirtyeightdata)  # Package For FiveThirtyEight datasets


# load box scores ####
box <- list(
  team_box = load_nba_team_box(2018:2023),
  player_box = load_nba_player_box(2018:2023)
)

# organize box scores ####
map(box, .f = names)
with(box, setdiff(team_box, player_box))
    
# remove non-season games (e.g., all-star games)
tabyl(box$team_box$team_name)

rm_teams <- c(
  "Team LeBron", "Team Giannis", "World",
  "Team Stephen", "Team Durant", "USA"
  )

box <- map(box, ~filter(.x, !team_name %in% rm_teams))
tabyl(box$team_box$team_name)

# clear
rm(rm_teams)

# Raptor data ####

raptor <- list(
  raptor_by_player = raptor_by_player,
  raptor_by_team = raptor_by_team, 
  elo_by_player = elo_by_player,
  )
