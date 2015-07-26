# This code must be run when the working directory is set to the directory
# that contains the Samsung data (e.g. it contains README.txt, etc)
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


library(dplyr) # need this library

# read in data- and label appropriately

activity_labels <- read.table("activity_labels.txt", header = FALSE, col.names=c("activity", "activity_name"))

features <-read.table("features.txt", header = FALSE)
# get indices of columns we want to examine
cols_we_want <- grep("mean|std", features$V2, ignore.case=TRUE)
saved_features <- features[cols_we_want, ] # saved for later

test_set <-read.table("test/X_test.txt", header = FALSE)
test_activity <-read.table("test/y_test.txt",  header = FALSE)
test_subject <-read.table("test/subject_test.txt",  header = FALSE)

train_set <-read.table("train/X_train.txt", header = FALSE)
train_activity <-read.table("train/y_train.txt" , header = FALSE)
train_subject <-read.table("train/subject_train.txt", header = FALSE)

# add column names to training and test data- to complete STEP 4
colnames(train_set) <- features[, 2]
colnames(test_set) <- features[, 2]

colnames(test_subject) <- "subject"
colnames(train_subject) <- "subject"

colnames(test_activity) <- "activity"
colnames(train_activity) <- "activity"

# combine test and train data into one big set- STEP 1 COMPLETE
combined_sets <- rbind(test_set, train_set)

# Extracts only the measurements on the mean
# and standard deviation for each measurement. STEP 2 COMPLETE
combined_sets_irrelevant_removed <-combined_sets[, cols_we_want]

# combine activity test and train activity data
combined_activity <- rbind(test_activity, train_activity)

# combine subject test and train subject data
combined_subject <- rbind(test_subject, train_subject)

#combine sets, activity, and subject together 
combined_sets_final <- cbind(combined_subject, combined_activity,combined_sets_irrelevant_removed)

# add the activity names- STEP 3 COMPLETE
# Uses descriptive activity names to name the activities in the data set
labeled_table <- inner_join(activity_labels, combined_sets_final)

# groups by activity and subject- also add in name which corresponds to activity
grouped <- group_by(labeled_table, activity_name, activity, subject )

# apply mean to get summary data
final_output <- summarise_each(grouped, funs(mean(., na.rm = TRUE)))

# output summary to file- STEP 5 COMPLETE
write.table(final_output, file="summary_data_means.txt", row.names = FALSE)