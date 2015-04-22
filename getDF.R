getDF <- function(inFileName) {
  DFout <- tryCatch(
    {
    # message(paste("This is the try part for", inFileName))
    read.csv(inFileName)
    return("OK")},
  error = function(cond) {
    # message(paste(inFileName, "does not appear to exist."))
    # message("Here is the original error message:")
    message(cond)
    return(NA)
    },
  warning = function(cond) {
    message(paste(inFileName,"created a warning:",cond))
    return("NULL")
    },
  finally= {
    # message("processed it all")
  }
  )
return(DFout)
}