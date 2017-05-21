require(zoo)
library(stringr)

# Load csv and set empty space with NA
Dirty.Data <- read.csv("C:/MS Analytics/RStudio Program/dirty_data.csv",  header=T)

# Replace NA in Area column with previous not NULL value
Area.Val<- transform(Dirty.Data, Area = na.locf(Area))
