##
## Data Visualization Using Plotly
##

library(dplyr)
library(readxl)
library(plotly)

## Importing Data
file <- "salesworkload_tabular.xlsx"
df <- read_xlsx(file)
View(df)

# =========================================== #


## Simple Charts : Sales for UK
# Data Aggregation
df_uk <- df %>% filter(Region == "United Kingdom") %>% group_by(Region,period) %>% summarise(total_sales = sum(sales))
View(df_uk)

# Bar Chart
plot <- plot_ly(df_uk,x = df_uk$period,y = df_uk$total_sales)
plot

# Scatter Plot
plot <- plot_ly(df_uk, x = ~period, y = ~total_sales, type = "scatter")
plot


# Line Chart
plot <- plot_ly(df_uk, x = ~period, y = ~total_sales, type = "scatter", mode = "lines")
plot



# =========================================== #

## Stacked Barchart : Sales by Type in UK
# Data Aggregation
df_uk <- df %>% filter(Region == "United Kingdom") %>% group_by(Region,Scheme,period) %>% summarise(total_sales = sum(sales))
View(df_uk)


# Plotting Barchart
plot <- plot_ly(df_uk, x = ~period, y = ~total_sales, name = ~Scheme) %>% layout(barmode = "stack")
plot

# =========================================== #

## Stacked Barchart : Sales by Store in UK
# Data Aggregation
df_uk <- df %>% filter(Region == "United Kingdom") %>% group_by(Region,`Store name`,period) %>% summarise(total_sales = sum(sales))
View(df_uk)


# Plotting Barchart
plot <- plot_ly(df_uk, x = ~period, y = ~total_sales, name = ~`Store name`) %>% layout(barmode = "stack")
plot






