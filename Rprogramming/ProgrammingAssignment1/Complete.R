complete<-function(directory,id=1:332) {
  
temp = list.files(path=directory,pattern="*.csv")
  dat = do.call(rbind,lapply(temp,function(x) read.csv(x)))
  new = data.frame("id" = id,"nobs"=numeric(length(id)))
  c = 1
  for(f in id) {
    good<-complete.cases(dat[dat$ID==f,])
    new[c,2] <-length(good[good=="TRUE"])
    c <- c + 1
  }
  print(new)
  
}
