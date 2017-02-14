shipmentData <-  read.table(paste(getwd(),"/piece_wise_shiment.data",sep = ""), header = TRUE, stringsAsFactors=FALSE)

plot(x=shipmentData$x1, y=shipmentData$y, col=c("blue"))
# -> It seems we need piece wise model for the point 250

# create dummy variable for piece wise
shipmentData["x2"] <- as.numeric(shipmentData["x1"] - 250 > 0)
shipmentData["x3"] <- (shipmentData["x1"] - 250)*shipmentData["x2"]
shipmentData

#Build the model
piece_wise_model <- lm(y ~ x1 + x3, data = shipmentData)
summary(piece_wise_model)
coefficients(piece_wise_model)

#Predict the value
predict_values <- data.frame(x1 = c(125,250,400), x3 = (c(125,250,400) - 250)*c(0,0,1))
predict(piece_wise_model,newdata = predict_values)
predict(piece_wise_model,newdata = predict_values, interval = "prediction")
predict(piece_wise_model,newdata = predict_values, interval = "confidence")
