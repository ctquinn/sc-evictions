South Carolina (SC) Cities Evictions EDA File
================
Connor Quinn
2020-01-29

  - [Reading in and initial
    exploration](#reading-in-and-initial-exploration)

``` r
# Libraries
library(tidyverse)
library(knitr)

# Parameters
cities_path = here::here("data/cities.rds")

#===============================================================================
```

## Reading in and initial exploration

``` r
cities_tbl <- read_rds(cities_path)

cities_tbl
```

    ## # A tibble: 397 x 4
    ##     geo_id  year name          num_evictions
    ##      <int> <int> <chr>                 <dbl>
    ##  1 4500100  2016 Abbeville             57.5 
    ##  2 4500550  2016 Aiken                465.  
    ##  3 4500775  2016 Alcolu                 4.28
    ##  4 4500955  2016 Allendale             24.2 
    ##  5 4501360  2016 Anderson             642.  
    ##  6 4501450  2016 Andrews               66.6 
    ##  7 4501810  2016 Antreville             0.14
    ##  8 4502080  2016 Arcadia               NA   
    ##  9 4502125  2016 Arcadia Lakes         15.0 
    ## 10 4502440  2016 Arial                 17.6 
    ## # … with 387 more rows

Which carolina city had the most evictions in 2016? Note that this data
is already filtered to 2016, so we simply find the max:

``` r
cities_tbl %>% 
  filter(num_evictions == max(num_evictions, na.rm = TRUE)) %>%
  select(name, num_evictions) %>% 
  kable()
```

| name             | num\_evictions |
| :--------------- | -------------: |
| North Charleston |         3660.1 |
