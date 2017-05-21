# 3. Make sure the first letters of street names are capitalized and the street denominations are following the same standard (for example, all streets are indicated as âstr.â, avenues as âave.â, etc.
clean_data$Street <- gsub("(^|[[:space:]])([[:alpha:]])", "\\1\\U\\2", clean_data$Street, perl=TRUE)
clean_data$Street.2 <- gsub("(^|[[:space:]])([[:alpha:]])", "\\1\\U\\2", clean_data$Street.2, perl=TRUE)

install.packages('gsubfn')
library('gsubfn')

patterns     <- c("Lane", "Road", "Avenue", "Green", "Hospital", "Village", "Center", "Drive", "Circle", "Park","Street")
replacements <- c("Lan.",  "Rd.", "Ave.", "Gr.","Hosp.","Vil.","Ctr.", "Dr.", "Cr.","Pk.","Str.")

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
