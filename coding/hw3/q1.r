baseball_data <- read.table(file="C:\\Users\\leonl\\Documents\\GitHub\\STAT-212\\coding\\hw3\\Baseball-Salary-Data.csv", sep=",", header=TRUE)

write.table(baseball_data, "baseball_data.txt", sep = "\t", row.names = FALSE, col.names = TRUE)


colnames(baseball_data) <- make.names(colnames(baseball_data))

salary <- baseball_data$salary


fit <- lm(salary~., data=baseball_data[, 2:17])

summary(fit)

anova(fit)

predicted_fit <- lm(salary~. - batting.average - on.base.percent - hits - doubles - triples, data=baseball_data[, 2:17])
anova(predicted_fit, fit)

summary(predicted_fit)

# Q. 2G
residual <- predicted_fit$residual
predict <- predicted_fit$fitted.values

plot(predict, residual, main="Residuals vs. predicted", xlab="Predicted values", ylab="Residual values")

plot(density(residual))

qqnorm(rstandard(predicted_fit))
qqline(rstandard(predicted_fit), lwd=2)

qqnorm(residual)

install.packages("leaps")
library(leaps)

leaps.AIC=function(X,y){
  y=as.vector(y)
  X=as.matrix(X)
  num=ncol(X)

  out=leaps(X,y,method='r2',nbest=1)

  aic=1:num
  bic=1:num

  for(j in 1:num){
    cols=(1:num)[out$which[j,]==TRUE]
    fit=lm(y~X[,cols])

    aic[j]=AIC(fit)
    bic[j]=AIC(fit,k=log(length(y)))
  }

  print("AIC values")
  print(aic)
  print("BIC values")
  print(bic)
  
  list(aic,bic, out$which)
}

leaps.AIC(baseball_data[, 2:17], salary)

new_fit <- lm(salary~. - batting.average - on.base.percent - doubles - triples - home.runs - walks - stolen.bases - errors - free.agent - arbitration, data=baseball_data[, 2:17])

summary(new_fit)

length(new_fit$residual)

plot(seq(1, 337), rstandard(new_fit), main="Residuals of new fit", xlab="Index", ylab="Residuals")

new_fit.residual <- rstandard(new_fit)
indices <- which(new_fit.residual < -3)
x_val <- seq(1, 337)[indices]

print(x_val)

plot(salary, new_fit.residual, main="Standardized residuals versus the predicted values", xlab="Predicted salary", ylab="Standardized residuals")

qqnorm(new_fit.residual)
qqline(new_fit.residual, lwd=2)

output = cooks.distance(new_fit)
plot(output, ylab="Cook's D")

