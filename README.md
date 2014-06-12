# Readme file for Getting and Cleaning Data Project

## This file descrbes the working of the run_analysis.R script file.The data set is stored in the folder"UCI HAR Dataset" of the R working directory.

1 First all of the data required are read into working variables

* The full set of test data is read into TestData from the x_test.txt file
* The full set of training data is read into TrainData from the x_train.txt file
* The test and training subject id's are read into TestSubjects and TrainSubjects from the subjects_test.txt and subjects_train.txt files
* The test and training activities are read into TestActivity and TrainActivity from the y_test.txt and y_train.txt files
* The variable names for the data are read into ColumnNames (from the features.txt file), and it is then turned into a character vector

2 Now three additional columns are added to the TestData and TrainData variables

* A column with the data "Test" or "Train" as appropriate
* A column adding in the TestActivity and TrainActivity data
* A column adding in the TstSubjects and TrainSubjects data

3 The column names of TestData and TrainData are renamed appropriately

* Subject
* Activity
* Train/Test
* Fially th data from ColumnNames
 
4 TestData and TrainData are then merged together to form the full set of data TheData

5 The next task is to identify the columns that contain mean and standard devition data

* Using the grep command, the column numbers are determined that contain the sub-string "mean()"
* Using the grep command, the column numbers are determined that contain the sub-string "std()"
* The two sets of column numbers are joined together and sorted
* The variable TheMeanData is created by subsetting TheData with the sorted column numbers

6 The activity column data are replacd by textual data

* The activity_labels.txt file is read into a variable called TheActivities
* The Activity column in The MeanData is relpaced by values from TheActivities

7 Sorting the data

* TheMeanData is sorted by Subject and Activity
* The rownames are re-ordered

8 TheMeanData is then complete, and is written to the local directory

9 To create the second tidy data set the data are averaged by subject and activity

* The data are melted into TheMeltedData to separate out each variable by subject and activity
* TheMeltedData is then recast by subject and activity, applying the mean function to each of the variable columns crating TheMeanofMeans variable

10 TheMeanofMeans is then complete, and is written to the local directory

11 Clean up files by removing all except TheMeanData and TheManofMeans
