# Getting and Cleaning Data Project

# Code Book

# Source Data
- A full description of the data used in this project can be found at     
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
  
# This code book summarizes the resulting data fields in `Tidy Data.txt`.

# Description
- All the similar values I combine, all files that refer to the same entities.
- I take the columns with the mean and standard deviation after extracting these columns, I give them the correct  
  names,   taken from `features.txt`.
- The activity data 1: 6, with the activity names and identifiers of `activity_labels.txt` and we replace them in the dataset.
- I generate a new set of data with all the mean measures for each subject and type of activity

# Read the data in the tables
- features.txt
- activity_labels.txt
- subject_train.txt
- x_train.txt
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt