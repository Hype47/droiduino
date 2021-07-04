##
## Cleansing Date
##



## STEP 1 : Import the data
fname <- "brazilian_real_estate_21.csv"
raw_data <- read.csv(fname,sep = ";")


## STEP 2 : Inspect the data
View(raw_data)
str(raw_data)
summary(raw_data)

## STEP 3 : Identify Columns to cleanse
typeof(raw_data$listing.createdAt)

## STEP 4 : Cleansing numeric data
# Date Only
raw_data$Date <- as.Date(raw_data$listing.createdAt,format = "%Y-%m-%d")
# Date and Time
raw_data$Datetime <- as.POSIXct(raw_data$listing.createdAt,format = "%Y-%m-%dT%H:%M:%S", tz=Sys.timezone())

## STEP 5 : Removing NA numeric data (if Any)
clean_data <- na.omit(raw_data)

## STEP 6 : Validate data
View(clean_data)
summary(clean_data)
