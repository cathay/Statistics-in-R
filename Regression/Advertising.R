dataSales <- read.csv("/home/thayhuynh/personal/R/Statistics-in-R/Regression/Advertising.csv", header = TRUE)
predictors <- attach(dataSales)
model <- lm(Sales ~ TV + Radio + Newspaper)
summary(model)
cor(data)
summary(model)$r.sq
summary(model)$sigma
pf(570.3,3,196,lower.tail = FALSE)
reduce_newspaper_model <- lm(Sales ~ . - Newspaper - X, data=dataSales)
summary(reduce_newspaper_model)
