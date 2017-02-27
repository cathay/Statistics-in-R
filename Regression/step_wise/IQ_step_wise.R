IQ_rawData <-  read.table(paste(getwd(),"/IQ_step_wise.data",sep = ""), header = TRUE, stringsAsFactors=FALSE)
str(IQ_rawData)

full_model <- lm(PIQ ~ . ,  data = IQ_rawData)
null_model <- lm(PIQ ~ 1, data = IQ_rawData)
cor(IQ_rawData)
pairs(IQ_rawData)

backward_model <- step(full_model, direction = "backward", trace=1)
forward_model <- step(null_model,direction="forward",trace=1, scope = ~ Brain + Height + Weight)
