### Quiz 1

## problem 1

x <- c(0.18, -1.54, 0.42, 0.95)

w <- c(2, 1, 3, 1)

mu <- c(0.0025, 0.300, 1.077, 0.1471)

y1 <- w(x - 0.0025)


beta1 <- cor(y, x) *  sd(y) / sd(x)
beta0 <- mean(y) - beta1 * mean(x)
rbind(c(beta0, beta1), coef(lm(y ~ x)))

## problem 2

x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)

yc <- y - mean(y)
xc <- x - mean(x)
beta1 <- sum(yc * xc) / sum(xc ^ 2)
coef(lm(y~x))
c(beta1, coef(lm(y ~ x))[2]) ### the second element of the coef vector is the slope
lm(yc ~ xc -1) ### another way to do regression through the origin
