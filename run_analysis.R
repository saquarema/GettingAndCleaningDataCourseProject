# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

getTidyDataset <- function(){

        ## Libraries
        library(data.table)
        library(plyr)
        
        #############################################################################################
        ## 1. Merges the training and the test sets to create one data set.
        ## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
                

        ## features: List of all features. Reading with fread   
        ## Make feature a global variable "<<-"  (to be used in other functions)
        features <<- fread("./UCI HAR Dataset/features.txt", colClasses = "character")  
        
        ## identify positions that must be considered in the text file
        columsAux <- getColumsPositionsMeanAndStd()
        
        ## x datasets        
        ## Training set:        
        ## Using fwf to get data by fixed width (just 'main' and 'std' columns)
        xTrain <- read.fwf("./UCI HAR Dataset/train/X_train.txt", columsAux) 
        ## Test set:
        xTest <- read.fwf("./UCI HAR Dataset/test/X_test.txt", columsAux)  
        ## Merging rows of x Training and Test datasets
        xFull <- rbindlist(list(xTrain, xTest))
        
        ## y sets        
        ## Training labels
        yTrain <- fread("./UCI HAR Dataset/train/y_train.txt", colClasses = "character")        
        ## Test labels
        yTest <- fread("./UCI HAR Dataset/test/y_test.txt", colClasses = "character")  
        ## Merging rows of y Training and Test datasets
        yFull <- rbindlist(list(yTrain, yTest))       

        ## Subject sets: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
        ## Train Subjects 
        subjectsTrain <- fread("./UCI HAR Dataset/train/subject_train.txt", colClasses = "character") 
        ## Test Subject
        subjectsTest <- fread("./UCI HAR Dataset/test/subject_test.txt", colClasses = "character") 
        ## Merging rows of y Training and Test datasets
        subjectsFull <- rbindlist(list(subjectsTrain, subjectsTest))  
        
        
        #############################################################################################
        # 3. Uses descriptive activity names to name the activities in the data set
        
        ## activityLabels: Links the class labels with their activity name. Reading with fread
        activityLabels <- fread("./UCI HAR Dataset/activity_labels.txt", colClasses = "character")
        
        ## Set the names of the activityLabels columns to easy identification
        setnames(activityLabels, c("activityId","activityName"))
        
        ## Set the name of the yFull column to easy identification
        setnames(yFull, c("activityId"))
        
        ## Set the name of the subjectsFull column to easy identification
        setnames(subjectsFull, c("subjectId"))
        
        ## As we have the row number as a common identifier between x, y and subject datasets, 
        ## I am creating a new column called 'id', which stores the row number for each data set.         
        xFull[, id := 1:nrow(xFull)]
        yFull[, id := 1:nrow(yFull)]
        subjectsFull[, id := 1:nrow(subjectsFull)]
        
        ## Setting keys to merge (yFull, xFull and subjectsFull)
        setkey(xFull, id)
        setkey(yFull, id)
        setkey(subjectsFull, id)
        
        ## I'll merge y and subject by the keys defined above ('id')
        newXFull <- merge(subjectsFull, yFull)
        ## Now I'll merge with x by the keys defined above ('id')
        newXFull <- merge(newXFull, xFull)
        
        ## Now I have a new dataset with an activityId for each register of x
        ## and I can get Activity Names with the merge function
        
        ## Set key to the newXFull dataset to be merged with Activity Names (this will order the dataset by the key to do the merge faster)
        setkey(newXFull,activityId)
        
        ## Set key to the Activity Names dataset to be merged with newXFull (this will order the dataset by the key to do the merge faster)
        setkey(activityLabels,activityId)       
        
        ## Merge data sets by activityId
        fullDataset <- merge(activityLabels, newXFull)
        ## Now each register of 'x' has the name of the activity and subject
        
        
        #############################################################################################                
        # 4. Appropriately labels the data set with descriptive variable names.         
        
        ## Update 'special' characters on the features names
        features$V2 <- gsub("\\(", "", features$V2)
        features$V2 <- gsub("\\)", "", features$V2)
        features$V2 <- gsub("-", "", features$V2)
        features$V2 <- gsub(",", "", features$V2)   
        ## CamelCase Mean and Std
        features$V2 <- gsub("mean", "Mean", features$V2)   
        features$V2 <- gsub("std", "Std", features$V2)   
       
        ## new columns from the merges
        colNames <- c("activityId", "activityName", "id", "subjectId")
        ## Merging names with features names     
        colNames <- c(colNames, features$V2)
        
        ## Set names for full dataset
        setnames(fullDataset, colNames)
        
        
        #############################################################################################
        # 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.         
        
        ## Set key to fullDataset for aggregate be faster
        setkey(fullDataset, subjectId, activityId, activityName)
        
        ## To know the number of columns
        numberOfCols <- length(colNames)
        
        ## Aggregating by subject and activity, calculating mean for colums with features information (starts on 5)
        tidyDataset <- fullDataset[, lapply(.SD, mean), by=c("subjectId", "activityId", "activityName"), .SDcols=names(fullDataset)[5:numberOfCols]]
        
        ## Get as numeric
        tidyDataset$activityId <- as.numeric(tidyDataset$activityId)        
        ## Get as numeric
        tidyDataset$subjectId <- as.numeric(tidyDataset$subjectId)
        ## Order by subjectId
        tidyDataset <- tidyDataset[ order(tidyDataset$subjectId), ]    
        
        ## Creating a tidy dataset as txt
        write.table(tidyDataset, file = "tidyData.txt", row.names = FALSE)        
}

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

