##
## Data Aggregation
##

library(dplyr)
library(readxl)


## FILE IMPORT
file <- "salesworkload_25.xlsx"
df <- read_xlsx(file)
View(df)

## TOTAL NUMBER OF STORE PER REGION
num_store <- df %>% group_by(Region) %>% summarise(store = n())
View(num_store)

# Sanity check
sum(num_store$store)


## TOTAL NUMBER OF SCHEMES PER REGION
num_scheme <- df %>% group_by(Region,Scheme) %>% summarise(scheme_num = n())
View(num_scheme)

# Sanity check
sum(num_scheme$scheme_num)

## ========================================================== ##

## AGGREGATE NUMBER OF SALES PER REGION PER SCHEME
# Data exploration
str(df)

# Aggregate Data
num_sales <- df %>% group_by(Region,Scheme) %>% summarise(sales_2019 = sum(`2019`), sales_2020 = sum(`2020`))
View(num_sales)

# Sanity Check
sum(num_sales$sales_2019)
sum(df$`2019`)
sum(num_sales$sales_2020)
sum(df$`2020`)


# Aggregate Sales Data (Value) per region
num_sales2 <- df %>% group_by(Region) %>% summarise(sales_2019 = sum(`2019`), sales_2020 = sum(`2020`))
View(num_sales2)

# Sanity Check
sum(num_sales2$sales_2019)
sum(num_sales2$sales_2020)

