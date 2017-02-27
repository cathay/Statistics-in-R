library(leaps)
library(car)
cement_rawData <-  read.table(paste(getwd(),"/cement_mallow.data",sep = ""), header = TRUE, stringsAsFactors=FALSE)
str(cement_rawData)
predictors <- cement_rawData[,2:5]
response_vector <- cement_rawData[,1]

#Choose model by Mallow's Cp
options <- leaps(x= predictors, y=response_vector, names=names(predictors),method="Cp")
report <- data.frame(options$which,options$size,options$Cp)
best_model_report <- report[options$size >= options$Cp,]
best_model_report
#The best model should be selected with criteria: Cp < size (number of parameters)
#=> There are 3 models y ~ x1 + x2 + x4, y ~ x1 + x2 + x3 and y ~ x1 + x2

#Then we need to do step-wise algorithm -> suggest y ~ x1 + x2 + x4
model_null <- lm(y ~ 1, data=cement_rawData)
full_model <- lm(y ~ ., data = cement_rawData)
step_wise_model_forward <- step(model_null,scope = ~ x1 + x2 + x3 + x4 , trace = 1, direction = "forward")
step_wise_model_backward <- step(full_model, trace =1, direction = "backward")

#Calculate variance inflation factor of 3 models
vif(lm(y ~ x1 + x2 + x4, data = cement_rawData))
vif(lm(y ~ x1 + x2 + x3, data = cement_rawData))
vif(lm(y ~ x1 + x2, data = cement_rawData))

#For the last model (only 2 predictors), the variance inflation factors are quite satisfactory (both 1.06),
#the adjusted R2-value (97.44%) is large, and the residual analysis yields no concerns.
final_model <- lm(y ~ x1 + x2, data = cement_rawData)
std_res <- rstandard(final_model)
qqnorm(std_res)
qqline(std_res)
# This plot suggests that the error terms are normally distributed. The regression model with y as the response and x1 and x2 
#the predictors has been evaluated fully and appears to be ready to answer the researcher's questions.
