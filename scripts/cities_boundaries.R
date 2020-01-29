# Description
# This file joins the .rds files cities.rds and boundaries.rds by geo_id,
# resulting in the file cities_boundaries.rds

# Author: Connor Quinn
# Version: 2020-01-29

# Libraries
library(tidyverse)

# Parameters

cities_path <- here::here("data/cities.rds")

boundaries_path <- here::here("data/boundaries.rds")

rds_path <- here::here("data/cities_boundaries.rds")

#===============================================================================

cities_tbl <- read_rds(cities_path)

boundaries_tbl <- read_rds(boundaries_path)

joined_tbl <-
  cities_tbl %>%
  left_join(boundaries_tbl, by = c("geo_id" = "city_id"))

joined_tbl %>%
  write_rds(rds_path, compress = "gz")
