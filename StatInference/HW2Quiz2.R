### HW 2 script

round(pnorm(93, mean = 100, sd = 10) * 100)

round(qnorm(.95, mean = 100, sd = 10), 3)

round(qnorm(.95, mean = 100, sd = 10 / sqrt(50) ), 3)

round(pbinom(4, prob = .5, size = 6, lower.tail = FALSE) * 100, 1)

round(pnorm(.51, mean = 0.5, sd = sqrt(1 / 12 / 100), lower.tail = FALSE), 3)

mean((1 : 6 - 3.5)^2 / 10)

round(ppois(20, lambda = 16.5 * 2) * 100, 1)


### Quiz 2

round(pnorm(70, mean = 80, sd = 10) * 100)

round(qnorm(.95, mean = 1100, sd = 75), 3)

round(qnorm(.95, mean = 1100, sd = 75 / sqrt(100) ), 3)

round(pbinom(4, prob = .5, size = 5, lower.tail = FALSE) * 100, 1)

round(pnorm(14, mean=15, sd=10/sqrt(100)),2)
round(pnorm(16, mean=15, sd=10/sqrt(100)),2)

round(ppois(10, lambda=5*3,lower.tail=TRUE),2)
