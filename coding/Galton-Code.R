
getwd()

data = read.table("Galton-Height-Data.txt",header=T)
class(data)

dim(data)
nrow(data)
ncol(data)

head(data)

dat = read.table("Galton-Height-Data.txt")
dim(dat)
head(dat)


data.mat = as.matrix(data)
class(data.mat)
dim(data.mat)
head(data.mat)

y = data[,2]
x = data[,1]

lm.fit = lm(y~x)

summary(lm.fit)

resid = lm.fit$residuals
predict = lm.fit$fitted.values

### residual vs. x plot (to check for non-linearity) ###

plot(x, resid, xlab = "Father's Height", ylab = "Residuals", main = "Residual Plot for Non-linearity Checking")

### residual vs. yhat plot (to check for unequal error variances) ### 

plot(predict, resid, xlab = "Fitted Values (Yhat)", ylab = "Residuals", main = "Residual Plot for Error Variance Checking")

### The 3 plots to check for Normality assumption ###

hist(resid, xlab ="Residuals", main = "Histogram of the Residuals")

plot(density(resid), xlab = "Residuals", ylab = "Density", main = "Density Estimate of Residuals")

qqnorm(resid)
qqline(resid,col="RED",lwd=2)

### Reproducing the scatter plot seen at the beginning ###

plot(x,y,xlab = "Father's Height", ylab = "Son's Height", main = "Scatterplot of Galton's Data with Lines Overlaid")

points(x,rep(mean(y),length(x)),col="RED",type="l",lwd=2)

lines(x,predict,col="BLUE",lwd=2)

points(x,x+1,col="GREEN",type="l",lwd=2)


### Inference: conf. int for beta1 ###

confint(lm.fit, level=0.95)
confint(lm.fit, level=0.9)
confint(lm.fit)


### Inference: 95% confidence interval for E(Y|X = x0) at a given point X = x0 ###

predict(lm.fit, newdata = data.frame(x=75), interval="confidence", level=0.95)  ### NOTE: Here, the data.frame command is important and must be used with the original colname for the predictor (in this case that is simply "x")

### Inference: 95% prediction interval for Y at a given point X = x0 ###

predict(lm.fit, newdata = data.frame(x=75), interval="prediction", level=0.95)  ### NOTE: Here, the data.frame command is important and must be used with the original colname for the predictor (in this case that is simply "x")


### sample correlation coefficient between x and y, and the test for correlation coefficient ###

cor(x,y)

cor.test(x,y)

### One last thing: fitting lin. reg of Y vs. (1/x) or X^2 etc. ###

lm(y~1/x) ## Does NOT work! ##

### Solution 1 ### 

lm(y~I(1/x))

### Solution 2 ###

inv.x = 1/x
lm(y~inv.x)


### Same for x^2 as well ###

lm(y~x^2) ## Does NOT work ##

### Solution 1 ### 

lm(y~I(x^2))

### Solution 2 ### 

sq.x = x^2
lm(y~sq.x)