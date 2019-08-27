---
title: "Code Book"
author: "Stacy Irwin"
date: "8/26/2019"
output: html_document
---


This document describes the original data files, their source, and the script's steps to clean the data and provide two output files. 

## Overview

The data pertains to an experiment on a group of 30 volunteers, performing activities wearing a smartphone on their waist. Using its embedded accelerometer and gyroscope, the experimenters captured movement data from the volunteers. Data were labeled with activities manually. The dataset was then partitioned into two sets, where 21 of the volunteers generated the training data and 9 generated the test data.

## Relevant Files in `data/`

Filename                Description
-----------------       ------------
`subject_train.txt`     Subject codes (1-30) identifying which subject produced the corresponsing row of data in `X_train.txt`.
`X_train.txt`           Time and frequency data gathered from volunteers. 561 columns of various acceleration and gyroscopic data on the X, Y, and Z axes.
`y_train.txt`           Activity codes (1-6) for the the train set data.
`subject_test.txt`      Subject codes (1-30) identifying which subject produced the corresponsing row of data in `X_test.txt`.
`X_test.txt`            Time and frequency data gathered from volunteers.
`y_test.txt`            Activity codes (1-6) for the the test set data.
`activity_labels.txt`   Contains 2 columns, identifying the code (1-6) with the human-readable activity name.
`features.txt`          Column names of the `X_train.txt` and `X_test.txt` files.


## Steps for Cleaning

Per the assignment, the steps included:

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names.
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

In the actual `run_analysis.R` script the steps were performed in a slightly different order as:

0. Load R packages and data files into memory.
1. Apply descriptive names for activities.
2. Combine the test and training data sets.
3. Assign meaningful column names to the merged data set.
4. Extract only means and StdDev valued-columns (OPTIONAL: output file produced is `Extracted_Data_Set.csv`).
5. Reshape the data by calculating means of the remaining columns and aggregating by Subject and Activity (output file produced is `Tidy_Data_Set.csv`).


## Output File Columns

Major classification data columns include:

* DataSrc - Inidcates the source fo the data as being from the TRAIN or the TEST data set. (only available in `Extracted_Data_Set.txt`)
* Subject - The test subject designation (1-30).
* Activity - The activity label of the data: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, or LAYING.

The remaining 561 columns in the data of `X_train.txt` and `X_test.txt` are comprised of separate X, Y, and Z components (where applicable), magnitudes, min/max, means, bands, and other statitical measurements of the raw data, annotated in the feature name. `Tidy_Data_Set.csv` uses only 79 of these columns corresponding to means and standard deviations (std) and their XYZ components, for the following measures:

* tBodyAcc
* tGravityAcc
* tBodyAccJerk
* tBodyGyro
* tBodyGyroJerk
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc
* fBodyAccJerk
* fBodyGyro
* fBodyAccMag
* fBodyBodyAccJerkMag
* fBodyBodyGyroMag
* fBodyBodyGyroJerkMag

Note: In `Tidy_Data_Set.csv`, these are the mean values of the entire [extracted] data set aggregated by Subject and Activity.

## Other Notes

The folders named "Inertial Signals" under train and test were not used for this assignment and were ignored.


