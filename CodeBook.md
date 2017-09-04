# Getting and Cleaning Data - Course Project

Sept 3, 2017 - El Salvador

Autor: Marlon Marcelo Martinez

email: spardam4@gmail.com

# CodeBook 

Tidy Dataset of "Human Activity Recognition Using Smartphones Dataset" from UC Irvine Machine Learning Repository. 

## Contents
* 1.Variables
* 2.Data
* 3.Transformations

## 1.Variables
The following list contain the data frames and arrays used to create the dity data set:

* xTrainDF:			a data frame containing the train set (7352 rows of 561 variables)
* xTestDF:			a data frame containing the test set (2947 rows of 561 variables)
* xDataDF:			the combined data frame for the measures set (10299 rows of 561 variables)
* featuresDF:		a data frame with each of the labels for the variables of set X
* filterFeatures:	an array with the labels of the features containing mean() or std()
* yTrainDF:			a data frame containing the activities id for train set (7352 rows of 1 variables)
* yTestDF:			a data frame containing the activities id for test set (2947 rows of 1 variables)
* yDataDF:			the combined data frame for the activity set (10299 rows of 1 variables)
* activities:		a data frame with the id and the name of each activity catalogue (6 rows of 2 variables)
* activityDF:		a data frame with all the activities registered in descriptive name (10299 rows of 1 variables)
* sbjTrainDF:		data frame with the Train subjects rows (7352 rows of 1 variables)
* sbjTestDF:		data frame with the Test subjects rows (2947 rows of 1 variables)
* subjectDF: 		the combined data frame for the subject data (10299 rows of 1 variables)
* combinedData:		merged data frame with the subject, activity and features data sets (10299 rows of 68 variables)
* meltedData:		data frame with features transformed into rows for each measure (679734 rows of 4 variables)
* tidyData:			aggregated data containing subject, activity and the mean of each variable (180 rows of 68 variables)

## 2.Data
The files used in this project are:

* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

## 3.Transformations
The raw data is transformed into Tidy Data using some functions of libraries *read.table* and *reshape2*

* the *cbind()* function combine them to generate a single dataset
* Using Regular expressions and the *gsub()* function, the labels of each of the measures are transformed to descriptive variable names
* *melt()*: "subject" and "activity" field from *combinedData* are set as ID's to create one row for each measure and it's value. 
* *dcast*: the molten data its tranformed into a data frame applying a mean grouping the variables by subject and activity.
* *write.table()*: The result is exported as ".TXT"
