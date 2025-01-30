data <- read.table("C:\\Users\\leonl\\Documents\\GitHub\\STAT-212\\coding\\hw1\\WindSpeed.txt")

x <- data[,2]
y <- data[,1]

fit = lm(y~I(1/x))

# Q.2A
plot(y~x)
plot(y~I(1/x))

# Q.2B
summary(fit)

# Q.2C
2.9789-6.9345*(1/8)

# Q. 2D
residual = fit$residual
predict = fit$fitted.values

plot(x, residual, main="x_i vs. e_i", xlab="x", ylab="Residuals")
plot(predict, residual, main="yhat vs. e_i", xlab="yhat", ylab="Residuals")
hist(residual)
plot(density(residual))

qqnorm(residual)
qqline(residual, lwd=2)

# Q.2E
summary(fit)$r.squared

# Q.2F
B <- -6.9345
o <- 0.2064

print(B + qt(1 - 0.01/2, nrow(data) - 2) * o)
print(B - qt(1 - 0.01/2, nrow(data) - 2) * o)

# Q. 2G
predict(lm(y~I(1/x)), newdata=data.frame(x = 3.2), interval="confidence", level=0.95)

# Q. 2H
predict(lm(y~I(1/x)), newdata=data.frame(x = 9.05), interval="prediction", level=0.95)