complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  compObs = NULL
  fileNames <- dir(directory)
  fileNumbers <- as.numeric(sub(".csv","",fileNames))
  filesProcessed <- NULL
  obsNo = 1
  for (nexti in id) {
     fileno <-  paste("000",as(nexti,"character"), sep="")
     inFile <- paste(directory,"/",substr(fileno,nchar(fileno)-2,nchar(fileno)),".csv",sep = "")
     ## need to trap for non existant 'inFile'
    ##  good code:    inFileDF <- read.csv(inFile)
    resF <- lapply(inFile,getDF)
    #  message(resF)
    if (resF == "OK") {
    inFileDF <- read.csv(inFile)
    ##  use complete.cases
    nOfRows <- length(inFileDF[complete.cases(inFileDF),][,1])
      if (!(nOfRows ==0 & is.na(nOfRows))) { 
        compObs[obsNo] <- nOfRows
        filesProcessed <- c(filesProcessed,nexti)
       obsNo <- obsNo +1
      }
    }
   }
   nobs <- compObs
  data.frame(filesProcessed,nobs)
}

