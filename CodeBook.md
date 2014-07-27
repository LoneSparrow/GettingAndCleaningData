
### CodeBook for run_analysis.R

Source:
The original data set was obtained from Human Activity Recognition Using Smartphones Data Set. 
A full description is available at the site where the data were obtained from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data Set Information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components; therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
 
Attribute Information:
For each record in the dataset it is provided:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment. 


Source:
The data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

run_analysis.R script does the followings:

1) Reads and merges the training and test sets to create one data set:

2) Reads features.txt and extracts only the measurements on MEAN & SD for each measurement:
Output is a 10299*66 data frame, as only 66 out of 561 attributes are measurements on the MEAN & SD. All measurements appear to be float point numbers in the range (-1, 1).

3) Reads activity_labels.txt and applies descriptive activity names to name activities in the data set: LAYING, SITTING, STANDING, WALKING, WALKINGDOWNSTAIRS and WALKINGDOWNSTAIRS.

4) Labels the data set with descriptive activity names: 
Output is saved as merged_data.txt. It is a 10299*68 data frame with the first column contains subject IDs, the second column contains activity names, and the last 66 columns are measurements.

5) Creates a second independent tidy data set with the average of each variable for each activity and each subject:
Output is saved as tidy_data.txt. It is a 180*68 data frame. The first column contains subject IDs (1 to 30), the second column contains activity names (LAYING, SITTING, STANDING, WALKING, WALKINGDOWNSTAIRS and WALKINGDOWNSTAIRS) and the rest are the averages for each of the 66 attributes.
