# Getting and Cleaning Data course project: run_analysis.R code book

This codebook describes the transformations performed over the original UCI HAR Dataset.

## Original dataset features

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a cons
tant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then
 separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals
 were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

A Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indi
cate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ, unit:seconds
tGravityAcc-XYZ, unit:seconds
tBodyAccJerk-XYZ, unit:seconds
tBodyGyro-XYZ, unit:seconds
tBodyGyroJerk-XYZ, unit:seconds
tBodyAccMag, unit:seconds
tGravityAccMag, unit:seconds
tBodyAccJerkMag, unit:seconds
tBodyGyroMag, unit:seconds
tBodyGyroJerkMag, unit:seconds
fBodyAcc-XYZ, unit Hz
fBodyAccJerk-XYZ, unit Hz
fBodyGyro-XYZ, unit Hz
fBodyAccMag, unit Hz
fBodyAccJerkMag, unit Hz
fBodyGyroMag, unit Hz
fBodyGyroJerkMag, unit Hz

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

## Transformations applied
Each feature name has been transformed to a more descriptive name:

tBodyAcc-XYZ: transformed to: timeBodyAcc
tGravityAcc-XYZ: transformed to: timeGravityAcc
tBodyAccJerk-XYZ: transformed to: timeBodyAccJerk
tBodyGyro-XYZ: transformed to: timeBodyGyro
tBodyGyroJerk-XYZ: transformed to: timeBodyGyroJerk
tBodyAccMag: transformed to: timeBodyAccMag
tGravityAccMag: transformed to: timeGravityAccMag
tBodyAccJerkMag: transformed to: timeBodyAccMagMag
tBodyGyroMag: transformed to: timeBodyGyroMag
tBodyGyroJerkMag: transformed to: timeBodyGyroJerkMag
fBodyAcc-XYZ: transformed to: freqBodyAcc-XYZ
fBodyAccJerk-XYZ: transformed to: freqBodyAccJerk-XYZ
fBodyGyro-XYZ: transformed to: freqBodyGyro-XYZ
fBodyAccMag: transformed to: freqBodyAccMag
fBodyAccJerkMag: transformed to: freqBodyAccJerkMag
fBodyGyroMag: transformed to: freqBodyGyroMag
fBodyGyroJerkMag: transformed to: freqBodyGyroJerkMag

The set of names of variables that were estimated from these signals are: 

suffix '-mean()': has been transformed to 'Mean'
suffix '-std()': has been transformed to 'Std'

Additional we added to the dataset the information regarding both the activity and the subject performing the activity.

activityLabel: descriptive name of the performed activity
subjectId: id of the subject performing the activity

activity labels can have one of the following:
WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING

Finally, we took the mean of each signal measure, group by subjectId and activityLabel.

The resulting dataset has the following features:

"timeBodyAccMean-X": seconds, mean value of the mean body acceleration signal over the X axis for a subject/activity  
"timeBodyAccMean-Y": seconds, mean value of the mean body acceleration signal over the Y axis for a subject/activity  
"timeBodyAccMean-Z": seconds, mean value of the mean body acceleration signal over the Z axis for a subject/activity  
"timeBodyAccStd-X": seconds, mean value of the standard deviation of the body acceleration signal over the X axis for a subject/activity  
"timeBodyAccStd-Y": seconds, mean value of the standard deviation of the body acceleration signal over the Y axis for a subject/activity  
"timeBodyAccStd-Z": seconds, mean value of the standard deviation of the body acceleration signal over the Z axis for a subject/activity  
"timeGravityAccMean-X": seconds, mean value of the mean of the gravity acceleration signal over the X axis for a subject/activity  
"timeGravityAccMean-Y": seconds, mean value of the mean of the gravity acceleration signal over the Y axis for a subject/activity  
"timeGravityAccMean-Z": seconds, mean value of the mean of the gravity acceleration signal over the Z axis for a subject/activity  
"timeGravityAccStd-X": seconds, mean value of the standard deviation of the gravity acceleration signal over the X axis for a subject/activity  
"timeGravityAccStd-Y": seconds, mean value of the standard deviation of the gravity acceleration signal over the Y axis for a subject/activity  
"timeGravityAccStd-Z": seconds, mean value of the standard deviation of the gravity acceleration signal over the Z axis for a subject/activity  
"timeBodyAccJerkMean-X": seconds, mean value of the mean of the body acceleration Jerk signal over the X axis for a subject/activity  
"timeBodyAccJerkMean-Y": seconds, mean value of the mean of the body acceleration Jerk signal over the Y axis for a subject/activity  
"timeBodyAccJerkMean-Z": seconds, mean value of the mean of the body acceleration Jerk signal over the Z axis for a subject/activity  
"timeBodyAccJerkStd-X": seconds, mean value of the standard deviation of the body acceleration Jerk signal over the X axis for a subject/activity  
"timeBodyAccJerkStd-Y": seconds, mean value of the standard deviation of the body acceleration Jerk signal over the Y axis for a subject/activity  
"timeBodyAccJerkStd-Z": seconds, mean value of the standard deviation of the body acceleration Jerk signal over the Z axis for a subject/activity  
"timeBodyGyroMean-X": seconds, mean value of the mean of the body gyroscope signal over the X axis for a subject/activity  
"timeBodyGyroMean-Y": seconds, mean value of the mean of the body gyroscope signal over the Y axis for a subject/activity  
"timeBodyGyroMean-Z": seconds, mean value of the mean of the body gyroscope signal over the Z axis for a subject/activity  
"timeBodyGyroStd-X": seconds, mean value of the standard deviation of the body gyroscope signal over the X axis for a subject/activity  
"timeBodyGyroStd-Y": seconds, mean value of the standard deviation of the body gyroscope signal over the Y axis for a subject/activity  
"timeBodyGyroStd-Z": seconds, mean value of the standard deviation of the body gyroscope signal over the Z axis for a subject/activity  
"timeBodyGyroJerkMean-X": seconds, mean value of the mean of the body gyroscope jerk signal over the X axis for a subject/activity  
"timeBodyGyroJerkMean-Y": seconds, mean value of the mean of the body gyroscope jerk signal over the Y axis for a subject/activity  
"timeBodyGyroJerkMean-Z": seconds, mean value of the mean of the body gyroscope jerk signal over the Z axis for a subject/activity  
"timeBodyGyroJerkStd-X": seconds, mean value of the standard deviation of the body gyroscope jerk signal over the X axis for a subject/activity  
"timeBodyGyroJerkStd-Y": seconds, mean value of the standard deviation of the body gyroscope jerk signal over the Y axis for a subject/activity  
"timeBodyGyroJerkStd-Z": seconds, mean value of the standard deviation of the body gyroscope jerk signal over the Z axis for a subject/activity  
"timeBodyAccMagMean": seconds, mean value of the mean of the magnitude of the body acceleration signal
"timeBodyAccMagStd": seconds, mean value of the standard deviation of the magnitude of the body acceleration signal
"timeGravityAccMagMean": seconds, mean value of the mean of the magnitude of the gravity acceleration signal
"timeGravityAccMagStd": seconds, mean value of the standard deviation of the magnitude of the gravity acceleration signal
"timeBodyAccJerkMagMean": seconds, mean value of the mean of the jerk magnitude of the body acceleration signal
"timeBodyAccJerkMagStd": seconds, mean value of the mean of the standard deviation of the jerk magnitude of the body acceleration signal
"timeBodyGyroMagMean": seconds, mean value of the mean of the magnitude of the body gyroscope signal
"timeBodyGyroMagStd": seconds, mean value of the standard deviation of the magnitude of the body gyroscope signal
"timeBodyGyroJerkMagMean": seconds, mean value of the mean of the magnitude of the body gyroscope jerk signal
"timeBodyGyroJerkMagStd": seconds, mean value of the standard deviation of the magnitude of the body gyroscope jerk signal
"freqBodyAccMean-X": Hz, mean value (broken by subjectId/activityLabel) of the mean of the body acceleration signal over the X axis
"freqBodyAccMean-Y": Hz, mean value (broken by subjectId/activityLabel) of the mean of the body acceleration signal over the Y axis
"freqBodyAccMean-Z": Hz, mean value (broken by subjectId/activityLabel) of the mean of the body acceleration signal over the Z axis
"freqBodyAccStd-X": Hz, mean value of (broken by subjectId/activityLabel) of the standard deviation of the body acceleration signal over the X axis
"freqBodyAccStd-Y": Hz, mean value of (broken by subjectId/activityLabel) of the standard deviation of the body acceleration signal over the Y axis
"freqBodyAccStd-Z": Hz, mean value of (broken by subjectId/activityLabel) of the standard deviation of the body acceleration signal over the Z axis
"freqBodyAccJerkMean-X": Hz, mean value (broken by subjectId/activityLabel) of the mean of the body acceleration jerk signal over the X axis
"freqBodyAccJerkMean-Y": Hz, mean value (broken by subjectId/activityLabel) of the mean of the body acceleration jerk signal over the Y axis
"freqBodyAccJerkMean-Z": Hz, mean value (broken by subjectId/activityLabel) of the mean of the body acceleration jerk signal over the Z axis
"freqBodyAccJerkStd-X": Hz, mean value of (broken by subjectId/activityLabel) of the standard deviation of the body acceleration jerk signal over the X axis
"freqBodyAccJerkStd-Y": Hz, mean value (broken by subjectId/activityLabel) of the standard deviation of the body acceleration jerk signal over the Y axis
"freqBodyAccJerkStd-Z": Hz, mean value (broken by subjectId/activityLabel) of the standard deviation of the body acceleration jerk signal over the Z axis
"freqBodyGyroMean-X": Hz, mean value of (broken by subjectId/activityLabel) of the mean of the body gyroscope signal over the X axis
"freqBodyGyroMean-Y": Hz, mean value (broken by subjectId/activityLabel) of the mean of the body gyroscope signal over the Y axis
"freqBodyGyroMean-Z": Hz, mean value (broken by subjectId/activityLabel) of the mean of the body gyroscope signal over the Z axis
"freqBodyGyroStd-X": Hz, mean value (broken by subjectId/activityLabel) of the standard deviation of the body gyroscope signal over the X axis
"freqBodyGyroStd-Y": Hz, mean value (broken by subjectId/activityLabel) of the standard deviation of the body gyroscope signal over the Y axis
"freqBodyGyroStd-Z": Hz, mean value (broken by subjectId/activityLabel) of the standard deviation of the body gyroscope signal over the Z axis 
"freqBodyAccMagMean": Hz, mean value (broken by subjectId/activityLabel) of the mean of the body acceleration magnitude signal
"freqBodyAccMagStd": Hz, mean value (broken by subjectId/activityLabel) of the standard deviation of the body acceleration magnitude signal
"activityLabel": name of the activity performed
"subjectId": id of the subject