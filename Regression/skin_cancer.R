rawData <-  read.table("/home/thayhuynh/personal/R/skin_cancer.data", header = FALSE)
lats <- as.numeric(as.vector(rawData$V2[2:length(rawData$V2)]))
mortalities <- as.numeric(as.vector(rawData$V3[2:length(rawData$V3)]))

regressionModel <- lm(mortalities ~ lats)
plot(lats,mortalities, xlab = "Latitude" ,ylab = "Mortality", col="blue")
abline(regressionModel)
summary(regressionModel)
residuals <- resid(regressionModel)
plot(lats,residuals,xLab="Latitude",yLab="Residuals",col="red")
abline(0,0)