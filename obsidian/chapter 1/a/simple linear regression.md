### regression: methodology for studying the relationship between **two sets** of variables
simplest case is two variables $x$ and $y$
- how does $y$ change as $x$ does?

##### suppose we want to establish the relationship between two variables $x$ and $y$
we could...
- choose several values of $x$, say $n$, and call them $x_{1},\dots x_{n}$
- determine the $y$ value for each $x_{1},\dots,x_{n}$
- draw a curve based on the points in the graph
	- the curve fitted estimates the true relationship between $x$ and $y$
#### $x$ values
$x_{1},\dots ,x_{n}$ are values of a 
- control variable
- independent variable
- explanatory variable
- covariate
- predictor
- regressor
- feature

these $x$ values are fixed by the experimenter

---
## we assume a simple linear regression model:
$$
Y_{i}=\beta_{0}+\beta_{1}x_{i}+\epsilon_{i}, \text{  } i = 1,2,\dots,n
$$
the following assumptions are made about the preceding model:
- $\epsilon_{1}, \dots, \epsilon_{n}$ are unobserved random variables
- $\epsilon_{1},\dots,\epsilon_{n}$ are independent of each other
- each $\epsilon_{i}$ has a $N(0, \sigma^{2})$ distribution
	- the variance $\sigma^{2}$ stays the same for all $\epsilon_{i}$'s. (known as the homoskedasticity assumption)
- $\beta_{0}$, $\beta_{1}$ and $\sigma^{2}$ are unknown, but fixed, parameters.
	- $\beta_{0}$ is called the intercept
	- $\beta_{1}$ is called the slope
	- $\sigma^{2}$ is called the error (or noise) variance

#### the statistical problem
infer on the unknown parameters $\beta_{0},\beta_{1}$, and $\sigma^{2}$ using the data $(x_{1},y_{1}), \dots,(x_{n},y_{n})$

note that according to the problem,
$$
E(Y_{i})=\beta_{0}+\beta_{1}x_{i}+E(\epsilon_{i})=\beta_{0}+\beta_{1}x_{i}
$$
and
$$
\text{Var}(Y_{i})=\sigma^{2}
$$
the interpretation is that the expected value of $Y$ should be a linear function of $x$

#### so how can we estimate $\beta_{0}$ and $\beta_{1}$?
given $(x_{1},y_{1}),(x_{2},y_{2}),\dots,(x_{n},y_{n})$, find the values of $b_{0}$ and $b_{1}$ such that
$$
f(b_{0},b_{1})=\sum_{i=1}^n [y_{i}-(b_{0}+b_{1}x_{i})]^{2}
$$
is minimized

we do this by setting the derivative equal to 0, to "minimize" the cost function; known as the **least squares method**

essentially known as the "cost" function
#### an important formula to have is:
$$\hat{\beta_{0}}=\bar{y}-\hat{\beta_{1}}\bar{x}$$
- given a smaller dataset, can i calculate $\hat{\beta_{0}}$ and $\hat{\beta_{1}}$?

- $\hat{\beta_{0}}$ and $\hat{\beta_{1}}$ are called the least squares estimate of $\beta_{0}$ and $\beta_{1}$

---
#### R command for finding least squares line
`summary(lm(y~x))` gives the basic statistics for a linear regression fit, including the least squares line

the least square line equation is given by:
$$
y=\hat{\beta_{0}}+\hat{\beta_{1}}x=33.887+0.514x
$$
- for the population of the father-son pair, it is estimated that when the father's height increases by 1 inch, the son's height increases **on average** by 0.514 inches
---
#### estimation of $\sigma^{2}$
our model says that
$$
Y_{i}=\beta_{0}+\beta_{1}x_{i}+\epsilon _{i}
$$
where
$$
\sigma^{2}=\text{Var}(\epsilon_{i})
$$

since
$$
\epsilon _{i}=Y_{i}-(\beta_{0}+\beta_{1}x_{i})
$$
the definition of variance tells us that
$$
\sigma^{2}=E\{[\epsilon _{i}=Y_{i}-(\beta_{0}+\beta_{1}x_{i})]^{2}\}
$$

the so-called residuals are
$$
e_{i}=y_{i}-\hat{y_{i}}
$$
meaning that the error sum of squares is:
$$
SSE=\sum_{i=1}^n e_{i}^{2}
$$
thus our estimate of $\sigma^{2}$ is
$$
\hat{\sigma^{2}}=\frac{SSE}{n-2}
$$
- dividing by $n-2$ makes $\hat{\sigma^{2}}$ an unbiased estimator
- we subtract 2 from $n$ since we have had to estimate **two** parameters, $\beta_{0}$ and $\beta_{1}$ in order to construct the variance estimator $\hat{\sigma}^{2}$

#### use of residuals to check the model
if the model is correct, then $e_{1},\dots,e_{n}$ should behave like a random sample from a normal distribution

- plotting $e_{i}$ vs. $x_{i}$ checks on whether the regression curve is more complicated than a straight line
- plotting $e_{i}$ vs. $y_{i}$ checks the "equal variance" assumption
- a histogram, kernel density estimate or normal quantile plot of the residuals allow us to check the normality assumption

#### total sum of squares, or $SST$
ANOVA decomposition of SST
$$
\begin{align}
SST&=\sum_{i=1}^n(y_{i}-\hat{y_{i}}+\hat{y_{i}}-\bar{y})^{2} \\
&=SSE+\sum_{i=1}^n(\hat{y_{i}}-\bar{y})^{2} \\
&=2\sum_{i=1}^n(y_{i}-\hat{y_{i}})(\hat{y_{i}}-\bar{y})
\end{align}
$$
#### $SSR$ and $SSE$
$$
SSR=\sum_{i=1}^n(\hat{y_{i}}-\bar{y})^{2}
$$
SSR - amount of variation in $y$ that is systematic and CAN be explained via the linear model
SSE - amount of variation in $y$ that is unsystematic and NOT explainable through $x$ and is purely related to random error or noise unrelated to $x$

#### $R^{2}$ values
a nice summary measure is:
$$
R^{2}=\frac{SS\mathbb{R}^{ }}{SST}=1-\frac{SSE}{SST}
$$

for example, the $R ^{2}$ for Galton's data is $0.251$. So, only about 25% of the total variation in sons' heights is explained by the linear relationship

#### inference about $\hat{\beta_{1}}$

properties of $\hat{\beta_{1}}$
- $\hat{\beta_{1}}$ is an unbiased estimator of $\beta_{1}$
- $\hat{\beta_{1}}$ is normally distributed

#### standardized version of $\hat{\beta_{1}}$
$$
T=\frac{\hat{\beta_{1}}-\beta_{1}}{\hat{\sigma}/\sum_{i=1}^n(x_{i}-\bar{x})^{2}}
$$
the quantity
$$
\hat{\sigma}_{\beta_{1}}=\frac{\hat{\sigma}}{\sum_{i=1}^n(x_{i}-\bar{x})^{2}}
$$
estimates the standard error of $\hat{\beta_{1}}$

a $(1-\alpha)$ 100% confidence interval for $\beta_{1}$ is 
$$
\hat{\beta_{1}}\pm t_{n-2};\alpha/2 \hat{\sigma}_{\hat{\beta_{1}}}
$$
here $t_{n-2};\alpha/2$ denotes the $(1-\frac{\alpha}{2})$th quantile of the $t_{n-2}$ distribution

#### hypothesis testing
$H_{0}$: $\beta_{1}=\beta_{1_{0}}$

we use the test statistic:
$$
T=\frac{\hat{\beta_{1}}-\beta_{1_{0}}}{\hat{\sigma}_{\beta_{1}}}
$$
alternative:
two sided test:
- $H_{a}$: $\beta_{1}\neq\beta_{1_{0}}$ if $|T|>t_{n-2};\alpha/2$

one sided test:
- $H_{a}$: $\beta_{1}>\beta_{1_{0}}$ if $T>t_{n-2};\alpha$
- $H_{a}$: $\beta_{1}<\beta_{1_{0}}$ if $T<-t_{n-2};\alpha$

