pliCon <- url("http://www.plimoth.org/plimoth-cinema")
pliCine <- readLines(pliCon)
movies <- pliCine[187]
mVec <- strsplit(movies,"color: #660000;\">")
mVec <- mVec[[1]][2:8]
mList <- lapply(mVec,strsplit,split="</em></strong>")  ## consider sapply. lapply results in a list of lists [[1]][[1]][1]