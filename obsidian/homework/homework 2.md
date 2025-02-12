#### question 1.
Since $\hat{\rho}$ is defined as:
$$
\begin{align}
\hat{\rho}&=\frac{\sum_{i=1}^n (x_{i}-\bar{x})(y_{i}-\bar{y})}{\sqrt{ \sum_{i=1}^n(x_{i}-\bar{x})^{2}\sum_{i=1}^n(y_{i}-\bar{y})^{2} }}

\end{align}

$$
and $R^{2}$ is defined as:
$$
\begin{align}
R^{2}=\frac{SSR}{SST}&=\frac{\sum_{i=1}^n(\hat{y}_{i}-\bar{y})^{2}}{\sum_{i=1}^n(y_{i}-\bar{y})^{2}} \\
\end{align}
$$
We can do the following to prove that $R=\rho$:
$$
\begin{align}
R^{2}&=\frac{\sum_{i=1}^n((\hat{\beta}_{0}+\hat{\beta}_{1}x_{i})-(\hat{\beta}_{0}+\hat{\beta}_{1}\bar{x}))^{2}}{\sum_{i=1}^n(y_{i}-\bar{y})^{2}} \\
&=\frac{\sum_{i=1}^n(\hat{\beta}_{1}x_{i}-\hat{\beta}_{1}\bar{x})^{2}}{\sum_{i=1}^n(y_{i}-\bar{y})^{2}} \\
&=\hat{\beta}_{1}^{2}\frac{\sum_{i=1}^n(x_{i}-\bar{x})^{2}}{\sum_{i=1}^n(y_{i}-\bar{y})^{2}} \\ \\
\text{Since }\hat{\beta}_{1}&=\frac{\sum_{i=1}^n(x_{i}-\bar{x})(y_{i}-\bar{y})}{\sum_{i=1}^n(x_{i}-\bar{x})^{2}}, \\ \\
&=\frac{\left( \sum_{i=1}^n(x_{i}-\bar{x})(y_{i}-\bar{y}) \right)^{2}}{\cancel{\sum_{i=1}^n(x_{i}-\bar{x})^{2}}\sum_{i=1}^n(x_{i}-\bar{x})^{2}}\frac{\cancel{\sum_{i=1}^n(x_{i}-\bar{x})^{2}}}{\sum_{i=1}^n(y_{i}-\bar{y})^{2}} \\
R^{2}&=\frac{(\sum_{i=1}^n(x_{i}-\bar{x})(y_{i}-\bar{y}))^{2}}{\sum_{i=1}^n(y_{i}-\bar{y})^{2}\sum_{i=1}^n(x_{i}-\bar{x})^{2}} \\ \\
\sqrt{ R^{2} }=R&=\frac{\sum_{i=1}^n (x_{i}-\bar{x})(y_{i}-\bar{y})}{\sqrt{ \sum_{i=1}^n(x_{i}-\bar{x})^{2}\sum_{i=1}^n(y_{i}-\bar{y})^{2} }}=\rho
\end{align}
$$

Thus proving that $R=\rho$.

#### question 2.
