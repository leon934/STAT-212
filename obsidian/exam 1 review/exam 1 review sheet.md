### least squares regression line
a simple linear regression model is given in the form:
$$
y=\beta_{0}+\beta_{1}x
$$
##### $\beta_{1}$
we can find $\beta_{1}$ by using the following formula:
$$
\hat{\beta}_{1}=\frac{\sum_{i=1}^n (x_{i}-\bar{x})(y_{i}-\bar{y})}{\sum_{i=1}^n(x_{i}-\bar{x})^{2}}
$$
##### $\beta_{0}$
we can then find $\beta_{0}$ by using the least squares regression line:
$$
\beta_{0}=\bar{y}-\beta_{1}\bar{x}
$$
---
##### test statistic for $\beta_{1}$
given by:
$$
T=\frac{\hat{\beta}_{1}}{\hat{\sigma}_{\hat{\beta}_{1}}}
$$
---
##### $(1-\alpha)$% confidence interval for $\beta_{1}$
finding the confidence interval for $\beta_{1}$ is given by the following formula:
$$
\hat{\beta}_{1}\pm t_{n-2;\alpha/2}\hat{\sigma}_{\hat{\beta}_{1}}
$$
- $t_{n-2;a/2}$ is the t-value with $n-2$ degrees of freedom at $\alpha/2$
	- $\hat{\sigma}_{\hat{\beta}_{1}}$ is given by:
$$
\hat{\sigma}_{\hat{\beta}_{1}}=\frac{\hat{\sigma}}{\sqrt{ \sum_{i=1}^n(x_{i}-\bar{x})^{2}}}
$$
- $\hat{\sigma}$ is given by:
$$
\hat{\sigma}=\sqrt{ \frac{\sum_{i=1}^n(y_{i}-\hat{y}_{i})^{2}}{n-k-1} }=\sqrt{ \frac{\text{SSE}}{n-k-1} }
$$
##### $(1-\alpha)$% confidence interval for $Y$
given by:
$$
(\hat{\beta}_{0}+\hat{\beta}_{1}x_{0})\pm t_{n-2;\alpha/2}SE(x_{0})
$$
- where $SE(x_{0})$ is given by:
$$
SE(x_{0})=\hat{\sigma}\left[ \frac{1}{n}+\frac{(x_{0}-\bar{x})^{2}}{\sum_{i=1}^n(x_{i}-\bar{x})^{2}} \right]^{1/2}
$$

##### $(1-\alpha)$% prediction interval for $Y$
given by:
$$
(\hat{\beta}_{0}+\hat{\beta}_{1}x_{0})\pm t_{n-2;\alpha/2}SE_{\text{pred}}(x_{0})
$$
- where $SE_{\text{pred}(x_{0})}$ is given by:
$$
SE_{\text{pred}}(x_{0})=\hat{\sigma}\left[1+ \frac{1}{n}+\frac{(x_{0}-\bar{x})^{2}}{\sum_{i=1}^n(x_{i}-\bar{x})^{2}} \right]^{1/2}
$$
---
##### $\text{Var}$
properties of $\text{Var}$:
$$
\begin{align}
\text{Var}(\alpha x)&=\alpha^{2}\text{Var}(x) \\
\text{Var}(\alpha+x)&=\text{Var}(x)
\end{align}
$$
##### $\text{E}(val)$
properties of $\text{E(val)}$
$$
\begin{align}
\text{E}(\hat{\beta}_{1})&=\beta_{1} \\
\text{E}(\epsilon)&=0
\end{align}
$$
