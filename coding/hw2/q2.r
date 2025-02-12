tree_age <- read.table(file="C:\\Users\\leonl\\Documents\\GitHub\\STAT-212\\coding\\hw2\\TreeAgeDiamSugarMaple.txt")

colnames(tree_age) <- c("Diamet", "Age")

tree_age <- tree_age[-1,]
tree_age$Diamet <- as.double(tree_age$Diamet)
tree_age$Age <- as.double(tree_age$Age)

x <- tree_age$Diamet
y <- tree_age$Age

plot(y, x, xlim=c(0, 500), ylim=c(0,500))

# kmax means the maximum degree desired.
AIC_poly = function(x, y, kmax) {
    # Adjusted R^2.
    adjr2 = 1:kmax
    aic = 1:kmax
    bic = 1:kmax

    n = length(y)

    for(k in 1:kmax) {
        fit = lm(y~poly(x, k, raw=TRUE))

        adjr2[k] = summary(fit)$adj
        aic[k] = AIC(fit)
        bic[k] = AIC(fit, k=log(n))
    }

    k_r2 = (1:kmax)[adjr2==max(adjr2)]
    k_aic = (1:kmax)[aic==min(aic)]
    k_bic = (1:kmax)[bic==min(bic)]

    ylim = range(c(aic, bic))

    plot(1:k, aic, xlab='k', ylab='aic/bic', ylim=ylim, col='red')
    points(1:k, bic, col='blue')
    abline(v=k_aic, col='red')
    abline(v=k_bic, col='blue')

    title("Red points: AIC, Blue points: BIC")
    list(aic, bic, adjr2, k_aic, k_bic, k_r2)
}

AIC_poly(x, y, 8)

# Q2ii.
tree_fit = lm(y~poly(x, degree=2, raw=TRUE))
summary(tree_fit)

# Q2iii.
residual = tree_fit$residuals
fitted = tree_fit$fitted.values
plot(fitted, residual, xlab="FITTED", ylab="RESIDUALS")


new_tree = data.frame(x=110)
predict(tree_fit, newdata=new_tree, interval="prediction", level=0.95)