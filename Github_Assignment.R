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


# 3. Make sure the first letters of street names are capitalized and the street denominations are following the same standard (for example, all streets are indicated as “str.”, avenues as “ave.”, etc.
clean_data$Street <- gsub("(^|[[:space:]])([[:alpha:]])", "\\1\\U\\2", clean_data$Street, perl=TRUE)
clean_data$Street.2 <- gsub("(^|[[:space:]])([[:alpha:]])", "\\1\\U\\2", clean_data$Street.2, perl=TRUE)

install.packages('gsubfn')
library('gsubfn')

patterns     <- c("Lane", "Road", "Avenue", "Green", "Hospital", "Village", "Center", "Drive", "Circle", "Park")
replacements <- c("Lan.",  "Rd.", "Ave.", "Gr.","Hosp.","Vil.","Ctr.", "Dr.", "Cr.","Pk.")



clean_data$Street <- gsubfn("\\b\\w+\\b", as.list(setNames(replacements, patterns)), clean_data$Street)
clean_data$Street.2 <- gsubfn("\\b\\w+\\b", as.list(setNames(replacements, patterns)), clean_data$Street.2)



# 4. If the value in Street 2 duplicates the value in Street 1, remove the value in Street 2
i <- 1

while(i < NROW(clean_data)) 
{
  if(clean_data$Street[i] == clean_data$Street.2[i]) 
  {
    clean_data$Street.2[i] = ""
  }
  i <- i+1
}


# 5. Remove the “Strange HTML column”
columns <- 1:4
clean_data <- subset(clean_data[,1:4])
head(clean_data)

# 1. Populate the missing values in the Area variable with an appropriate values (Birmingham, Coventry, Dudley, Sandwell, Solihull, Walsall or Wolverhampton)
i <- 1
while (i < NROW(clean_data))
{
  if(grep("Birmingham", clean_data$Street[i]) | grep("Birmingham", clean_data$Street.2[i])) {
    clean_data$Area[i] <- "Birmingham"
  }
  else if(grep("Coventry", clean_data$Street[i]) | grep("Coventry", clean_data$Street.2[i])) {
    clean_data$Area[i] <- "Coventry"
  }
  else if(grep("Dudley", clean_data$Street[i]) | grep("Dudley", clean_data$Street.2[i])) {
    clean_data$Area[i] <- "Dudley"
  }
  else if(grep("Sandwell", clean_data$Street[i]) | grep("Sandwell", clean_data$Street.2[i])) {
    clean_data$Area[i] <- "Sandwell"
  }
  else if(grep("Solihull", clean_data$Street[i]) | grep("Solihull", clean_data$Street.2[i])) {
    clean_data$Area[i] <- "Solihull"
  }
  else if(grep("Walsall", clean_data$Street[i]) | grep("Walsall", clean_data$Street.2[i])) {
    clean_data$Area[i] <- "Walsall"
  }
  else if(grep("Wolverhampton", clean_data$Street[i]) | grep("Wolverhampton", clean_data$Street.2[i])) {
    clean_data$Area[i] <- "Wolverhampton"
  }
  else  {
    clean_data$Area[i] <- "Unknown"
  }
  i < i + 1
}
