### Quiz 4 



## Question 1

library(ElemStatLearn)
data(vowel.train)
data(vowel.test) 

library(caret)
library(dplyr)


test <- as.data.frame(vowel.test)
train <- as.data.frame(vowel.train)

test %<>% 
     mutate(factory = factor(y))

train %<>% 
     mutate(factory = factor(y))

set.seed(33883)

rfmodel <- train(factory ~ ., data = train[,-1], method = "rf")
gbmmodel <- train(factory ~ ., data = train[,-1], method = "gbm", verbose = FALSE)

rfpreds <- predict(rfmodel, newdata = test[,-1])
gbmpreds <- predict(gbmmodel, newdata = test[,-1])

confusionMatrix(rfpreds,test$factory)
confusionMatrix(gbmpreds,test$factory)

testwithpreds <- cbind(test, rfpreds, gbmpreds)

testme <- testwithpreds[rfpreds == gbmpreds, ]

confusionMatrix(data = testme$rfpreds, reference = testme$factory)



### Question 2

library(caret)
library(gbm)
set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

set.seed(62433)

rfmodel <- train(diagnosis ~ ., data = training, method = "rf")
gbmmodel <- train(diagnosis ~ ., data = training, method = "gbm", verbose = FALSE)
ldamodel <- train(diagnosis ~ ., data = training, method="lda")

predrf <- predict(rfmodel, newdata = testing)
predgbm <- predict(gbmmodel, newdata = testing)
predlda <- predict(ldamodel, newdata = testing)

predall <- data.frame(predrf, predgbm, predlda, diag=testing$diagnosis)
combModFit <- train(diag ~ ., method="gam", data=predall)
combPred <- predict(combModFit, predall)

confusionMatrix(data = combPred, reference = predall$diag)
confusionMatrix(data = predrf, reference = predall$diag)
confusionMatrix(data = predgbm, reference = predall$diag)
confusionMatrix(data = predlda, reference = predall$diag)

### had to guess here - package differences?



## Question 3


set.seed(3523)
library(AppliedPredictiveModeling)
data(concrete)

library(caret)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

set.seed(233)

m <- as.matrix(training[,-9])
y <- training[,9]

model <- train(m, y, method = "lasso")

plot(model, xvar = "penalty")

coef(model, s = 0.1)

## cement




### Question 4

library(readr)

## Download the data 
dataurl <- "https://d396qusza40orc.cloudfront.net/predmachlearn/gaData.csv"
download.file(dataurl, destfile = "PracticalMachineLearning/data/quiz4q4.csv")

library(lubridate)  # For year() function below

dat = read_csv("PracticalMachineLearning/data/quiz4q4.csv")

training = dat[year(dat$date) < 2012,]
testing = dat[(year(dat$date)) > 2011,]
tstrain = ts(training$visitsTumblr)
tstest = ts(testing$visitsTumblr)

library(forecast)

plot.ts(tstrain)

model <- bats(tstrain)

fcast <- forecast(model)
plot(forecast(model))

lines(tstest, col = "red")

fcast

length(tstest[tstest > 714])  ## 27
27/235

length(tstest[tstest > 773])  ## 17
17/235


### guessed here too - package versions? - wrong




### Question 5

set.seed(3523)
library(AppliedPredictiveModeling)
data(concrete)

library(caret)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[inTrain,]
testing = concrete[-inTrain,]

set.seed(325)

library(e1071)

model <- svm(CompressiveStrength ~ ., data = training)

preds <- predict(model, newdata = testing)

sqrt(sum((preds - testing$CompressiveStrength)^2)/length(preds))  ## RMSE


