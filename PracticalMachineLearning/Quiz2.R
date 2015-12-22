### Quiz 2 




## Question 3


library(dplyr)

library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]


### testing the regular expression
names(training)

interleuks <- 
     grep("^IL", names(training), value = TRUE) %>% 
     unique
interleuks  ## 12 vars


### subsetting the training data frame to only those vars that start with IL
ils <- training[,grep("^IL", colnames(training))]


### preprocessing with PCA
preProc <- preProcess(ils, method="pca", thresh = 0.9) ### select the number of PCs that explain 90% of variance
preProc  ## output states 9 components





### Question 4


library(dplyr)

library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]


### subsetting the training data frame to only those vars that start with IL and the diagnosis

interleuks <- 
     grep("^IL", names(training), value = TRUE) %>% 
     unique
interleuks  ## 12 vars

df <- training %>%
     select(one_of(interleuks), diagnosis)



### Build 2 models

## model with vars as they are

fitbasic <- train(diagnosis ~ ., data = df, method="glm")

predictions <- predict(fitbasic, newdata = testing)
confusionMatrix(predictions, testing$diagnosis)  ## 65% accuracy



## model with PCs that explain 80%

### preprocessing with PCA
preProc <- preProcess(df, method="pca", thresh = 0.8) ### select the PCs that explain 80% of variance
trainPC <- predict(preProc, newdata = df)

fitpca <- train(diagnosis ~ ., data = trainPC, method="glm")

testPC <- predict(preProc, testing)
predictionspca <- predict(fitpca, newdata = testPC)

confusionMatrix(predictionspca, testing$diagnosis)

predictions <- predict(fitpca, newdata = testing)
confusionMatrix(predictions, testing$diagnosis)  ## 65% accuracy

