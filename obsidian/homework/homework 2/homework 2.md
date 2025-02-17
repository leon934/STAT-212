#### question 1.
Since $\hat{\rho}$ is defined as:
$$
\begin{align}
\hat{\rho}&=\frac{\sum_{i=1}^n (x_{i}-\bar{x})(y_{i}-\bar{y})}{\sqrt{ \sum_{i=1}^n(x_{i}-\bar{x})^{2}\sum_{i=1}^n(y_{i}-\bar{y})^{2} }}

\end{align}

$$
and $R^{2}$ is defined as:
$$
\begin{align}
R^{2}=\frac{SSR}{SST}&=\frac{\sum_{i=1}^n(\hat{y}_{i}-\bar{y})^{2}}{\sum_{i=1}^n(y_{i}-\bar{y})^{2}} \\
\end{align}
$$
We can do the following to prove that $R=\rho$:
$$
\begin{align}
R^{2}&=\frac{\sum_{i=1}^n((\hat{\beta}_{0}+\hat{\beta}_{1}x_{i})-(\hat{\beta}_{0}+\hat{\beta}_{1}\bar{x}))^{2}}{\sum_{i=1}^n(y_{i}-\bar{y})^{2}} \\
&=\frac{\sum_{i=1}^n(\hat{\beta}_{1}x_{i}-\hat{\beta}_{1}\bar{x})^{2}}{\sum_{i=1}^n(y_{i}-\bar{y})^{2}} \\
&=\hat{\beta}_{1}^{2}\frac{\sum_{i=1}^n(x_{i}-\bar{x})^{2}}{\sum_{i=1}^n(y_{i}-\bar{y})^{2}} \\ \\
\text{Since }\hat{\beta}_{1}&=\frac{\sum_{i=1}^n(x_{i}-\bar{x})(y_{i}-\bar{y})}{\sum_{i=1}^n(x_{i}-\bar{x})^{2}}, \\ \\
&=\frac{\left( \sum_{i=1}^n(x_{i}-\bar{x})(y_{i}-\bar{y}) \right)^{2}}{\cancel{\sum_{i=1}^n(x_{i}-\bar{x})^{2}}\sum_{i=1}^n(x_{i}-\bar{x})^{2}}\frac{\cancel{\sum_{i=1}^n(x_{i}-\bar{x})^{2}}}{\sum_{i=1}^n(y_{i}-\bar{y})^{2}} \\
R^{2}&=\frac{(\sum_{i=1}^n(x_{i}-\bar{x})(y_{i}-\bar{y}))^{2}}{\sum_{i=1}^n(y_{i}-\bar{y})^{2}\sum_{i=1}^n(x_{i}-\bar{x})^{2}} \\ \\
\sqrt{ R^{2} }=R&=\frac{\sum_{i=1}^n (x_{i}-\bar{x})(y_{i}-\bar{y})}{\sqrt{ \sum_{i=1}^n(x_{i}-\bar{x})^{2}\sum_{i=1}^n(y_{i}-\bar{y})^{2} }}=\rho
\end{align}
$$

Thus proving that $R=\rho$.

#### question 2.
1. Running the following code results in the selection of a polynomial with degree $k=2$, as also seen in the image:
![[aic_bic_adjr_plots.png]]

```r
AIC_poly = function(x, y, kmax) {
    # Adjusted R^2.
    adjr2 = 1:kmax
    aic = 1:kmax
    bic = 1:kmax

    n = length(y)

    for(k in 1:kmax) {
        fit = lm(y~poly(x, k, raw=TRUE))

        adjr2[k] = summary(fit)$adj
        aic[k] = AIC(fit)
        bic[k] = AIC(fit, k=log(n))
    }

    k_r2 = (1:kmax)[adjr2==max(adjr2)]
    k_aic = (1:kmax)[aic==min(aic)]
    k_bic = (1:kmax)[bic==min(bic)]

    ylim = range(c(aic, bic))

    plot(1:k, aic, xlab='k', ylab='aic/bic', ylim=ylim, col='red')
    points(1:k, bic, col='blue')
    abline(v=k_aic, col='red')
    abline(v=k_bic, col='blue')

    title("Red points: AIC, Blue points: BIC")
    list(aic, bic, adjr2, k_aic, k_bic, k_r2)
}

AIC_poly(x, y, 8)
```


2. 
```r
tree_fit = lm(y~poly(x, degree=2, raw=TRUE))
summary(tree_fit)
```

Running the above code results in a p-value of about $p=4.062\times 10^{-13}$. Since this is significantly less than $0.05$, we reject the null hypothesis, meaning the coefficient of $x^{2}$ is not zero.

1. There doesn't seem to be anything remarkable about the plot of the residuals versus the predicted values.

![[q2iii.png]]

```r
# Q2iii.
residual = tree_fit$residuals
fitted = tree_fit$fitted.values
plot(fitted, residual, xlab="FITTED", ylab="RESIDUALS")
```

2. 
```r
new_tree = data.frame(x=110)
predict(tree_fit, newdata=new_tree, interval="prediction", level=0.95)
```

The above `R` code results in the following predicted value and confidence interval for the age of tree given a diameter of 110:
- age: 51.49921
- confidence interval: (18.17506, 84.82335)

