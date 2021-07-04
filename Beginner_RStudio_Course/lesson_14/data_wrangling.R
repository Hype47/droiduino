##
## Apply this on console
##

## String to Date
text <- "21-11-2019"
date <- as.Date(text,"%d-%m-%Y")
date

## String to Number
text <- "123456"
num <- as.numeric(text)
num

num + 1000
text + 10000

## Remove White Space
text <- "     this is text      "
text
cleanText <- trimws(text,which = "both")
cleanText


## Extract text from String
text <- "19May2019"
subText <- substr(text,1,5)
subText
subText <- substr(text,3,nchar(text))
subText


## Remove unwanted character from String
text <- "this is not a text"
removeChar <- sub("not","",text)
removeChar


## EXERCISE ====
# Take numbers from this string and convert it into number
text <- "123456a7"
cleanText <- sub("a","",text)
num <- as.numeric(cleanText)
num



