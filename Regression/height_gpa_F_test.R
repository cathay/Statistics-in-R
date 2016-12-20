rawData <-  read.table("/home/thayhuynh/personal/R/Regression/height_gpa.data", header = TRUE)
attach(rawData)
full_model_anova <- aov(formula = gpa ~ height)
full_model_regression <- lm(gpa ~ height)
full_model_regression
summary(full_model_regression)
anova(full_model_regression) # F-test is 0.0938, df1 = 1, df2=33
p_value <- pf(0.0938,df1 = 1, df2 = 33)
p_value # 0.2386753 failed to reject H0 and favor the reduced model
