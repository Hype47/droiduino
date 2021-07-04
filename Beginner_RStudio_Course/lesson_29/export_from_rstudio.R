##
## Exporting from R Studio
##

library(dplyr)
library(plotly)
library(writexl)


## Importing Data
file <- "job_listing.csv"
df <- read.csv(file,sep = ",")
View(df)


## Datad Manipulaton
data_export <- df %>% select(Id,Title,Location,ContractTime,Category,annual_salary = Salary.per.annum)
View(data_export)

## Filter for "permanent" position
data_export <- data_export %>% filter(ContractTime == "permanent")
View(data_export)


## Exporting Data to CSV
write.csv(data_export,"permanent_job.csv")

## Exporting Data to XLSX
write_xlsx(data_export,"permanent_job.xlsx")


## Exporting Chart Image

# Aggregate Data
location_aggregate <- data_export %>% group_by(Location) %>% summarise(num_job = n())
View(location_aggregate)

# Get 10 data only
location_aggregate <- head(location_aggregate,10)
View(location_aggregate)

# Plot the data
fig <- plot_ly(location_aggregate,x = ~num_job, y = ~Location) %>% layout(orientation = "h")
fig


## Histogram
## Data Cleanup
str(data_export)
data_export$annual_salary <- as.numeric(data_export$annual_salary)

## Remove NA
data_export <- data_export %>% filter(!is.na(annual_salary))
str(data_export)

## Plotting
fig <- plot_ly(data_export,x = ~annual_salary,type = "histogram", nbinsx = 20) %>% layout(bargap = 0.05)
fig

















