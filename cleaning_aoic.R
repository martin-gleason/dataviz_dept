#pulling and cleaning data
library("tidyverse")
library("readxl")
source("cleaning_functions.R")

june_oct_2018_xlsx <- file.path("June-Sept AOIC per dept.xlsx")

june_oct_2018_df <- june_oct_2018_xlsx %>% seperate_calendars()


#Calendars
cal58_60 <- Sept[4:18, 1:8] %>%
  select(AOIC_Stat = X__1, 
         PO_Stat = X__2:X__8)

po_name_col(cal58_60)


  
