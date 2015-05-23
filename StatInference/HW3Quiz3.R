### HW 3 script

#1
data(mtcars)
str(mtcars)
t.test(mtcars$mpg)


#2
# t interval is xˉ±t.975,8 ∗ s/sqrt(n)
qt(0.975, 8)
# 2.306
2.306*1/3
# 0.769 is the interval
# answer is 0.77

#3
summary(mtcars)
four <- mtcars$mpg[mtcars$cyl==4]
six <- mtcars$mpg[mtcars$cyl==6]
t.test(four, six, var.equal=TRUE)

#4
# easy

#5
# The sample sizes are equal, so the pooled variance is the average of the individual variances
((1.5^2)+(1.8^2))/2

#6
# binomial, MLE Pr(success) = Pr(success)

#7
#



### Quiz 3

# 1
# t interval is xˉ±t.975,8 ∗ s/sqrt(n)
qt(0.975, 8)
# 2.306
1100 + 2.306*(30/3)


# 2
# t interval is xˉ±t.975,8 ∗ s/sqrt(n)
qt(0.975, 8)
# 2.306
-2 + 2.306*(x/3) = 0
2 = (2.306/3)x
2/(2.306/3)
## 2.60

#3
# easy

#4
# equal sample sizes, so pooled var is ave of the two variances = 0.64
# t interval is xˉ±t.975,8 ∗ s/sqrt(n)
qt(0.975, 9)
# 2.26
# SD is 0.8, sqrt(0.64)
sqrt(10)
-2 + 2.26*(0.8/3.162)

round(pnorm(70, mean = 80, sd = 10) * 100)

round(qnorm(.95, mean = 1100, sd = 75), 3)

round(qnorm(.95, mean = 1100, sd = 75 / sqrt(100) ), 3)

round(pbinom(4, prob = .5, size = 5, lower.tail = FALSE) * 100, 1)

round(pnorm(14, mean=15, sd=10/sqrt(100)),2)
round(pnorm(16, mean=15, sd=10/sqrt(100)),2)

round(ppois(10, lambda=5*3,lower.tail=TRUE),2)
