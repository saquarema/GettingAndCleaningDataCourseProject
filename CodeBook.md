===============================+++===================================
A tidy data from the project 
Human Activity Recognition Using Smartphones Dataset

Version 1.0
===============================+++===================================
Gustavo Oliveira Santos
saquarema@gmail.com
===============================+++===================================


This tidy data was obtained from the project Human Activity Recognition Using Smartphones Data Set.

The original data can be downloaded in this link:
http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip

This original files has data from two different sets (train and test). Each of this set has information is divides in three files: "subject" (with de id of the subjesct from experiments), "x" that contain all information that was captured by the phone and "y", with each activity id informations from the phone information.

From "x" was obtained only the columns related to mean() and std() functions.

There are more two files "features" that represents the columns of the "x" and "activity_labels" that has the id and description of activities.

The train and test sets were merged into a new set with combination of "x", "y", and "subject". Then the new set was merged with "activity_labels" to get their names.

In the end was obtained the mean of all new "x" information by Subject and Activity.

Description of "x" colums

The features (x" colums) contain "()" and "-" characters. The new colums exclude this characters and replaced the words "mean" and "std" for "Mean" and "Std" to be CamelCase.

Below the Tidy Dataset Structure:
======================================

	NAME              			TYPE              	DESCRIPTION
	subjectId                   numeric           	Id of the subject of the experiment
	activityId                  numeric           	Id of the activity
	activityName                character         	The name of the activity
	tBodyAccMeanX				numeric				Mean of  tBodyAcc-mean()-X  feature.
	tBodyAccMeanY				numeric				Mean of  tBodyAcc-mean()-Y  feature.
	tBodyAccMeanZ				numeric				Mean of  tBodyAcc-mean()-Z  feature.
	tBodyAccStdX				numeric				Standard deviation of  tBodyAcc-std()-X  feature.
	tBodyAccStdY				numeric				Standard deviation of  tBodyAcc-std()-Y  feature.
	tBodyAccStdZ				numeric				Standard deviation of  tBodyAcc-std()-Z  feature.
	tGravityAccMeanX			numeric				Mean of  tGravityAcc-mean()-X  feature.
	tGravityAccMeanY			numeric				Mean of  tGravityAcc-mean()-Y  feature.
	tGravityAccMeanZ			numeric				Mean of  tGravityAcc-mean()-Z  feature.
	tGravityAccStdX				numeric				Standard deviation of  tGravityAcc-std()-X  feature.
	tGravityAccStdY				numeric				Standard deviation of  tGravityAcc-std()-Y  feature.
	tGravityAccStdZ				numeric				Standard deviation of  tGravityAcc-std()-Z  feature.
	tBodyAccJerkMeanX			numeric				Mean of  tBodyAccJerk-mean()-X  feature.
	tBodyAccJerkMeanY			numeric				Mean of  tBodyAccJerk-mean()-Y  feature.
	tBodyAccJerkMeanZ			numeric				Mean of  tBodyAccJerk-mean()-Z  feature.
	tBodyAccJerkStdX			numeric				Standard deviation of  tBodyAccJerk-std()-X  feature.
	tBodyAccJerkStdY			numeric				Standard deviation of  tBodyAccJerk-std()-Y  feature.
	tBodyAccJerkStdZ			numeric				Standard deviation of  tBodyAccJerk-std()-Z  feature.
	tBodyGyroMeanX				numeric				Mean of  tBodyGyro-mean()-X  feature.
	tBodyGyroMeanY				numeric				Mean of  tBodyGyro-mean()-Y  feature.
	tBodyGyroMeanZ				numeric				Mean of  tBodyGyro-mean()-Z  feature.
	tBodyGyroStdX				numeric				Standard deviation of  tBodyGyro-std()-X  feature.
	tBodyGyroStdY				numeric				Standard deviation of  tBodyGyro-std()-Y  feature.
	tBodyGyroStdZ				numeric				Standard deviation of  tBodyGyro-std()-Z  feature.
	tBodyGyroJerkMeanX			numeric				Mean of  tBodyGyroJerk-mean()-X  feature.
	tBodyGyroJerkMeanY			numeric				Mean of  tBodyGyroJerk-mean()-Y  feature.
	tBodyGyroJerkMeanZ			numeric				Mean of  tBodyGyroJerk-mean()-Z  feature.
	tBodyGyroJerkStdX			numeric				Standard deviation of  tBodyGyroJerk-std()-X  feature.
	tBodyGyroJerkStdY			numeric				Standard deviation of  tBodyGyroJerk-std()-Y  feature.
	tBodyGyroJerkStdZ			numeric				Standard deviation of  tBodyGyroJerk-std()-Z  feature.
	tBodyAccMagMean				numeric				Mean of  tBodyAccMag-mean()  feature.
	tBodyAccMagStd				numeric				Standard deviation of  tBodyAccMag-std()  feature.
	tGravityAccMagMean			numeric				Mean of  tGravityAccMag-mean()  feature.
	tGravityAccMagStd			numeric				Standard deviation of  tGravityAccMag-std()  feature.
	tBodyAccJerkMagMean			numeric				Mean of  tBodyAccJerkMag-mean()  feature.
	tBodyAccJerkMagStd			numeric				Standard deviation of  tBodyAccJerkMag-std()  feature.
	tBodyGyroMagMean			numeric				Mean of  tBodyGyroMag-mean()  feature.
	tBodyGyroMagStd				numeric				Standard deviation of  tBodyGyroMag-std()  feature.
	tBodyGyroJerkMagMean		numeric				Mean of  tBodyGyroJerkMag-mean()  feature.
	tBodyGyroJerkMagStd			numeric				Standard deviation of  tBodyGyroJerkMag-std()  feature.
	fBodyAccMeanX				numeric				Mean of  fBodyAcc-mean()-X  feature.
	fBodyAccMeanY				numeric				Mean of  fBodyAcc-mean()-Y  feature.
	fBodyAccMeanZ				numeric				Mean of  fBodyAcc-mean()-Z  feature.
	fBodyAccStdX				numeric				Standard deviation of  fBodyAcc-std()-X  feature.
	fBodyAccStdY				numeric				Standard deviation of  fBodyAcc-std()-Y  feature.
	fBodyAccStdZ				numeric				Standard deviation of  fBodyAcc-std()-Z  feature.
	fBodyAccJerkMeanX			numeric				Mean of  fBodyAccJerk-mean()-X  feature.
	fBodyAccJerkMeanY			numeric				Mean of  fBodyAccJerk-mean()-Y  feature.
	fBodyAccJerkMeanZ			numeric				Mean of  fBodyAccJerk-mean()-Z  feature.
	fBodyAccJerkStdX			numeric				Standard deviation of  fBodyAccJerk-std()-X  feature.
	fBodyAccJerkStdY			numeric				Standard deviation of  fBodyAccJerk-std()-Y  feature.
	fBodyAccJerkStdZ			numeric				Standard deviation of  fBodyAccJerk-std()-Z  feature.
	fBodyGyroMeanX				numeric				Mean of  fBodyGyro-mean()-X  feature.
	fBodyGyroMeanY				numeric				Mean of  fBodyGyro-mean()-Y  feature.
	fBodyGyroMeanZ				numeric				Mean of  fBodyGyro-mean()-Z  feature.
	fBodyGyroStdX				numeric				Standard deviation of  fBodyGyro-std()-X  feature.
	fBodyGyroStdY				numeric				Standard deviation of  fBodyGyro-std()-Y  feature.
	fBodyGyroStdZ				numeric				Standard deviation of  fBodyGyro-std()-Z  feature.
	fBodyAccMagMean				numeric				Mean of  fBodyAccMag-mean()  feature.
	fBodyAccMagStd				numeric				Standard deviation of  fBodyAccMag-std()  feature.
	fBodyBodyAccJerkMagMean		numeric				Mean of  fBodyBodyAccJerkMag-mean()  feature.
	fBodyBodyAccJerkMagStd		numeric				Standard deviation of  fBodyBodyAccJerkMag-std()  feature.
	fBodyBodyGyroMagMean		numeric				Mean of  fBodyBodyGyroMag-mean()  feature.
	fBodyBodyGyroMagStd			numeric				Standard deviation of  fBodyBodyGyroMag-std()  feature.
	fBodyBodyGyroJerkMagMean	numeric				Mean of  fBodyBodyGyroJerkMag-mean()  feature.
	fBodyBodyGyroJerkMagStd		numeric				Standard deviation of  fBodyBodyGyroJerkMag-std()  feature.

