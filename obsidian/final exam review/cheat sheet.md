#### randomized block design
*"All treatments of interest are assigned randomly to units within a block."*

Treatment means:
$$
\bar{X}_{i\cdot}=\frac{1}{n}\sum_{j=1}^nX_{ij}, \text{  } i=1,\dots,k
$$
Block means:
$$
\bar{X}_{\cdot j}=\frac{1}{k}\sum_{i=1}^kX_{ij}, \text{  } j=1,\dots,n
$$
Grand mean:
$$
\bar{X}_{\cdot \cdot}=\frac{1}{kn}\sum_{i=1}^k\sum_{j=1}^nX_{ij}
$$
Sum of squares treatment:
$$
\begin{align}
SSTr&=n\sum_{i=1}^k(\bar{X}_{i\cdot}-\bar{X}_{..})^{2} \\
SSB&=k\sum_{j=1}^n(\bar{X}_{\cdot j}-\bar{X}_{\cdot \cdot})^{2} \\
SST&=\sum_{i=1}^k\sum_{j=1}^n(X_{ij}-\bar{X}_{\cdot \cdot})^{2} \\
SSE&=SST-SSTr-SSB
\end{align}
$$
ANOVA table:

| source of variation | degrees of freedom | sum of squares |  mean square   |    F     |
| ------------------- | :----------------: | :------------: | :------------: | :------: |
| **treatments**      |       $k-1$        |     $SSTr$     | $MSTr=SSTr/df$ | $F_{Tr}$ |
| **blocks**          |       $n-1$        |     $SSB$      |  $MSB=SSB/df$  | $F_{B}$  |
| **error**           |    $(k-1)(n-1)$    |     $SSE$      |  $MSE=SSE/df$  |          |
| **total**           |       $kn-1$       |     $SST$      |                |          |

we then test $H_{0}:\alpha_{1}=\dots=\alpha _k$ using the statistic:
$$
F_{Tr}=MSTr/MSE
$$
$H_{0}$ is rejected if
$$
F_{Tr}\geq F_{k-1,(k-1)(n-1);\alpha}
$$
#### Tukey's procedure
treatment means $\bar{X}_{i}$ and $\bar{X}_{l}$ are significantly different if
$$
|\bar{X}_{i}-\bar{X}_{l}|\geq Q_{\alpha,k,(k-1)(n-1)}\sqrt{ \frac{MSE}{n} }
$$
#### $\chi^{2}$ test
we measure said discrepancy by using:
$$
\frac{(N_{i}-np_{i_{0}})^{2}}{np_{i_{0}}}=\frac{\text{(observed - expected)}^{2}}{\text{expected}}
$$
summing these up, we obtain the $\chi^{2}$ test formula
$$
\chi^{2}=\sum_{i=1}^r \frac{(N_{i}-np_{i_{0}})^{2}}{np_{i_{0}}}
$$
- $r-1$ degrees of freedom

$H_{0}$ is rejected at $\alpha$ if
$$
\chi^{2}\geq \chi^{2}_{r-1,\alpha}
$$
#### type 1 and type 2 errors
##### type 1 error
- false positive
- rejecting null hypothesis that is correct
##### type 2 error
- false negative
- failure to reject null hypothesis that is false
###### EWER error
- probability of making one or more type 1 error when conducting multiple statistics test within a single experiment
$$
\alpha_{E}=1-(1-\alpha)^m
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
- SSE can be obtained by taking $RSE^{2}(df)$
- reject meaning the removed indep. vars. are needed in the model
- $F_{k-1,n-k-1;\alpha}$ is the critical value at $\alpha$
	- want $(1-\alpha)$ when finding `Fpdf`

performing a `summary(fit)` on whether the variables fit is essentially the null hypothesis being that none of the variables are useful

confidence interval of predictor coefficient
$$
\beta_{i}\pm t_{n-k-1,\alpha/2}SE(\beta_{i})
$$
Adjusted $R^{2}$ tends to overestimate the right degree.

$F\geq F_{k-1,N-k;\alpha}$


reject $H_{0A}$ then:
$$
|\bar{X}_{i\cdot \cdot}-\bar{X}_{l\cdot \cdot}\geq Q_{\alpha,a,ab(n-1)}\sqrt{ \frac{MSE}{bn} }
$$
reject $H_{0B}$ then:
$$
|\bar{X}_{i\cdot \cdot}-\bar{X}_{l\cdot \cdot}\geq Q_{\alpha,a,ab(n-1)}\sqrt{ \frac{MSE}{an} }
$$
