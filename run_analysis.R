#==================================================================
#=  Sept 03, 2017                                                 =
#=  Getting and Cleaning Data Course Project                      =
#=  Name: Marlon Martinez                                         =
#==================================================================

#Loading libraries
if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

require("data.table")
require("reshape2")


# Download and unzip the dataset:
filename <- "getdata_projectfiles_UCI HAR Dataset.zip"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename, method="curl")
}

if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

#To Do:
#1.Merges the training and the test sets to create one data set.
#2.Extracts only the measurements on the mean and standard deviation for each measurement.
#3.Uses descriptive activity names to name the activities in the data set
#4.Appropriately labels the data set with descriptive variable names.
#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#==================================================================

#Merging the train and test sets rows

xTrainDF <- read.table("./UCI HAR Dataset/train/X_train.txt")
xTestDF  <- read.table("./UCI HAR Dataset/test/X_test.txt")
xDataDF  <- rbind(xTrainDF,xTestDF)
#==================================================================

#Loading file with descriptions of each measure
featuresDF <- read.table("./UCI HAR Dataset/features.txt")
featuresDF <- featuresDF[,2]

#assigning the names of each measure
names(xDataDF) <- featuresDF

#Select only the measure columns needed
filterFeatures <- grep("(mean|std)\\(\\)",featuresDF)
xDataDF        <- xDataDF[,filterFeatures]
#==================================================================

#Merging activity data sets rows
yTrainDF       <- read.table("./UCI HAR Dataset/train/y_train.txt")
yTestDF        <- read.table("./UCI HAR Dataset/test/y_test.txt")
yDataDF        <- rbind(yTrainDF,yTestDF)
names(yDataDF) <- c("activityID")

#adding a rank to preserve the position of each row in the activity set
yDataDF$rnk    <- 1:nrow(yDataDF)

#Loading activity labels
activities        <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activities) <- c("id","activity")

#matching the activity name with each id of the activity set
activityDF        <- merge(yDataDF,activities,by.x = "activityID",by.y = "id")
activityDF        <- activityDF[order(activityDF$rnk ),]
activityDF        <- as.data.frame(activityDF$activity) 
names(activityDF) <- "activity"
#==================================================================

#Merging subject data rows
sbjTrainDF       <- read.table("./UCI HAR Dataset/train/subject_train.txt")
sbjTestDF        <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subjectDF        <- rbind(sbjTrainDF,sbjTestDF)
names(subjectDF) <- "subject"

#==================================================================

#Merging data frames in a single dataset
combinedData        <- cbind(subjectDF,activityDF,xDataDF)

#Appropriately label the data set with descriptive variable names
names(combinedData) <- gsub("^t","Time",names(combinedData))
names(combinedData) <- gsub("^f","Freq",names(combinedData))
names(combinedData) <- gsub("mean","Mean",names(combinedData))
names(combinedData) <- gsub("std","StdDev",names(combinedData))
names(combinedData) <- gsub("\\(\\)","",names(combinedData))

#==================================================================

#Creating an average of each variable for each activity and each subject
meltedData <- melt(combinedData,id=c("subject","activity"))
tidyData   <- dcast(meltedData,subject+activity~variable,mean)

#export Tidy Data to TXT file
write.table(tidyData, "tidy_data.txt", row.names = FALSE, quote = FALSE)
