
Getting and Cleaning Data Course Project
========================================================

Purpose 
-----------------

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 

1. a tidy data set as described below
2. a link to a Github repository with your script for performing the analysis -- ``run_analysis.R`` 
3. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data --  ``CodeBook.md``
4. You should also include a ``README.md`` in the repo with your scripts. README.md will explain how all of the scripts work and how they are connected.  

`run_analysis.R` should performs the following:
-----------------

1. Merge the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names and it saves it in -- ``tidydata.txt``
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject -- ``tidydata2.txt`` 

How the scripts and files work and are connected
-----------------

1. `run_analysis.R` downloads the data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zipand 
2. The data set gets unzipped in the subdirectory directory 
3. The datasets and vaiables we are interested on are:
    - **features** < - 'features.txt'::: List of all features.
    - **activity_labels** < - 'activity_labels.txt'::: Links the class labels with their activity name.
    - **training_sets** < - '//train/X_train.txt'::: Training set.
    - **training_labels** < - '//train/y_train.txt'::: Training labels.
    - **training_subjects** < - '//train/subject_train.txt'::: Each row identifies the subject who performed the train activity for each window sample.
    - **test_sets** < - '//test/X_test.txt'::: Test set.
    - **test_labels** < - '//test/y_test.txt'::: Test labels.
    - **test_subjects** < - '//test/subject_test.txt'::: Each row identifies the subject who performed the test activity for each window sample. 

4. `run_analysis.R` loads the 3 **train** datasets and the 3 **test** datasets and appends them.
5. Then extracts just the *mean* and *standard deviation* using the **features** dataset.
6. Then we proceed to clean the column names  
7. We use **activity_Labels** to name the columns, we make sure all the names are lower case and there are no underscores
8. ``tidydata.txt`` gets filled with the cleaned and merged data  
9. ``tidydata2.txt`` gets filled with the *mean* of activities and subjects

