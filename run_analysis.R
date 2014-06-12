# First read in all of the data required
TestData <- read.table("UCI HAR Dataset/test/x_test.txt")               # Read the full test data
TrainData <- read.table("UCI HAR Dataset/train/x_train.txt")            # Read the full training data
TestSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")     # Read the test subject data
TrainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")  # Read the training subject data
TestActivity <- read.table("UCI HAR Dataset/test/y_test.txt")           # Read the test activity data
TrainActivity <- read.table("UCI HAR Dataset/train/y_train.txt")        # Read the training activity data
ColumnNames <- read.table("UCI HAR Dataset/features.txt")               # Read the names of the feature file columns
ColumnNames <- as.character(ColumnNames[,2])                            # Create as a character vector
#
# Now add Subject, actvity and test/train columns to the data  
#
TestData <- cbind(rep("Test",dim(TestData)[1]),TestData)                # Set column to red Test
TestData <- cbind(TestActivity,TestData)                                # Activity to TestData
TestData <- cbind(TestSubjects,TestData)                                # Subjects to TestData
TrainData <- cbind(rep("Train",dim(TrainData)[1]),TrainData)            # Set column to read Train
TrainData <- cbind(TrainActivity,TrainData)                             # Activity to TrainData
TrainData <- cbind(TrainSubjects,TrainData)                             # Subjects to TrainData
#
# Rename the columns to the correct data fields
#
ColumnNames <- append(c("Subject","Activity","Test/Train"),ColumnNames) # Add in the new column names
names(TestData) <- ColumnNames                                          # Rename TestData with descriptive names
names(TrainData) <- ColumnNames                                         # Rename TrialData with descriptive names
#
# Merge the files into one
#
TheData <- rbind(TestData,TrainData)                                    # Create a single data frame with all of the data
#
# Create a data frame containing only the first three columns plus all columns that contain mean or st.dev data
# This relies on checking for the substrngs "mean()" and "std()" in TheData names
# To do this the grep command is used twice on the names of the data variables, results are combined and sorted to list all required columns
#
TheMeanData=TheData[,c(1,2,3,sort(c(grep("mean()",names(TheData),fixed=TRUE),grep("std()",names(TheData),fixed=TRUE))))]
#
# Replace the activity column with textual data
#
TheActivities <- read.table("UCI HAR Dataset/activity_labels.txt")      # Read in the activity names
TheMeanData$Activity <- TheActivities[TheMeanData$Activity,2]           # Replace the integers with text
#
# Now sort the data by Subject and Activity
#
TheMeanData <- TheMeanData[order(TheMeanData$Subject,TheMeanData$Activity),]
rownames(TheMeanData)=1:dim(TheMeanData)[1]                             # Reset the row numbering for completeness
#
# Write the tidy data to a text file on home directory
#
write.table(TheMeanData,"Themeandata.txt",sep=",")
#
# Now average the data by subject and activity
# Melt the data to separate out each variable by subject and activity and test/train
#
TheMeltedData <- melt(TheMeanData,id=names(TheMeanData)[1:3],measure.vars=names(TheMeanData)[4:length(names(TheMeanData))])
#
# Recast the melted data by subject and activity, applying the mean function
#
TheMeanofMeans <- dcast(TheMeltedData,Subject + Activity ~ variable,mean)
#
# Write the second tidy data to a text file
#
write.table(TheMeanofMeans,"Themeanofmeans.txt",sep=",")
#
# Clean up files
#
rm(TheData,TheMeltedData,TestData,TrainData,TestActivity,TrainActivity,TestSubjects,TrainSubjects,ColumnNames,TheActivities)
#