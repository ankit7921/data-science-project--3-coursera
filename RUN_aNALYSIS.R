features <- 'UCI HAR Dataset/features.txt'
subject_test <- 'UCI HAR Dataset/test/subject_test.txt'
X_test <- 'UCI HAR Dataset/test/X_test.txt'
y_test <- 'UCI HAR Dataset/test/y_test.txt'
subject_train <- 'UCI HAR Dataset/train/subject_train.txt'
X_train <- 'UCI HAR Dataset/train/X_train.txt'
y_train <- 'UCI HAR Dataset/train/y_train.txt'

# this number calculated manually 
# and represents length of numbers of each column
X_num_len <- 16

# this information took from features.txt
X_num_of_cols <- 561

# 1. Merging the training and the test sets to create one data set.
test_ds <- data.frame(read.fwf(X_test, 
                               widths = rep(X_num_len, X_num_of_cols), 
                               header = FALSE), 
                      subject = scan(subject_test), 
                      activity = scan(y_test))

train_ds <- data.frame(read.fwf(X_train, 
                                widths = rep(X_num_len, X_num_of_cols), 
                                header = FALSE), 
                       subject = scan(subject_train), 
                       activity = scan(y_train))

ds <- rbind(test_ds, train_ds)

# 2. Extracting only the measurements on the mean and standard deviation
# for each measurement.
conn <- file(features)
features_names <- readLines(conn)
close(conn)
# filtering by 'mean' and 'std' in col name, adding subjects and activity cols
features_names <- sub(".*? (.+)", "\\1", features_names)
selected_cols <- c(which(grepl('mean', features_names)
                         | grepl('std', features_names)),
                   562, 563)

# 4. Appropriately labels the data set with descriptive variable names.
colnames(ds) <- c(features_names, c('subject', 'activity'))

ds <- ds[, selected_cols]

# 3. Using descriptive activity names to name the activities in the data set.
ds$activity <- factor(ds$activity, 
                      levels = c(1,2,3,4,5,6),
                      labels = c('WALKING',
                                 'WALKING_UPSTAIRS',
                                 'WALKING_DOWNSTAIRS',
                                 'SITTING',
                                 'STANDING',
                                 'LAYING'))

# 5. From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.
avg_ds <- ds %>%
  group_by(subject, activity) %>%
  summarise_all(list(mean))

write.table(avg_ds, 'tidy_data.txt')