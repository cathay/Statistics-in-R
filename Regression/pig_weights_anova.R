pig_weights <- read.table("/home/thayhuynh/personal/R/pig_weights.data", header = TRUE)
pig_weights
names(pig_weights)
#attach(pig_weights) # Attach to get variables Feed_1, Feed_2... 
summary(pig_weights)
statistical_model <- stack(pig_weights)
summary(statistical_model)
attach(statistical_model)
boxplot(values ~ ind)
oneway.test(values ~ ind, var.equal=TRUE)
anova(values ~ ind)
