# Getting and Cleaning Data course project

## How to run the script

1. Download 'run_analysis.R' from my githib repo: https://github.com/lucarosellini/datascience-getdata-project
2. Place the R script 'run_analysis.R' in the _root_ of your own copy of the UCI HUR Dataset (the dataset is quite big and has not been uploaded to GitHub).

3. Run Rstudio or an R console session and issue a setwd(<root of UCI HUR Dataset>) to change the working directory to the root folder of the UCI HUR Dataset. You should change <root of UCI HUR Dataset> appropiately.

4. perform a source("run_analysis.R")

# How the script works

# Getting and Cleaning Data course project: run_analysis.R code book

To run the script, place it in the root of the UCI HUR Dataset as described in README.md

## Part 1: Merges the training and the test sets to create one data set.

### Load the test and training data to two different datasets ds1 and ds2. Both datasets have 561 columns
	ds1 <- read.table("test//X_test.txt", header = FALSE, sep="")
	ds2 <- read.table("train//X_train.txt", header = FALSE, sep="")

### merge the two datasets into one using rbind. This will yield a 10299x66 dataframe
	merged <- rbind(ds1, ds2)

### Since ds1 and ds2 are huge datasets and I am only interested in the 'merged' dataset, I free up some memory
	ds1 <- NULL
	ds2 <- NULL

## Part 2: Extracts only the measurements on the mean and standard deviation for each measurement. 

### load the features names. I manually assign descriptive names to the dataset columns. This is a 561x2 dataset.
	features <- read.table("features.txt", header = FALSE, sep = "", col.names = c("position", "name"))

### use a regular expression to match only the mean() and std() features. This yields a boolean vector with 66 elements.
	goodcols <- grep("(*-mean\\(\\)*|*-std\\(\\)*)", features$name)

### filter the 'merged' dataframe columns using R column filtering. This operation yields a 10299x66 data frame.
	dataset <- merged[, goodcols]

## Part 3: Uses descriptive activity names to name the activities in the data set

### First, load the test and training activity ids, the test and train subjects and the activity labels. I manually assign descriptive column names to each dataframe
	test_y_label = read.table("test/y_test.txt", header=FALSE, col.names = c("activityId"))
	train_y_label = read.table("train/y_train.txt", header=FALSE, col.names = c("activityId"))

	test_subjects = read.table("test/subject_test.txt", header=FALSE, col.names = c("subjectId"))
	train_subjects = read.table("train/subject_train.txt", header=FALSE, col.names = c("subjectId"))

	activity_labels = read.table("activity_labels.txt", header=FALSE, sep = "", col.names = c("activityId", "activityLabel"))

### second, merge test_y_label and train_y_label to create one data frame, just as I did for ds1 and ds2 above. The order of the parameters to rbind here is very important, we must bind the two datasets using the same order used in step 1. This yields a 10299x1 data frame
	activityIds <- rbind(test_y_label, train_y_label)

### do the same for subjectIds
	subjectIds <- rbind(test_subjects, train_subjects)

### third, join activityIds and activityLabels using the column activityId as join condition. This yields a 10299x2 data frame. Specifying the join condition here is superfluous, by I added it for the sake of clarity. The join function is provided by the 'plyr' package that I import using require()
	require(plyr)
	activityLabels <- join(activityIds, activity_labels, by = c("activityId"))

### finally, append activityLabels$activityLabel and subjectIds columns to our 'dataset'. This yields a 10299x68 data frame
	dataset <- cbind(dataset, activityLabels$activityLabel, subjectIds)

## Part 4: Appropriately labels the data set with descriptive variable names

### From part 2 of the exercise I already have a boolean vector telling me which features of the dataset to keep. I use the same vector to filter the 'features' dataframe 
	features <- features[goodcols,]

### package 'stringr' is required for str_replace()
	require(stringr)

### To clean feature names will:
#### a. replace '-mean()-' and '-std()-' with 'Mean' and 'Std', respectively.
	features$name <- str_replace(features$name, "-mean\\(\\)", "Mean")
	features$name <- str_replace(features$name, "-std\\(\\)", "Std")

#### b. replace prefixes 't' and 'f' to 'time' and 'freq', respectively. Here I am matching only the character at the beginning of the stirng, using the caret ^
	features$name <- str_replace(features$name, "^t", "time")
	features$name <- str_replace(features$name, "^f", "freq")

#### c. leave every other abbreviation intact, expanding them would result (in my opinion) in too large column names

### get the array of feature names that will be assigned to names(dataset)
	featureNames <- features$name

### before assigning featureNames to names(dataset) I need to add two additional names to this array, since in step 3 we added 'activity label' and 'subjectId' columns to the dataset.
	featureNames <- c(featureNames, "activityLabel", "subjectId")

### finally, I can assign the featureNames vector to names(dataset)
	names(dataset) <- featureNames

## Part 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### I use the 'aggregate' function that solves the problem using the formula: ". ~ activityLabel + subjectId". This means: aggregate all the columns of the 'dataset' dataframe grouping by the 'activityLabel' and 'subjectId' columns. The aggregating funcion 'mean' is passed as the last parameter.
	avgDataset <- aggregate(. ~ activityLabel + subjectId, dataset, mean)


