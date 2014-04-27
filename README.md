Wearable Computing Project
==========================

Introduction
------------

This projects draws on data from the [UCI Machine Learning Repository] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) on wearable computing. The accompanying R script takes two datasets, joins them together, and returns a summary dataset.

Methodology
-----------

In specific, the R script performs the following steps:

1. Merges the training and the test sets into one data set.
2. Extracts the variables related to mean and standard deviation calculation. 
3. Appends a column to identify data points in the dataset.
4. Appends a header row to label the variables in the dataset. 
5. Creates a second data set with the average of each variable for each activity and each subject.

How-To
------

1. Download the UCI HAR dataset from the above website.
2. Extract the ZIP file. 
3. Open R, and set the working directory to the newly created file directory. 
4. Run the R script titled run_analysis.
5. The summary dataset will be created in the file directory.
