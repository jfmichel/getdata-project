#Getting and Cleaning Data
This repository contains one R script "run_analysis.R". It solves the Coursera's Getting and Cleaning Data course projet described below. 
## Course project
Here are the data for the project: 

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

 You should create one R script called run_analysis.R that does the following. 
 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Setup and usage

1. Download and extract [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). You should have a directory named "UCI HAR Dataset".
2. set the working directory to the parent directory of "UCI HAR Dataset"
3. source run_analysis.R. It should add an runAnalysis function to your environment.
4. Call runAnalysis() function. It will create the requested tidy data file "tidy_data_set.txt". You can also pass a file name argument to runAnalysis to change the output file name.
