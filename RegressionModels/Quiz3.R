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

newwt <- mean(mtcars$wt)

ans1 <- data.frame(predict(fit3, newdata = data.frame(wt = newwt), interval = "confidence"))




## problem 5

data(mtcars)
#summary(mtcars)

fit2 <- lm(mpg ~ wt, data = mtcars)  ### need to make the call this way otherwise predict acts funny below
summary(fit2)

newwt <- data.frame(wt = seq(1, 5, by = 0.1))
p1 = data.frame(predict(fit2, newdata = newwt, interval = ("confidence"))) ## confidence in regression line - very narrow
p2 = data.frame(predict(fit2, newdata = newwt, interval = ("prediction"))) ## what I think of as a CI, CI of est x at a new y



## problem 9

## R squared of fit2 is 0.75, see lect 6 slide 14, the ratio must be 0.25

