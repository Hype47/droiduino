##
## Cleansing Numeric Data
##



## STEP 1 : Import the data
fname <- "brazilian_real_estate_20.csv"
raw_data <- read.csv(fname,sep = ";")


## STEP 2 : Inspect the data
View(raw_data)
str(raw_data)
summary(raw_data)


## STEP 3 : Identify Columns to cleanse
typeof(raw_data$listing.totalAreas)
sum(raw_data$listing.totalAreas)

## STEP 4 : Cleansing numeric data
# remove unwanted chararacters
raw_data$listing.totalAreas <- gsub("m2","",raw_data$listing.totalAreas)
# Convert character to numeric
raw_data$listing.totalAreas <- as.numeric(raw_data$listing.totalAreas)

## STEP 5 : Removing NA data (if Any)
clean_data <- na.omit(raw_data)

## STEP 6 : Validate data
typeof(clean_data$listing.totalAreas)
View(clean_data)
summary(clean_data)






