rawData <-  read.table("/home/thayhuynh/personal/R/Statistics-in-R/Regression/allen_test_score_model_experiment.data", header = TRUE)
attach(rawData)
vocab_model <- lm (ACL ~ Vocab)
anova(vocab_model)
vocab_sdmt_model <- lm(ACL ~ Vocab + SDMT)
anova(vocab_sdmt_model)