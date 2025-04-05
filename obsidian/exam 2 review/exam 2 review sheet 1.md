##### multiple regression
- if the surface of averages $E(Y|x_{1},x_{2})$ has curvature, we'd want to utilize a model with an interaction term $x_{1}x_{2}$
- $AIC$ will sometimes choose a model containing more independent variables than $BIC$
#### coefficient of determination
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
- this is also the `Sum Sq` and `Residuals` cell value
We can use the following formula to relate the two:
$$
\text{SST}=\text{SSE} +\text{SSR}
$$
To find $R^{2}$ (proportion of variance), the fraction of total variation in $y$ that is explainable by the straight line relationship between $y$ and $x$, we use the following:
$$
R^{2}=\frac{\text{SSR}}{\text{SST}}=1-\frac{\text{SSE}}{\text{SST}}
$$
##### confidence intervals for $E(Y)$ at $\mathbf{X}=x$
$$
\hat{\mu}(\mathbf{x})\pm t_{n-k-1;\alpha/2}\hat{\sigma}\sqrt{ \mathbf{x}^T(\mathbf{X}^T\mathbf{X})^{-1}\mathbf{x} }
$$
##### prediction interval for $Y$ at $\mathbf{X}=x$
$$
\hat{\mu}(\mathbf{x})\pm t_{n-k-1;\alpha/2}\hat{\sigma}\sqrt{ 1+\mathbf{x}^T(\mathbf{X}^T\mathbf{X})^{-1}\mathbf{x} }
$$
##### reduction method
$$
F=\frac{(SSE_{r}-SSE_{f})/l}{SSE_{f}/(n-k-1)}
$$
- $r$ : reduced variables
- $f$ : full model
- $l$ : number of predictors removed
- $k$ : number of predictors in the full model

we reject $H_{0}: \mu_{1}=\mu_{2}=\dots=\mu_{k}$ if and only if
$$
F\geq F_{l,n-k-1;\alpha}
$$
- reject meaning the removed indep. vars. are needed in the model

- $F_{l,n-k-1;\alpha}$ is the critical value at $\alpha$
	- $l$: numerator degrees of freedom = $k-1$
	- $n-k-1$: denominator degrees of freedom
	- $\alpha$: level of significance
		- want $(1-\alpha)$ when finding `Fpdf`

##### model selection
two principles
- if the model has the same # of indep. variables, choose highest $R^{2}$
- if the models have diff number of indep. vars., use either $AIC$ or $BIC$, where smaller = better
##### Cook's D
measures distance between $\hat{\beta}$ and estimate of $\beta$ after deleting $i$th observation
- if $D$ value is big, corresponding observation is influential
	- big = larger than 1.5

##### plotting and purpose

| plot                                              | purpose                          |
| ------------------------------------------------- | -------------------------------- |
| $e_{i}^*$ vs. $i$                                 | check independence of errors     |
| $e_{i}^*$ vs. $\hat{y}_{i}$                       | check constant variance          |
| $e_{i}^*$ vs. indep. var.                         | check for nonlinear relationship |
| normal probability plot<br>or kernel density est. | check normality                  |
