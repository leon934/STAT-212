sl <- read.table("C:\\Users\\leonl\\Documents\\GitHub\\STAT-212\\coding\\hw3\\SleepRem.txt")

anova(aov(sl$values~sl$ind))

fit <- aov(sl$values~sl$ind)
residual <- fit$residuals

standard_resid <- rstandard(residual)

# p-value 1
anova(aov(resid(aov(sl$values~sl$ind))^2~sl$ind))

# p-value 2
shapiro.test(residual)

qqnorm(residual)
qqline(residual, lwd=2)