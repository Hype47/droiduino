##
## Step 1 : Importing Data
##

library(readxl)

## Filenames
store_info <- "store_info.xlsx"
dept_info <- "department_info.xlsx"
jan_sales <- "jan_2017.xlsx"
feb_sales <- "feb_2017.xlsx"
mar_sales <- "mar_2017.xlsx"
apr_sales <- "apr_2017.xlsx"
may_sales <- "may_2017.xlsx"
jun_sales <- "jun_2017.xlsx"

## Reading the files
store_df <- read_xlsx(store_info)
dept_df <- read_xlsx(dept_info)
jan_df <- read_xlsx(jan_sales)
feb_df <- read_xlsx(feb_sales)
mar_df <- read_xlsx(mar_sales)
apr_df <- read_xlsx(apr_sales)
may_df <- read_xlsx(may_sales)
jun_df <- read_xlsx(jun_sales)