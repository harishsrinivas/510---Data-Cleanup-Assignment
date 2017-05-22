
getwd()
setwd("/Users/hvaidyanathan/Desktop/Data Assignment")

#The team lead will delegate the following data cleanup tasks to each team member:
# 1. Populate the missing values in the Area variable with an appropriate values (Birmingham, Coventry, Dudley, Sandwell, Solihull, Walsall or Wolverhampton)
# 2. Remove special characters, padding (the white space before and after the text) from Street 1 and Street 2 variables. 
# 3. Make sure the first letters of street names are capitalized and the street denominations are following the same standard (for example, all streets are indicated as “str.”, avenues as “ave.”, etc.
# 4. If the value in Street 2 duplicates the value in Street 1, remove the value in Street 2
# 5. Remove the “Strange HTML column”

raw_data <- read.csv("dirty_data.csv")
colnames(raw_data)
head(raw_data)

# 2. Remove special characters, padding (the white space before and after the text) from Street 1 and Street 2 variables. 
clean_data <- raw_data
clean_data$Street <- gsub("[^A-Za-z ]", " ", clean_data$Street)
clean_data$Street <- gsub("(?<=[\\s])\\s*|^\\s+|\\s+$", "", clean_data$Street, perl=TRUE)


clean_data$Street.2 <- gsub("[^A-Za-z ]", " ", clean_data$Street.2)
clean_data$Street.2 <- gsub("(?<=[\\s])\\s*|^\\s+|\\s+$", "", clean_data$Street.2, perl=TRUE)
