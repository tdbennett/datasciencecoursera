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

summary(glm(count ~ 
               I(1 * (spray == 'A')) + I(1 * (spray == 'C')) + 
               I(1 * (spray == 'D')) + I(1 * (spray == 'E')) +
               I(1 * (spray == 'F'))
           , data = InsectSprays, family = "poisson"))$coef

## problem 5





## problem 6

x <- -5:5
y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)

knots <- 0
splineTerms <- sapply(knots, function(knot) (x > knot) * (x - knot))
xMat <- cbind(1, x, splineTerms)
yhat <- predict(lm(y ~ xMat - 1))

plot(x, y, frame = FALSE, pch = 21, bg = "lightblue", cex = 2)
lines(x, yhat, col = "red", lwd = 2)

fit <- lm(yhat ~ x, subset = (x > 0))
summary(fit)

