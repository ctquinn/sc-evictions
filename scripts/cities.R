# Description
# This script serves to read in the data from cities.csv into
# cities.rds into ../data. This is done via url, cities.csv is
# not in ../raw_data

# Author: Connor Quinn
# Version: 2020-01-29

# Libraries
library(tidyverse)

# Parameters
cities_path <- "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.csv"

rds_path <- here::here("data/cities.rds")

cities_col_types <-
  cols(
    GEOID = col_integer(),
    year = col_integer(),
    name = col_character(),
    `parent-location` = col_character(),
    population = col_integer(),
    `poverty-rate` = col_double(),
    `renter-occupied-households` = col_double(),
    `pct-renter-occupied` = col_double(),
    `median-gross-rent` = col_double(),
    `median-household-income` = col_double(),
    `median-property-value` = col_double(),
    `rent-burden` = col_double(),
    `pct-white` = col_double(),
    `pct-af-am` = col_double(),
    `pct-hispanic` = col_double(),
    `pct-am-ind` = col_double(),
    `pct-asian` = col_double(),
    `pct-nh-pi` = col_double(),
    `pct-multiple` = col_double(),
    `pct-other` = col_double(),
    `eviction-filings` = col_double(),
    evictions = col_double(),
    `eviction-rate` = col_double(),
    `eviction-filing-rate` = col_double(),
    `low-flag` = col_double(),
    imputed = col_double(),
    subbed = col_double()
  )

vars_rename <-
  c(
    geo_id = "GEOID",
    year = "year",
    name = "name",
    num_evictions = "evictions"
  )

#===============================================================================

# Used to get col types
# vroom::vroom(cities_path) %>%
#   vroom::spec()

cities_path %>%
  vroom::vroom(
    col_types = cities_col_types
  ) %>%
  filter(year == 2016) %>%
  select(!!! vars_rename) %>%
  write_rds(rds_path, compress = "gz")


