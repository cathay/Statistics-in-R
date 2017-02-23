library(MASS)
rawData <-  read.table(paste(getwd(),"/birthsmoker.data",sep = ""), header = TRUE, stringsAsFactors=FALSE)

# Transform catogirical variables to numeric
rawData$Smoke[rawData$Smoke == 'yes'] <- 1
rawData$Smoke[rawData$Smoke == 'no'] <- 0
attach(rawData)
Smoke <- as.numeric(Smoke)
Smoke

model <- lm(Wgt ~ Smoke + Gest)
summary(model)
boxcox(model)

#Calculate CI for Smoke -> 
# We can be 95% confident that the mean birth weight of smoking mothers is between 158.7 and 330.4 grams less than 
#the mean birth weight of non-smoking mothers, regardless of the length of gestation. 
#It is up to the researchers to debate whether or not the difference is a meaningful difference.
Smoke_CI <- confint(model, "Smoke", level = 0.95)
