### Quiz 1

## problem 1

x <- c(0.18, -1.54, 0.42, 0.95) 

w <- c(2, 1, 3, 1)

### Because w is 1 for -1.54 and 0.95, the "high-leverage" points are 0.42 and 0.18
### I'll guess 0.3, their mean



## problem 2

x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)

### not centered because reg through origin
beta1 <- sum(y * x) / sum(x ^ 2)
beta1


## problem 3

data(mtcars)
summary(mtcars)

lm(mtcars$mpg ~ mtcars$wt)


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


