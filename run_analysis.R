# You should create one R script called run_analysis.R that does the following.

# 1. Merges the training and the test sets to create one data set.
# 2. xtracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###########################################################################################
# 1. Merges the training and the test sets to create one data set.
###########################################################################################
# Read the data
features                    <- read.table('./features.txt',header=FALSE)
activity_labels             <- read.table('./activity_labels.txt',header=FALSE)
x_train                     <- read.table("train/X_train.txt")
y_train                     <- read.table("train/y_train.txt")
subject_train               <- read.table("train/subject_train.txt")
x_test                      <- read.table("test/X_test.txt")
y_test                      <- read.table("test/y_test.txt")
subject_test                <- read.table("test/subject_test.txt")

# Merging Data  
x_data                      <- rbind(x_train, x_test)
y_data                      <- rbind(y_train, y_test)
subject_data                <- rbind(subject_train, subject_test)

###########################################################################################
# 2. xtracts only the measurements on the mean and standard deviation for each measurement.
###########################################################################################
# Extract the measurements of the mean and the standard deviation
mean_features               <- grep("-(mean|std)\\(\\)", features[, 2])
x_data                      <- x_data[, mean_features]
# Correct names
names(x_data)               <- features[mean_features, 2]

###########################################################################################
# 3. Uses descriptive activity names to name the activities in the data set
###########################################################################################
# Update Values
y_data[, 1]                 <- activity_labels[y_data[, 1], 2]
# Correct names
names(y_data)               <- "activity"

###########################################################################################
# 4. Appropriately labels the data set with descriptive variable names.
###########################################################################################
# Correct names
names(subject_data)         <- "subject"
# Combined all the data
finalData                   <- cbind(x_data, y_data, subject_data)

###########################################################################################
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
###########################################################################################
# Create a Tidy Data table
library(plyr)
Tidy_Data                    <- ddply(finalData, .(subject, activity), function(x) colMeans(x[, 1:66]))

# Write Tidy Data
write.table(Tidy_Data, "Tidy Data.txt", row.name=FALSE)