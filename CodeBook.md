# Code book for the tidy data files Themeandata.txt and Themeanofmeans.txt

These files were created from the UCI HAR Dataset of human activity data, which came from accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 

Te original data set included time domain signals (prefix 't' to denote time), captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

These files contain the means and standard deviations taken from the full data set, and sorted by subject and activity. The sequence of processing os described in the accompaning Readme.md file, and the R script file run_analysis.R

Themeandata.txt contains mean "...mean()" and standard deviation "...std()" data for 30 individuals performing 6 basic tasks

* WALKING

* WALKING_UPSTAIRS

* WALKING_DOWNSTAIRS

* SITTING

* STANDING

* LAYING


Both mean and standard deviation results are shown for the following variables

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

All accelerations (variables containing Acc in their name) are measured in 'g', and rotations (variables containing Gyro in their name) in radians/sec

Themeanofmeans.txt contains the average of these means for each subject and each activity, for the same variable names


