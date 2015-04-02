### Course Project 1 - Exploratory Data Analysis

### Plot 3

##### This script does the following 

## 1) calculates the memory necessary to read all of the data into R
## 2) downloads the .zip file 
## 3) reads the necessary contents (all 9 columns, rows from Feb 1-2, 2007)
## 4) cleans the dates and times
## 5) makes Plot 3 on the screen device
## 6) saves it to .png file



setwd("ExploratoryDataAnalysis/Project1")
# sets working directory


# calculate the memory necessary to read _all_ of the data into R
# 2,075,259 rows and 9 columns, all numeric data
# 2,075,259 x 9 x 8 bytes/numeric = 149,418,648 bytes
# 149,418,648 bytes / 2^20 = 142 Mb 
# no problem


### Source of data - website at UCI ML repository
### Dataset - Electric power consumption


# download the zipped file
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "powerdata.zip")
list.files()

# document the download time
downloadtime <- date()
downloadtime

# unzip the zipped file
unzip("powerdata.zip")
list.files()


# reading in the first 100 rows
initial <- read.table("household_power_consumption.txt", sep=";", header=TRUE, nrows = 100)
head(initial)
# then call the class function on the first 100 rows
classes <- sapply(initial, class)
classes


# reading the requested two days of data into R (Feb 1st and 2nd, 2007)
require(sqldf)

data <- read.csv.sql("household_power_consumption.txt", 
                sql = "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'", 
                sep = ";", nrows = 2000000, header = TRUE)
head(data, 100)


# The following descriptions of the 9 variables in the dataset are taken from the UCI web site:
    
# Date: Date in format dd/mm/yyyy
# Time: time in format hh:mm:ss
# Global_active_power: household global minute-averaged active power (in kilowatt)
# Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# Voltage: minute-averaged voltage (in volt)
# Global_intensity: household global minute-averaged current intensity (in ampere)
# Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
# Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
# Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.



# converting the Date and Time variables to R date/time
require(lubridate)
require(dplyr)

data <- mutate(data, DateTime = paste(Date,Time))

data <- mutate(data, datetime = dmy_hms(DateTime))

# extracting the days of the week

data <- mutate(data, dow = weekdays(datetime))

# renames and selects the necessary variables

data2 <- select(data, datetime, sm1 = Sub_metering_1,
                sm2 = Sub_metering_2, sm3 = Sub_metering_3)


# converts any missing (?) values to NA's

data2$sm1[data2$sm1=="?"] <- NA
data2$sm2[data2$sm2=="?"] <- NA
data2$sm3[data2$sm3=="?"] <- NA


# converts the values to numeric

data2$sm1 <- as.numeric(data2$sm1)
data2$sm2 <- as.numeric(data2$sm2)
data2$sm3 <- as.numeric(data2$sm3)

### makes Plot 3

plot(data2$datetime, data2$sm1, type="l", ylab = "Energy sub metering",
     xlab="")
lines(data2$datetime,data2$sm2, col="red")
lines(data2$datetime,data2$sm3, col="blue")
legend("topright", lty = c(1,1,1), col = c("black","red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


# saves it to a file
dev.copy(png, file = "plot3.png")  ## Copy the plot to a PNG file, default is 480x480
dev.off()  ## close the PNG device






