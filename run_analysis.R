## 1. Merges the training and the test sets to create one data set.

# load the test set
ds1 <- read.table("test//X_test.txt", header = FALSE, sep="")

# lead the training set
ds2 <- read.table("train//X_train.txt", header = FALSE, sep="")

# merge the two datasets
merged <- rbind(ds1, ds2)

# (optional) frees some memory: ds1 and ds2 are not required anymore
ds1 <- NULL
ds2 <- NULL

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# load the features names
features <- read.table("features.txt", header = FALSE, sep = "", col.names = c("position", "name"))

# use a regular expression to match only the mean() and std() features
# this yields a boolean vector with 66 elements.
goodcols <- grep("(*-mean\\(\\)*|*-std\\(\\)*)", features$name)

# filter the 'merged' dataframe columns using R column filtering
# this operation yields a 10299x66 data frame.
dataset <- merged[, goodcols]

## 3. Uses descriptive activity names to name the activities in the data set

# First, load the test and training activity ids, the test and train subjects and the activity labels
test_y_label = read.table("test/y_test.txt", header=FALSE, col.names = c("activityId"))
train_y_label = read.table("train/y_train.txt", header=FALSE, col.names = c("activityId"))

test_subjects = read.table("test/subject_test.txt", header=FALSE, col.names = c("subjectId"))
train_subjects = read.table("train/subject_train.txt", header=FALSE, col.names = c("subjectId"))

activity_labels = read.table("activity_labels.txt", header=FALSE, sep = "", col.names = c("activityId", "activityLabel"))

# second, merge test_y_label and train_y_label to create one data frame, just as I did for ds1 and ds2 above.
# the rbind order here is very important. This yields a 10299x1 data frame
activityIds <- rbind(test_y_label, train_y_label)

# do the same for subjectIds
subjectIds <- rbind(test_subjects, train_subjects)

# third, join activityIds and activityLabels using the column activityId as join condition.
# this yields a 10299x2 data frame

# import plyr for join
require(plyr)
activityLabels <- join(activityIds, activity_labels, by = c("activityId"))

# finally, append activityLabels$activityLabel to 'dataset'
dataset <- cbind(dataset, activityLabels$activityLabel, subjectIds)

## 4. Appropriately labels the data set with descriptive variable names

# select only the subset of features that I need
features <- features[goodcols,]

# required for str_replace
require(stringr)

# To clean feature names will:
# a. replace '-mean()-' and '-std()-' with 'Mean' and 'Std', respectively
features$name <- str_replace(features$name, "-mean\\(\\)", "Mean")
features$name <- str_replace(features$name, "-std\\(\\)", "Std")

# b. replace prefixes 't' and 'f' to 'time' and 'freq', respectively
# here I am matching only the character at the beginning of the stirng, using the caret ^
features$name <- str_replace(features$name, "^t", "time")
features$name <- str_replace(features$name, "^f", "freq")

# c. I leave every other abbreviation intact, expanding them would result in too large column names

# get the array of feature names that will be assigned to names(dataset)
featureNames <- features$name

# before assigning featureNames to names(dataset) I need to add two additional names to this array,  
# since in step 3 we added 'activity label' and 'subjectId' column to the dataset.
featureNames <- c(featureNames, "activityLabel", "subjectId")

# finally, I can assign the featureNames vector to names(dataset)
names(dataset) <- featureNames

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
avgDataset <- aggregate(. ~ activityLabel + subjectId, dataset, mean)