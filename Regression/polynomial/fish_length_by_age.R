rawData <-  read.table(paste(getwd(),"/fish_length_by_age.data",sep = ""), header = TRUE, stringsAsFactors=FALSE)

plot(rawData[,"age"],rawData[,"length"], xlab ="Age", ylab="Length", type="p")
#Scatter plot suggests that there is positive trend in the data. That is, not surprisingly, as the age of
#bluegill fish increases, the length of the fish tends to increase.
#The trend, however, doesn't appear to be quite linear. It appears as if the relationship is slightly curved.

#Therefore we go with second-order model(quardratic)
rawData["age_quadratic"] <- as.vector(rawData["age"]^2)
quadratic_model <- lm(length ~ age + age_quadratic, data = rawData)
#plot(fitted(quadratic_model), residuals(quadratic_model), xlab = "Fitted values", ylab = "Residuals")

summary(quadratic_model)
anova(quadratic_model)

predict_values <- data.frame(age=5,age_quadratic=25)
predict(quadratic_model,newdata = predict_values, interval = "prediction", ,level = 0.95)
#80.1% of the variation in the length of bluegill fish is reduced by taking into account a quadratic function of the age of the fish.
#We can be 95% confident that the length of a randomly selected five-year-old bluegill fish is between 143.5 and 188.3 mm.
