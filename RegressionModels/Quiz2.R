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
#summary(mtcars)

fit3 <- lm(mpg ~ I(wt - mean(wt)), data = mtcars)  ### question asks re: average wt
summary(fit3)

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

