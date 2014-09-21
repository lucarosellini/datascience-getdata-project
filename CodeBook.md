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

tBodyAcc-XYZ, unit:seconds<br/>
tGravityAcc-XYZ, unit:seconds<br/>
tBodyAccJerk-XYZ, unit:seconds<br/>
tBodyGyro-XYZ, unit:seconds<br/>
tBodyGyroJerk-XYZ, unit:seconds<br/>
tBodyAccMag, unit:seconds<br/>
tGravityAccMag, unit:seconds<br/>
tBodyAccJerkMag, unit:seconds<br/>
tBodyGyroMag, unit:seconds<br/>
tBodyGyroJerkMag, unit:seconds<br/>
fBodyAcc-XYZ, unit Hz<br/>
fBodyAccJerk-XYZ, unit Hz<br/>
fBodyGyro-XYZ, unit Hz<br/>
fBodyAccMag, unit Hz<br/>
fBodyAccJerkMag, unit Hz<br/>
fBodyGyroMag, unit Hz<br/>
fBodyGyroJerkMag, unit Hz<br/>

The set of variables that were estimated from these signals are: 

mean(): Mean value<br/>
std(): Standard deviation<br/>

## Transformations applied
Each feature name has been transformed to a more descriptive name:

tBodyAcc-XYZ: transformed to: timeBodyAcc<br/>
tGravityAcc-XYZ: transformed to: timeGravityAcc<br/>
tBodyAccJerk-XYZ: transformed to: timeBodyAccJerk<br/>
tBodyGyro-XYZ: transformed to: timeBodyGyro<br/>
tBodyGyroJerk-XYZ: transformed to: timeBodyGyroJerk<br/>
tBodyAccMag: transformed to: timeBodyAccMag<br/>
tGravityAccMag: transformed to: timeGravityAccMag<br/>
tBodyAccJerkMag: transformed to: timeBodyAccMagMag<br/>
tBodyGyroMag: transformed to: timeBodyGyroMag<br/>
tBodyGyroJerkMag: transformed to: timeBodyGyroJerkMag<br/>
fBodyAcc-XYZ: transformed to: freqBodyAcc-XYZ<br/>
fBodyAccJerk-XYZ: transformed to: freqBodyAccJerk-XYZ<br/>
fBodyGyro-XYZ: transformed to: freqBodyGyro-XYZ<br/>
fBodyAccMag: transformed to: freqBodyAccMag<br/>
fBodyAccJerkMag: transformed to: freqBodyAccJerkMag<br/>
fBodyGyroMag: transformed to: freqBodyGyroMag<br/>
fBodyGyroJerkMag: transformed to: freqBodyGyroJerkMag<br/>
<br/>
The set of names of variables that were estimated from these signals are: 

suffix '-mean()': has been transformed to 'Mean'<br/>
suffix '-std()': has been transformed to 'Std'<br/>

Additional we added to the dataset the information regarding both the activity and the subject performing the activity.

activityLabel: descriptive name of the performed activity
subjectId: id of the subject performing the activity

activity labels can have one of the following:
WALKING<br/>
WALKING_UPSTAIRS<br/>
WALKING_DOWNSTAIRS<br/>
SITTING<br/>
STANDING<br/>
LAYING<br/>

Finally, we took the mean of each signal measure, group by subjectId and activityLabel.

The resulting dataset has the following features:

"timeBodyAccMean-X": seconds, mean value of the mean body acceleration signal over the X axis for a subject/activity<br/>
"timeBodyAccMean-Y": seconds, mean value of the mean body acceleration signal over the Y axis for a subject/activity  <br/>
"timeBodyAccMean-Z": seconds, mean value of the mean body acceleration signal over the Z axis for a subject/activity  <br/>
"timeBodyAccStd-X": seconds, mean value of the standard deviation of the body acceleration signal over the X axis for a subject/activity  <br/>
"timeBodyAccStd-Y": seconds, mean value of the standard deviation of the body acceleration signal over the Y axis for a subject/activity  <br/>
"timeBodyAccStd-Z": seconds, mean value of the standard deviation of the body acceleration signal over the Z axis for a subject/activity  <br/>
"timeGravityAccMean-X": seconds, mean value of the mean of the gravity acceleration signal over the X axis for a subject/activity  <br/>
"timeGravityAccMean-Y": seconds, mean value of the mean of the gravity acceleration signal over the Y axis for a subject/activity  <br/>
"timeGravityAccMean-Z": seconds, mean value of the mean of the gravity acceleration signal over the Z axis for a subject/activity  <br/>
"timeGravityAccStd-X": seconds, mean value of the standard deviation of the gravity acceleration signal over the X axis for a subject/activity  <br/>
"timeGravityAccStd-Y": seconds, mean value of the standard deviation of the gravity acceleration signal over the Y axis for a subject/activity  <br/>
"timeGravityAccStd-Z": seconds, mean value of the standard deviation of the gravity acceleration signal over the Z axis for a subject/activity  <br/>
"timeBodyAccJerkMean-X": seconds, mean value of the mean of the body acceleration Jerk signal over the X axis for a subject/activity  <br/>
"timeBodyAccJerkMean-Y": seconds, mean value of the mean of the body acceleration Jerk signal over the Y axis for a subject/activity  <br/>
"timeBodyAccJerkMean-Z": seconds, mean value of the mean of the body acceleration Jerk signal over the Z axis for a subject/activity  <br/>
"timeBodyAccJerkStd-X": seconds, mean value of the standard deviation of the body acceleration Jerk signal over the X axis for a subject/activity  <br/>
"timeBodyAccJerkStd-Y": seconds, mean value of the standard deviation of the body acceleration Jerk signal over the Y axis for a subject/activity  <br/>
"timeBodyAccJerkStd-Z": seconds, mean value of the standard deviation of the body acceleration Jerk signal over the Z axis for a subject/activity  <br/>
"timeBodyGyroMean-X": seconds, mean value of the mean of the body gyroscope signal over the X axis for a subject/activity  <br/>
"timeBodyGyroMean-Y": seconds, mean value of the mean of the body gyroscope signal over the Y axis for a subject/activity  <br/>
"timeBodyGyroMean-Z": seconds, mean value of the mean of the body gyroscope signal over the Z axis for a subject/activity  <br/>
"timeBodyGyroStd-X": seconds, mean value of the standard deviation of the body gyroscope signal over the X axis for a subject/activity  <br/>
"timeBodyGyroStd-Y": seconds, mean value of the standard deviation of the body gyroscope signal over the Y axis for a subject/activity  <br/>
"timeBodyGyroStd-Z": seconds, mean value of the standard deviation of the body gyroscope signal over the Z axis for a subject/activity  <br/>
"timeBodyGyroJerkMean-X": seconds, mean value of the mean of the body gyroscope jerk signal over the X axis for a subject/activity  <br/>
"timeBodyGyroJerkMean-Y": seconds, mean value of the mean of the body gyroscope jerk signal over the Y axis for a subject/activity  <br/>
"timeBodyGyroJerkMean-Z": seconds, mean value of the mean of the body gyroscope jerk signal over the Z axis for a subject/activity  <br/>
"timeBodyGyroJerkStd-X": seconds, mean value of the standard deviation of the body gyroscope jerk signal over the X axis for a subject/activity  <br/>
"timeBodyGyroJerkStd-Y": seconds, mean value of the standard deviation of the body gyroscope jerk signal over the Y axis for a subject/activity  <br/>
"timeBodyGyroJerkStd-Z": seconds, mean value of the standard deviation of the body gyroscope jerk signal over the Z axis for a subject/activity  <br/>
"timeBodyAccMagMean": seconds, mean value of the mean of the magnitude of the body acceleration signal<br/>
"timeBodyAccMagStd": seconds, mean value of the standard deviation of the magnitude of the body acceleration signal<br/>
"timeGravityAccMagMean": seconds, mean value of the mean of the magnitude of the gravity acceleration signal<br/>
"timeGravityAccMagStd": seconds, mean value of the standard deviation of the magnitude of the gravity acceleration signal<br/>
"timeBodyAccJerkMagMean": seconds, mean value of the mean of the jerk magnitude of the body acceleration signal<br/>
"timeBodyAccJerkMagStd": seconds, mean value of the mean of the standard deviation of the jerk magnitude of the body acceleration signal<br/>
"timeBodyGyroMagMean": seconds, mean value of the mean of the magnitude of the body gyroscope signal<br/>
"timeBodyGyroMagStd": seconds, mean value of the standard deviation of the magnitude of the body gyroscope signal<br/>
"timeBodyGyroJerkMagMean": seconds, mean value of the mean of the magnitude of the body gyroscope jerk signal<br/>
"timeBodyGyroJerkMagStd": seconds, mean value of the standard deviation of the magnitude of the body gyroscope jerk signal<br/>
"freqBodyAccMean-X": Hz, mean value (broken by subjectId/activityLabel) of the mean of the body acceleration signal over the X axis<br/>
"freqBodyAccMean-Y": Hz, mean value (broken by subjectId/activityLabel) of the mean of the body acceleration signal over the Y axis<br/>
"freqBodyAccMean-Z": Hz, mean value (broken by subjectId/activityLabel) of the mean of the body acceleration signal over the Z axis<br/>
"freqBodyAccStd-X": Hz, mean value of (broken by subjectId/activityLabel) of the standard deviation of the body acceleration signal over the X axis<br/>
"freqBodyAccStd-Y": Hz, mean value of (broken by subjectId/activityLabel) of the standard deviation of the body acceleration signal over the Y axis<br/>
"freqBodyAccStd-Z": Hz, mean value of (broken by subjectId/activityLabel) of the standard deviation of the body acceleration signal over the Z axis<br/>
"freqBodyAccJerkMean-X": Hz, mean value (broken by subjectId/activityLabel) of the mean of the body acceleration jerk signal over the X axis<br/>
"freqBodyAccJerkMean-Y": Hz, mean value (broken by subjectId/activityLabel) of the mean of the body acceleration jerk signal over the Y axis<br/>
"freqBodyAccJerkMean-Z": Hz, mean value (broken by subjectId/activityLabel) of the mean of the body acceleration jerk signal over the Z axis<br/>
"freqBodyAccJerkStd-X": Hz, mean value of (broken by subjectId/activityLabel) of the standard deviation of the body acceleration jerk signal over the X axis<br/>
"freqBodyAccJerkStd-Y": Hz, mean value (broken by subjectId/activityLabel) of the standard deviation of the body acceleration jerk signal over the Y axis<br/>
"freqBodyAccJerkStd-Z": Hz, mean value (broken by subjectId/activityLabel) of the standard deviation of the body acceleration jerk signal over the Z axis<br/>
"freqBodyGyroMean-X": Hz, mean value of (broken by subjectId/activityLabel) of the mean of the body gyroscope signal over the X axis<br/>
"freqBodyGyroMean-Y": Hz, mean value (broken by subjectId/activityLabel) of the mean of the body gyroscope signal over the Y axis<br/>
"freqBodyGyroMean-Z": Hz, mean value (broken by subjectId/activityLabel) of the mean of the body gyroscope signal over the Z axis<br/>
"freqBodyGyroStd-X": Hz, mean value (broken by subjectId/activityLabel) of the standard deviation of the body gyroscope signal over the X axis<br/>
"freqBodyGyroStd-Y": Hz, mean value (broken by subjectId/activityLabel) of the standard deviation of the body gyroscope signal over the Y axis<br/>
"freqBodyGyroStd-Z": Hz, mean value (broken by subjectId/activityLabel) of the standard deviation of the body gyroscope signal over the Z axis <br/>
"freqBodyAccMagMean": Hz, mean value (broken by subjectId/activityLabel) of the mean of the body acceleration magnitude signal<br/>
"freqBodyAccMagStd": Hz, mean value (broken by subjectId/activityLabel) of the standard deviation of the body acceleration magnitude signal<br/>
"activityLabel": name of the activity performed<br/>
"subjectId": id of the subject<br/>