creditData <-  read.csv("/home/thayhuynh/personal/R/Statistics-in-R/Regression/Credit.csv", header = TRUE)
predictors <- attach(creditData)
str(creditData)
female_credit_data <- creditData[creditData$Gender == 'Female', ]
female_credit_data
female_model <- lm(female_credit_data$Balance ~ female_credit_data$Gender,data = female_credit_data)