# The code book

***

For a more complete reproducibility of the analysis the R script is dealing with the web download of data (from url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), local extraction of files and creation of the storing directories.

Moreover, a specific user defined function, called "recursive_replace_lowercase", has been added in order to get rid of any eventual annoying (and error prone) white space and/or upper case letters within the file or directory names.

The whole process of data analysis is assuming that the structure of directories and file names created by the above mentioned user defined function is kept invariant (please keep in mind that any changes may hampering the results). Please set your own path for the working directory accordingly (as per deafult ".").

For detailed information on the original dataset upon which has been carried out the present analysis please check the file "readme.txt" present on the directory "uci_har_dataset" which was automatically created by running the R script "run_analysis.R".

The files present whithin the folders "inertial_signals" both in train and test sets within the directory "uci_har_dataset" were not used for the purpose of this course project. 

The files used for the data analysis were just the following:

* test/subject_test.txt
* test/x_test.txt
* test/y_test.txt
* train/subject_train.txt
* train/x_train.txt
* train/y_train.txt

66 feature variables were selected from the original 561 feature variables in the original data set. All feature variables were standardized - i.e. unitless - and bounded within [-1,1].

The selection criterion used for feature variables was to include names ending with *\*-mean()* or *\*-std()*. Names of feature variables were made descriptive as much as possible and in order to improve readability were kept in the *CamelCase* notation.

What follows is the complete list of 66 selected feature variables upon which has been performed aggregation by "subject" (1-30) and by "activity" (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING):

* TimeBodyAccelerometer-mean()-X
*	TimeBodyAccelerometer-mean()-Y
*	TimeBodyAccelerometer-mean()-Z
*	TimeBodyAccelerometer-std()-X
*	TimeBodyAccelerometer-std()-Y
*	TimeBodyAccelerometer-std()-Z
*	TimeGravityAccelerometer-mean()-X
*	TimeGravityAccelerometer-mean()-Y
*	TimeGravityAccelerometer-mean()-Z
*	TimeGravityAccelerometer-std()-X
*	TimeGravityAccelerometer-std()-Y
*	TimeGravityAccelerometer-std()-Z
*	TimeBodyAccelerometerJerk-mean()-X
*	TimeBodyAccelerometerJerk-mean()-Y
*	TimeBodyAccelerometerJerk-mean()-Z
*	TimeBodyAccelerometerJerk-std()-X
*	TimeBodyAccelerometerJerk-std()-Y
*	TimeBodyAccelerometerJerk-std()-Z
*	TimeBodyGyroscope-mean()-X
*	TimeBodyGyroscope-mean()-Y
*	TimeBodyGyroscope-mean()-Z
*	TimeBodyGyroscope-std()-X
*	TimeBodyGyroscope-std()-Y
*	TimeBodyGyroscope-std()-Z
*	TimeBodyGyroscopeJerk-mean()-X
*	TimeBodyGyroscopeJerk-mean()-Y
*	TimeBodyGyroscopeJerk-mean()-Z
*	TimeBodyGyroscopeJerk-std()-X
*	TimeBodyGyroscopeJerk-std()-Y
*	TimeBodyGyroscopeJerk-std()-Z
*	TimeBodyAccelerometerMagnitude-mean()
*	TimeBodyAccelerometerMagnitude-std()
*	TimeGravityAccelerometerMagnitude-mean()
*	TimeGravityAccelerometerMagnitude-std()
*	TimeBodyAccelerometerJerkMagnitude-mean()
*	TimeBodyAccelerometerJerkMagnitude-std()
*	TimeBodyGyroscopeMagnitude-mean()
*	TimeBodyGyroscopeMagnitude-std()
*	TimeBodyGyroscopeJerkMagnitude-mean()
*	TimeBodyGyroscopeJerkMagnitude-std()
*	FrequencyBodyAccelerometer-mean()-X
*	FrequencyBodyAccelerometer-mean()-Y
*	FrequencyBodyAccelerometer-mean()-Z
*	FrequencyBodyAccelerometer-std()-X
*	FrequencyBodyAccelerometer-std()-Y
*	FrequencyBodyAccelerometer-std()-Z
*	FrequencyBodyAccelerometerJerk-mean()-X
*	FrequencyBodyAccelerometerJerk-mean()-Y
*	FrequencyBodyAccelerometerJerk-mean()-Z
*	FrequencyBodyAccelerometerJerk-std()-X
*	FrequencyBodyAccelerometerJerk-std()-Y
*	FrequencyBodyAccelerometerJerk-std()-Z
*	FrequencyBodyGyroscope-mean()-X
*	FrequencyBodyGyroscope-mean()-Y
*	FrequencyBodyGyroscope-mean()-Z
*	FrequencyBodyGyroscope-std()-X
*	FrequencyBodyGyroscope-std()-Y
*	FrequencyBodyGyroscope-std()-Z
*	FrequencyBodyAccelerometerMagnitude-mean()
*	FrequencyBodyAccelerometerMagnitude-std()
*	FrequencyBodyAccelerometerJerkMagnitude-mean()
*	FrequencyBodyAccelerometerJerkMagnitude-std()
*	FrequencyBodyGyroscopeMagnitude-mean()
*	FrequencyBodyGyroscopeMagnitude-std()
*	FrequencyBodyGyroscopeJerkMagnitude-mean()
*	FrequencyBodyGyroscopeJerkMagnitude-std()

For detailed information on the meaning of the variable names please refer to the file "readme.txt" present in the directory "uci_har_dataset" automatically created by the R script "run_analysis.R".

The final dataset called "my_means" is a dataframe with dimension 180 rows times 68 columns that was exported to the file "export_dataset.txt".