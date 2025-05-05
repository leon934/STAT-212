## sign test
used to test hypotheses about the population **median**

$X$ is a cont. random variable w/ median $\tilde{\mu}$, meaning
$$
P(X\geq \tilde{\mu})=P(X\leq\tilde{\mu})=\frac{1}{2}
$$
we want to test
$$
H_{0}:\tilde{\mu}=c \text{ vs. } H_{a}:\tilde{\mu}>c
$$
test statistic is:
$$
Y=\text{number of }\chi_{i}\text{'s larger than }c
$$
where we reject $H_{0}$ when $Y$ is too big

$Y$ has a binomial distribution with the number of trials equal to $n$ and success probability 1/2
- as long as $n\geq 10$, ok to carry out normal approximation to binomial

$H_{0}:\tilde{\mu}=c \text{ vs. } H_{a}:\tilde{\mu}>c \text{ with }\frac{Y-n/2}{\sqrt{ n }/2}\geq z_{\alpha}$

$H_{0}$ rejected at:
$$
\frac{Y-n/2}{\sqrt{ n }/2}\geq z_{\alpha}
$$
we can also test
$$
H_{0}:\tilde{\mu}=c \text{ vs. }\tilde{\mu}<c \text{ with }\frac{Y-n/2}{\sqrt{ n }/2}\le-z_{\alpha}
$$
and
$$
H_{0}:\tilde{\mu}=c \text{ vs. }\tilde{\mu}\neq c \text{ with }\frac{|Y-n/2|}{\sqrt{ n }/2}\geq z_{\alpha/2}
$$
