

# subset_function ---------------------------------------------------------

# `CRTL + SHIFT + R` - to create that section above

# Only works for SCRIPTS

subset_function <- function(x){
  
  subset <- x[1:5]
  
  print(subset)
  
}

numbers2 <- c(1,2,3)

saveRDS(numbers2, file = "number.RDS")

