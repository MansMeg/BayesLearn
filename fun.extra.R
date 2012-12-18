
# Plot many mixings
plot.many<-function(results,bins,sameAxis){
  max.val<-max(results)
  min.val<-min(results)
  par(mfrow=c(4,4))
  if(sameAxis){
    for(i in 1:16){
      plot(results[,i],type="l",main=paste("Beta",i),ylab="",ylim=c(max.val,min.val))
    }
    for(i in 1:16){
      hist(results[,i],type="l",main=paste("Beta",i),breaks=bins,xlim=c(max.val,min.val))
    }
  }else{
    for(i in 1:16){
      plot(results[,i],type="l",main=paste("Beta",i),ylab="")
    }
    for(i in 1:16){
      hist(results[,i],type="l",main=paste("Beta",i),breaks=bins)
    }
  }
  par(mfrow=c(1,1))
}