rawData <-  read.table(paste(getwd(),"/leadmoss.data",sep = ""), header = TRUE, stringsAsFactors=FALSE)
rawData$x2
interaction_term <- rawData$x1*rawData$x2
# Second-order (quadratic) model
second_order_model <- lm(rawData$y ~ rawData$x1 + rawData$x2 + rawData$x1*rawData$x2)
second_order_model_2 <- lm(rawData$y ~ rawData$x1 + rawData$x2 + interaction_term)
anova(second_order_model)
anova(second_order_model_2)
summary(second_order_model)
#This model has p-value 0.8567 so this model is not statistically useful
coefficients(second_order_model)

