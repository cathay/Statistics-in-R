library(MASS)
rawData <-  read.table(paste(getwd(),"/allen_test_score_model_experiment.data",sep = ""), header = TRUE, stringsAsFactors=FALSE)

attach(rawData)
vocab_model <- lm (ACL ~ Vocab)
anova(vocab_model)
vocab_sdmt_model <- lm(ACL ~ Vocab + SDMT)
anova(vocab_sdmt_model)
boxcox(vocab_sdmt_model)