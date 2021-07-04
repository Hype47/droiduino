##
## Data Exploration
##

# Getting the data
fname <- "brazilian_real_estate.csv"
data <- read.csv(fname, sep = ";")
View(data)

# Data Structure
str(data)

# Data Summary
summary(data)

# Number of Columns
ncol(data)

# Get Column names
colnames(data)

# Getting a column content
data$account.name

# Number of Row
nrow(data)

# Top n data
head(data,10)

# Bottom n data
tail(data,10)



