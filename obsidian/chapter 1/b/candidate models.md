previously our model was
$$
Y=\beta_{0}+\beta_{1}x+\epsilon
$$
but more generally we could assume
$$
Y=f(x)+\epsilon
$$
this is because a good way to obtain a "flexible" class of models is by using polynomials
- see **Taylor's theorem** and Taylor series

we will assume that
$$
Y=\beta_{0}+\beta_{1}x+\beta_{2}x^{2}+\dots+\beta_{k}x^k+\epsilon
$$
- $\epsilon \approx N(0,\sigma^{2})$


ultimately by using the least squares principle, it leads to the normal equation:
$$
a_{l_{0}}b_{0}+a_{l_{1}}+b_{1}+\dots+a_{l_{k}}b_{k}=c_{l},l=0,1,\dots,k
$$
- these are easy to solve
