
# NBA Box Scores Data ####
# Seasons: 2018-19, 2019-20, 2020-21, 2021-22, 2022-23

# packages ####
library(psych)      # Descriptive statistics
library(hoopR)      # NBA Play by Play Data
library(janitor)    # Examining and Cleaning Data
library(tidyverse)  # Load the 'Tidyverse'

# load box scores ####
box <- list(
  team_box = load_nba_team_box(2018:2023),
  player_box = load_nba_player_box(2018:2023)
)

# organize data ####
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

# clear memory
rm(rm_teams)











