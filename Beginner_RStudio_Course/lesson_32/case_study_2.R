##
## Step 2 : Cleansing Data
##

library(readxl)
library(dplyr)
library(zoo)

## Filenames
store_info <- "store_info.xlsx"
dept_info <- "department_info.xlsx"
jan_sales <- "jan_2017.xlsx"
feb_sales <- "feb_2017.xlsx"
mar_sales <- "mar_2017.xlsx"
apr_sales <- "apr_2017.xlsx"
may_sales <- "may_2017.xlsx"
jun_sales <- "jun_2017.xlsx"

## Read the files
store_df <- read_xlsx(store_info)
dept_df <- read_xlsx(dept_info)
jan_df <- read_xlsx(jan_sales)
feb_df <- read_xlsx(feb_sales)
mar_df <- read_xlsx(mar_sales)
apr_df <- read_xlsx(apr_sales)
may_df <- read_xlsx(may_sales)
jun_df <- read_xlsx(jun_sales)



## Cleanse Store Info
store_df <- unique(store_df)
store_df <- store_df %>% filter(!is.na(StoreID))

## Cleanse Department Info
dept_df <- unique(dept_df)
dept_df <- dept_df %>% filter(!is.na(Dept_ID))


## Cleanse Monthly sales data
str(jan_df)
jan_df$MonthYear <- as.yearmon(jan_df$MonthYear,format = "%b %Y")
feb_df$MonthYear <- as.yearmon(feb_df$MonthYear,format = "%b %Y")

# ============================================ #
# This is for Exercise
mar_df$MonthYear <- as.yearmon(mar_df$MonthYear,format = "%b %Y")
apr_df$MonthYear <- as.yearmon(apr_df$MonthYear,format = "%b %Y")
may_df$MonthYear <- as.yearmon(may_df$MonthYear,format = "%b %Y")
jun_df$MonthYear <- as.yearmon(jun_df$MonthYear,format = "%b %Y")










