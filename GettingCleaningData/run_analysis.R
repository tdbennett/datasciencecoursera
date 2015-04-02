##### This script does the following 
##### for the "Getting and Cleaning Data" course project


## 1) downloads the .zip file and extracts the contents
## 2) merges the training and test data sets
## 3) extracts the mean and SD for each measurement and applies a name to each column/variable
## 4) labels the variables
## 5) creates a new tidy data set with the average 
        ## for each variable for each activity for each subject
## 6) writes that new tidy data set to a new .txt file


# set working directory
setwd("./GettingCleaningData")

# make a destination file if it does not already exist
if (!file.exists("projdata")) { 
    dir.create("projdata")
}

# download the zipped file
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "./projdata/phonedataset.zip")
list.files("./projdata")

# document the download time
downloadtime <- date()
downloadtime

# unzip the zipped file
unzip("./projdata/phonedataset.zip", exdir = "projdata")
list.files("./projdata")
list.files("./projdata/UCI HAR Dataset")

# setting new working directory
setwd("./projdata/UCI HAR Dataset")




# reading the training dataset subject labels into R
trainsubj <- read.table("train/subject_train.txt", sep = "", header = FALSE)
head(trainsubj, 100)

# reading the training dataset labels into R
trainy <- read.table("train/y_train.txt", sep = "", header = FALSE)
head(trainy, 100)

# reading the training dataset into R
trainx <- read.table("train/X_train.txt", sep = "", header = FALSE)
# head(trainx, 100)

# reading the test dataset subject labels into R
testsubj <- read.table("test/subject_test.txt", sep = "", header = FALSE)
head(trainsubj, 100)

# reading the test dataset labels into R
testy <- read.table("test/y_test.txt", sep = "", header = FALSE)
head(trainy, 100)

# reading the test dataset into R
testx <- read.table("test/X_test.txt", sep = "", header = FALSE)
# head(trainx, 100)

# reading the features vector into R
features <- read.table("features.txt", sep = "", header = FALSE)

# making a vector of column names for the train and test data frames
columnnames <- as.character(features[,2])

# attaching the column names to the train and test data frames -
# this names the variables with descriptive names - STEP 4
colnames(trainx) <- columnnames
colnames(testx) <- columnnames

# attaching the activity label to the train and test data frames
traindata <- cbind(trainy,trainx)
testdata <- cbind(testy,testx)

# identifying the activity labels as such
names(traindata)[1] <- "activity"
names(testdata)[1] <- "activity"
    
# attaching the subject labels as the first column in the train and test data frames
traindata <- cbind(trainsubj,traindata)
testdata <- cbind(testsubj,testdata)

# identifying the subject labels as such
names(traindata)[1] <- "subjectid"
names(testdata)[1] <- "subjectid"


# combining the train and test datasets into one - STEP 1
data <- rbind(traindata,testdata)
# head(data,10)

library(plyr)
library(dplyr)

# selecting the variables corresponding to mean and standard deviation only - STEP 2
data <- select(data, contains("subjectid"), contains("activity"),
               contains("mean", ignore.case=FALSE), contains("std", ignore.case=FALSE))

# removing trainx and testx from memory
rm(trainx)
rm(testx)

# removing the separate train and test datasets from memory
rm(testdata)
rm(traindata)

# creating a factor variable from the activity variable
data <- mutate(data, actfactor = factor(activity)) 

# making labels for the factor levels - STEP 3
levels(data$actfactor) <- c("walk", "walkup", "walkdown", "sit", "stand", "lay")                                     


### STEP 5

# calculating the means by subject, by activity
means <- ddply(data, .(subjectid, activity), numcolwise(mean))

# creating a factor variable from the activity variable
means <- mutate(means, activity = factor(activity)) 

# making labels for the factor levels
levels(means$activity) <- c("walk", "walkup", "walkdown", "sit", "stand", "lay") 

# write the new data set to a .txt file - STEP 6
write.table(means, "meansbysubj.txt", sep = "", col.names = TRUE,row.names=FALSE)
