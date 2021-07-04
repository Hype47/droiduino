##
## Read From External data Source
##

library(readxl)

## Excel Filename
excelFile <- "governors_county.xlsx"

## Import Excel File
importExcel <- read_xlsx(excelFile)

## Display Data
View(importExcel)


## CSV Filename
csvFile <- "RAW_global_confirmed_cases.csv"

## Import CSV file
importCsv <- read.csv(csvFile)

## Display the data
View(importCsv)
