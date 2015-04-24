# Coursera "Getting and Cleaning Data"
## Peer assessment of course project

***

# Introduction

In this Github repository you will find:

* the present file ("readme.md") describing the main objective of the data analysis assignment of the Coursera MOOC called "Getting and Cleaning Data;

* the R script file ("run_analysis.R") with the code for getting and cleaning the original data set in a tidy format to finally produce a sub-selction and aggregation of original variables as per file "export_dataset.txt";

* a codebook file ("codebook.md") describing main features of the final product of analysis (i.e. "export_dataset.txt") along with the calculation assumption of the analysis to guarantee complete reproducibility of results.

# The objective of the analysis

Accordingly to the assignment of the course project the objective is to prepare a new and tidy dataset that can be used for a later analysis starting from the the original dataset freely available at the following url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 

A full description of the main features of the original dataset is available at the following url: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

The original dataset refers to sensor data collected through an experiment carried out within a group of 30 volunteers wearing a smartphone (Samsung Galaxy S II) on the waist while performing six different types of activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). By means of the embedded accelerometer and gyroscope in the smarphones 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. 

The dataset was then randomly partitioned into two distinct sets: 70% of the volunteers were selected for generating the training data and 30% the test data. 


# The R script

It contains the R code for performing the analysis assignment along with a detailed description (comment) of each code line o make easily and fully reproducible the whole process of data analysis. 

The analysis of the original dataset went through the following stpes:

1. merging of the training and test set to create a single and complete dataset;

2. extraction of the measurements (variables) referring to the mean - *\*-mean()* - or standard deviation - *\*-std()* -;

3. labelling of variables with appropriate descriptive names;

4. creation of an indipendent and tidy dataset with the average of each variable grouped by activity and subject.

     
# The code book

The file "codebook.md" explains main features of performed analysis, calculation assumptions, final dataset dimensions and variable names along with respective measure units.

 