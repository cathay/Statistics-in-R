rawData <-  read.table("/home/thayhuynh/personal/R/Regression/rabbit_cool_heart.data", header = TRUE)
attach(rawData)
model <- lm(Inf. ~ Area + X2 + X3)
summary(model)

