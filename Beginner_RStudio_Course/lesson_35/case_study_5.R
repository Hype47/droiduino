##
## Step 5 : Visualization and Data Export
##

library(readxl)
library(dplyr)
library(zoo)
library(writexl)
library(plotly)

## File names
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


# ============================================ #

## Cleanse Store Info
store_df <- unique(store_df)
store_df <- store_df %>% filter(!is.na(StoreID))

## Cleanse Department Info
dept_df <- unique(dept_df)
dept_df <- dept_df %>% filter(!is.na(Dept_ID))


## Cleanse Monthly sales data
jan_df$MonthYear <- as.yearmon(jan_df$MonthYear,format = "%b %Y")
feb_df$MonthYear <- as.yearmon(feb_df$MonthYear,format = "%b %Y")
mar_df$MonthYear <- as.yearmon(mar_df$MonthYear,format = "%b %Y")
apr_df$MonthYear <- as.yearmon(apr_df$MonthYear,format = "%b %Y")
may_df$MonthYear <- as.yearmon(may_df$MonthYear,format = "%b %Y")
jun_df$MonthYear <- as.yearmon(jun_df$MonthYear,format = "%b %Y")


# ============================================ #

## Merging Sales data
sales_data <- rbind(jan_df,feb_df,mar_df,apr_df,may_df,jun_df)

## Add Store Info
sales_data <- sales_data %>% merge(store_df,by = "StoreID")

## Add Department Info
sales_data <- sales_data %>% merge(dept_df,by = "Dept_ID")


# ============================================ #
## Data Manipulation

# 1. Enriched sales data for UK
uk_sales <- sales_data %>% filter(Country == "United Kingdom")

# 2. Monthly Sales per country 
monthly_sales <- sales_data %>% group_by(MonthYear,Country) %>% summarise(sales = sum(Turnover))

# 3. Monthly Sales comparison for German and UK
sales_comp <- sales_data %>% filter(Country %in% c("Germany","United Kingdom")) %>% 
  group_by(MonthYear,Country) %>% summarise(sales = sum(Turnover))

# 4. Total Sales per Department
sales_by_dept <- sales_data %>% group_by(`Dept. Name`) %>% summarise(sales = sum(Turnover))
sales_by_dept <- sales_by_dept %>% filter(sales > 0) %>% filter(!(`Dept. Name` %in% c("Admin","all","others","Checkout")))

# 5. Top 10 city by sales in January 2017
top_city <- sales_data %>% filter(MonthYear == "Jan 2017") %>% group_by(City) %>% summarise(sales = sum(Turnover))
top_city <- top_city[order(-top_city$sales),]
top_city <- head(top_city,10)


# ============================================ #

## Data Export
#1
write_xlsx(uk_sales, "uk_sales.xlsx")

## Data Visualization
#2
fig1 <- plot_ly(monthly_sales, x = as.factor(monthly_sales$MonthYear), y = ~sales, name = ~Country,type = "bar") %>% 
  layout(barmode = "stack")
fig1

#3
fig2 <- plot_ly(sales_comp, x = as.factor(sales_comp$MonthYear), y = ~sales, name = ~Country,type = "bar")
fig2

#4
fig3 <- plot_ly(sales_by_dept, y = ~`Dept. Name`, x = ~sales,type = "bar", orientation = "h") 
fig3

#5
fig4 <- plot_ly(top_city, y = ~reorder(City,sales), x = ~sales,type = "bar", orientation = "h") 
fig4

