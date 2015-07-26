
# read in data

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", sep = " " , header = FALSE)

features <-read.table("UCI HAR Dataset/features.txt", sep = " " , header = FALSE)

test_set <-read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
test_activity <-read.table("UCI HAR Dataset/test/y_test.txt",  header = FALSE)
test_subject <-read.table("UCI HAR Dataset/test/subject_test.txt",  header = FALSE)

train_set <-read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
train_activity <-read.table("UCI HAR Dataset/train/y_train.txt" , header = FALSE)
train_subject <-read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
