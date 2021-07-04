##
## Data Frame Manipulation
##

library(dplyr)


## Import the data
fname <- "job_listing_23.csv"
raw_data <- read.csv(fname,sep=",")
View(raw_data)

## SELECT
colnames(raw_data)
select_df <- raw_data %>% select(Id,Title,Location,CloseDate)
View(select_df)
select_df <- raw_data %>% select(2,3,4)
View(select_df)

## FILTER
filter_df <- raw_data %>% filter(Title != "")
View(filter_df)
filter_df <- raw_data %>% filter(Location == "Glasgow")
View(filter_df)


## RENAME
rename_df <- raw_data %>% rename(`Job Title` = Title)
View(rename_df)



## MUTATE
mutate_df <- raw_data %>% mutate(Deadline = as.Date(CloseDate,format="%Y%m%d"))
View(mutate_df)



## Compounded Function
compound_df <- raw_data %>% select(Id,Title,Location,CloseDate) %>% filter(Title != "") %>% filter(Location == "London") %>%
  rename(`Job Title` = Title) %>% mutate(Deadline = as.Date(CloseDate,format="%Y%m%d"))
View(compound_df)



