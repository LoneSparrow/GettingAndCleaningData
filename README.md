## GettingAndCleaningData
======================
Peer Assessments: Getting and Cleaning Data Course Project

### This file describes how run_analysis.R script works.

1-  Download the data from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
For this exercise, assuming you will set your working directory to the folder you unzip this data to.
If not, please adjust the path accordingly.

2- Place run_analysis.R script in your working directory.

3- Run the script with source command - source("run_analysis.R")

4- The script will read 'train' and 'test' data sets and does all the required steps.
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The 2 outputs 'merged_data.txt' and 'tidy_data.txt' will be generated on your working directory.

5- Read the tidy_data file: t.data <- read.table("tidy_data.txt")
It is a 180*68 data frame. The first column contains subject IDs, the second column contains activity names and the rest are the averages for each of the 66 attributes.
