### coefficient of determination
$\text{SST}$ (sum of squares total) is defined as:
$$
\text{SST}=\sum_{i=1}^n(y_{i}-\bar{y})^{2}
$$
$\text{SSR}$ (sum of squares residual) is defined as:
$$
\text{SSR}=\sum_{i=1}^n(\hat{y}_{i}-\bar{y})^{2}
$$
$\text{SSE}$ (sum of squares residual) is defined as:
$$
\text{SSE}=\sum_{i=1}^n(y_{i}-\hat{y}_{i})^{2}
$$
We can use the following formula to relate the two:
$$
\text{SST}=\text{SSE} +\text{SSR}
$$
To find $R^{2}$ (proportion of variance), the fraction of total variation in $y$ that is explainable by the straight line relationship between $y$ and $x$, we use the following:
$$
R^{2}=\frac{\text{SSR}}{\text{SST}}=1-\frac{\text{SSE}}{\text{SST}}
$$
---
##### $\hat{\rho}$
defined as:
$$
\hat{\rho}=\frac{\sum_{i=1}^n(x_{i}-\bar{x})(y_{i}-\bar{y})}{\sqrt{ \sum_{i=1}^n(x_{i}-\bar{x})^{2}\sum_{i=1}^n(y_{i}-\bar{y})^{2} }}
$$
- $\rho=0$ does not imply that $x_{i}$ and $y_{i}$ are independent
##### test statistic for $\rho$
$$
T=\frac{R\sqrt{ n-2 }}{\sqrt{ 1-R^{2} }}
$$
---
### regression analysis
##### $R^{2}_{\text{adj,k}}$, $\text{AIC}$, and $\text{BIC}$
$R^{2}_{adj,k}$ is defined as:
$$
R^{2}_{adj,k}=\frac{(n-1)R^{2}_{k}-k}{n-k-1}
$$
$AIC$ is defined as:
$$
AIC_{k}=n\log(\text{SSE}_{k})+2k
$$
$BIC$ is defined as:
$$
BIC_{k}=n\log(\text{SSE}_{k})+k\log n
$$

we want to try to minimize $\text{AIC}$ and $\text{BIC}$ and try to select the smallest $k$ due to Occam's Razor.

---
##### $(1-\alpha)$% confidence interval for mean response
$$
\hat{\mu}\pm t_{n-k-1;\alpha/2}\hat{\sigma}\sqrt{ x^T(X^TX)^{-1}x }=\hat{\mu}\pm t_{n-k-1;\alpha/2}\text{SE}(\hat{\mu})
$$
- where $x^T=\begin{pmatrix}1 & x_{0} & x_{0}^{2} & \dots & x_{0}^k\end{pmatrix}$
##### $(1-\alpha)$% prediction interval for mean response
$$
\hat{\mu}\pm t_{n-k-1;\alpha/2}\hat{\sigma}\sqrt{1+ x^T(X^TX)^{-1}x }=\hat{\mu}\pm t_{n-k-1;\alpha/2}\sqrt{ \hat{\sigma}^{2}+\text{SE}(\hat{\mu})^{2} }
$$
- where $x^T=\begin{pmatrix}1 & x_{0} & x_{0}^{2} & \dots & x_{0}^k\end{pmatrix}$