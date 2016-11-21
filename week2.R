# Calculate Pearson's r 

x <- c( 2, 4, 1.5, 2, 3)
y <- c(7, 3, 8, 8, 6)

Zx <- (x-mean(x))/sd(x)
Zy <- (y-mean(y))/sd(y)

r <- sum(Zx*Zy)/(length(x)-1)

# Our data
money <- c(1,2,3,4,5,6,7,8,9,10)
prosocial <- c(3, 2, 1, 4, 5, 10, 8, 7, 6,9)
# Find the regression coefficients
lm(prosocial ~ money)
# Your plot
plot(money, prosocial, xlab = "Money", ylab = "Prosocial Behavior")
# Your regression line
line <- lm(prosocial ~ money)
abline(line)
# Add a line that shows the mean of the dependent variable
abline(mean(prosocial), 0)
#Correlation 
cov(money,prosocial)