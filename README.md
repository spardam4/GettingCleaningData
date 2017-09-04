==================================================================
**Getting and Cleaning Data - Course Project**
Sept 3, 2017 - El Salvador
==================================================================
Autor: Marlon Marcelo Martinez
email: spardam4@gmail.com
==================================================================
In the file *run_analysis.R* you will find the code for creating a Tidy Dataset of "Human Activity Recognition Using Smartphones Dataset" from UC Irvine Machine Learning Repository.
The *CodeBook.md* file contain the description of variables and transformations applied to get the final data.

##Explanation.
The approach of this code is to create a single dataset from each subject, activity and measures, merging training and test files.

	* subjectDF:	Contain the subject IDs from training and test subject file
	* activityDF:Contain the activity in readable description of each row from training and test activity file
	* xDataDF:	Contain the measures variables filtered of Mean and Standard Deviation
 
After creating each dataset, the *cbind()* function combine them to generate a single dataset.
	* combinedData

Using Regular expressions and the *gsub()* function, the labels of each of the measures are transformed to descriptive variable names

Finally, 
Using *melt()* from library *reshape2* the "subject" and "activity" field from *combinedData* are set as ID's to create one row for each measure and it's value. 
With *dcast* the molten data its tranformed into a data frame applying a mean grouping the variables by subject and activity.

The result is exported as ".TXT" with *write.table()*














