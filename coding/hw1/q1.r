data <- read.table(file="C:\\Users\\leonl\\Documents\\STAT212\\hw1\\BacteriaDeath.txt")
head(data)

t <- data[,1]
y <- data[,2]

plot(y~t)
plot((log(y))~t)

print(lm(log(y)~t))