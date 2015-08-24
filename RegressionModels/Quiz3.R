### Quiz 3

## problem 1

data(mtcars)
fit <- lm(mpg ~ I(factor(cyl)) + wt, data = mtcars)
summary(fit)


## problem 2

fit2 <- lm(mpg ~ I(factor(cyl)), data = mtcars)
summary(fit2)


## problem 3

fit3 <- lm(mpg ~ I(factor(cyl)) + wt + wt * I(factor(cyl)), data = mtcars)
summary(fit3)

library(lmtest)
lrtest(fit,fit3)

## problem 4

fit4 <- lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars)
summary(fit4)



## problem 5

x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)

fit <- lm(y ~ x)
hatvalues(fit)
plot(fit)

## I went with point 5



## problem 6

x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)

fit <- lm(y ~ x)
hatvalues(fit)
dfbetas(fit)

