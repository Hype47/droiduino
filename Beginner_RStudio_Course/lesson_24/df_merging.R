##
## Data Frame Merging
##

library(dplyr)
library(readxl)


# RBind

## Import Data
file1 <- "salesworkload_1_rbind.xlsx"
file2 <- "salesworkload_2_rbind.xlsx"
df1 <- read_xlsx(file1)
df2 <- read_xlsx(file2)
View(df1)
View(df2)

## Combine Data
df_rbind <- rbind(df1,df2)
View(df_rbind)


# ==================================================== #

# CBind

## Import Data
file5 <- "salesworkload_5_cbind.xlsx"
file4 <- "salesworkload_4_cbind.xlsx"
df4 <- read_xlsx(file4)
df5 <- read_xlsx(file5)
View(df4)
View(df5)

## Combine data
df_cbind <- cbind(df5,df4)
View(df_cbind)


# ==================================================== #

# Merge

## Import data
file6 <- "salesworkload_6_merge.xlsx"
file7 <- "salesworkload_7_merge.xlsx"
df6 <- read_xlsx(file6)
df7 <- read_xlsx(file7)
View(df6)
View(df7)

## Combine Data
df_merge <- merge(df6,df7,by="id")
View(df_merge)
