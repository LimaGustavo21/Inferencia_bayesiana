theta <- seq(1,30)/100
prior2 <- rep(c(5,3,1), each = 10)
vero2 <- dbinom(11,67,theta)
w2 <- prior2*vero2
post2 <- prop.table(w2)
tab2 <- matrix(c(theta,prior2,vero2,w2,post2),nrow=30)

plot(tab2[,5])
