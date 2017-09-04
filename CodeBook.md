==================================================================
**Getting and Cleaning Data - Course Project**
Sept 3, 2017 - El Salvador
==================================================================
Autor: Marlon Marcelo Martinez
email: spardam4@gmail.com

#CodeBook 

Tidy Dataset of "Human Activity Recognition Using Smartphones Dataset" from UC Irvine Machine Learning Repository. 

##Contents
*1.Variables
*2.Data
*3.Transformations

##1.Variables
The following list contain the data frames and arrays used to create the dity data set:

* xTrainDF:			a data frame containing the train set (7352 rows of 561 variables)

* xTestDF:			a data frame containing the test set (2947 rows of 561 variables)
 
* xDataDF:			the combined data frame for the measures set (10299 rows of 561 variables)

* featuresDF:		a data frame with each of the labels for the variables of set X

* filterFeatures:	an array with the labels of the features containing mean() or std()

* yTrainDF:			a data frame containing the activities id for train set (7352 rows of 1 variables)

* yTestDF:			a data frame containing the activities id for test set (2947 rows of 1 variables)

* yDataDF:			

* activities:

* activityDF:

* sbjTrainDF:

* combinedData:

* meltedData:

* tidyData:

##2.Data
The files used in this project are:

* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

##3.Transformations
