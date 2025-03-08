baseball_data <- read.table(file="C:\\Users\\leonl\\Documents\\GitHub\\STAT-212\\coding\\hw3\\Baseball-Salary-Data.csv", sep=",", header=TRUE)

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
  #
  # X is an n x k matrix and y a vector of n values.
  #
  # This function fits linear models of the sort lm(y~X[,cols]), where
  # cols is a subset of {1,...,k}.  It uses the package leaps to find
  # the best model (according to R^2) among all those for which the
  # number of elements of cols is j, and it does so for j=1,...,k.  It
  # then determines AIC and BIC for each of the k models so determined.
  #
  # In case X and y aren't of the right mode, make them a matrix and
  # a vector, respectively.
  #
  y=as.vector(y)
  X=as.matrix(X)
  num=ncol(X)
  #
  # Create the leaps output, returning only the best model for each
  # number of variables (i.e., nbest=1). 
  #
  out=leaps(X,y,method='r2',nbest=1)
  # 
  # Initialize the aic and bic vectors.
  #
  aic=1:num
  bic=1:num
  #
  # Compute all the AIC and BIC values.
  #
  for(j in 1:num){
    #
    # Determine the variables in the best model containing j independent
    # variables. 
    #
    cols=(1:num)[out$which[j,]==TRUE]
    fit=lm(y~X[,cols])
    #
    # Determine AIC and BIC for the best model with j variables.
    #
    aic[j]=AIC(fit)
    bic[j]=AIC(fit,k=log(length(y)))
  }
  #
  # Print out the output.
  #
  print("AIC values")
  print(aic)
  print("BIC values")
  print(bic)
  #
  # Return the output.
  #

  # Assuming 'out' is the result from leaps function
best_aic_model <- which.min(aic)  # Index of the best AIC model
best_bic_model <- which.min(bic)  # Index of the best BIC model

# Get the predictors for the best AIC model
best_aic_predictors <- (1:num)[out$which[best_aic_model, ] == TRUE]
best_bic_predictors <- (1:num)[out$which[best_bic_model, ] == TRUE]

print(best_aic_predictors)
print(best_bic_predictors)

  list(aic,bic)
}

leaps.AIC(baseball_data[, 2:17], salary)

