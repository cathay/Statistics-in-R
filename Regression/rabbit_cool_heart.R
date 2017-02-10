rawData <-  read.table("/home/thayhuynh/personal/R/Regression/rabbit_cool_heart.data", header = TRUE)
attach(rawData)

# Testing slope of X1=0: F-statistic = SSR(X1 given X2,X3)/MSE = 0.63742/0.01946 = 32.7554
full_model <- lm(Inf. ~ X2 + X3 + Area) # Area is X1
reduce_X1_as_model <- lm(Inf. ~ X2 + X3)
summary(full_model)

#Since X3 has high p-value, try to reduce X3
reduce_X3_model <-  lm(Inf. ~ X2 +  Area)
summary(reduce_X3_model)
anova(full_model)
anova(reduce_X3_model)
anova(reduce_X1_as_model)

plot(fitted(full_model), residuals(full_model), xlab = "Fitted values", ylab = "Residuals")
help(abline)
#Testing if slope of X2, X2 equal 0
model_Area <- lm(Inf. ~ Area)
anova(model_Area)
testing_subset_full_model <- lm(Inf. ~ Area + X2 + X3)
anova(testing_subset_full_model)

#Testing all slope parameters equal 0
model_Area_First <- lm(Inf. ~ Area + X2 + X3)
anova(model_Area_First)

