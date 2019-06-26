# data-science-project--3-coursera
cousera peer grade project
Data Analysis
In the data the readme.me document, you will get a detailed perspective of what to expect and how to manipulate the data. There are three core variables:

Main
2. Test 3. Train
Main : activity_labels Inertial Signals Inertial Signals Test: features subject_test subject_train Train: features.info X_test X_train

README y_test y_train ‘features_info.txt’: Shows information about the variables used on the feature vector. * - ‘features.txt’: List of all features. * - ‘activity_labels.txt’: Links the class labels with their activity name. * - ‘train/X_train.txt’: Training set. * - ‘train/y_train.txt’: Training labels. * - ‘test/X_test.txt’: Test set. *- ‘test/y_test.txt’: Test labels

Analysis shows that you can categorize the data into 4 segments * training set * test set * features * activity labels

Inertial Signal data is not required. Additionally, features and activity label are more for tagging and descriptive than data sets
### 1. Output Steps - Here we begin how to create the data set of training and test
#Reading training tables - xtrain / ytrain, subject train
xtrain = read.table(file.path(pathdata, "train", "X_train.txt"),header = FALSE)
ytrain = read.table(file.path(pathdata, "train", "y_train.txt"),header = FALSE)
subject_train = read.table(file.path(pathdata, "train", "subject_train.txt"),header = FALSE)
#Reading the testing tables
xtest = read.table(file.path(pathdata, "test", "X_test.txt"),header = FALSE)
ytest = read.table(file.path(pathdata, "test", "y_test.txt"),header = FALSE)
subject_test = read.table(file.path(pathdata, "test", "subject_test.txt"),header = FALSE)
#Read the features data
features = read.table(file.path(pathdata, "features.txt"),header = FALSE)
#Read activity labels data
activityLabels = read.table(file.path(pathdata, "activity_labels.txt"),header = FALSE)
