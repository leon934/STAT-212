1. The null hypothesis is $H_{0}:\mu_{1}=\mu_{2}=\mu_{3}=\mu_{4}$ and the alternative hypothesis is $H_{a}:H_{0}$ is not true.
The grand mean, $\bar{X}$ is defined as:
$$
\bar{X}=\frac{\bar{X_{1}}+\bar{X_{2}}+\bar{X_{3}}+\bar{X_{4}}}{4}=\frac{7.43+7.24+6.66+6.24}{4}=6.8925
$$

The $SSTr$ is defined as:
$$
\begin{align}
SSTr&=\sum_{i=1}^4 n_{i}(\bar{X_{i}}-\bar{X})^{2} \\
&=\sum_{n=1}^{4}5\left(\bar{X_{i}}-6.8925\right)^{2} \\
&=5\left(7.43-6.8925\right)^{2}+5\left(7.24-6.8925\right)^{2}+5\left(6.66-6.8925\right)^{2}+5\left(6.24-6.8925\right)^{2} \\
&=4.447
\end{align}
$$
Using $SSTr$, we can calculate $MSTr$:
$$
\begin{align}
MSTr&=\frac{SSTr}{k-1} \\
&=\frac{4.447}{3} \\
&=1.482
\end{align}
$$
We can then calculate $MSE$:
$$
\begin{align}
MSE&=S^{2}_{p} \\
&=\frac{\sum_{i=1}^4(n_{i}-1)S_{i}^{2}}{n-k} \\
&=\frac{4(0.2245)+4(0.143)+4(0.083)+4(0.068)}{16} \\
&=0.129625
\end{align}
$$
The F-statistic is then:
$$
F=\frac{MSTr}{MSE}=\frac{1.482}{0.129625}=11.4329797493
$$
2. The R command is provided below:
```r
> pc_aov <- aov(values ~ as.factor(temp), data=pc)
> anova(pc_aov)

Analysis of Variance Table

Response: values
                Df Sum Sq Mean Sq F value    Pr(>F)
as.factor(temp)  3 4.4474 1.48246  11.437 0.0002958 ***
Residuals       16 2.0740 0.12963
```
The value of the test statistic is $11.437$ and the p-value is $0.0002958$. We reject the null hypothesis since the p-value is significantly less than $\alpha=0.05$.

3. We can test the assumptions of equal variances and normality by using the functions below:
```r
> shapiro.test(resids)
        Shapiro-Wilk normality test

data:  resids
W = 0.95437, p-value = 0.4383
```
Since the p-value is significantly greater than $\alpha=0.05$, we fail to reject the null hypothesis, suggesting that the normality assumption holds.

The boxplot and normal Q-Q plot is provided below:
![[1.3.png]]
The normality is valid since the points on the Q-Q plot roughly align with $y=x$, and the boxplot seems roughly symmetrical around the median with no outliers.

4. The R command and computation is provided below:
```r
> thsd <- TukeyHSD(pc_aov, conf.level = 0.95)

  Tukey multiple comparisons of means
    95% family-wise confidence level

Fit: aov(formula = values ~ as.factor(temp), data = pc)

$`as.factor(temp)`
         diff        lwr         upr     p adj
400-300 -0.19 -0.8414712  0.46147124 0.8373903
500-300 -0.77 -1.4214712 -0.11852876 0.0179499
600-300 -1.19 -1.8414712 -0.53852876 0.0004366
500-400 -0.58 -1.2314712  0.07147124 0.0900085
600-400 -1.00 -1.6514712 -0.34852876 0.0023107
600-500 -0.42 -1.0714712  0.23147124 0.2897872
```
- `400-300`: Since $0.8373>0.05$, we fail to reject the null hypothesis for `400-300`.
- `500-300`: Since $0.0179<0.05$, we reject the null hypothesis for `500-300`.
- `600-300`: Since $0.0004<0.05$, we reject the null hypothesis for `600-300`. 
- `500-400`: Since $0.090>0.05$, we fail to reject the null hypothesis for `500-400`.
- `600-400`: Since $0.002<0.05$, we reject the null hypothesis for `600-400`.
- `600-500`: Since $0.2897>0.05$, we fail to reject the null hypothesis for `600-500`.

5. The sorted values in increasing order are provided below:
```> sort(thsd$`as.factor(temp)`[,2])```
   600-300    600-400    500-300    **500-400**    **600-500    400-300**
-1.8414712 -1.6514712 -1.4214712 **-1.2314712** **-1.0714712 -0.8414712**

The bolded values are the ones that do not differ significantly.