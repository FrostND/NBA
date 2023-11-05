
# 📝 Description: ----
# Build a prediction model for NBA games and 
# test it out against the 2023-2024 season. 
# Dichotomous outcome: 
#   win-loss (1-0)
# Continuous outcome: 
#   point differential (points scored - points allowed)


# 📦 Packages ####
library(hoopR)     # NBA Play by Play Data
library(tidyverse) # Load the 'Tidyverse'
library(janitor)   # Examining and Cleaning Data
library(todor)     # Comments and More
library(ARTofR)    # Insert Title, Divider, and Comments


# 📂 NBA seasons ####    
box_18 <- load_nba_team_box(2018)
box_19 <- load_nba_team_box(2019)
box_20 <- load_nba_team_box(2020)
box_21 <- load_nba_team_box(2021)  
box_22 <- load_nba_team_box(2022)


# need seasons in single object to 
# apply functions across them at once
nest_fun <- function(df, team_ID, season, year) {
  df %>%
    group_by({{ team_ID }}, {{ season }}, {{ year }}) %>%
    nest() %>%
    ungroup() %>%
    mutate(
      season_type =
        ifelse(season_type == 2, "Regular", "Playoffs")
      )
}

data_frames <- list(box_18, box_19, box_20, box_21, box_22)

nested_data_frames <- lapply(data_frames,
  nest_fun,
  team_ID = team_name,
  season = season_type,
  year = season
)


# Combine the nested data frames into a single data frame
years <- bind_rows(nested_data_frames)
class(years)

rm(
  box_18, box_19, box_20, box_21, box_22,
  nest_fun, nested_data_frames, data_frames
)


#........................................
# TODO: remove all-star games, and others
#........................................

# which are the all-star games?
tabyl(years$team_name)

rm_team <- c(
  "Team LeBron",
  "Team Giannis",
  "Team Stephen",
  "Team Durant",
  "USA",
  "World"
)

years <- years %>%
  filter(!team_name %in% rm_team) %>%
  rename(year = season)

# check that the all-star games are gone
tabyl(years$team_name)

nba <- years 
rm(rm_team, years)


##~~~~~~~~~~~~~~~~~~~~~~
## 📊 describe      ----
##~~~~~~~~~~~~~~~~~~~~~~





