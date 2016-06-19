
# Download the data to a file

dataFile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(dataFile, "UCI-HAR-dataset.zip")
unzip("./UCI-HAR-dataset.zip")

# Load data from training and test files

training_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")

training_sets <- read.table("./UCI HAR Dataset/train/X_train.txt")
test_sets <- read.table("./UCI HAR Dataset/test/X_test.txt")

training_labels <- read.table("./UCI HAR Dataset/train/y_train.txt")
test_labels <- read.table("./UCI HAR Dataset/test/y_test.txt")


# 1. - Merges the training and the test sets to create one data set.

sets <- rbind(training_sets, test_sets)
labels <- rbind(training_labels, test_labels)
subjects <- rbind(training_subjects, test_subjects)

# 2. -Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("./UCI HAR Dataset/features.txt")
mean_std <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
mean_std_sets <- sets[, mean_std]

# 3. -Uses descriptive activity names to name the activities in the data set

names(mean_std_sets) <- features[mean_std, 2]
names(mean_std_sets) <- tolower(names(mean_std_sets)) 
names(mean_std_sets) <- gsub("\\(|\\)", "", names(mean_std_sets))

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity_labels[, 2] <- tolower(as.character(activity_labels[, 2]))
activity_labels[, 2] <- gsub("_", "", activity_labels[, 2])

labels[, 1] = activity_labels[labels[, 1], 2]
colnames(labels) <- "activity"
colnames(subjects) <- "subject"

# 4. -Appropriately labels the data set with descriptive variable names.

tidydata <- cbind(subjects, mean_std_sets, labels)
str(tidydata)
write.table(tidydata, "./tidydata/tidydata.txt", row.names = F)

# 5. -Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidydata2 <- aggregate(x = tidydata, by = list(activity_labels = tidydata$activity, subjects = tidydata$subject), FUN = mean)
tidydata2 <- tidydata2[, !(colnames(tidydata2) %in% c("subj", "activity"))]
str(tidydata2)
write.table(tidydata2, "./tidydata/tidydata2.txt", row.names = F)
