#### question 1
1.  Below is the code for fitting a linear regression model with the baseball data:
```r
baseball_data <- read.table(file="C:\\Users\\leonl\\Documents\\GitHub\\STAT-212\\coding\\hw3\\Baseball-Salary-Data.csv", sep=",", header=TRUE)

salary <- baseball_data$salary

lm(salary~., data=baseball_data[, 2:17])
```
2. The percentage of the variation explained by the model is $0.7438$.
```r
fit <- lm(salary~., data=baseball_data[, 2:17])
summary(fit)
```
3. The coefficient of the predictor `hits` is $-7.371$. This goes against intuition, since naturally we expect those who get more hits are better players, thus they should get paid more.
4. Since there is at least one predictor that has a p-value of less than $0.05$, we can reject the null hypothesis that none of the 16 predictors is related.
```r
> anova(fit)
Analysis of Variance Table

Response: salary
                      Df   Sum Sq  Mean Sq  F value    Pr(>F)
batting.average        1 15766639 15766639  33.1869 8.922e-08 ***
on.base.percent        1  6484698  6484698  13.6495 0.0003563 ***
runs                   1 53916586 53916586 113.4881 < 2.2e-16 ***
hits                   1   256723   256723   0.5404 0.4639659
doubles                1   301725   301725   0.6351 0.4273431    
triples                1    58975    58975   0.1241 0.7253188
home.runs              1  6687648  6687648  14.0767 0.0002918 ***
rbi                    1  3759535  3759535   7.9134 0.0058876 **
walks                  1  1929890  1929890   4.0622 0.0464838 *
strike.outs            1 23121137 23121137  48.6673 3.114e-10 ***
stolen.bases           1   249509   249509   0.5252 0.4702962    
errors                 1  1228303  1228303   2.5854 0.1109419
free.agent.eligible    1 17431321 17431321  36.6909 2.336e-08 ***
free.agent             1    98983    98983   0.2083 0.6490358
arbitration.eligible   1  9253183  9253183  19.4769 2.534e-05 ***
arbitration            1   135394   135394   0.2850 0.5946114
Residuals            102 48458743   475086
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```
5. We fail to reject the null hypothesis, since the p-value is $0.1614>0.05$.
```r
> predicted_fit <- lm(salary~. - batting.average - on.base.percent - hits - doubles - triples, data=baseball_data[, 2:17])
> anova(predicted_fit, fit)
Analysis of Variance Table

Model 1: salary ~ (batting.average + on.base.percent + runs + hits + doubles +
    triples + home.runs + rbi + walks + strike.outs + stolen.bases + 
    errors + free.agent.eligible + free.agent + arbitration.eligible +
    arbitration) - batting.average - on.base.percent - hits -
    doubles - triples
Model 2: salary ~ batting.average + on.base.percent + runs + hits + doubles +
    triples + home.runs + rbi + walks + strike.outs + stolen.bases +
    errors + free.agent.eligible + free.agent + arbitration.eligible +
    arbitration
  Res.Df      RSS Df Sum of Sq      F Pr(>F)
1    107 52306649
2    102 48458743  5   3847906 1.6199 0.1614
```
6. The percentage of variation explained by the linear model with the 11 variables is $0.7234$.
```r
summary(predicted_fit)
```
7. Below are the plots for the residuals versus predicted values, a kernel density estimate of the residuals, and a Q-Q plot of the standardized results:
![[resid_vs_predicted.png]]
The graph appears to have a fan shape, where the spread correlates with the predicted value. This means that the variance of residuals is not constant.

![[kernel_density.png]]
The kernel density graph appears to have a second smaller peak at around 2800. Thus, the residuals aren't normally distributed.

![[qq_plot.png]]
The values in the Q-Q plot tend to deviate away from the straight line near the end, which indicates non-normality with the residuals.

8. To obtain the best subset of the 16 predictors to include in a linear model, I modified the `AIC-leaps.R` file to find the best subset.
```r
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
  
  list(aic,bic, out$which) # This line was added to show which predictor variable for each subset size was the best.
}

leaps.AIC(baseball_data[, 2:17], salary)

new_fit <- lm(salary~. - batting.average - on.base.percent - doubles - triples - home.runs - walks - stolen.bases - errors - free.agent - arbitration, data=baseball_data[, 2:17])

summary(new_fit)
```
I obtained the smallest BIC and AIC value, which was including 6 predictor variables. The AIC values from around 6-10 were very similar and due to Occam's Razor, I ended up choosing 6. The smallest BIC value was relatively distinct compared to its surrounding values.

Once the additional line was added, all that was left was to determine the best predictor variables which are the following: `runs`, `hits`, `rbi`, `strike outs`, `free agent eligible`, and `arbitation eligible`.
9. Below is the plot of the standardized residuals versus the index:
![[residual_new_fit.png]]
Based on this plot, the following players have an absolute value standardized residuals that are larger than 3:
- Bobby Bonilla
- Eric Davis
- Danny Tartabull
- Robin Ventura
```r
# Plot
plot(seq(1, 337), rstandard(new_fit), main="Residuals of new fit", xlab="Index", ylab="Residuals")

# Obtain values.
new_fit.residual <- rstandard(new_fit)
indices <- which(new_fit.residual < -3)
x_val <- seq(1, 337)[indices]

print(x_val)
```
10. Below is the plot of the standardized residuals versus the predicted values:
![[standard_vs_predicted.png]]
The residuals appear to increase as the predicted salary increases. Since it is not random, the variance of residuals is not constant.
```r
plot(salary, new_fit.residual, main="Standardized residuals versus the predicted values", xlab="Predicted salary", ylab="Standardized residuals")
```
10. The Q-Q plot is provided below:
![[qq_k.png]]
The values in the Q-Q plot deviated from the straight line further in the graph, which indicates non-normality in the residuals.
```r
qqnorm(new_fit.residual)
qqline(new_fit.residual, lwd=2)
```
10.  The plot of Cook's D values is provided below:
![[cooks.png]]

The points that are very high have the most influence on the model, but these points don't greatly affect our model, so we can't pinpoint anything in particular to see what influenced it the most.
```r
output = cooks.distance(new_fit)
plot(output, ylab="Cook's D")
```
#### question 2
1.  
We can say that our null hypothesis is: $H_{0}:\mu_{1}=\mu_{2}=\mu_{3}=\mu_{4}$.

Our alternative hypothesis is that $H_{0}$ is not true.

Given $\bar{X_{i}}$, we can calculate the entire $\bar{X}$ by doing the following: $\frac{\sum_{i=1}^n\bar{X_{i}}}{n}$, which in this case is $55.375$.

We can then calculate $SSTR$ by using the following formula:
$$
SSTR=\sum_{i=1}^nn_{i}(\bar{X}_{i}-\bar{X})^{2}=5882.36
$$
Using this value, we obtain the $MSTR$:
$$
MSTR=\frac{SSTR}{k-1}=\frac{5882.36}{3}=1960.79
$$
We can then use this value and $MSE$ to obtain the F-statistic:
$$
\frac{MSTR}{MSE}=\frac{1960.79}{92.95}=21.10
$$
Using this F-statistic, we get the p-value of $8.32\times 10^{-6}$

Given this p-value, we reject the null hypothesis. There is strong evidence to conclude that the averages for eye movement during sleep time of the four concentrations of ethanol are not equal.
2. Below is the p-value and the outcome:
```r
> sl <- read.table("C:\\Users\\leonl\\Documents\\GitHub\\STAT-212\\coding\\hw3\\SleepRem.txt")
> anova(aov(sl$values~sl$ind))

Analysis of Variance Table

Response: sl$values
          Df Sum Sq Mean Sq F value    Pr(>F)
sl$ind     3 5881.7 1960.58  21.093 8.322e-06 ***
Residuals 16 1487.1   92.95
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```
From the analysis, the p-value is $8.322\times 10^{-6}$. We would reject the null hypothesis since it is less than the level of significance, 0.05.
3. The responses are given:
	1. p-value 1 on equal variances: 0.62
	2. p-value for normality: 0.13

Based on both p-values, it indicates that the assumption of equal variance and normality assumption holds, respectively.

![[qq_2.png]]