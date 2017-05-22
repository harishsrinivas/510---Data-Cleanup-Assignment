# 1. Populate the missing values in the Area variable with an appropriate values (Birmingham, Coventry, Dudley, Sandwell, Solihull, Walsall or Wolverhampton)
require(zoo)
library(stringr)

# Load csv and set empty space with NA
Dirty.Data <- read.csv("dirty_data.csv",  header=T, na.strings=c("","NA"))

# Replace NA in Area column with previous not NULL value
Dirty.Data<- transform(Dirty.Data, Area = na.locf(Area))
clean_data$Area <- Dirty.Data$Area
write.csv(clean_data, file="clean_data.csv")
