## Cleaning Data Project
The project includes processing a [data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) collected from the accelerometers of a Samsung Galaxy S smartphone.

Included in this repository is an R script [run_analysis.R](run_analysis.R). It performs all of the functions assigned in the cleaning data project, including:

> 1. Merges the training and the test sets to create one data set.
> 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
> 3. Uses descriptive activity names to name the activities in the data set
> 4. Appropriately labels the data set with descriptive variable names. 
> 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The "second, independent tidy data set" it produces is a space-delimited file in the working directory called [summary_data_means.txt](UCI HAR Dataset/summary_data_means.txt). 

To use run_analysis.R, set the working directory to the directory that contains the Samsung data (e.g. it contains Samsung's README.txt, etc) A codebook is available called [CodeBook.md](CodeBook.md) that summarizes the values in [summary_data_means.txt](UCI HAR Dataset/summary_data_means.txt). 

Then execute source('path to run_analysis.R'). 