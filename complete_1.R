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
  
  #get the stringr library
  library("stringr", lib.loc="/Library/Frameworks/R.framework/Versions/3.1/Resources/library")
  ## directory = "specdata"  ## for testing
  ## fileNames <- dir(directory)
  ## nOfFiles <- length(fileNames)
  
  ## nObs <- length(test001[,"nitrate"])
  ##for (i in id)  if (is.na(test001$nitrate[i]) == F) print(test001$nitrate[i])
  
  ## file Name for testing
  compObs = NULL
  fileName = NULL
  ## id = 1:10  ## for testing
  ##print(id)
  obsNo = 1
  for (nexti in id) {
    fileName[nexti] <- as(str_pad(as(nexti,"character"),width=3,side="left",pad="0"),"integer")
    inFile <- str_join(directory,"/",str_pad(as(nexti,"character"),width=3,side="left",pad="0"),".csv")
    inFileDF <- read.csv(inFile)
    fobs <- 1:length(inFileDF$nitrate)
    compObs[obsNo] <- 0
    for (i in fobs) if ((is.na(inFileDF$nitrate[i]) == F) & (is.na(inFileDF$sulfate[i]) == F))   {
        compObs[obsNo] <- compObs[obsNo] +1
        }
    if (is.na(compObs[obsNo]) == F) obsNo <- obsNo + 1
  }
  ## id <- fileName
  nobs <- compObs
  data.frame(id,nobs)
}