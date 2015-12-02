corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  listFiles <- list.files(directory, full.names = TRUE);
  correlation <- c();
  
  for(i in seq_along(listFiles)) {
    completeCases <- complete(directory, i);
    
    if (completeCases$nobs > threshold) {
      data <- read.csv(listFiles[i], comment.char = "");
      data <- na.omit(data)
      correlation <- c(correlation, cor(data$sulfate, data$nitrate, use = "complete.obs"));
    }
  }
  
  correlation;
}
