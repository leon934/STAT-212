#### question 1.
1. The $(t, \log (y))$ scatterplot suggests a linear relationship.

![[q1_t_vs_y.png|378]]

![[q1_t_vs_logy.png|378]]

It can be seen that the $(t, \log(y))$ scatterplot is more linear than the $(t,y)$ scatterplot.

1. The predictive equation is: 
$$Y=5.9732-0.2184t$$

R code for question 1:
```r
data <- read.table(file="C:\\Users\\leonl\\Documents\\STAT212\\hw1\\BacteriaDeath.txt")
head(data)

t <- data[,1]
y <- data[,2]

plot(y~t)
plot((log(y))~t)

print(lm(log(y)~t))
```

---
#### question 2.
1. The $(x,y)$ scatterplot suggests a linear relationship.

![[q2_y_vs_x.png|378]]

![[q2_y_vs_1x.png|378]]

It can be seen that the $(1/x, y)$ scatterplot is more linear than the $(x,y)$ scatterplot.

1. The $(1/x, y)$ scatterplot suggests the best linear relationship. The estimated regression line is;
$$
y=2.9789-6.9345(1/x)
$$
3. At a wind speed of 8 mph, the current output would be $2.1120875$.
4. 
###### The $x_i$ vs. $e_i$ and $y_i$ vs. $e_i$ are given below:
![[e_vs_x.png|378]]
There are no patterns or structures and the datapoints are relatively scattered across the graph. This means the linearity assumption of the model is reasonable.

![[e_vs_yhat.png|378]]
There are no patterns or structures and the datapoints are relatively scattered across the graph. This means the equal variances assumption is reasonable.
###### The graphs for determining normality of the errors ($\epsilon_{i}$) are given below:
![[histogram.png|378]]
Since the histogram appears to be left-skewed, rather than following a normal distribution, it can be seen that the residuals are not normally distributed.

![[density_estimator.png|378]]
While the kernel density graph appears to look normally distributed, it is symmetric around 2. This means the residuals aren't normally distributed.

![[quantile_plot.png|378]]
The Q-Q plot appears to roughly follow the $y=x$ line, but slowly starts to deviate from it near the end. Since it doesn't relatively follow $y=x$, it can be said that the residuals aren't normally distributed.

5. The $R^{2}$ value is $0.98$. This means that 98% of the total variation in the output is explained by the linear relationship.
6. A 99% confidence interval for the slope ($\beta_{1}$) of the linear model is $(-7.513934, -6.355066)$.
7. A 95% confidence interval for the average output is $(0.7491112, 0.8745171)$.
8. A 95% prediction interval for the output is $(2.010505, 2.414719)$.

```r
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
```