##Test for chunking  units
require(tidyverse)

june_oct_2018_xlsx <- file.path("June-Sept AOIC per dept.xlsx")

june_oct_2018_xlsx %>% seperate_calendars()

Sept_Stats <- Sept %>% 
  select(AOIC_Stat = X__1, 
         PO_Stat = X__2:X__8)

chunk <- 20
n <- nrow(Sept)
r  <- rep(1:ceiling(n/chunk),each=chunk)[1:n]
d <- split(Sept, r)

View()
