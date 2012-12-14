setwd("/Users/mansmagnusson/Desktop/BayesLearn/liveBUGS")
library("rjags")

# Data 
x<-c(1,1,0,0,1,1,1,1,0,1)
data <- list(x = x, n = length(x), a = 1, b = 1)

# Create JAGS model (Bernoulli)
jags.bern<-jags.model("bern.bug",data)

# Draw samples
bern.sample<-coda.samples(model=jags.bern,variable.names="p",n.iter=1000)
summary(bern.sample)
plot(bern.sample)


# Linear regression
# Data 
weight<-c(71.2,58.2,56.0,64.5,53.0,52.4,56.8,49.2,55.6,77.8)
height<-c(169.6,166.8,157.1,181.1,158.4,165.6,166.7,156.5,168.1,165.3)
data <- list(height = height, 
             weight = weight, 
             n = length(height))

# Create JAGS model (Linear regression model)
jags.linreg<-jags.model("linreg.bug",data)

# Draw samples
linreg.sample<-coda.samples(model=jags.linreg,variable.names=c("beta0","beta1","sigma2"),n.iter=400000,thin=200)
summary(linreg.sample)
plot(linreg.sample)

# Rats model
# Data 
rats.data<-
  list(r=c(10,23,23,26,15,5,53,55,32,46,10,8,10,8,23,0,3),
       n=c(39,62,82,51,39,6,74,72,51,79,13,16,30,28,45,4,12),
       x1=c(0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1),
       x2=c(0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,1),
       N=length(r))
       

# Create JAGS model (Linear regression model)
jags.rats<-jags.model("rats.bug",rats.data)

# Draw samples
rats.sample<-coda.samples(model=jags.rats,variable.names=c("alpha0","alpha1","sigma"),n.iter=40000,thin=20)
summary(rats.sample)
plot(rats.sample)
