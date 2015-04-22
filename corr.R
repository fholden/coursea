corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  ##  hd$nobs[hd$nobs >= 400]
  
  ## logic:  get the data.frame of observations
  ##      subset using the threshold
  ##      loop through the subset computing the cor and capturing in a vector
  ##      publish the vector
  ## threshold = 150
  ## directory="specdata"
  compDF = complete(directory)
  threshIDs <- compDF$id[compDF$nobs > threshold]
  corrValue = NULL
  corrNo = 1
  for (nexti in threshIDs) {
    ## get dataframe and compute cor
    inFile <- str_join(directory,"/",str_pad(as(nexti,"character"),width=3,side="left",pad="0"),".csv")
    inDF = read.csv(inFile)
    newDFSulfate <- inDF$sulfate[is.na(inDF$sulfate) == F & is.na(inDF$nitrate) == F]
    newDFNitrate <- inDF$nitrate[is.na(inDF$sulfate) == F & is.na(inDF$nitrate) == F]
    corrValue[corrNo] = round(cor(newDFSulfate,newDFNitrate),4) 
    corrNo <- corrNo + 1
    }
  corrValue
}