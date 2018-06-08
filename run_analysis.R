setwd("C:/Users/m.hernandez.moreno/Desktop/Curso Data Science/03. Getting and Cleaning Data/Course Project")
url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileZip <- "Dataset.zip"
dir <- "UCI HAR Dataset"

# Download file to working directory.
if(!file.exists(fileZip)){
        download.file(url,fileZip, mode = "wb") 
}

# Unzip the downloaded file.
if(!file.exists(dir)){
        unzip(fileZip, files = NULL, exdir=".")
}


# Read data:

# Test and training subjects
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Test and training sets
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
# Features
features <- read.table("UCI HAR Dataset/features.txt") 

# Test and training labels
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
# Class labels with their activity name
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")


## -----------------------------------------------------------------------------
## 1. Merge the training and the test sets to create one data set.
## -----------------------------------------------------------------------------

data <- rbind (x_test,x_train)

nrow(data)
ncol(data)


## -----------------------------------------------------------------------------
## 2. Extract only the measurements on the mean and standard deviation for 
##    each measurement.
## -----------------------------------------------------------------------------

# Choose features that cointains the words "mean()" or "std()"
Mean_Std <- grep("mean()|std()", features[[2]])
data <- data[,Mean_Std]

# Assign features and delete brakets
clean <- sapply(features[[2]], function(x) {gsub("[()]", "",x)})
names(data) <- clean[Mean_Std]

nrow(data)
ncol(data)


## -----------------------------------------------------------------------------
## 3. Use descriptive activity names to name the activities in the data set.
## -----------------------------------------------------------------------------

# Add subject column and activity column to data
subject <- rbind(subject_train, subject_test)
names(subject) <- 'subject'
activity <- rbind(y_train, y_test)
names(activity) <- 'activity'
tidydata <- cbind(subject,activity, data)

# Add activity labels
activ_aux <- factor(tidydata$activity)
levels(activ_aux) <- activity_labels[[2]]
tidydata$activity <- activ_aux

nrow(tidydata)
ncol(tidydata)


## -----------------------------------------------------------------------------
## 4. Appropriately label the data set with descriptive variable names.
## -----------------------------------------------------------------------------

names(tidydata)<-gsub("^t", "time", names(tidydata))
names(tidydata)<-gsub("^f", "frequency", names(tidydata))
names(tidydata)<-gsub("Acc", "Accelerometer", names(tidydata))
names(tidydata)<-gsub("Gyro", "Gyroscope", names(tidydata))
names(tidydata)<-gsub("Mag", "Magnitude", names(tidydata))
names(tidydata)<-gsub("BodyBody", "Body", names(tidydata))

names(tidydata)


## -----------------------------------------------------------------------------
## 5. From the data set in step 4, create a second, independent tidy data set
##    with the average of each variable for each activity and each subject.
## -----------------------------------------------------------------------------

tidydata2 <- aggregate(. ~subject + activity, tidydata, mean)
tidydata2 <- tidydata2[order(tidydata2$subject, tidydata2$activity),]
write.table(tidydata2,"tidy_data.txt", row.name=FALSE)

nrow(tidydata2)
ncol(tidydata2)
