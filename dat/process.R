library(maps) # map()
library(LatticeKrig) # quilt.plot()
x <- as.matrix( read.table("HadISST1_SST_2015.txt") )
xvec <- c(x)
xvec[which(xvec != -1000)] <- xvec[which(xvec != -1000)] / 100
xvec[which(xvec < -50)] <- 20

n <- nrow(x)
k <- ncol(x)

1:n

lat <- rep(seq(89.5,-89.5,length=n),times=k)#rep(1:k,each=n)
lon <- rep(seq(-179.5,179.5,length=n),each=k)#rep(1:n,k)


latlon<- cbind(lat,lon)

viewPred <- function(x,latlon,main.plot='',bks=range(x),leg=T) {
  quilt.plot(latlon[,2],latlon[,1],x,add.legend=leg,
             fg='grey90',bty='n',main=main.plot,
             ylim=range(latlon[,1])+c(-1,1),
             xlim=range(latlon[,2])+c(-1,1),
             breaks=seq(bks[1],bks[2],len=length(x)+1),nx=150,ny=150,
             col= colorRampPalette(c('dark blue','grey90','dark red'))(length(x)))
  #map('world',add=T,col='grey')
}
#viewPred(xvec,latlon)
