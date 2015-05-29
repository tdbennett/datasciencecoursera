### HW 4 script

#1
data(mtcars)
str(mtcars)
mean(mtcars$mpg)
mn <- mean(mtcars$mpg)
s <- sd(mtcars$mpg)
z <- qnorm(.05)
mu0 <- mn - z * s / sqrt(nrow(mtcars))

#2
summary(mtcars)
four <- mtcars$mpg[mtcars$cyl==4]
six <- mtcars$mpg[mtcars$cyl==6]
t.test(four, six, var.equal=FALSE)

#3
mn <- 3
s <- 1.1
mn + c(-1,1) * qnorm(0.975) * s/sqrt(100)


#4
pbinom(54, size = 100, prob = .5, lower.tail = FALSE) ### have to start at 54 instead of 55 - quirk of pbinom

#5
ppois(15800-1, 520*30, lower.tail = FALSE)

#6
m1 <- 10; m2 <- 11
n1 <- n2 <- 100
s <- 4
se <- s * sqrt(1 / n1 + 1 / n2)
ts <- (m2 - m1) / se
pv <- 2 * pnorm(-abs(ts))  ### p-value for a Z test

#7
# text

#8
mu0 = 10; mua = 11; sigma = 4; n = 100
alpha = 0.05
z = qnorm(1 - alpha)
pnorm(mu0 + z * sigma / sqrt(n), mean = mu0, sd = sigma / sqrt(n), 
      lower.tail = FALSE)  ### should just return alpha
pnorm(mu0 + z * sigma / sqrt(n), mean = mua, sd = sigma / sqrt(n), 
      lower.tail = FALSE)  ### gives you power

#9
n <- (qnorm(.95) + qnorm(.8)) ^ 2 * .04 ^ 2 / .01^2

#10
#text

#11
eight <- mtcars$mpg[mtcars$cyl==8]
six <- mtcars$mpg[mtcars$cyl==6]
t.test(eight, six, var.equal=TRUE)

m8 <- mean(eight)
m6 <- mean(six)
n8 <- length(eight)
n6 <- length(six)
s8 <- sd(eight)
s6 <- sd(six)
mixprob <- (n8 - 1) / (n8 + n6 - 2)
s <- sqrt(mixprob * s8 ^ 2  +  (1 - mixprob) * s6 ^ 2)
z <- (m8 - m6) / (s * sqrt(1 / n8 + 1 / n6))
pv <- 2 * pnorm(-abs(z))  ### p-value for a Z test


### Quiz 4

# 1
bl <- c(140,138,150,148,135)
wk2 <- c(132,135,151,146,130)
t.test(bl, wk2, paired=TRUE) ### default is two-sided


# 2
1100 + c(-1,1) * qt(0.975,8) * 30/sqrt(9)


#3
pbinom(2, size = 4, prob = .5, lower.tail = FALSE) ### have to start at 2 instead of 3

#4
ppois(10, 0.01*1787, lower.tail = TRUE) ### it's "below" the standard, so don't subtract 1 from q

#5
mixprob <- (9 - 1) / (18 - 2)
s <- sqrt(mixprob * 1.5 ^ 2  +  (1 - mixprob) * 1.8 ^ 2)
z <- (-3 - 1) / (s * sqrt(1 / 9 + 1 / 9))
pv <- 2 * pnorm(-abs(z))  ### p-value for a Z test

#6
#text

#7
mu0 = 0; mua = 0.01; sigma = 0.04; n = 100
alpha = 0.05
z = qnorm(1 - alpha)
pnorm(mu0 + z * sigma / sqrt(n), mean = mu0, sd = sigma / sqrt(n), 
      lower.tail = FALSE)  ### should just return alpha
pnorm(mu0 + z * sigma / sqrt(n), mean = mua, sd = sigma / sqrt(n), 
      lower.tail = FALSE)  ### gives you power


#8
mu0 = 0; mua = 0.01; sigma = 0.04
alpha = 0.05
z = qnorm(1 - alpha)
pnorm(mu0 + z * sigma / sqrt(n), mean = mu0, sd = sigma / sqrt(n), 
      lower.tail = FALSE)  ### should just return alpha
pnorm(mu0 + z * sigma / sqrt(n), mean = mua, sd = sigma / sqrt(n), 
      lower.tail = FALSE)  ### gives you power


n <- (qnorm(.95) + qnorm(.9)) ^ 2 * .04 ^ 2 / .01^2

#9
#text
