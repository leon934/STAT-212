#### equations for $\hat{\beta_{0}}$ and $\hat{\beta_{1}}$

#### SSR
Regression sum of squares.
$$
SSR=\sum_{i=1}^n(\hat{y}_{i}-\bar{y})^{2}
$$
#### SSE
$$
SSE=\sum_{i=1}^n(y_{i}-\hat{y}_{i})^{2}
$$
#### SST
$$
SST = SSE+SSR
$$
#### standardized version of $\hat{\beta_{1}}$
$$
T=\frac{\hat{\beta_{1}}-\beta_{1}}{\hat{\sigma}/\sum_{i=1}^n(x_{i}-\bar{x})^{2}}
$$
#### $SE(x_{0})$
$$
SE(x_{0})=\hat{\sigma}\left[ \frac{1}{n}+\frac{(x_{0}-\bar{x})^{2}}{\sum_{i=1}^n(x_{i}-\bar{x})^{2}} \right]^{1/2}
$$
#### 
$$
b=(X^TX)^{-1}X^Ty=\hat{\beta}
$$
#### predicted value
$$
\hat{y_{i}}=\hat{\beta_{0}}+\hat{\beta_{1}}x_{i}+\dots+\hat{\beta_{k}}x_{i}^k,\text{  }i=1,\dots,n
$$
#### residuals
$$
\begin{align}
e_{i}&=y_{i}-\hat{y_{i}}&i=1,\dots,n \\
SSE&=\sum_{i=1}^ne_{i}^{2}
\end{align}
$$
we estimate $\sigma^{2}$ by
$$
\hat{\sigma}^{2}=MSE=\frac{SSE}{n-k-1}
$$
#### adjusted $R^{2}$
$$
R^2_{adj,k}=R ^{2}_{k}-\frac{k}{n-1-k}(1-R ^{2}_{k})
$$
#### $AIC_{k}$
$$
AIC_{k}=n\ln(SSE_{k})+2k
$$
#### $BIC_{k}$
$$
BIC_{k}=n\ln(SSE_{k})+k\ln(n)
$$
#### $(1-\alpha)100\%$ confidence interval for $\beta_{i}$
$$
\hat{\beta_{i}}+t_{n-k-1;\alpha/2}\hat{\sigma}\sqrt{ c_{i+1} }
$$
#### $(1-\alpha)100\%$ confidence interval for the mean response
#### $(1-\alpha)100\%$ prediction interval for $Y$ at $x_{0}$
#### variance

$$
\begin{align}
\text{Var}(\alpha x)&=\alpha^{2}\text{Var}(x) \\
\text{Var}(\alpha+x)&=\text{Var}(x)
\end{align}
$$
- $\alpha$ is a cosntant