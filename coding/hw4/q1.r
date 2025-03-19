pc <- read.table("C:\\Users\\leonl\\Documents\\GitHub\\STAT-212\\coding\\hw4\\PorousCarbon.txt")

pc_aov <- aov(values ~ as.factor(temp), data=pc)
anova(pc_aov)

# Q1C
resids <- pc_aov$residuals
resids <- (resids - mean(resids)) / sd(resids)

plot(pc_aov$fitted.values, resids, xlab="Predictions", ylab="Residuals", main="Predictions vs. Residuals")

shapiro.test(resids)

par(mfrow= c(1, 2))
qqnorm(resids)
qqline(resids)

boxplot(resids, main="Boxplot of residuals")

thsd <- TukeyHSD(pc_aov, conf.level = 0.95)

sort(thsd$`as.factor(temp)`[,2])

par(mfrow=c(1,1))
plot(TukeyHSD(pc_aov))