# data-science-project--3-coursera
cousera peer grade project
Data Analysis
In the data the readme.me document, you will get a detailed perspective of what to expect and how to manipulate the data. There are three core variables:
# Getting-and-Cleaning-Data-Course-Project

# 1. Merging the training and the test sets to create one data set.
For reading data using the function read.fwf which takes the ``rep(16, 561)`` as an argument. 16 - because the number of characters in each column is 15 (including the sign) + space separator. 561 - since the number of features in the file features.txt. Subject and activity columns are also added by reading the corresponding files. ``rbind`` function is used to merge two datasets.
# 2. Extracting only the measurements on the mean and standard deviation for each measurement.
Column names are taken from file features.txt. Using the following code ``which(grepl('mean', features_names) | grepl('std', features_names))`` selected columns of mean and standart deviation.
# 3. Using descriptive activity names to name the activities in the data set.
File activity_labels.txt contains descripts of activity numbers. All that is needed it's to convert a column into a factor.
```
ds$activity <- factor(ds$activity, 
                      levels = c(1,2,3,4,5,6),
                      labels = c('WALKING',
                                 'WALKING_UPSTAIRS',
                                 'WALKING_DOWNSTAIRS',
                                 'SITTING',
                                 'STANDING',
                                 'LAYING'))
```
# 4. Appropriately labels the data set with descriptive variable names.
File features.txt contains descriptions of variables.
```
conn <- file(features)
features_names <- readLines(conn)
close(conn)

features_names <- sub(".*? (.+)", "\\1", features_names)

colnames(ds) <- c(features_names, c('subject', 'activity'))
```
Using next code to read and remove number of each variable. And then add colnames to data set, with 'subject' and 'activity' as last columns.
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Using ``library(dplyr)`` and next code:
```
avg_ds <- ds %>%
  group_by(subject, activity) %>%
  summarise_all(list(mean))
```

For writing data to `tidy_data.txt` used next code: `write.table(avg_ds, 'tidy_data.txt', row.name = FALSE)`.
