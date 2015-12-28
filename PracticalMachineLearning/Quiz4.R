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





## Question 3


library(dplyr)
library(caret)
library(pgmm)
data(olive)
olive = olive[,-1]



treefit <- train(Area ~ ., data = olive, method="rpart")
plot(treefit$finalModel, uniform = TRUE)
text(treefit$finalModel, use.n = TRUE, all = TRUE, cex = 1)


newdata = as.data.frame(t(colMeans(olive)))
predict(treefit, newdata = newdata)




### Question 4


library(dplyr)
library(caret)
library(ElemStatLearn)
library(magrittr)
data(SAheart)
set.seed(8484)
train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)

SAheart %<>% 
     mutate(chd = factor(chd, levels = c(0,1), labels = c("no", "yes")))

trainSA = SAheart[train,]
testSA = SAheart[-train,]

set.seed(13234)

model <- train(chd ~ 
               age + alcohol + obesity + tobacco + typea + ldl, 
               method = "glm", 
               family = "binomial", 
               data = trainSA)
model

trainprobs <- predict.train(model, newdata = trainSA, type = "prob")
testprobs <- predict.train(model, newdata = testSA, type = "prob")

predictions <- predict(model, newdata = testSA)
confusionMatrix(predictions, testSA$chd)

predictionstrain <- predict(model, newdata = trainSA)
confusionMatrix(predictionstrain, trainSA$chd)


# missClass = function(values,prediction)
#                {sum(((prediction > 0.5)*1) != values)/length(values)
# }
# 
# missClass(trainSA$chd,trainprobs$yes)
# missClass(testSA$chd,testprobs$yes)





### Question 5

library(ElemStatLearn)
data(vowel.train)
data(vowel.test) 

library(dplyr)
library(caret)

test <- as.data.frame(vowel.test)
train <- as.data.frame(vowel.train)

test %<>% 
     mutate(factory = factor(y))

train %<>% 
     mutate(factory = factor(y))

set.seed(33883)

model <- train(factory ~ ., data = train[,-1], method = "rf", trControl = trainControl(method = "oob"))

varImp(model)
plot(varImp(model))
