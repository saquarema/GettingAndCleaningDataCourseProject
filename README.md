### Introduction

This is the Course Project with a five steps to deal with some datasets and generate a tidy dataset.

 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names. 
 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

### Getting original data

The original data can be downloaded in this link:
http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip

### Getting the tidy data

In this Github repository there is a file nammed as "run_analysis.R". It must be put in your work directory.

The zip file (ontained in Getting original data) must be unziped in a way tha will be a folder "UCI HAR Dataset" directtly in your work directory.

To get the tidy data execute in R console the instructions below:

<!-- -->

    > source("run_analysis.R")
    > getTidyDataset()

In a few minutes the tidy data will be created in your work directory with the name "tidyData.txt".

This file contain as columns "subjectId",	"activityId", "activityName" and all features related to mean() and std().
I included the colum "activityId" to be easier.

The rows contain the mean from all features grouped by Subject and Activity.

### About the code
