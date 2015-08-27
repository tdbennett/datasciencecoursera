### Quiz 4

## problem 1

library(MASS)
data(shuttle)

logreg1 <- glm(formula = use ~ wind, family = "binomial", data = shuttle)
summary(logreg1)
exp(logreg1$coeff)

## problem 2

logreg2 <- glm(formula = use ~ wind + magn, family = "binomial", data = shuttle)
summary(logreg2)
exp(logreg2$coeff)


## problem 3

shuttle$use2 <- factor(1 - as.numeric(shuttle$use))
logreg3 <- glm(formula = use2 ~ wind, family = "binomial", data = shuttle)
summary(logreg3)
exp(logreg1$coeff)

## problem 4

data(InsectSprays)
data <- data.frame(InsectSprays)
relevel(data$spray, ref = "B")
pois1 <- glm(count ~ spray, family="poisson", data = data)
summary(pois1)

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

