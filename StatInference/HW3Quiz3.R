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
#-2 + 2.306*(x/3) = 0
#2 = (2.306/3)x
2/(2.306/3)
## 2.60

#3
# easy

#4
sp <- sqrt((9 * 0.6 + 9 * 0.68) / (10 + 10 - 2))
3 - 5 + c(-1, 1) * qt(.975, 18) * sp * (1 / 10 + 1 / 10)^.5

#5
# easy

#6
num <- (2^2/100 + 0.5^2/100)^2  
denom <- (2^2/100)^2/99 + (0.5^2/100)^2/99
df <- num/denom
6 - 2 + c(-1,1) * qnorm(0.95, 111) * sqrt(2^2/100 + 0.5^2/100)

#7
sp <- sqrt((8 * 1.5^2 + 8 * 1.8^2) / (9 + 9 - 2))
-3 - 1 + c(-1, 1) * qt(.95, 16) * sp * (1 / 9 + 1 / 9)^.5
