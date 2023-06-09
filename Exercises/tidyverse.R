library("tidyverse")

tibble(
  x = 1:50,
  y = runif(50), 
  z = x + y^2,
  outcome = rnorm(50)
)

#=============================================================
class(cars)
## "data.frame"

cars_tbl <- as_tibble(cars)
class(cars_tbl)
## "tbl_df"     "tbl"        "data.frame"

#=============================================================
# This way applies to dataframes and tibbles
vehicles <- as_tibble(cars[1:5,])
vehicles[['speed']]
vehicles[[1]]
vehicles$speed

# Using placeholders with the pipe
vehicles %>% .$dist
vehicles %>% .[['dist']]
vehicles %>% .[[2]]

#=============================================================
library(tidyverse)
diamonds2 <- readRDS("diamonds2.rds")

diamonds2 %>% head(n = 5)
#=============================================================
diamonds2 %>% 
  pivot_longer(cols      = c("2008", "2009"), 
               names_to  = 'year', 
               values_to = 'price') %>% 
  head(n = 5)
#=============================================================
model <- lm(price ~ ., data = diamonds2_long)
model
#=============================================================
library(ggplot2) # To load the diamonds dataset
library(dplyr)
diamonds %>% 
  filter(cut == 'Ideal' | cut == 'Premium', carat >= 0.23) %>% 
  head(5)

diamonds %>% 
  filter(cut == 'Ideal' | cut == 'Premium', carat >= 0.23) %>% 
  slice(3:4)
#=============================================================
glimpse(diamonds)
#============================================================
library(lubridate)
ymd(20101215)