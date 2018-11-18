#function to change column names ot PO Names
# This is the base function
#names(cal58_60)[2] <- cal58_60[1 , 2]
require(tidyverse)

#Create a data frame of each sheet and load into environment
seperate_calendars <- function(xlsx, ...){
  sheet_names <- excel_sheets(xlsx)
  months <- lapply(sheet_names, function(X) read_excel(xlsx, sheet = X))
  lapply(months, as.data.frame)
  names(months) <- sheet_names
  list2env(months, .GlobalEnv)
}


#takes lenght of DF, then, assuming second row is the header, replaces column name with name of PO
po_name_col <- function(df, ...){
  df <- df %>% 
    mutate_all(funs(replace(., is.na(.),0)))
  for(i in 1:length(df)){
    if(!is.na(df[1, i])){
      names(df)[i] <- df[1, i]
    } else {
      next(is.na(df[1, i]))
    }
  }

  df <- df[2:nrow(df), 1:ncol(df)]
  return(df)
}


