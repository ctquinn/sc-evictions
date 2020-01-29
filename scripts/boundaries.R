# Description
# This file reads in the url data cities.geojson into
# ../data/boundaries.rds

# Author: Connor Quinn
# Version: 2020-01-29

# Libraries
library(tidyverse)

# Parameters
boundaries_path <-
  "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.geojson"

rds_path <-
  here::here("data/boundaries.rds")

vars_select <-
  c(
    city_id = "GEOID",
    city_name = "n",
    geometry = "geometry"
  )


#===============================================================================

boundaries_test <-
  boundaries_path %>%
  sf::read_sf() %>%
  select(!!! vars_select) %>%
  mutate(
    city_id = as.integer(city_id),
  ) %>%
  write_rds(rds_path, compress = "gz")

