
## Produces the "tidy" data file
generate_tidy_data <- function(reduced){
  
  tidydata <- colMeans(reduced[2:67])
  tidydata
  
}