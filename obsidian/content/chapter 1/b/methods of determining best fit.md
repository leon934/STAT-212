#### 1. using R to fit polynomials
there are two ways to fit, say, a third degree polynomial
- `lm(y~poly(x,y,raw=T))`
- `lm(y~x+I(x^2)+I(x^3))`

but how can we know which polynomial degree is the best fit for the data?
- use $R ^2$?
	- no! this doesn't tell us anything since as $k$ increases, $R ^{2}$ will naturally increase as well

instead, we can use the [[adjusted R2|adjusted R^2 formula]]
$$
R^2_{adj,k}=R ^{2}_{k}-\frac{k}{n-1-k}(1-R ^{2}_{k})
$$
suppose the following command is used:
- `fit=lm(y~poly(x,3,raw=T))`

we can find the following to select the best polynomial degree
- AIC: `AIC(fit)`
- BIC: `AIC(fit, k=log(length(y)))`
- [[adjusted R2|adjusted R^2]]: `summary(fit)$adj`

then we will choose a polynomial degree to minimize AIC and BIC

---
#### 2. Akaike Information Criteria (AIC)
##### using R
`AIC(fit)`

---
#### 3. Bayes Information Criteria (BIC)
