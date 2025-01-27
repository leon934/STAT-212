data <- read.table("hw1\\WindSpeed.txt")

x <- data[,1]
y <- data[,2]

y <- 1/y

fit = lm(y~x)

residual = fit$residual
predict = fit$fitted.values

plot(x, residual, xlab="x", ylab="Residuals")
plot(predict, residual, xlab="yhat", ylab="Residuals")

hist(residual)
plot(density(x))
qqnorm(residual)