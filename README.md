Getting and Cleaning Data : Course Project
==========================================

Introduction
------------
This repository contains code to process the UCI Human Activity Recognition data set.

The script `run_analysis.R` will merge the test and training data per the requirements for this project. It will then output the final "tidy" data set to a txt and/or csv file.



Objective
----------

The files in this repository have been created according to the requirements set out for the Course Project.

The requirements were:

You should create one R script called `run_analysis.R` that does the following.

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive activity names.
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject

The `run_analysis.R` file achieves all the requirements chronologically.


The Raw Data
------------------------------
The raw data used in this project and it's full description can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).



The Code Book
-------------
The `CodeBook.md` file details the behaviour of the `run_analysis.R` script and how it should be used.



**NOTE :** You will need to choose and/or set your working directory as shown on line 3 in the `run_analysis.R` file.