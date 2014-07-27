## Instructions
## 1 Merges the training and the test sets to create one data set.

# read in Test & Training sets,then combine them
x.test <- read.table("test/X_test.txt")
x.train <- read.table("train/X_train.txt")
X <- rbind(x.test, x.train)

# read in Test & Training labels,then combine them
y.test <- read.table("test/Y_test.txt")
y.train <- read.table("train/Y_train.txt")
Y <- rbind(y.test, y.train)

# read in Test & Training subjects,then combine them
s.test <- read.table("test/subject_test.txt")
s.train <- read.table("train/subject_train.txt")
S <- rbind(s.test, s.train)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# read in features and extract mean & std with grep()
features <- read.table("features.txt")
featuresIndex <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, featuresIndex]
names(X) <- features[featuresIndex, 2]


## 3. Uses descriptive activity names to name the activities in the data set

# read in activity labels and named the activities, fix character vect w/ gsub()
activity <- read.table("activity_labels.txt")
activity[, 2] = gsub("_", "", activity[, 2])
Y[,1] = activity[Y[,1], 2]
names(Y) <- "Activity"


## 4. Appropriately labels the data set with descriptive activity names.

# Labeled the data set with descriptive activity names, merge & output to a file.
names(S) <- "Subject"
MergeData <- cbind(S, Y, X)
write.table(MergeData, "merged_data.txt")
# write.csv(MergeData, "merged_data.csv")

## 5. Creates a second, independent tidy data set with the average of each variable 
## for each activity and each subject. 

# read in data from step 4, lapply mean & standard veviation, order by subject, output tidy data file.
# https://stat.ethz.ch/pipermail/r-help/2011-March/271479.html

library(data.table)
DT <- data.table(MergeData)
t.data <- DT[, lapply(.SD, mean), by = c("Subject", "Activity")]
t.data <- t.data[order(t.data$Subject),]
write.table(t.data, "tidy_data.txt")
# write.csv(t.data, "tidy_data.csv")
