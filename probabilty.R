qnorm(0.015,lower.tail = TRUE)
qnorm(0.985,lower.tail = TRUE)

qnorm(0.95,lower.tail = TRUE)

s <- 100000
n <- 81
subMean=20000
subMean/(s/sqrt(n))
qt(0.05,df=80,lower.tail=FALSE)
qt(0.0025,df=80,lower.tail=FALSE)

pt(0.86,df=899,lower.tail = FALSE)

vars <- c(1:6)
p <- c(0.56,0.23,0.11,0.05,0.03,0.02)
mean <- sum(vars*p)
mean
sd <- (c(1:6) -mean)^2
sd
p
sd*p
sqrt(sum(sd*p))

