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


# ========================================== #

## Plotting Stacked Barchart
df_uk <- df %>% filter(Region == "United Kingdom") %>% group_by(Region, `Store name`, period) %>% summarise(total_sales = sum(sales))
plot <- plot_ly(df_uk, x = ~period, y = ~total_sales, name = ~`Store name`) %>% layout(barmode = "stack")
plot

# ========================================== #

## Configuring Chart Legends

# Hide Legends
plot_legend <- plot %>% layout(showlegend = FALSE)
plot_legend

# Changing Legend Orientation
plot_legend <- plot %>% layout(legend = list(orientation = "h"))
plot_legend


# Legend Title
plot_legend <- plot %>% layout(legend = list(orientation = "v",title = list(text = "Store Name")))
plot_legend


# ========================================== #

## Annotations

# Scatter Plot : UK Sales 2009-2019
df_uk <- df %>% filter(Region == "United Kingdom") %>% group_by(Region,period) %>% summarise(total_sales = sum(sales))
plot <- plot_ly(df_uk, x = ~period, y = ~total_sales, type = "scatter")
plot

# Add text annotation
plot <- plot_ly(df_uk, x = ~period, y = ~total_sales, type = "scatter", text = "this is a text") %>% 
  add_text(textposition = "top right") %>% layout(showlegend = FALSE)
plot  
  
  
  


