##
## Visualization Using Plotly
##

library(dplyr)
library(plotly)


## Import Data
csvFile <- "governors_county.csv"
csvImport <- read.csv(csvFile,sep = ";")
View(csvImport)


## Calculate Average Vote Percentage per State
voteAvg <- csvImport %>% group_by(state) %>% summarise(avg_vote = mean(percent))
View(voteAvg)


## Visualize the data
fig <- voteAvg %>% plot_ly(x = ~state, y = ~avg_vote, type = "bar")
fig
fig <- voteAvg %>% plot_ly(x = ~avg_vote, y = ~state, type = "bar", orientation = "h")
fig
