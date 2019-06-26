## data-science-project--3-coursera
cousera peer grade project
Data Analysis
In the data the readme.me document, you will get a detailed perspective of what to expect and how to manipulate the data. There are three core variables:
# Getting-and-Cleaning-Data-Course-Project

# 1. Merging the training and the test sets to create one data set.
For reading data using the function read.fwf which takes the ``rep(16, 561)`` as an argument. 16 - because the number of characters in each column is 15 (including the sign) + space separator. 561 - since the number of features in the file features.txt. Subject and activity columns are also added by reading the corresponding files. ``rbind`` function is used to merge two datasets.
# 2. Extracting only the measurements on the mean and standard deviation for each measurement.
Column names are taken from file features.txt. Using the following code ``which(grepl('mean', features_names) | grepl('std', features_names))`` selected columns of mean and standart deviation.
## Usage of the script

The script is to create a tidy data set for [UCI HAR Dataset]

## Initial data for research
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 

## The following files from the initial dataset is used:
  1. ***features.txt*** - descriptions for features measured
  2. ***X_train.txt*** - measurements of the features in training set 
  3. ***y_train.txt*** - activity (from 1 to 6) for each measurement from the training set
  4. ***subject_train.txt*** - subject (volunteer) id from the training set
  5. ***X_test.txt*** - measurements of the features in test set
  6. ***y_test.txt*** - activity (from 1 to 6) for each measurement from the test set
  7. ***subject_test.txt*** - subject (volunteer) id for each measurement from the test set

## How script works
This script consists of six parts:
1. Download data, upzip files and load data into R
2. Merge training data and test data to a singel data set
3. Extract only the measurements on the mean and standard deviation for each measurement
4. Appropriately label the data set with descriptive variable names
5. Create a independent tidy set with the average of each variable for each activity and each subject
