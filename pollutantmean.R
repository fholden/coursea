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
     
  ## directory = "specdata"
  ## id= 1:10
## testJoin= rbind(testJoin,test003)
  ## test003 <- read.csv("specdata/003.csv")
  ##for (nexti in id) print(str_pad(as(nexti,"character"),width=3,side="left",pad="0")
  ##  str_join("specdata/","002",".csv")
  ## mean(testJoin$nitrate,na.rm=T)
  ##for (nexti in id) print(str_pad(as(nexti,"character"),width=3,side="left",pad="0"))
  
  
  ## get the "stringr" library 
  library("stringr", lib.loc="/Library/Frameworks/R.framework/Versions/3.1/Resources/library")
  ## load the result data.frame to NULL
  testJoin = NULL
  ## id = 1:10  ## for testing
  ## pollutant="sulfate"  ## for testing
  
  for (nexti in id) {
   inFile <- str_join(directory,"/",str_pad(as(nexti,"character"),width=3,side="left",pad="0"),".csv")
   testJoin = rbind(read.csv(inFile),testJoin) 
  }
  
  round(mean(testJoin[,pollutant],na.rm=T),3)
}