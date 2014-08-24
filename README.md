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

In this Github repository there is a file with the name "run_analysis.R". It should be placed in your work directory.

The zip file (obtained in Getting original data) should be unzipped in a way that will be a folder "UCI HAR Dataset" directtly in your work directory.

To get the tidy data execute in R console the instructions below:

<!-- -->

    > source("run_analysis.R")
    > getTidyDataset()

In a few minutes the tidy data will be created in your work directory with the name "tidyData.txt".

This file contain as columns "subjectId", "activityId", "activityName" and all features related to mean() and std(). I included the colum "activityId" to be more comprehensive.

The rows contain the mean and the standard deviation from all features grouped by Subject and Activity.

### About the code

To simplify, there are only two functions in the script, getTidyDataset() that is the main function and getColumsPositionsMeanAndStd(). 

This last is called by getTidyDataset() to identify the positions in the text file that correspond to mean() and std() features. Then the text files with the x informations can be read as column fixed.

I could have read the entire x files and get the correct columns after, but my computer does not support this.

<!-- -->

    ## Function to identify positions that must be considered in the text file
    getColumsPositionsMeanAndStd <- function(){
        
        ## Creating a vector that represents all colums with 16 width positions from the x and y
        ## Initially all values are negative (would be ignored) 
        widthAux <- rep(-16, length(features$V1))
        
        ## Getting colIndex that correspond with Mean value from the features
        ## using grep to identify indexes for the string "mean()". The \\ is to deal with the ()        
        indexMean <- features[grep("mean\\()", features$V2)]
        ## Getting colIndex that correspond with Standard deviation from the features
        ## using grep to identify indexes for the string "std()". The \\ is to deal with the ()        
        indexStd <- features[grep("std\\()", features$V2)]
        
        ## Merging indexes
        indexAux <- rbind(indexMean, indexStd)
             
        ## Update widthAux with the indexes that must be considered (mean and std)  
        for (i in 1:length(widthAux)){
                if (i %in% indexAux$V1) widthAux[i] <- 16 ## Setting positive
        }
        
        ## Keeping only the features that will be used        
        features <<- features[V1 %in% indexAux$V1, ]
        
        ## Return
        widthAux
    }
 
 In other aspects of the code, I tried to use the most the "data.tabble" resources.
