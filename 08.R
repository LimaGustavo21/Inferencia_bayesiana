##Primeiro teste

theta <- c(0.05,0.1,0.15)
prior <- c(0.6,0.3,0.1)
vero <- dbinom(180,1000,theta)
w <- prior*vero
post <- prop.table(w)
tab <- matrix(c(theta,prior,vero,w,post),nrow=3)
tab

for (i in 1:10) {
  w <- prior*vero
  post <- prop.table(w)
  print(post)
  prior <- post
}

##Segundo Teste

prior2 <- post
vero2 <- dbinom(6,40,theta)
w2 <- prior2*vero2
post2 <- prop.table(w2)
tab2 <- matrix(c(theta,prior2,vero2,w2,post2),nrow=3)
tab2

##Terceiro Teste

vero2
w3 <- prior*vero*vero2
post3 <- prop.table(w)
tab3 <- matrix(c(theta,prior,vero,vero2,w3,post3),nrow=3)
tab3
