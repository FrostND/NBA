

# 📝 Description #### 
# Organize team box scores into a single data frame. 
# Seasons: 2018-19, 2019-20, 2020-21, 2021-22, 2022-23



# 📦 Packages ####
library(hoopR)     # NBA Play by Play Data
library(tidyverse) # Load the 'Tidyverse'
library(janitor)   # Examining and Cleaning Data
library(todor)     # Comments and More

# 📂 NBA seasons ####    

box_18 <- load_nba_team_box(2018)
box_19 <- load_nba_team_box(2019)
box_20 <- load_nba_team_box(2020)
box_21 <- load_nba_team_box(2021)  
box_22 <- load_nba_team_box(2022)
box_23 <- load_nba_team_box(2023)


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


# variables in each nested column
names(nba$data[[1]])

# remove variables from from nested columns
nba <- nba %>%
  mutate(
    data = map(data, select, -c(
      team_color, team_logo, opponent_team_location, 
      opponent_team_color, opponent_team_logo, 
      opponent_team_alternate_color, team_alternate_color, 
      opponent_team_uid, team_uid
    ))
  )






