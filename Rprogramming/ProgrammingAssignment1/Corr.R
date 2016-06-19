corr <- function(directory,threshold=0) {
  
  temp = list.files(path=directory,pattern="*.csv")
  dat = do.call(rbind,lapply(temp,function(x) read.csv(x)))
  tz <-complete(directory,1:332)
  dz<-tz[tz$nobs>threshold,"id"]
  gat <-subset(dat,!is.na(sulfate)&!is.na(nitrate))
  cc=vector()
  for(f in dz) {
    gex <-gat[gat$ID==f,2]
    gey <-gat[gat$ID==f,3]
    cc<-c(cc,cor(as.vector(gex),as.vector(gey)))
    
  }
  print(cc)
  
}