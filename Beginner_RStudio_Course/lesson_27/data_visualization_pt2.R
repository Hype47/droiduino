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


## Horizontal Barchart : Sales per Country in 2010

# Data Aggregation
df_sales <- df %>% filter(period == "2010") %>% group_by(Region) %>% summarise(total_sales = sum(sales))
View(df_sales)

# Plotting
plot <- plot_ly(df_sales, x = ~total_sales, y = ~Region, type = "bar", orientation = "h")
plot


# =========================================== #

## Histogram : Sales Profile in UK

# Data Grouping
df_uk <- df %>% filter(Region == "United Kingdom") %>% group_by(Region,`Store name`)
View(df_uk)

# Plotting Histogram
plot <- plot_ly(df_uk, x = ~sales, type = "histogram") %>% layout(bargap = 0.05)
plot






