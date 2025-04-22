#### question 1
We can calculate the fit of a Poisson distribution by first calculating $\theta$:
$$
\theta=\frac{\sum_{i=0}^9 iN_{i}}{300}=3.877
$$
- $i$ is the number of exchanges
- $N_{i}$ is the observed count at $i$

After calculating $\theta$, we can obtain the probability of each category under the Poisson distribution, denoted by $\pi$:
$$
\begin{align}
\pi_{i}(\theta)&=\frac{e^{-\theta}\theta^i}{i!}
\end{align}
$$
But for $x_{8}$, we can obtain this by summing up $\pi_{i}$ for $i<8$ and subtracting 1 from it, since the Poisson distribution sums to 1.

Once these values are obtained, we can calculate the fit by obtaining the test statistic $\chi^{2}$:
$$
\chi^{2}=\sum_{i=1}^r \frac{(N_{i}-n\pi_{i}(\theta))^{2}}{n\pi_{i}(\theta)}=7.81
$$
We then compare this value to $\chi^{2}_{7,0.05}=14.067$. Since $7.81<14.067$, we fail to reject the null hypothesis. 

This means there is no significant evidence against the Poisson model and that the data aligns with a Poisson distribution.
#### question 2
##### a.
The null hypothesis is that the median increase in home owners' taxes is $300, while the alternative hypothesis is that the median increase in home owners' taxes is not $300.

To obtain $Y$, we count the number of datapoints with values greater than $300, which is $Y=6$.

We can then calculate the $z$-score with the following formula:
$$
\begin{align}
z&=\frac{|Y-n/2|}{\sqrt{ n }/2} \\
&=\frac{|6-10|}{\sqrt{ 20 }/2} \\
&=1.789
\end{align}
$$
We then compare this to $z_{\alpha/2}=1.96$. Since $1.789<1.96$, we fail to reject the null hypothesis at $\alpha=0.05$.
##### b.
Using the same $Y=6$ as in part a., we obtain the $z$-score for testing the alternative hypothesis that the median increase is less than $300 with the following formula:
$$
\begin{align}
z&=\frac{Y-n/2}{\sqrt{ n }/2} \\
&=\frac{6-10}{\sqrt{ 20 }/2} \\
&=-1.789
\end{align}
$$
We then compare this to $-z_{0.05}=-1.645$. Since $-1.789\leq-1.645$, we reject the null hypothesis to conclude that the median increase is less than $300.