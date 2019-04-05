Getting and Cleaning Data : CodeBook
====================================

This codebook describes the processes carried out on the "Human Activity Recognition Using Smartphones Dataset Version 1.0" through the 'run_analysis.R' script.


Project Objectives
------------------
You should create one R script called `run_analysis.R` that does the following: 
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Requirements
-----------
This script can be run step by step to reproduce the 'tidy' dataset. The primary requirement is that the working directory must be set by the user. Line 3 in the `run_analysis.R` file sets the working directory, every user must set a working directory (or comment this line out).

**NOTE :** The script assumes that the `plyr` library is installed. If it isn't, please install it using `install.packages("plyr")` before running the script.


The script
----------

In chronological order, the script `run_analysis.R`
- downloads the data from this
  [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
- merges the training and test sets
- extracts the the mean and standard deviation for each measurement
- sets and uses descriptive activity names
- labels the columns with descriptive names
- creates a tidy data set. (`merged.clean`)
- creates a second, independent tidy dataset with an average of each measurement. (`merged.avg`)
- exports two versions of the the processed data set (a tidy data set and a tidy+averaged data set). These files are also both exported in the txt and csv file format (clean_dataset.txt, clean_dataset.csv, averaged_dataset.txt, averaged_dataset.csv).

The final dataset is output per the requirements set out for this course project.

The `run_analysis.R` file is appropriately commented and follows the logicial steps set out in the course project requirements.


More Information
----------------

Details on the layout and structure of the raw data can be found in the `Readme.txt` file within the downloaded UCI dataset folder.

Some of the functions used to prepare the data are `grepl()`, `mean()` and `sd()`.

The activity labels are: (walking, walkingupstairs, walkingdownstairs, sitting, standing, laying).

Some general observations noticed during the data preprocessing are listed below:

- The merged data set is 10299 observations by 561 variables (563 when you include the subject and activity variables). The variables also appear to be normalized and bounded within [-1,1].

- After the means and measurements are extracted, we are left with a 10299 * 66 dataframe.

- The descriptive activity names are then set using the labels defined in `activity_labels.txt` and prepended to the data frame along with subject data. This forms a 10299 * 68 dataframe.

- After calculating the mean for each measurement. The final data table (which is 180 * 68) is written out to file.


The features in the final data set are :

`subject        activity	tbodyacc-mean()-x	tbodyacc-mean()-y	tbodyacc-mean()-z	tbodyacc-std()-x	tbodyacc-std()-y	tbodyacc-std()-z	tgravityacc-mean()-x	tgravityacc-mean()-y	tgravityacc-mean()-z	tgravityacc-std()-x	tgravityacc-std()-y	tgravityacc-std()-z	tbodyaccjerk-mean()-x	tbodyaccjerk-mean()-y	tbodyaccjerk-mean()-z	tbodyaccjerk-std()-x	tbodyaccjerk-std()-y	tbodyaccjerk-std()-z	tbodygyro-mean()-x	tbodygyro-mean()-y	tbodygyro-mean()-z	tbodygyro-std()-x	tbodygyro-std()-y	tbodygyro-std()-z	tbodygyrojerk-mean()-x	tbodygyrojerk-mean()-y	tbodygyrojerk-mean()-z	tbodygyrojerk-std()-x	tbodygyrojerk-std()-y	tbodygyrojerk-std()-z	tbodyaccmag-mean()	tbodyaccmag-std()	tgravityaccmag-mean()	tgravityaccmag-std()	tbodyaccjerkmag-mean()	tbodyaccjerkmag-std()	tbodygyromag-mean()	tbodygyromag-std()	tbodygyrojerkmag-mean()	tbodygyrojerkmag-std()	fbodyacc-mean()-x	fbodyacc-mean()-y	fbodyacc-mean()-z	fbodyacc-std()-x	fbodyacc-std()-y	fbodyacc-std()-z	fbodyaccjerk-mean()-x	fbodyaccjerk-mean()-y	fbodyaccjerk-mean()-z	fbodyaccjerk-std()-x	fbodyaccjerk-std()-y	fbodyaccjerk-std()-z	fbodygyro-mean()-x	fbodygyro-mean()-y	fbodygyro-mean()-z	fbodygyro-std()-x	fbodygyro-std()-y	fbodygyro-std()-z	fbodyaccmag-mean()	fbodyaccmag-std()	fbodybodyaccjerkmag-mean()	fbodybodyaccjerkmag-std()	fbodybodygyromag-mean()	fbodybodygyromag-std()	fbodybodygyrojerkmag-mean()	fbodybodygyrojerkmag-std()`
