##
## Text Manipulation
##



## STEP 1 : Import the data
fname <- "brazilian_real_estate_22.csv"
raw_data <- read.csv(fname, sep=";")

## STEP 2 : Inspect the data
View(raw_data)
str(raw_data)
summary(raw_data)

## STEP 3 : Identify Columns to cleanse
## 1. account.licenseNumber
## 2. account.name
## 3. listing.address.city : change "Campinas" into "Rio de Janeiro"


## STEP 4 : Cleansing numeric data
# 1.
raw_data$account.licenseNumber <- substr(raw_data$account.licenseNumber,1,5)
# 2.
raw_data$account.name <- trimws(raw_data$account.name,which = "both")
# 3.
for (i in 1:nrow(raw_data)){
  if (raw_data$listing.address.city[i] == "Campinas"){
    raw_data$listing.address.city[i] <- "Rio de Janeiro"
  }
}


## STEP 5 : Removing NA numeric data (if Any)
clean_data <- na.omit(raw_data)


## STEP 6 : Validate data
View(clean_data)
