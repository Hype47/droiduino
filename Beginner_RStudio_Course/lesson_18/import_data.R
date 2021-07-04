##
## Importing Data
##

library(readxl)


# Data Filename
excelFile <- "salesworkload.xlsx"


# Import Data
excelData <- read_xlsx(excelFile)
View(excelData)


# Data Filename
csvFile <- "brazilian_real_estate.csv"


# Import Data
csvData <- read.csv(csvFile, sep=";")
View(csvData)
