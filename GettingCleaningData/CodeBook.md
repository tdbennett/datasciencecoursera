###### This is the code book/data dictionary for the "Getting and Cleaning Data" course project
###### v1.0, Sept 19 2014

### Data Source

University of California Irvine Machine Learning Repository 
part of the Center for Machine Learning and Intelligent Systems

# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Experiments - for additional detail, see the "README" and "features_info" files
within the .zip UCI HAR dataset file

Briefly, 30 volunteers performed 6 activities (walking, walking up, walking down, sitting, standing, and laying)
while wearing a smart phone that included an accelerometer and a gyroscope

The phone recorded acceleration and velocity in each of three dimensions (X, Y, and Z) at 50Hz, i.e 50 times per second

The data were filtered in various ways (see the README and features_info files) and the acceleration data were separated into their gravity and body motion components

### The variables in the dataset are all related to the following measurements:

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

### Variable naming conventions

"t" indicates the "time domain" signals that were originally measured at 50Hz
"f" indicates that a "t" signal has been fast fourier transformed to the "frequency" domain

"Body" and "Gravity" are the two components of acceleration 
tAcc-"XYZ"" is the total acceleration signal before separation

"Acc" is acceleration, units = g (gravity units)
"Gyro" is gyroscope angular velocity, units = radians/second

"Jerk" indicates that the subject's linear acceleration and angular velocity were derived to calculate a 3-dimensional "Jerk" signal for a given sensor

"Mag" indicates the magnitude of the 3-dimensional "Jerk" signal, calculated using the Euclidean norm

"-XYZ" indicates 3-axial signals in the X, Y or Z direction

## The variables used in this analysis include the following summary measures
### of the above variables

mean(): Mean value
std(): Standard deviation
meanFreq(): Weighted average of the frequency components to obtain a mean frequency


##### The run_analysis R script does the following:

1) set the working directory and create a project file, if one does not already exist
2) download the .zip file and extract the files within it
3) read the necessary data into R
      a) for this analysis, the test (70% of the subjects) and training data (30%) were combined
      b) the inertial signals data were not necessary for this analysis

4) Dataset idiosyncrasies of note:
      a) the "features" .txt file are the column/variable names - this script attaches them
      b) the subject identifiers and activity identifiers are also separate .txt file - this script attaches them


