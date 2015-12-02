pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
 
  filesList <- list.files(path=directory,full.names=TRUE)
  fileData <- data.frame()
  for(i in id)fileData<-rbind(fileData,read.csv(filesList[i]))
  
  if(pollutant=='sulfate'){
    mean(fileData$sulfate,na.rm=TRUE)
  } else if(pollutant=='nitrate'){
    mean(fileData$nitrate,na.rm = TRUE )
  }
}
