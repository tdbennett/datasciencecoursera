### Quiz 3 



## Question 1

library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)
library(dplyr)


data <- data.frame(segmentationOriginal)

training <- data %>%
     filter(Case == "Train")

testing <- data %>%
     filter(Case == "Test")

set.seed(125)

model <- train(Class ~ ., method = "rpart", data = training)

plot(model$finalModel, uniform = TRUE)
text(model$finalModel, use.n = TRUE, all = TRUE, cex = 1)




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
