#pulling and cleaning data
library("tidyverse")
library("readxl")

june_oct_2018_xlsx <- file.path("June-Sept AOIC per dept.xlsx")

#months
sept_2018 <- read_xlsx(june_oct_2018_xlsx, sheet = "Sept")
aug_2018 <- read_xlsx(june_oct_2018_xlsx, sheet = "Aug")
july_2018 <- read_xlsx(june_oct_2018_xlsx, sheet = "July")
june_2018 <- read_xlsx(june_oct_2018_xlsx, sheet = "June")

#Calendars
cal58_60 <- sept_2018[4:18, 1:8] %>%
  select("AOIC_Stat" = X__1, 
         "PO_Stat" = X__2:X__8) 

# %>%
# gather(PO_Name, Totals, PO_Stat1:PO_Stat7)

po_names <- cal58_60[1, ]


colnames(cal58_60[, 2:7])



LD_test <- cal58_60 %>% select(2) 

ld_test_sep <- LD_test %>%
  separate(PO_Stat1, c("Total_Caseload", "YASI_High", "YASI_Low", 
                   "YASI_Unclassified", "Scheduled_Termination",
                   "Early_Termination", "Revoked_Technical", "Revoked_New_Offense"), 
           sep = "\\n")

variable_names <- LD_test %>%
  separate(PO_Stat1, c("Total_Caseload", "YASI_High", "YASI_Low", 
                   "YASI_Unclassified", "Scheduled_Termination",
                   "Early_Termination", "Revoked_Technical", "Revoked_New_Offense"),
           sep = "\\n") %>%
  names()

View(ld_test_sep)

named_columns <- c("X__2", "X__3", "X__4", "X__5", "X__6", "X__7", "X__8")

sep. <- cal58_60 %>%
  separate(X__1, c("Total_Caseload", "YASI_High", "YASI_Low", 
                   "YASI_Unclassified", "Scheduled_Termination",
                   "Early_Termination", "Revoked_Technical", "Revoked_New_Offense"),
           extra = "drop")

cal58_60  %>%
  gather(key = "PO_Name",
         X__2, X__3, X__4, X__5, X__6, X__7, X__8)


gather_cal <- cal58_60 %>%
  separate(X__1, c("Total_Caseload", "YASI_High", "YASI_Low", 
                   "YASI_Unclassified", "Scheduled_Termination",
                   "Early_Termination", "Revoked_Technical", "Revoked_New_Offense")) %>%
  gather(PO_name, totals, X__2, X__3, X__4, X__5, X__6, X__7, X__8)
  
