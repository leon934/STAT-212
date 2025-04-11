#### question 1
1. The blocking factor is "fabric." This is because the type of fabric could affect the variability of the experiment, but it is not of primary interest.
2. The completed ANOVA table is provided below:

|               | degrees of freedom | sum squares | mean squares | F-value |
| ------------- | :----------------: | :---------: | :----------: | :-----: |
| **treatment** |         3          |   2.4815    |    0.8272    | 19.4170 |
| **block**     |         4          |   5.4530    |    1.3633    | 32.0012 |
| **residuals** |         12         |   0.5110    |    0.0426    |         |
Given the degrees of freedom and the F-value, the p-value for the treatment and block respectively are:
1. $6.72 \times 10^{-5}$
2. $2.57 \times 10^{-6}$
#### question 2
To do so, the expected value should be $E=120/8=15$ since the direction $X$ should be uniformly distributed. Now that we have $E$, we can calculate the $\chi^{2}$ statistic by using the observed values and the expected value:
$$
\begin{align}
\chi^{2}&=\sum\frac{(O_{i}-E)^{2}}{E} \\
&= 4.8
\end{align}
$$
The degrees of freedom will be 7, since there are 8 categories.

Looking at a $\chi^{2}$ table, the critical value at $\alpha=0.10$ and $df=7$ is $12.017$. Since $\chi^{2}=4.8<12.017$, we fail to reject the null hypothesis. This means there is not enough evidence to conclude that the directions are not uniformly distributed.