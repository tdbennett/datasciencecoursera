### Quiz 2

## problem 1

x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)

fit <- lm(y~x)
summary(fit)


## problem 2

e <- resid(fit)

summary(fit)$sigma




## problem 3

data(mtcars)
summary(mtcars)

fit2 <- lm(mtcars$mpg ~ mtcars$wt)
summary(fit2)

sumCoef <- summary(fit2)$coefficients
sumCoef[2,1] + c(-1, 1) * qt(.975, df = fit2$df) * sumCoef[2, 2]







## problem 6

x <- c(8.58, 10.46, 9.01, 9.64, 8.86)

xn <- (x - mean(x))/sd(x)
xn


## problem 7

x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)

lm(y ~ x)


## problem 8

x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
mean(x)


