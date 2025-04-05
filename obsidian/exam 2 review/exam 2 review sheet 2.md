##### grand mean
$$
\begin{align}
\bar{X}&=\frac{1}{N}\sum_{i=1}^kn_{i}\bar{X}_{i} \\ \\
N&=n_{1}+\dots+n_{k}
\end{align}
$$
##### variance between populations, $SSTr$ (sum of squares treatment)
- treatment sum of squares
- explained variance
- also found in the `Location` row
	- `Location` row's degrees of freedom is $k-1$
$$
SSTr=\sum_{i=1}^k n_{i}(\bar{X}_{i}-\bar{X})^{2}
$$
##### variance within populations, $SSE$
- error sum of squares
- unexplained variation
$$
SSE=\sum_{i=1}^k\sum_{j=1}^{n_{i}}(X_{ij}-\bar{X}_{i})^{2}
$$
##### $SST$
- total sum of squares
- measures *all* variability in data
$$
\begin{align}
SST&=\sum_{i=1}^k \sum_{j=1}^{n_{i}}(X_{ij}-\bar{X})^{2} \\
SST&=SSTr+SSE
\end{align}
$$

##### form of ANOVA table
below is the table to determine what's given:

| source of variation     | degrees of freedom | sum of squares | mean square | $F$ |
| ----------------------- | :----------------: | :------------: | :---------: | :-: |
| **treatments/location** |       $k-1$        |     $SSTr$     |   $MSTr$    | $F$ |
| **error**               |       $N-k$        |     $SSE$      |    $MSE$    |     |
| **total**               |       $N-1$        |     $SST$      |             |     |
##### $MSTr$
$$
MSTr=\frac{SSTr}{k-1}
$$
##### $MSE$
- known as "estimate of the error standard deviation in the model" or "estimate of the error variance"
- unbiased estimator of $\sigma^{2}$
- regardless of whether $H_{0}$ is true, $E(MSE)=\sigma^{2}$
$$
\begin{align}
MSE&=\frac{SSE}{N-k} \\
&=\frac{1}{N-k}\sum_{i=1}^k (n_{i}-1)S_{i}^{2}
\end{align}
$$
- $S_{i}$ is the sample variance for population $n_{i}$

residual standard error is $\hat{\sigma}$
##### $F$-statistic
$$
\begin{align}
F&=\frac{MSTr}{MSE}=\frac{SSR/k}{MSE} \\
&=\frac{R^{2}/k}{(1-R^{2})/(n-k-1)}
\end{align}
$$
- if the $F$-statistic is equal to or less than 1, there is never strong evidence that there are differences among the treatment means
##### $F$-statistic and null hypothesis
$$
\text{reject null at: }F\geq F_{k-1,N-k;\alpha}
$$
- where $F_{k,n-k-1;\alpha}$ is the $(1-\alpha)^{th}$ quantile of $F_{k,n-k-1}$
- meaning the area starting from the right equals $0.05$

the $p$-value is $P(F_{k-1,N-k;\alpha}>F_{obs})$ where $F_{obs}$ is the observed value of the test statistic $F$
##### Tukey's procedure
if $H_{0}:\mu_{1}=\mu_{2}=\dots=\mu_{k}$ is rejected, then we want to know *which* means are different

we do so by doing the test with the form:
$$
\begin{align}
H_{0}&:\mu_{i}=\mu_{j} \\
H_{a}&:\mu_{i}\neq\mu_{j}
\end{align}
$$

1. choose the error rate, $\alpha$
2. find critical value $Q_{\alpha,k,N-k}$ from table
3. for all $(i,j)$, compute the following confidence interval for $\mu_{i}-\mu_{j}$:
$$
\bar{X}_{i}-\bar{X}_{j}\pm Q_{k,N-k,\alpha}\sqrt{ \frac{MSE}{2}\left( \frac{1}{n_{i}}+\frac{1}{n_{j}} \right) }
$$
- two means are significantly different if their difference is at least the value to the right of $\pm$
1. for every pair $(i,j)$ in the interval above does *not* contain 0, reject $H_{0}:\mu_{i}=\mu_{j}$

##### type 1 error
- false positive
- rejecting null hypothesis that is correct
###### EWER error
- probability of making one or more type 1 error when conducting multiple statistics test within a single experiement
$$
\alpha_{E}=1-(1-\alpha)^m
$$
##### type 2 error
- false negative
- failure to reject null hypothesis that is false