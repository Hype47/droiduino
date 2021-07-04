##
## DPLYR Sample codes
##


library(dplyr)
library(readxl)


## Importing Excel Data
excelFile <- "governors_county.xlsx"
excelImport <- read_xlsx(excelFile)
View(excelImport)


## "Select" Function
voteSelect <- select(excelImport, c(county,percent))
View(voteSelect)


## "Filter" Function
voteFilter <- filter(excelImport, percent < 70)
View(voteFilter)


## "Mutate" Function
voteMutate <- mutate(excelImport, diff = total_votes - current_votes)
View(voteMutate)


## "Rename" Function
voteRename <- rename(excelImport, VotePercentage = percent)
View(voteRename)


## "Merge" Function
# Import second dataset
csvFile <- "county_state.csv"
csvImport <- read.csv(csvFile,sep = ";")
View(csvImport)

# Combine both datasets
voteMerge <- merge(excelImport,csvImport,by="county")
View(voteMerge)


## Pipe Symbol ("%>%")
votePipe <- excelImport %>% select(county,percent) %>% filter(percent < 70) %>% rename(VotePercentage = percent) %>%
  merge(csvImport,by="county")
View(votePipe)


## Group by and Summarise function
voteGroup <- voteMerge %>% group_by(state) %>% summarise(num_of_county = n())
View(voteGroup)
voteGroup <- voteMerge %>% group_by(state) %>% summarise(avg_vote_pct = mean(percent))
View(voteGroup)


