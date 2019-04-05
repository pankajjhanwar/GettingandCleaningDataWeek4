library(plyr)

setwd("~/R/Data Science MOOC/Get and Clean Data/Getting and Cleaning Data Project") ## Path to working directory.

## Download the dataset
file.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(file.url,"UCI Dataset.zip")

unzip("UCI Dataset.zip", exdir="dataset")

## read in the data
activity <- read.table("dataset/UCI HAR Dataset/activity_labels.txt")

features <- read.table("dataset/UCI HAR Dataset/features.txt")

train.x <- read.table("dataset/UCI HAR Dataset/train/X_train.txt")

train.y <- read.table("dataset/UCI HAR Dataset/train/Y_train.txt")

train.sub <- read.table("dataset/UCI HAR Dataset/train/subject_train.txt")

test.x <- read.table("dataset/UCI HAR Dataset/test/X_test.txt")

test.y <- read.table("dataset/UCI HAR Dataset/test/Y_test.txt")

test.sub <- read.table("dataset/UCI HAR Dataset/test/subject_test.txt")

## merge the data
x.data <- rbind(train.x,test.x)

y.data <- rbind(train.y,test.y)

sub.data <- rbind(train.sub, test.sub)

## Extract the mean and standard deviation for each measurement
tmp.mean <- sapply(features[,2], function(x) grepl("mean()", x, fixed=T))
tmp.std <- sapply(features[,2], function(x) grepl("std()", x, fixed=T))

new.x <- x.data[,(tmp.mean | tmp.std)]
names(new.x) <- features[(tmp.mean | tmp.std), 2]
names(new.x) <- tolower(names(new.x))                                    # Editing Text Variables Lecture (week 4)

## Use descriptive names to name the activities in the dataset.
activity[, 2] = gsub("_", "", tolower(as.character(activity[, 2])))      # Editing Text Variables Lecture (week 4)
new.y <- y.data
new.y[,1] = activity[new.y[,1], 2]


## Appropriately labels the data set with descriptive variable names.
names(new.y) <- "activity"
names(sub.data) <- "subject"

## Create tidy data set.
merged.clean <- cbind(sub.data,new.y,new.x)
write.table(merged.clean, "clean_dataset.txt")

## Averaged clean data set.
merged.avg <- ddply(merged.clean, .(subject, activity), function(x) colMeans(x[,3:68]))
write.table(merged.avg, "averaged_dataset.txt")

## csv versions of the files
write.csv(merged.clean, "clean_dataset.csv", row.names=FALSE)
write.csv(merged.avg, "averaged_dataset.csv", row.names=FALSE)
