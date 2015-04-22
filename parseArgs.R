parseArgs <- function(...) {
  o <- commandArgs(TRUE)
  # The defaults arguments should be named
  defaults <- list(...)
  stopifnot( length(defaults) == length(names(defaults)) )
  stopifnot( all( names(defaults) != "" ) )
  # All the arguments should be of the form "--foo=bar"
  re <- "^--(.*?)=(.*)"
  stopifnot( all(grepl(re, o)) )
  # Extract the values and names
  r <- gsub(re, "\\2", o)
  names(r) <- gsub("^--(.*?)=(.*)", "\\1", o)
  r <- as.list(r)
  # Add the default values
  missing <- setdiff( names(defaults), names(r) )
  append(r, defaults[missing])
}
print( parseArgs() )
print( parseArgs(foo=1, bar=2) ) # With default values