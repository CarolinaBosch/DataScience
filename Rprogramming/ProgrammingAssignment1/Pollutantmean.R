pollutantmean <- function(directory,pollutant="sulfate",id=1:332){
  temp = list.files(path=directory,pattern="*.csv")
  dat = do.call(rbind,lapply(temp,function(x) read.csv(x)))
  net = data.frame()
  for (f in id) {
    if(pollutant=="sulfate"){
      get <-dat[dat$ID ==f,2]
    } else {
      get <-dat[dat$ID ==f,3]
    }
    net <- c(get,net)
  }
  s<-as.numeric(net)
  avg <-mean(s,na.rm=TRUE)
  print(avg)
}